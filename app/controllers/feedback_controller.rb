class FeedbackController < ApplicationController
  layout 'front'
  before_filter :reject_non_auth_request, only: [:remove, :list]

  def index
    @title = '::Feedback'
  end

  def congratulations
    @title = '::Congratulations'
  end

  def add
    feedback = Feedback.new(params.permit(:name, :text))

    if feedback.valid?
      feedback.save!
      FeedbackMailer.entry_added(feedback).deliver
    end

    redirect_to action: 'congratulations'
  end

  def remove
    id = params[:id]
    feedback = Feedback.find(id)

    if feedback.nil?
      render json: "can't find"
    else
      feedback.delete
      render json: "ok"
    end
  end


  def list
    all_feedback = Feedback.all.to_a

    render json: all_feedback
  end

end
