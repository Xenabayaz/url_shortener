# app/controllers/urls_controller.rb
class UrlsController < ApplicationController
  def index
    @urls = Url.includes(:analytics).all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    
    if @url.save
      redirect_to urls_path, notice: "Shortened URL created successfully!"
    else
      flash[:alert] = @url.errors.full_messages
      render :new
    end
  end

  def show
    @url = Url.find_by(id: params[:id])

    if @url
      @url.analytics.create(visited_at: Time.now) # Track visit
      render :show
    else
      flas[:alert] = @url.errors.full_messages
      redirect_to urls_path, alert: "URL not found!"
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
