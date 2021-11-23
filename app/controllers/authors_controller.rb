class AuthorsController < ApplicationController
  before_action :set_author_params, only: [:create]
  before_action :set_author, only: [:show]
  attr_accessor :author_params

  def index
  end

  def show
  end

  def new
  end

  def create
    Author.create(first_name: author_params[:first_name],
                  last_name: author_params[:last_name],
                  homepage: author_params[:homepage])
    redirect_to root_path
  end

  private

  def set_author_params
    @author_params ||= params.require(:author).permit(:first_name, :last_name, :homepage)
  end

  def set_author
    @author ||= Author.find_by(id: params[:id])
  end
end

