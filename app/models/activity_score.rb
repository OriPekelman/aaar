class ActivityScore
  include Mongoid::Document
  belongs_to :repo

  field :repo_id, type: String
  field :year, type: Integer
  field :week, type: Integer
  field :pulls, type: Integer
  field :issues_close, type: Integer
  field :issues_comments, type: Integer
  field :commits, type: Integer
  field :commits_change, type: Integer
end
