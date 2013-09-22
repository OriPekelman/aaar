json.array!(@activity_scores) do |activity_score|
  json.extract! activity_score, :repo_id, :year, :week, :pulls, :issues_close, :issues_comments, :commits, :commits_change
  json.url activity_score_url(activity_score, format: :json)
end
