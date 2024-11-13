class ImagesController < ApplicationController
  def create
    @image = Image.create(
      url: params[:url],
      product_id: params[:product_id],
    )
    render :show
  end
end
