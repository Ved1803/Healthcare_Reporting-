class Api::V1::CommentsController < ApplicationController
	before_action :authorize_comment, only: [:create, :index]

	def create
		comment = @report.comments.new(comment_params)
		comment.user = @current_user
		authorize comment, :create?

		if comment.save
			render json: comment, status: :created
		else
			render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def index
		comments = @report.comments
		authorize comments
		render json: comments
	end
	
	private

	def authorize_comment
		debugger
		@report = Report.find(params[:report_id])
	end
	
	def comment_params
		params.permit(:content)
	end
end
