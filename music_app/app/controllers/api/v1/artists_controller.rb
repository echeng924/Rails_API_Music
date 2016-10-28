class Api::V1::ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :destroy]

  def index
    @artists = Artist.all.includes(:songs)
    render json: @artists, include: [:songs]
  end

  def show
    render json: @artist
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      render json: @artist, status: :created
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def update
    if @artist.update(artist_params)
      render json: @artist
    else
      render json: @artist.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @artist.destroy
  end

  private

  def artist_params
    params.permit(:name)
  end

  def set_artist
    @artist ||= Artist.find(params[:id])
  end

end
