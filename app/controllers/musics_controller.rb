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

  private
  def music_params
    params.require(:music).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
