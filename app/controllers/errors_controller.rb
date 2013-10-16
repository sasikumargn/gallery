class ErrorsController < ApplicationController
	def handle404
		render :template => "shared/404"
	end
end
