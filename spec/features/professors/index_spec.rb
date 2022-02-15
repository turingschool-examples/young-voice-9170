require 'rails_helper'

RSpec.describe 'professors index page' do

  before(:each) do
    
    @flitwick = Professor.create!(name: "Filius Flitwick", age: 230, specialty: "Charms")
    @umbridge = Professor.create!(name: "Dolores Umbridge", age: 150, specialty: "Defence Against the Dark Arts")
    @longbottom = Professor.create!(name: "Neville Longbottom", age: 60, specialty: "Herbology")
    
    visit '/professors'
  end 
  
    scenario 'visitor sees list of professors and attributes' do

    expect(page).to have_content(@flitwick.name)
    expect(page).to have_content(@umbridge.name)
    expect(page).to have_content(@longbottom.name)
  end
end
