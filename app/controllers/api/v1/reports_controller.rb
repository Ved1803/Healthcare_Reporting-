class Api::V1::ReportsController < ApplicationController
  def index
    reports = @current_user.reports
    render json: reports
  end

  def create
    report = @current_user.reports.new(report_params)
    authorize report

    if report.save
      render json: report, status: :created
    else
      rnder json: { errors: report.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def submit
		debugger
    report = Report.find(params[:id])
    authorize report, :submit?

    report.update(status: :submitted)
    render json: report
  end

  def approve
    report = Report.find(params[:id])
    authorize report, :approve?

    report.update(status: :approved)
    render json: report
  end

	def reject
		report = Report.find(params[:id])
		authorize report, :reject?

		report.update(status: :rejected)
		render json: report
	end

	def start_review
		report = Report.find(params[:id])
		authorize report, :start_review?

		report.update(status: :under_review)
		render json: report
	end

  private

  def report_params
    params.permit(:title, :description, :severity)
  end
end
