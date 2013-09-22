class AaarRepos
  def initialize (github_user, github_oauth_token="", cache=true)
    @github_user = github_user
    @github_oauth_token = github_oauth_token
    @repos = {}
    @member = []
    @owner = []
    @cache = cache
    @github = client
  end
    
  def client
    Github.new do |config|
      config.oauth_token = @github_oauth_token
      config.ssl         = {:verify => false}
      config.client_id = ENV['GITHUB_KEY']
      config.client_secret = ENV['GITHUB_SECRET']
      config.user = @github_user
    end
  end
    
  def member
    @member = @github.repos.list  type: :member, auto_pagination: true, sort: "updated", direction: "asc" if @member.empty?
    @member
  end
    
  def owner
    @owner = @github.repos.list  type: :owner, auto_pagination: true, sort: "updated", direction: "asc" if @owner.empty?
    @owner
  end
    
  def sources
    @repos[:sources] = []
    self.member.map {|r| @repos[:sources].push(r) if !r.fork}
    self.owner.map  {|r| @repos[:sources].push(r) if !r.fork}
    @repos[:sources]
  end
    
  def forks
    @repos[:forks] = []
    self.member.map {|r| @repos[:forks].push(r)   if r.fork}
    self.owner.map  {|r| @repos[:forks].push(r)   if r.fork}
    @repos[:forks]
  end
    
  def repos
    cache_key ="repos:#{@github_user}"
    if @cache
      if Rails.cache.exist?(cache_key)
        return Marshal.load(Rails.cache.read(cache_key))
      end
    end
    @repos = {sources: sources, forks: forks} if @repos.empty?
    if @cache
      Rails.cache.write(cache_key,Marshal.dump(@repos))
    end
    @repos
  end
    
end
