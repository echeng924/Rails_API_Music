class Api::V1::SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  def index
    @songs = Song.all.includes(:artist)
    render json: @songs, include: [:artist]
  end

  def show
    render json: @song
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      render json: @song, status: :created
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.erros, status: :unprocessable_entity
    end
  end

  def destroy
    @song.destroy
  end

  private

  def song_params
    params.permit(:title, :body, :artist_id)
  end

  def set_song
    @song ||= Song.find(params[:id])
  end
end
