class SongsController < ApplicationController
  def search
    # HTTP request: GET /search?query=thriller
    @songs = Song.where(title: params[:query])
  end

  def named
    # HTTP request: GET /songs/named/thriller
    @songs = Song.where(title: params[:name])
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      # Rediriger vers la show
      redirect_to songs_path(@song)
      # Rediriger vers la liste de tous les songs
      # redirect_to songs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
