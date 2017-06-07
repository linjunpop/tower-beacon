class PagesController < ApplicationController
  def main
    render :main
  end

  def show
    render params[:page]
  end
end
