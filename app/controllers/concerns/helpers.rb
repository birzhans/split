module Helpers
  extend ActiveSupport::Concern

  def render_errors(resource)
    render turbo_stream: turbo_stream.replace(
      'errors',
      partial: 'shared/errors',
      locals: { resource: resource }
    )
  end
end