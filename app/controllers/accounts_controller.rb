class AccountsController < ApplicationController
  def index
    @accounts = Account.find :all, :include => [:books_with_titles, :names, :nicks, :sites, :portraits, :services]
  end
end
