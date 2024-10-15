class Api::V1::WhoisController < Api::V1::AbstractController
  def show
  end

  def create
    job = Api::Job::WhoisForm.new(
      api_key: current_api_key,
      domain: params[:domain],
      webhooks: params[:webhooks]
    )

    if job.invalid?
      render json: { errors: job.errors.full_messages }, status: :unprocessable_entity
    end

    job.save!

    render json: Api::Job::WhoisSerializer.new.serialize(job).to_json
  end
end
