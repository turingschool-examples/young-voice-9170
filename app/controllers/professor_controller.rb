class ProfessorController < ApplicationController
  def index
    @professors = Professor.all
  end

  def show
    @professor = Professor.find(params[:id])
  end
end
