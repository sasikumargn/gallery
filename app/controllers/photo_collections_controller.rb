class PhotoCollectionsController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]  
	def index
		sleep 1 if request.xhr?
		@photo_collections = PhotoCollection.paginate(:per_page => 7, :page => params[:page])
	end

	def my_collections
		sleep 1 if request.xhr?
		@photo_collections = current_user.photo_collections.paginate(:per_page => 7, :page => params[:page])
	end

	def galleries
		@photo_collections = PhotoCollection.all
	end
	
	def new
		@photo_collection = PhotoCollection.new 
	end

	def create
	 	@photo_collection = PhotoCollection.new(params[:photo_collection])
	 	@photo_collection.user_id = current_user.id
	 	if @photo_collection.save
  			redirect_to photo_collection_path(@photo_collection.token)
		else
  			render :new 
		end
	end

	def edit
		@photo_collection = PhotoCollection.find(params[:id])
		render :template => 'photo_collections/new'
	end

	def update
		@photo_collection = PhotoCollection.find(params[:id])
		@photo_collection.update_attributes(params[:photo_collection])
		@photo_collection.user_id = current_user.id
	 	if @photo_collection.save
  			redirect_to photo_collection_path(@photo_collection.token)
		else
  			redirect_to edit_photo_collection_path(@photo_collection.id) 
		end
	end

	def show
		@photo_collection = PhotoCollection.find_by_token(params[:token])
	end

	def destroy
		@photo_collection = PhotoCollection.find(params[:id])
		@photo_collection.destroy
		redirect_to photo_collections_path
	end
end
