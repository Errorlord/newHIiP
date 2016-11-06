class ImagesController < ApplicationController
    before_action :set_image, only: [:edit, :update, :show, :destroy]
    
    def index
        @images = Image.all
    end
    
    def new
        @image = Image.new
        @position = params[:position]
        @image.position = params[:position]
    end
    
    def create
        @image = Image.new(image_params)
        @image.position = params[:position]
        
        if(@image.save)
            flash[:notice] = "Image was succesfully created!"
            redirect_to node_path(find_node_with_position(@image.position))
        else
            render 'new'
        end
    end
    
    def show
        @images = Image.all
        
    end
    
    def edit

    end
    
    def update
        if(@image.save)
            flash[:notice] = "Image was succesfully created!"
            redirect_to node_path()
        else
            render 'new'
        end
    end
    
    def delete
        @image.destroy
        redirect_to images_path
    end
    
    private
    
    def set_image
        @image = Image.find(params[:id])
    end
    
    def image_params
        params.require(:image).permit(:img, :title, :content)
    end
    
    def find_node_with_position(input)
        print "LOOK HERE. INPUT = #{input}"
        
        @nodes = Node.all
        @nodes.each do |f|
          print "INPUT: #{input}\t\tf.position: #{f.position}"
          if f.position == input
            print "Found."
            return f
          end
        end
        
        print "Failed to find node w/ position"
        return Node.find(params["1"])
    end
end