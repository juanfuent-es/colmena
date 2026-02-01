# frozen_string_literal: true

class ThemeMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    
    # Detectar preferencia de color-scheme del cliente si está disponible
    if request.headers['Sec-CH-Prefers-Color-Scheme'].present?
      env['theme.prefers_dark'] = request.headers['Sec-CH-Prefers-Color-Scheme'].downcase == 'dark'
    end

    status, headers, body = @app.call(env)
    
    [status, headers, body]
  end
end
