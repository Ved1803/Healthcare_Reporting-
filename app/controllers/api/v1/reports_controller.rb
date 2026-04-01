class Api::V1::ReportsController < ApplicationController
  def index
    reports = @current_user.reports
    render json: reports
  end

  def create
    report = @current_user.reports.new(report_params)

    if report.save
    render json: report, status: :created
    else
    rnder json: { errors: report.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def report_params
    params.permit(:title, :description, :severity)
  end
end
