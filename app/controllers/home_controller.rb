class HomeController < ApplicationController
	def index
		sleep 1 if request.xhr?
		@photo_collections = PhotoCollection.paginate(:per_page => 7, :page => params[:page])
	end
end
