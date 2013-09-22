class AaarReposUser
  def initialize (github_user, github_oauth_token="", cache=true)
    @github_user = github_user
    @github_oauth_token = github_oauth_token
    @users =[]
    @github = client
  end
    
  def client
    Github::Users.new do |config|
      config.oauth_token = @github_oauth_token
      config.ssl         = {:verify => false}
      config.client_id = ENV['GITHUB_KEY']
      config.client_secret = ENV['GITHUB_SECRET']
      config.user = @github_user
    end
  end

  def current_user
    #We merge the email into the general hash, we only take the primary one
    client.get(@github_user).to_hash.merge client.emails.list.select{|email|email["primary"]}[0].select{|k,v|k=="email"}
  end
  
  def user (user)
    client.get user
  end
    
end
