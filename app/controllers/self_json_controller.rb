class SelfJsonController < ApplicationController
  before_filter :reject_non_auth_request, except: :get_self

  def get_self
    my_self = MySelf.first
    render json: my_self
  end

  def update_self
    result = false

    begin
      my_self = MySelf.new(params.permit!.except(:controller, :action))
    rescue
      Rails.logger.error("Can't convert params to MySelf model in #{controller_name}/#{action_name}")
      my_self = MySelf.new
    end

    if my_self.valid?
      MySelf.destroy_all
      result = my_self.save!
    end

    render json: result
  end
end