class MembersController < ApplicationController

  expose(:members) { Member.all }
  expose(:member)

  def new
    member.doj = Date.today
    member.build_address
  end

  def create
    delete_blank_family_member_fields(params)
    member.build_address(params[:address])
    if member.save
      redirect_to member, notice: 'Member was successfully created.'
    else
      render action: "new"
    end
  end

  def delete_blank_family_member_fields(params)
    fm_attributes = params[:member][:family_members_attributes]
    fm_attributes ||= {}
    fm_attributes.delete_if { |num,fm| fm[:name].blank? }
  end

  def update
      if member.update_attributes(params[:member])
        redirect_to member, notice: 'Member was successfully updated.'
      else
        render action: "edit"
      end

  end

  def destroy
    member.destroy
    redirect_to members_url
  end
end
