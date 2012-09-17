require 'spec_helper'

describe MembersController do
  describe "POST create" do
    let(:basic_member_params) {{
      :name => "Dania",
      :ic_number => "123",
      :doj => "30/01/1970",
      :hand_phone => "9999",
      :donation => 20,
      :doj => "30/01/1970",
    }}
    let(:member_params) { basic_member_params }
    let (:addr_params) {{
      :line1 => "Foo St",
      :postcode => "pc123"
    }}
    def do_action
      post :create, {
        :member => member_params,
        :address => addr_params
      }
    end

    it "creates a member" do
      expect{ do_action }.to change { Member.count }
    end

    context "not all family member fields are filled out" do
      let(:member_params) {
        basic_member_params.merge({
          "family_members_attributes" => {
            "0"=>{"name"=>"Mustafa"},
            "1"=>{"name"=>""},
            "2"=>{"name"=>""},
          }
        })
      }

      it "saves only the non-blank ones" do
        do_action
        Member.last.family_members.count.should  == 1
      end
    end
  end
end
