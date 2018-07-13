class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.find_by(band_params)
    if @band.save
      redirect_to band_url
    else
      flash[:errors] = @band.errors.full_messages
      render :new
    end


  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    @band = Band.find_by(band_params)
    if @band.update
      redirect_to band_url
    else
      flash[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
  def band_params
    params.expect(:band).permit(:name)
  end
end
