class SessionsController < ApplicationController
  def new
    redirect_to controller: 'application', action: 'index' if current_user
  end

  def create
    if name_invalid?
      redirect_to '/login'
    else
      session[:name] = params[:name]
      redirect_to controller: 'application', action: 'index'
    end
  end

  def destroy
    session.delete :name
    redirect_to '/'
  end

  private 

  def name_invalid?
    params[:name].blank?
  end
end
