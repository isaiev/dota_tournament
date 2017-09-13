class TeamsController < ApplicationController

  before_action :find_team, only: [:edit, :update, :destroy]
  before_action :check_logged_user, only: [:new, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  before_action :check_team_count, only: [:create]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params.merge({ user_id: @current_user.id }))

    if @team.save
      redirect_to_root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update(team_params)

    if @team.save
      redirect_to_root_path
    else
      render :edit
    end
  end

  def destroy
    @team.destroy!

    redirect_to_root_path
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def check_owner
    redirect_to_root_path unless @team.owner == @current_user
  end

  def check_logged_user
    redirect_to_root_path unless @current_user
  end

  def check_team_count
    redirect_to_root_path if @current_user.team
  end

  def redirect_to_root_path
    redirect_to root_path
  end

  def team_params
    params[:team].permit(:title, :logo)
  end

end
