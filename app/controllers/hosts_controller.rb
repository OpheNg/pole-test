class HostsController < ApplicationController
  def index
    @user = current_user
    @hosts = Host.all
    # @hosts = policy_scope(host).order(created_at: :desc)

    # @markers = @hosts.geocoded.map do |host|
    #   {
    #     lat: host.latitude,
    #     lng: host.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { host: host }),
    #     image_url: helpers.asset_url("mama.png")
    #   }
    # end
  end

  def new
    @user = current_user
    @host = Host.new
    # authorize @host
  end

  def create
    @host = Host.new(host_params)

    @user = current_user
    @host.user = current_user
    # authorize @host

    if @host.save
      redirect_to hosts_path
    else
    end
  end

  def edit
    @user = current_user
    @host = host.find(params[:host_id])
    # authorize @host
  end

  def update
    @host = host.find(params[:host_id])

    @user = current_user
    @host.user = @user
    # authorize @host

    if @host.update(host_params_update)
      redirect_to hosts_path
    else
    end
  end

  def destroy
    @host = host.find(params[:host_id])
    # authorize @host

    if @host.destroy
      redirect_to hosts_path
    else
    end
  end

  private

  def host_params
    params.require(:host).permit(:first_name, :last_name,:photo, :email, :address)
  end

  def host_params_update
    params.require(:host).permit(:address,:email, :photo)
  end
end
