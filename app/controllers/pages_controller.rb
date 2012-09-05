class PagesController < ApplicationController
  def home
    @companies = Company.all
  end

  def about
  end
end
