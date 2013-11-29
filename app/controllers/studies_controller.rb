class StudiesController < ApplicationController
  before_filter :authenticate_user!

  # GET /studies/new
  def new
  end

  # POST /studies
  def create
    tags = params[:tags].split(',').map { |v| v.strip }
    is_or = params[:is_or] == 'true' ? true : false
    @study = Study.new(current_user.id, tags, is_or, params[:pages])

    render json: @study.generate
  end
end
