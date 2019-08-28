class SportactionsController < ApplicationController
  def new
    @sportaction = Sportaction.new
    @sports = Sport.pluck(:sportname)
    @employees = Employee.pluck(:employeename)
    #respond_to do |format|
    #  format.js
    #  format.html
    #end
  end

  def index
    @sportactions = Sportaction.all.order('sportactions.created_at DESC')
  end

  def create
    current_user_id = current_user.id
    date = "#{action_params["datum(1i)"]}-#{action_params["datum(2i)"]}-#{action_params["datum(3i)"]}"

    @sportaction = Sportaction.new(datum: date, user_id: current_user_id)


    @sportaction.sport = Sport.where("sportname = ?", action_params[:sport]).first
    @sportaction.employee = Employee.where("employeename = ?", action_params[:employee]).first

    if @sportaction.save
      @sportaction.save!
      redirect_to ranking_path
    else
      @sportaction = Sportaction.new
      redirect_to departmentranking
    end
  end

  def destroy
    @sportaction = Sportaction.find(params[:id])
    @sportaction.destroy
    redirect_to sportactions_path
  end

  def ranking
    sql = "SELECT e.id, e.employeename, sum(s.pointsperaction) as totalpoints FROM sportactions a left join sports s on s.id=a.sport_id left join employees e on e.id=a.employee_id group by e.id, e.employeename ORDER BY totalpoints desc"
    @actionranking = ActiveRecord::Base.connection.execute(sql)

    sql_dep = "SELECT e.department, sum(s.pointsperaction) as totalpoints FROM sportactions a left join sports s on s.id=a.sport_id left join employees e on e.id=a.employee_id group by e.department ORDER BY totalpoints desc"
    @departmentranking = ActiveRecord::Base.connection.execute(sql_dep)
    render "pages/dashboard"
  end

  private

  def action_params
    params.require(:sportaction).permit(:datum, :sport, :employee)
  end

end
