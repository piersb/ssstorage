class AVFilesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @avfile = current_user.avfiles.create(avfiles_params)
    if @avfile.save
      flash[:success] = 'avfile created'
      redirect_to root_url
    else
      @avfiles = []
      @s3files = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  def show
    @avfile = AVFile.find(params[:id])
  end

  def edit
  end

  private

    def avfiles_params
      params.require(:avfile).permit(:title, :file)
    end

end
