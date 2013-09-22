class ActivityScoresController < ApplicationController
  before_action :set_activity_score, only: [:show, :edit, :update, :destroy]

  # GET /activity_scores
  # GET /activity_scores.json
  def index
    @activity_scores = ActivityScore.all
  end

  # GET /activity_scores/1
  # GET /activity_scores/1.json
  def show
  end

  # GET /activity_scores/new
  def new
    @activity_score = ActivityScore.new
  end

  # GET /activity_scores/1/edit
  def edit
  end

  # POST /activity_scores
  # POST /activity_scores.json
  def create
    @activity_score = ActivityScore.new(activity_score_params)

    respond_to do |format|
      if @activity_score.save
        format.html { redirect_to @activity_score, notice: 'Activity score was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity_score }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_scores/1
  # PATCH/PUT /activity_scores/1.json
  def update
    respond_to do |format|
      if @activity_score.update(activity_score_params)
        format.html { redirect_to @activity_score, notice: 'Activity score was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_scores/1
  # DELETE /activity_scores/1.json
  def destroy
    @activity_score.destroy
    respond_to do |format|
      format.html { redirect_to activity_scores_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_score
      @activity_score = ActivityScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_score_params
      params.require(:activity_score).permit(:repo_id, :year, :week, :pulls, :issues_close, :issues_comments, :commits, :commits_change)
    end
end
