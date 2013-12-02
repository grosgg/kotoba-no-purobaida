class PracticesController < ApplicationController
  before_filter :authenticate_user!

  # GET /practices/new
  def new
  end

  # POST /practices
  def create
    tags = params[:tags].split(',').map { |v| v.strip }
    is_or = params[:is_or] == 'true' ? true : false

    @practice = Practice.new(current_user.id, tags, is_or, params[:pages])
    @word_grid = @practice.generate

    kit = PDFKit.new(render_to_string layout: false)
    pdf = kit.to_pdf
    
    send_data pdf, filename: "Practice #{current_user.name} #{Date.today.to_s}.pdf", type: "application/pdf"
  end
end
