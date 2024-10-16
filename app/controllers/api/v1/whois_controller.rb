class Api::V1::WhoisController < Api::V1::AbstractController
  def show
    # FIX: Can't use Panko Serializer without pre actions e.g. `job.inspect` before serializing, otherwise it returns an error:
    #   NoMethodError: undefined method `default' for an instance of ActiveRecord::Result::IndexedRow
    #
    # render json: Api::Job::WhoisSerializer.new().serialize(current_job)

    render json: Api::Job::WhoisSerializer.new(current_job)
  end

  def create
    job = Api::Job::WhoisForm.new(api_key: current_api_key, domain: params[:domain], webhook_ids: params[:webhook_ids])
    return render(json: { errors: job.errors.full_messages }, status: :unprocessable_entity) if job.invalid?

    job.save!

    WhoisJob.perform_later(job.id)

    render json: Api::Job::WhoisSerializer.new(job, only: [ :id, :state, :domain ])
  end

  private

  def current_job
    current_api_key.api_jobs_whois.find(params[:id])
  end
end
