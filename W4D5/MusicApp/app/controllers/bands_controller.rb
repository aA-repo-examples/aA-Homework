class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
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
    @band = Band.find(params[:id])
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
    @band = Band.find_by(band_params)
    if @band.delete
      render :index
    else
      flash.now[:errors] = ['Invalid band.']
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
