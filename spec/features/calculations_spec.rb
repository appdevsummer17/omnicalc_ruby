require "rails_helper"

RSpec.describe "Using", type: :feature do
  feature "simple text" do
    it "parrots back the submitted text", points: 1, hint: I18n.t("hints.one") do
      visit "/word_count/new"

      fill_in "Text",
        with: "the first draft is just you telling yourself the story"

      fill_in "Special Word (optional)",
        with: "the"

      click_button "Submit"

      expect(page).to have_css(".text", text: "the first draft is just you telling yourself the story")
    end

    it "displays the word count", points: 16, hint: I18n.t("hints.two") do
      visit "/word_count/new"

      fill_in "Text",
        with: "the first draft is just you telling yourself the story"

      click_button "Submit"

      expect(page).to have_css(".word_count", text: 10)
    end

    it "displays the character count with spaces", points: 4, hint: I18n.t("hints.three") do
      visit "/word_count/new"

      fill_in "Text",
        with: "the first draft is just you telling yourself the story"

      click_button "Submit"

      expect(page).to have_css(".character_count_with_spaces", text: 54)
    end

    it "displays the character count without spaces", points: 12, hint: I18n.t("hints.four") do
      visit "/word_count/new"

      fill_in "Text",
        with: "the first draft is just you telling yourself the story"

      click_button "Submit"

      expect(page).to have_css(".character_count_without_spaces", text: 45)
    end

    it "displays the count of the special word occurrences", points: 16, hint: I18n.t("hints.five") do
      visit "/word_count/new"

      fill_in "Text",
        with: "the first draft is just you telling yourself the story"

      fill_in "Special Word (optional)",
        with: "the"

      click_button "Submit"

      expect(page).to have_css(".occurrences", text: 2)
    end
  end

  feature "text with mixed case" do
    it "displays the word count", points: 1 do
      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story"

      click_button "Submit"

      expect(page).to have_css(".word_count", text: 10)
    end

    it "displays the character count with spaces", points: 1 do
      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story"

      click_button "Submit"

      expect(page).to have_css(".character_count_with_spaces", text: 54)
    end

    it "displays the character count without spaces", points: 1, hint: I18n.t("hints.six") do
      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story"

      click_button "Submit"

      expect(page).to have_css(".character_count_without_spaces", text: 45)
    end

    it "displays the count of the special word occurrences", points: 4 do
      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story"

      fill_in "Special Word (optional)",
        with: "the"

      click_button "Submit"

      expect(page).to have_css(".occurrences", text: 2)
    end
  end

  feature "text with punctuation" do
    it "displays the word count", points: 1 do
      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story."

      click_button "Submit"

      expect(page).to have_css(".word_count", text: 10)
    end

    it "displays the character count with spaces", points: 1 do
      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story."

      click_button "Submit"

      expect(page).to have_css(".character_count_with_spaces", text: 55)
    end

    it "displays the character count without spaces", points: 1 do
      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story."

      click_button "Submit"

      expect(page).to have_css(".character_count_without_spaces", text: 46)
    end

    it "displays the count of the special word occurrences", points: 4, hint: I18n.t("hints.seven") do

      visit "/word_count/new"

      fill_in "Text",
        with: "The first draft is just you telling yourself the story."

      fill_in "Special Word (optional)",
        with: "story"

      click_button "Submit"

      expect(page).to have_css(".occurrences", text: 1)
    end
  end

  describe "loan payment" do
    before do
      visit "/loan_payment/new"
      fill_in "annual_percentage_rate", with: 4.5
      fill_in "number_of_years", with: 30
      fill_in "principal_value", with: 50000
      click_button "Submit"
    end

    it "displays the submitted APR", points: 1 do
      expect(page).to have_content "4.5%"
    end

    it "displays the submitted number of years", points: 1 do
      expect(page).to have_content 30
    end

    it "displays the submitted principal", points: 1 do
      expect(page).to have_content "$50,000"
    end

    it "displays the calculated monthly payments", points: 32, hint: I18n.t("hints.eight") do
      expect(page).to have_content "$253.34"
    end
  end

  describe "time between" do
    before do
      visit "/time_between/new"
      fill_in "starting_time", with: "04/16/2015 4:00 PM"
      fill_in "ending_time", with: "04/17/2015 4:02 PM"
      click_button "Submit"
    end

    it "displays the starting time", points: 1 do
      expect(page).to have_content "4:00pm"
      expect(page).to have_content "April 16, 2015"
    end

    it "displays the ending time", points: 1 do
      expect(page).to have_content "4:02pm"
      expect(page).to have_content "April 17, 2015"
    end

    it "displays the seconds between", points: 18, hint: I18n.t("hints.nine") do
      expect(page).to have_content "86520"
    end

    it "displays the minutes between", points: 3, hint: I18n.t("hints.ten") do
      expect(page).to have_content "1442"
    end

    it "displays the hours between", points: 3 do
      expect(page).to have_content "24.0333"
    end

    it "displays the days between", points: 3 do
      expect(page).to have_content "1.0013"
    end

    it "displays the weeks between", points: 3 do
      expect(page).to have_content "0.1430"
    end

    it "displays the years between", points: 3 do
      expect(page).to have_content "0.0027"
    end
  end

  describe "descriptive statistics" do
    before do
      visit "/descriptive_statistics/new"
      fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8 9"
      click_button "Submit"
    end

    it "parrots back the submitted numbers as an array", points: 1 do
      expect(page).to have_css(".numbers", text: [10.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 8.0, 9.0])
    end

    it "displays the numbers as a sorted array", points: 4 do
      expect(page).to have_css(".sorted_numbers", text: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 8.0, 9.0, 10.0])
    end

    it "displays the count of numbers", points: 4 do
      expect(page).to have_css(".count", text: 11)
    end

    it "displays the lowest number", points: 4 do
      expect(page).to have_css(".minimum", text: 1.0)
    end

    it "displays the highest number", points: 4 do
      expect(page).to have_css(".maximum", text: 10.0)
    end

    it "displays the range", points: 8 do
      expect(page).to have_css(".range", text: 9.0)
    end

    it "displays the median of the numbers", points: 12 do
      expect(page).to have_css(".median", text: 6.0)
    end

    it "displays the sum of the numbers", points: 5 do
      expect(page).to have_css(".sum", text: 63.0)
    end

    it "displays the mean of the numbers", points: 8 do
      expect(page).to have_css(".mean", text: 5.72)
    end

    it "displays the variance of the numbers", points: 24, hint: I18n.t("hints.eleven") do
      expect(page).to have_css(".variance", text: 8.01)
    end

    it "displays the standard deviation", points: 8, hint: I18n.t("hints.twelve") do
      expect(page).to have_css(".standard_deviation", text: 2.83)
    end

    it "displays the mode of the numbers", points: 8 do
      expect(page).to have_css(".mode", text: 8.0)
    end
  end

  describe "descriptive stats with an even number of elements" do
    before do
      visit "/descriptive_statistics/new"
      fill_in "list_of_numbers", with: "10 1 2 3 4 5 6 7 8 8"
      click_button "Submit"
    end

    it "displays the numbers as a sorted array", points: 1 do
      expect(page).to have_css(".sorted_numbers", text: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 8.0, 10.0])
    end

    it "displays the count of numbers", points: 1 do
      expect(page).to have_css(".count", text: 10)
    end

    it "displays the lowest number", points: 1 do
      expect(page).to have_css(".minimum", text: 1.0)
    end

    it "displays the highest number", points: 1 do
      expect(page).to have_css(".maximum", text: 10.0)
    end

    it "displays the range", points: 1 do
      expect(page).to have_css(".range", text: 9.0)
    end

    it "displays the median of the numbers", points: 9 do
      expect(page).to have_css(".median", text: 5.5)
    end

    it "displays the sum of the numbers", points: 1 do
      expect(page).to have_css(".sum", text: 54.0)
    end

    it "displays the mean of the numbers", points: 1 do
      expect(page).to have_css(".mean", text: 5.4)
    end

    it "displays the variance of the numbers", points: 1 do
      expect(page).to have_css(".variance", text: 7.64)
    end

    it "displays the standard deviation", points: 1 do
      expect(page).to have_css(".standard_deviation", text: 2.76)
    end

    it "displays the mode of the numbers", points: 5 do
      expect(page).to have_css(".mode", text: 8.0)
    end
  end
end
