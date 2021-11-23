class AuthorsController < ApplicationController
  before_action :set_author_params, only: [:create]
  before_action :set_author, only: [:show, :update]
  attr_accessor :author_params

  def index
    @authors = Author.all
  end

  def show
  end

  def new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def set_author_params
    @author_params ||= params.require(:author).permit(:first_name, :last_name, :homepage)
  end

  def set_author
    @author ||= Author.find_by(id: params[:id])
  end
end

