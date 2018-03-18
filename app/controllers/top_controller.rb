class TopController < ApplicationController

  #before_action :authenticate_user!, only: [:show]

  def index
  end

  def show
    if user_signed_in? || student_signed_in?
    else
      redirect_to top_index_path
    end
  end


end
