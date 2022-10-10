class SessionsController < ApplicationController
  def index
    @user = current_user
    @sessions = Session.all
    # @hosts = Host.all
    # @session = Session.new(params[:id])
    # .order(created_at: :desc)

    # @users = User.all

  end

  def show
    @user = current_user
    # @host = Host.find(params[:host_id])
    @session = Session.find(params[:session_id])
  end

  def new

    @host = Host.find(params[:host_id])
    @user = current_user
    @session = Session.new

  end

  def create
    @session = Session.new(session_params)
    @host = Host.find(params[:host_id])
    @user = current_user
    @session.user = current_user
    # @sessions = Session.all
    # authorize @session

    if @session.save
      redirect_to sessions_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
    @session = Session.find(params[:session_id])
    # authorize @session
  end

  def update
    @session = Session.find(params[:session_id])

    @user = current_user
    @session.user = @user
    # authorize @session

    if @session.update(session_params_update)
      redirect_to session_path
    else
      render :edit
    end
  end

  def destroy
    @session = Session.find(params[:format])
    # authorize @session

    if @session.destroy
      redirect_to sessions_path
    end
  end


    private

  def session_params
    params.require(:session).permit(:date, :start_time, :end_time, :address, :host_id)
  end

  def session_params_update
    params.require(:session).permit(:date, :start_time, :end_time, :address)
  end
end
