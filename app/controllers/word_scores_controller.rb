class WordScoresController < ApplicationController
  # before_action :set_word_score, only: [:show, :edit, :update, :destroy]

  # GET /word_scores
  # GET /word_scores.json
  def index
    @word_scores = WordScore.all
  end

  # GET /word_scores/1
  # GET /word_scores/1.json
  # def show
  # end

  # GET /word_scores/new
  def new
    @word_score = WordScore.new
  end

  # GET /word_scores/1/edit
  # def edit
  # end

  # POST /word_scores
  # POST /word_scores.json
  def create
    @word_score = WordScore.new(word_score_params)

    respond_to do |format|
      if @word_score.save
        format.html { redirect_to @word_score, notice: 'Word score was successfully created.' }
        format.json { render :show, status: :created, location: @word_score }
      else
        format.html { render :new }
        format.json { render json: @word_score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_scores/1
  # PATCH/PUT /word_scores/1.json
  # def update
  #   respond_to do |format|
  #     if @word_score.update(word_score_params)
  #       format.html { redirect_to @word_score, notice: 'Word score was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @word_score }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @word_score.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /word_scores/1
  # DELETE /word_scores/1.json
  # def destroy
  #   @word_score.destroy
  #   respond_to do |format|
  #     format.html { redirect_to word_scores_url, notice: 'Word score was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_score
      @word_score = WordScore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_score_params
      params.require(:word_score).permit(:word)
    end
end
