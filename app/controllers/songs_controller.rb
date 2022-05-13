class SongsController < ApplicationController
  # GET /search?query=thriller
  def search
    # @songs = Song.where(title: params[:query])
    @songs = Song.where('title ILIKE ?', "%#{params[:query]}%")
    raise
  end

  # GET /songs/named/thriller
  def name
    @songs = Song.where('title ILIKE ?', "%#{params[:name]}%")
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
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  private

  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
