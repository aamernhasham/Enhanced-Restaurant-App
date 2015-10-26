class RestaurantsController < ApplicationController

def index

@restaurants=Restaurant.all

end

def show

@restaurant=Restaurant.find(params[:id])

end

def new

@restaurant=Restaurant.new


end

def create

	@restaurant=Restaurant.new(restaurant_params)
	
	if @restaurant.save
		redirect_to restaurants_path, alert: "Restaurant created successfully"
	else
		render :new
	end

end

	# @restaurant=Restaurant.find(params[:restaurant_id])
	# 	@reservation=Reservation.new(reservation_params)
	# 	@reservation.restaurant=@restaurant

	# 	if @reservation.save
	# 		redirect_to @restaurant, alert: "Reservation created successfully"
	# 	else
	# 		render :new

	# 	end


def edit 

@restaurant=Restaurant.find(params[:id])

end

def update

@restaurant=Restaurant.find(params[:id])
if @restaurant.update(restaurant_params)
	redirect_to @restaurant, alert: "Restaurant information updated successfully"
else
	render :new

end

end

def destroy

@restaurant=Restaurant.find(params[:id])
@restaurant.destroy
redirect_to restaurants_path, alert: "Restaurant successfully deleted!"

end

private

def restaurant_params

params.require(:restaurant).permit(:name, :address, :capacity,:cuisine_type_id)

end



end