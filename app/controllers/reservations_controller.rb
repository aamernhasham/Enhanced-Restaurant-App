class ReservationsController < ApplicationController

	def index
		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservations=@restaurant.reservations
	end

	def show
		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservation=Reservation.find(params[:id])
	end

	def new
		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservation=Reservation.new
	end

	def create
		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservation=Reservation.new(reservation_params)
		@reservation.restaurant=@restaurant

		if @reservation.save
			redirect_to @restaurant, alert: "Reservation created successfully"
		else
			render :new

		end
	end

	def edit

		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservation=Reservation.find(params[:id])

	end

	def update
		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservation=Reservation.find(params[:id])
		if @reservation.update(reservation_params)
			redirect_to @restaurant, alert: "Reservation updated successfully"
		else
			render :new
		end
	end

	def destroy
		#@reservation.destroy
		@restaurant=Restaurant.find(params[:restaurant_id])
		@reservation=Reservation.find(params[:id])
		@reservation.destroy
		redirect_to @restaurant, alert: "Reservation deleted successfully"

	end

	private 

	def reservation_params
		params.require(:reservation).permit(:seating_time,:party_size)

	end
end
