class ThemesController < ApplicationController
  def new
    @theme = Theme.new
  end
  def list
    @themes = Theme.all
  end
end
