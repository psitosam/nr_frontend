class BackendService

  def self.conn
    Faraday.new(url: ENV['BASE_URL']) do |f|
      f.adapter Faraday.default_adapter
    end
  end
#  Opportunity here to refactor to include authorization between FE and BE
  def self.get_all_tweets
    response = conn.get("/tweets")
    JSON.parse(response.body, symbolize_names: true)
  end
end 