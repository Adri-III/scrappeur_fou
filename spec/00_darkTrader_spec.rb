require_relative '../lib/00_darkTrader.rb'

describe "Le trader ancestral !" do
  it "Return an array" do
    expect(cryptocurrencies).to be_instance_of Array
  end
  it "Unaccepted nil value" do 
  	expect(cryptocurrencies).not_to be_nil
  end
end