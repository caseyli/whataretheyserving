class PagesController < ApplicationController
  def home
    @companies = Company.all
		@latest_entries = Entry.all(limit: 5)
  end

  def about
  end
end
