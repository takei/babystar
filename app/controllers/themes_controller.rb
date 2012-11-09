class ThemesController < ApplicationController
  def new
    @theme = Theme.new
  end
end
