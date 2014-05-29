class FeedbackController < ApplicationController
  layout 'front'
  before_filter :reject_non_auth_request, except: [:index, :congratulations]

  def index
    @title = '::Feedback'
  end

  def congratulations
    @title = '::Congratulations'
  end

  def add
    feedback = Feedback.new(params.permit(:name, :text))
    feedback.save!

    redirect_to action: 'congratulations'
  end

  def remove

  end

  def get_all
    all_feedback = Feedback.all.to_a

    render json: all_feedback
  end

end
