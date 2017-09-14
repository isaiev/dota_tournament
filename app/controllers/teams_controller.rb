class TeamsController < ApplicationController

  skip_before_action :authenticate, only: [:index]

  before_action :init_team, only: %i[edit update destroy]
  before_action :check_owner, only: %i[edit update destroy]
  before_action :check_team_count, only: [:create]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params.merge(user_id: @current_user.id))

    if @team.save
      redirect_to_root_path
    else
      render :new
    end
  end

  def edit; end

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

  def init_team
    @team = Team.find(params[:id])
  end

  def check_owner
    forbidden unless @team.owner == @current_user
  end

  def check_team_count
    forbidden if @current_user.team
  end

  def team_params
    params[:team].permit(:title, :logo)
  end

  def redirect_to_root_path
    redirect_to root_path
  end

end
