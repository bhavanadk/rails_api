class Api::V1::MoviesController < ApplicationController
	def create
		@movie = Movie.new(movie_params)
		if @movie.save
		render json: {message: 'successfully created', data: @movie, status_code: 201}
		else
		render json: {message: 'failure', data: @movie.errors, status_code: 422}
		end
	end

	def index
		@movies=Movie.all
		render json: {message: 'successfully listed', data: @movies, status_code: 200}
	end

	
	def update
		@movie=Movie.find_by_movie_name(params[:movie_name])
		@movie.update_attributes(movie_params)
		if render json: {message: 'successfully updated', data: @movie, status_code: 200}
		else
		render json: {message: 'failure', data: @movie.errors, status_code: 422}
		end
	end

	def search_by_name
		@movie=Movie.find_by_movie_name(params[:movie_name])
		render json: {message: 'successfully showed', data: @movie, status_code: 200}
	end


	def show
		@movie=Movie.find_by_movie_name(params[:movie_name])
		render json: {message: 'successfully showed', data: @movie, status_code: 200}
	end

	def destroy
		@movie=Movie.find_by_movie_name(params[:movie_name])
		@movie.destroy
		render json: {message: 'successfully deleted', data: @movie, status_code: 200}
	end


	private

		def movie_params
			params.require(:movie).permit(:title,:year,:rating,:language,:actor,:director,:producer)
		end
end