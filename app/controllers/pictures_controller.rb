class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :update, :show, :destroy]
  
  def index
    @pictures = Picture.all
  end
  
  def new
    @picture = Picture.new
    @position = params[:position]
  end
  
  def create
    @picture = Picture.new(picture_params)
    
    @picture.position = params[:position]
    
    if(@picture.save)
      # flash stuff
      flash[:notice] = "Picture was sucesfully saved."
      redirect_to node_path(find_node_with_position(@picture.position))
    else
      render 'new'
    end
  end
  
  def show
    @pictures = Picture.all
  end
  
  def edit
    # blank
  end
  
  def update
    if @picture.update(picture_params)
      flash[:notice] = "Picture was succesfully updated!"
      redirect_to node_path(find_node_with_position(@picture.position))
    else
      render 'new'
    end
  end
  
  def destroy
    @picture.destroy
    flash[:notice] = "Picture was succesfully destroyed!"
    redirect_to nodes_path
  end
  
  private
  
  def set_picture
    @picture = Picture.find(params[:id])
  end
  
  def picture_params
    params.require(:picture).permit(:image)
  end
  
  def find_node_with_position(input)
    nodes = Node.all
    nodes.each do |f|
      if f.position == input
        return f
      end
    end
    return Node.find(params["1"])
  end
end