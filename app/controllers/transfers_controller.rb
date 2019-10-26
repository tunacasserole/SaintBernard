class TransfersController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @facility = Facility.first

    unless params[:id].blank?
      @patient = Patient.where(id: params[:id]).first
    end
  end
end
