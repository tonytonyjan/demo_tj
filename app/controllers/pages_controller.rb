class PagesController < ApplicationController
  #layout 'admin'

  def home
  end

  def about
    @name = "#{params[:first_name]} #{params[:last_name]} "
    #render layout: 'admin'
  end

  def math
    @numbers = (1..46).to_a.sample(6)
  end

  def form
  end
end
