class PicturesController < ApplicationController

    def index
      @pictures = Picture.all
    end

    def show
      @picture = Picture.find(params[:id])
    end

    def new
      @picture = Picture.new
    end

    def create
      @picture = Picture.new(pictures_params)
      if @picture.save
        redirect_to pictures_url
      else
        render :new
      end
    end

    def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy
      redirect_to pictures_url
    end

    def edit
      @picture = Picture.find(params[:id])
    end

    private
    def pictures_params
      params.require(:picture).permit(:artist, :title, :url)
    end
end
