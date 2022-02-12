require 'rails_helper'

RSpec.describe "professor index page", type: :feature do
  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
  end

  scenario "visitor sees list of professors name, age and specialty" do
    visit '/professors'

    expect(current_path).to eq('/professors')
    expect(page).to have_content(@snape.name)
    expect(page).to have_content(@snape.age)
    expect(page).to have_content(@snape.specialty)

    expect(page).to have_content(@hagarid.name)
    expect(page).to have_content(@hagarid.age)
    expect(page).to have_content(@hagarid.specialty)

    expect(page).to have_content(@lupin.name)
    expect(page).to have_content(@lupin.age)
    expect(page).to have_content(@lupin.specialty)
  end
end
