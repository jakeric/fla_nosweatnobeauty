class SportsController < ApplicationController

  def index
    @sports = Sport.all

  end

  def show
    @sport = Sport.new
    @user_not_logged = !user_signed_in?

    @sports = Sport.where("sport = ?", params[:id])

  end

  def new
    @sport = Sport.new
  end

  def create
    if Sport.where("sportname = ?", sport_params[:sportname]) == []
      @sport = Sport.new(sport_params)
      @sport.save
      redirect_to pages_about_path
    else
      redirect_to new_sport_path
    end
  end

  def edit
    # missing function for updating points for a sport
  end

  def update
    @sport.update(sport_params)
    redirect_to sport_path(@sport)
  end

  def destroy
    @sport.delete
    redirect_to pages_about_path
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end

  def sport_params
    params.require(:sport).permit(:sportname, :pointsperaction)
  end

end
