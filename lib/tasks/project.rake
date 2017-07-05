namespace :project do
  desc "Attempt to update project, if there are no conflicts"
  task :update do
    if `git config remote.upstream.url`.blank?
      `git remote add upstream git@github.com:appdevspring17/omnicalc_ruby.git`
    end

    `git fetch upstream`
    `git rebase upstream/master`
  end
end
