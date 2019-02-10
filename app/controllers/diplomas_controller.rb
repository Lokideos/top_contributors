# frozen_string_literal: true

class DiplomasController < ApplicationController
  def show
    render pdf: "#{diploma.contributor_name}_diploma", disposition: 'attachment'
  end

  private

  def diploma
    @diploma ||= Diploma.find(params[:id])
  end

  helper_method :diploma
end
