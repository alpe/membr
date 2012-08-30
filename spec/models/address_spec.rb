require 'spec_helper'

describe Address do
  describe "validations" do
    let (:valid_params) {{
      :line1 => "Foo St",
      :postcode => "62343",
    }}

    it "is valid with valid attributes" do
      a = Address.new(valid_params)
      a.member_id = 5
      a.valid?.should be_true
    end

    [:line1, :postcode].each do |attr|
      it "requires #{attr}" do
        params = valid_params.merge(attr => "")
        Address.new(params).valid?.should be_false
      end
    end
  end
end
