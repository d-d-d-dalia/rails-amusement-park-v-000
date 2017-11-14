class RidesController < ApplicationController

	def new
   	 @ride = Ride.create(
      	:user_id => params[:ride][:user_id],
     	 :attraction_id => params[:ride][:attraction_id]
   		 )
   	 @message = @ride.take_ride
   	 redirect_to user_path(@ride.user, :message => @message)
   	end

   	def create
   		@ride = Ride.create(
      	:user_id => params[:ride][:user_id],
     	 :attraction_id => params[:ride][:attraction_id]
   		 )
   	 	@message = @ride.take_ride
   	 	flash[:notice] = @message
   	 	redirect_to user_path(@ride.user, :message => @message)
   	end
 	
end
