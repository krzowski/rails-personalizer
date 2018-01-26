class AppPagesController < ApplicationController
  before_action :authenticate_user!, except: :home

  def home
    unless current_user
      flash[:notice] = notice if notice
      redirect_to new_user_session_path
    end
  end

  def checklist
  end
end
