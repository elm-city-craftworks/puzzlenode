class Puzzles::SubmissionsController < Puzzles::Base
  def new
    @submission = @puzzle.submissions.new
  end

  def create
    unless params[:submission].blank?
      @submission = @puzzle.submissions.new(submission_params)
    else
      @submission = @puzzle.submissions.new
    end

    @submission.user = current_user

    if @submission.save
      redirect_to user_submission_path(current_user, @submission)
    else
      flash.now[:error] = @submission.errors.map { |field, message|
        "#{field.to_s.humanize unless field == :base} #{message}"
      }.join("<br/>").html_safe
      render :action => :new
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:file)
  end
end
