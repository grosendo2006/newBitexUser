module ExternalApi::GenericConnection

  def post_call(url, body, token = false)
    response = establish_connection(url, token).post('', body.to_json, {'Content-Type'=>'application/json'})
    response.success? ? response.body : false
  rescue Faraday::TimeoutError,
         Faraday::ConnectionFailed,
         Faraday::ResourceNotFound,
         Faraday::ParsingError => e
         "Error: #{e.message}"
  end

   # Llamado generico get
  def get_call(url, token = false)
    response = establish_connection(url, token).get
    response.success? ? response.body : false
  rescue Faraday::TimeoutError,
         Faraday::ConnectionFailed,
         Faraday::ResourceNotFound,
         Faraday::ParsingError => e
    "Error: #{e.message}"
  end


  private

  # Realiza la conexion con la API
  def establish_connection(url, token)
    Faraday.new(url: url) do |faraday|
      faraday.request :json
      faraday.headers["Authorization"] = token
      faraday.headers['Accept'] = 'application/json'
      faraday.response :json
      faraday.response :raise_error
      faraday.options.open_timeout = 2
      faraday.options.timeout = 100
      faraday.adapter Faraday.default_adapter
    end
  end

end
