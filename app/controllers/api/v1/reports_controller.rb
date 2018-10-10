class API::V1::ReportsController < ApplicationController
  def new
    type = permited_params[:type]

    if Vehicle.permited_type? type
      respond_to do |format|
        format.csv { send_data Vehicle.report(type), filename: "#{type}_#{Date.today}.csv" }
        format.xls { send_data Vehicle.report(type, col_sep: "\t"), filename: "#{type}_#{Date.today}.csv" }
      end
    else
      render json: { error: 'invalid report type' }, status: :not_acceptable
    end
  end

  private

  def permited_params
    params.permit(:type)
  end
end
