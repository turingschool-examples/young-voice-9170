class ProfessorController < ApplicationController
  def index
    # binding.pry
    @professors = Professor.all
  end
end
