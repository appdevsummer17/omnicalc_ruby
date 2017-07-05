Rails.application.routes.draw do
  get("/", { :controller => "calculations", :action => "word_count_form" })

  get("/word_count/new",                 { :controller => "calculations", :action => "word_count_form" })
  get("/word_count/results",             { :controller => "calculations", :action => "word_count" })

  get("/loan_payment/new",               { :controller => "calculations", :action => "loan_payment_form" })
  get("/loan_payment/results",           { :controller => "calculations", :action => "loan_payment" })

  get("/time_between/new",               { :controller => "calculations", :action => "time_between_form" })
  get("/time_between/results",           { :controller => "calculations", :action => "time_between" })

  get("/descriptive_statistics/new",     { :controller => "calculations", :action => "descriptive_statistics_form" })
  get("/descriptive_statistics/results", { :controller => "calculations", :action => "descriptive_statistics" })

  mount WebGit::Engine, at: "/rails/git"
end
