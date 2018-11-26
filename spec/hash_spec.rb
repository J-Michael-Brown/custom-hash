require ('hash')
require ('rspec')

describe ("Worse_Hach class") do

  it ("single_store() should take two arguments to make a key and a value represented by that key") do
    test_hash = Worse_Hach.new()
    expect(test_hash.single_store("kitten","OMG, like so adorbs! *squee*")).to eq("OMG, like so adorbs! *squee*")
  end

  it ("worse_fetch() should take a key that exists and return the assosiated value") do
    test1 = Worse_Hach.new()
    test1.worse_store("kittie => cute")
    expect(test1.worse_fetch("kittie")).to eq("cute")
  end

  it ("has_key? should return boolean whether key is within hash") do
    test2 = Worse_Hach.new()
    test2.single_store("kitten","yarn")

    expect(test2.has_key?("kitten")).to eq(true)
    expect(test2.has_key?("puppy")).to eq(false)
  end

  it ("has_val? should return boolean whether val is within hash") do
    test2 = Worse_Hach.new()
    test2.single_store("kitten","yarn")

    expect(test2.has_val?("yarn")).to eq(true)
    expect(test2.has_val?("ball")).to eq(false)
  end

  it ("length should return integer of hash size") do
    test3 = Worse_Hach.new()
    test3.worse_store("kittie => cute", "poopie => smellie", "apple => tree", "computer => keyboard")

    expect(test3.length).to eq(4)
  end

  it ("merge!") do
    test4 = Worse_Hach.new()
    test4.single_store(1, "one less than two")
    test4.single_store("Hey","Yah!")
    test5 = Worse_Hach.new()
    test5.worse_store("mine => yours not mines", "yours => who knows")
    expect(test4.merge!(test5)).to eq(["one less than two","Yah!","yours not mines","who knows"])
  end

end
