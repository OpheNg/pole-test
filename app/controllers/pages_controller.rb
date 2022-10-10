class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def shop
    @users = User.all
  end

  def tutorials
  end
end
