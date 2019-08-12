class ActionsController < ApplicationController
  def new
    @action = Action.new
    @sports = Sport.pluck(:sportname)
    @employees = Employee.pluck(:name)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @action = Action.new(action_params)

    @sport = Sport.where("sportname = ?", params[:sport])
    @action.sport = @sport

    @action.user = current_user
    @employee = Employee.where("name = ?", params[:employee])


    if @action.save
      @action.save!
      redirect_to dashboard_path
    else
      @action = Action.new
      departmentranking
    end
  end

  def destroy
    @action = Action.find(params[:id])
    redirect_to dashboard_path
  end

  def ranking
    sql = "SELECT e.id, e.name, sum(s.pointsperaction) as totalpoints FROM actions a left join sports s on s.id=a.sport_id left join employees e on e.id=a.employee_id group by e.id, e.name ORDER BY totalpoints desc"
    @actionranking = ActiveRecord::Base.connection.execute(sql)

    sql_dep = "SELECT e.department, sum(s.pointsperaction) as totalpoints FROM actions a left join sports s on s.id=a.sport_id left join employees e on e.id=a.employee_id group by e.department ORDER BY totalpoints desc"
    @departmentranking = ActiveRecord::Base.connection.execute(sql_dep)
    render "pages/dashboard"
  end


end
