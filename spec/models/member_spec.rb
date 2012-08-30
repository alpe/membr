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
      :line1 => "Foo St"
    }}

    it "is valid with valid attributes" do
      m = Member.new(valid_params)
      m.build_address(addr_params)
      m.valid?.should be_true
    end

    [:name, :ic_number, :doj, :donation, :phone].each do |attr|
      it "requires #{attr}" do
        params = valid_params.merge(attr => "")
        Member.new(params).valid?.should be_false
      end
    end

    it "requires address" do
      params = valid_params.delete(:address)
      Member.new().valid?.should be_false
    end
  end
end
