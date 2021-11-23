class AuthorsController < ApplicationController
  before_action :set_author_params, only: [:create, :update]
  before_action :set_author, only: [:show, :edit, :update]
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

  def update
    @author.update(author_params)
    if @author.save
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def set_author_params
    @author_params ||= params.require(:author).permit(:first_name, :last_name, :homepage)
  end

  def set_author
    @author ||= Author.find_by(id: params[:id])
  end
end

