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
    @word_grid = @study.generate

    kit = PDFKit.new(render_to_string layout: false)
    pdf = kit.to_pdf
    # response.headers["Content-Type"] = "application/pdf"
    # response.body = pdf
    send_data pdf, filename: "study.pdf", type: "application/pdf"
  end
end
