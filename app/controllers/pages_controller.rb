class PagesController < ApplicationController
  layout "frontend/layout", only: :index

  def index
    authorize :page, :index?
  end

  def dashboard
    authorize :page, :dashboard?
  end
end
