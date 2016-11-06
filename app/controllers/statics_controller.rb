class StaticsController < ApplicationController
  def index
    @node = Node.all
  end
end
