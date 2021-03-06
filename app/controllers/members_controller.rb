# frozen_string_literal: true

# Membership controller
class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show() end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit() end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member == current_member && @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html do
        redirect_to members_url,
                    notice: 'Member was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.fetch(:member, {}).permit(
      :username, :firstname, :lastname, :email, :bio, :avatar, :company, :phone,
      :website_url, :website_name, :twitter, :facebook, :linkedin, :instagram,
      :slack, :work_pattern, :activities, :interests, :location
    )
  end
end
