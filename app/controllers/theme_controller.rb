class ThemeController < ApplicationController
  def new
    @theme = Theme.new()
  end
end
