class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include User::AuthDefinitions
  include User::Roles

  has_many :identities
  has_many :repos

  field :email, type: String
  field :image, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :roles_mask, type: Integer
  
  
  field :login, type: String 
  field :avatar_url, type: String
  field :gravatar_id, type: String
  field :url, type: String
  field :name, type: String
  field :company, type: String
  field :blog, type: String
  field :location, type: String

  field :hireable, type: Boolean
  field :bio, type: String
  field :public_repos, type: Integer
  field :public_gists, type: Integer
  field :followers, type: Integer
  field :following, type: Integer
  field :html_url, type: String
  field :created_at, type: DateTime
  field :user_type, type: String #dangerous... was type
  field :total_private_repos, type: Integer
  field :owned_private_repos, type: Integer
  field :private_gists, type: Integer
  field :disk_usage, type: Integer
  field :collaborators, type: Integer
  
  validates_presence_of :email, :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
  
  def from_github
    github = AaarReposUser.new(self.identities.first.nickname, self.identities.first.token)
    user = github.current_user
    #Let's set all the fields unless they already have data or new data is nil
    fields.keys.each do |field|
      self[field] = user[field] if self[field].nil? && !user[field].nil?
      logger.debug "#{field} : #{user[field]} #{self[field]}  #{self[field].nil? && !user[field].nil?}"
    end
    self["user_type"] = user["type"] if self["user_type"].nil?
  end

end
