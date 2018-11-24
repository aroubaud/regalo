class GiftsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @gift = Gift.find(params[:id])
  end
end
