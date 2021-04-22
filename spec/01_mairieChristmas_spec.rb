require_relative '../lib/01_mairieChristmas.rb'

describe "Méthode get_townhall" do
  it "Return an array" do
    expect(townhall_email("http://www.annuaire-des-mairies.com/95/avernes.html")).to be_instance_of Array
  end
  it "Unacceptable nil value" do 
  	expect(townhall_email("http://www.annuaire-des-mairies.com/95/avernes.html")).not_to be_nil
  end

end