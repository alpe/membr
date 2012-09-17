require 'spec_helper'

describe Member do
  describe "validations" do
    let (:valid_params) {{
      :name => "Dania",
      :ic_number => "123",
      :doj => "30/01/1970",
      :phone => "9999",
      :donation => 20,
    }}
    let (:addr_params) {{
      :line1 => "Foo St",
      :postcode => "12345"
    }}

    it "is valid with valid attributes" do
      m = Member.new(valid_params)
      m.build_address(addr_params)
      m.valid?.should be_true
    end

    [:name, :ic_number, :doj, :donation].each do |attr|
      it "requires #{attr}" do
        params = valid_params.merge(attr => "")
        m = Member.new(params)
        m.build_address(addr_params)

        m.valid?.should be_false
        m.errors.messages.should have_key(attr)
      end
    end

    it "requires address" do
      m = Member.new(valid_params)
      m.valid?.should be_false
      m.errors.messages.should have_key(:address)
    end

    it "requires valid address" do
      m = Member.new(valid_params)
      m.build_address({:line1 => "", :postcode => ""})

      m.valid?.should be_false
    end

    it "requires ic number to be unique" do
      m = Member.new(valid_params)
      m.build_address(addr_params)
      m.save!

      m = Member.new(valid_params)
      m.build_address(addr_params)
      m.valid?.should be_false
    end
  end
end
