class MusicsController < ApplicationController

  def index
    # @musics = Music.includes(:user)
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    if @music.save
      redirect_to musics_path(@musics)
    else
      render :new
    end
  end

  def show
    @music = Music.find(params[:id])
    @comment = Comment.new
    @comments = @music.comments.includes(:user)

  end

  def edit
    @music = Music.find(params[:id])
    unless @music.user.id == current_user.id
    redirect_to action: :index
    end
  end

  def update
    @music = Music.find(params[:id])
    music = Music.find(params[:id])
    if 
      music.update(music_params)
      redirect_to music_path
    else
      render :edit
    end
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to root_path 
  end

  private
  def music_params
    params.require(:music).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
