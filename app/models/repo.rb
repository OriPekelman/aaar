class Repo
  include Mongoid::Document
  belongs_to :user
  has_many :activity_scores
  
  field :user_id, type: String

  field :name, type: String
  field :full_name, type: String
  field :description, type: String
  field :private, type: Boolean
  field :fork, type: Boolean
  field :url, type: String
  field :html_url, type: String
  field :clone_url, type: String
  field :git_url, type: String
  field :ssh_url, type: String
  field :svn_url, type: String
  field :mirror_url, type: String
  field :homepage, type: String
  field :language, type: String
  field :forks, type: Integer
  field :forks_count, type: Integer
  field :watchers, type: Integer
  field :watchers_count, type: Integer
  field :size, type: Integer
  field :master_branch, type: String
  field :open_issues, type: Integer
  field :open_issues_count, type: Integer
  field :pushed_at, type: DateTime
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
  field :has_issues, type: Boolean
  field :has_wiki, type: Boolean
  field :has_downloads, type: Boolean
end

def self.import_from_github
  github = AaarRepos.new(current_user.identities.first.nickname, current_user.identities.first.token)
  
  #Let's set all the fields unless they already have data or new data is nil
  githhub.repos each do |repo|
    fields.keys.each do |field|
      self[field] = user[field] if self[field].nil? && !user[field].nil?
      logger.debug "#{field} : #{user[field]} #{self[field]}  #{self[field].nil? && !user[field].nil?}"
    end
  end
end