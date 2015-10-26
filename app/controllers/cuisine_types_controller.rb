class CuisineTypesController < ApplicationController

def index

	@cuisine_types=CuisineType.all
	
end

def show

	@cuisine_type=CuisineType.find(params[:id])

end

def new

	@cuisine_type=CuisineType.new

end

def create

	@cuisine_type=CuisineType.new(cuisine_type_params)
		if @cuisine_type.save
			redirect_to cuisine_types_path, alert: "Cuisine type created successfully"
		else
			render :new

		end
end

def update

	@cuisine_type=CuisineType.find(params[:id])
	
	#@cuisine_type.update(cuisine_type_params) why does this line give an error message? Missing template cuisine_types/update
	
	if @cuisine_type.update(cuisine_type_params)
			redirect_to @cuisine_type, alert: "Cuisine type updated"
		else
			render :new
		end
end

def edit

	@cuisine_type=CuisineType.find(params[:id])

end


def destroy

	@cuisine_type=CuisineType.find(params[:id])
	@cuisine_type.destroy
	redirect_to @cuisine_type, alert: "Cuisine type deleted successfully"

end


private

	def cuisine_type_params
		params.require(:cuisine_type).permit(:name)

	end

end


