class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]

  # GET /papers
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      redirect_to @paper, notice: 'Paper was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /papers/1
  def update
    if update_paper(paper_params, @paper)
      redirect_to @paper, notice: 'Paper was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /papers/1
  def destroy
    @paper.destroy
    redirect_to papers_url, notice: 'Paper was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def paper_params
      params.require(:paper).permit(:title, :venue, :year, {:author_ids => []})
    end

  def update_paper(paper_params, paper)
    return false unless paper.update(title: paper_params[:title],
                  venue: paper_params[:venue],
                  year: paper_params[:year])
    if paper_params[:author_ids].present?
      paper_params[:author_ids].each do |author_id|
        author = Author.find_by(id: author_id)
        already_present = paper.authors.find_by(id: author_id).present?
        paper.authors << author unless author.nil? || already_present
      end
    end
    paper.save
  end
end
