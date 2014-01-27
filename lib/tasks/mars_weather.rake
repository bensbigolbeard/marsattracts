namespace :mars_weather do
  desc "scrape the mars weather api into our db"
  task scrape: :environment do
    
    i = 1

    counter = [0]

    while i != counter[-1]

      counter << i

      url = 'http://marsweather.ingenology.com/v1/archive/?terrestrial_date_start=2012-01-01&terrestrial_date_end=2014-01-15&page=' + i.to_s 

      response = Unirest.get(url)

      page = response.body

      if !page['next'].nil?
        doc = page['results']
        i += 1
        doc.each do |hash|
          MarsWeather.create(hash)
        end
      end
    end
    
  end

end
