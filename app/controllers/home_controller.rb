class HomeController < ApplicationController
   
  def index
    
    if user_signed_in?
      github = AaarRepos.new(current_user.identities.first.nickname, current_user.identities.first.token)
      @repos = github.repos
      puts current_user.from_github
    end
  end
end
