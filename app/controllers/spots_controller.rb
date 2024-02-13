class SpotsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
      if params[:search] == nil
        @hotel = params[:tag_id].present? ? Tag.find(params[:tag_id]).spots : Spot.all
      elsif params[:search] == ''
        @hotel = params[:tag_id].present? ? Tag.find(params[:tag_id]).spots : Spot.all
      else
       @spots = Spot.where("place LIKE ? OR about LIKE ? OR limk LIKE ? OR title LIKE ? OR address LIKE ? OR image LIKE ?" , "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      end
    
      if params[:search] != nil && params[:search] != ''
      
        search = params[:search]
        @spots = Spot.joins(:user).where("place LIKE ? OR about LIKE ?, link LIKE ?, title LIKE ?, address LIKE ?", "%#{search}%", "%#{search}%").page(params[:page]).per(3)
      else
        @spots = Spot.all.page(params[:page]).per(3)
       
      end
      @spots = @spots.page(params[:page]).per(3) 
    
      @hotel = Spot.where(Mana:"hotel")
      @sightseeing = Spot.where(Mana:"sightseeing")
      @restaurant = Spot.where(Mana:"restaurant")
    end
    def top
      @hotel = Spot.where(Mana:"hotel")
      @sightseeing = Spot.where(Mana:"sightseeing")
      @restaurant = Spot.where(Mana:"restaurant")
    end

    def show
        @spot = Spot.find(params[:id])
        @comments = @spot.comments
        @comment = Comment.new  
    end
    def new
        @spot = Spot.new
        @category = params[:category]
    end

    def edit
      @spot =Spot.find(params[:id])
    end

    def destroy
      spot = Spot.find(params[:id])
      spot.destroy
      redirect_to action: :index
    end

    def update
      spot =Spot.find(params[:id])
      if spot.update(spot_params)
        redirect_to :action => "show", :id => spot.id
      else
        redirect_to :action => "new"
      end
    end
    
    def create

        @spot = Spot.new(spot_params)
        @spot.user_id = current_user.id 

        if @spot.save 
          redirect_to action: 'index'
        else 
          redirect_to action: 'new'
        end
    end  
private
   def spot_params
     params.require(:spot).permit(:place, :about, :link, :title, :address, :image, :name, :category, :level, :q,:w, :e, :overall, :r, :t, :y, :u, :i, :o, :p, :a, :s, :d, :f, :g, :h, :j, :body, :lat, :lng, :Mana, :text, :tag_ids) 
   end
   
end  

