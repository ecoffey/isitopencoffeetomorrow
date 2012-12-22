require 'sinatra/base'
require 'active_support/time'
require 'active_support/inflector'

module IsItOpenCoffeeTomorrow
  class Application < Sinatra::Base

    def self.configure
      yield self
    end

    dir = File.dirname(File.expand_path(__FILE__))
    set :views, "#{dir}/views"
    set :public_folder, "#{dir}/public"

    enable :run

    get '/' do
      seed = settings.seed
      time_zone = settings.time_zone
      @hash_tag = settings.hash_tag
      @official_site = settings.official_site
      @ga_token = settings.ga_token

      now = Time.now.utc.in_time_zone(time_zone).to_date
      tomorrow = now.tomorrow.to_date

      diff_days_now = (now - seed).to_i % 14
      diff_days_tomorrow = (tomorrow - seed).to_i % 14

      last_occ = now - diff_days_now
      next_occ = last_occ.advance(:days => 14)

      days_till_next_occ = (next_occ - now).to_i
      @days_till_next_occ =
        days_till_next_occ > 1 ? "#{days_till_next_occ} days" : "#{days_till_next_occ} day"

      @last_occ = last_occ.to_formatted_s(:long_ordinal)
      @next_occ = next_occ.to_formatted_s(:long_ordinal)
      @is_occ_tomorrow = diff_days_tomorrow == 0 ? "yes" : "no"

      erb :index
    end
  end
end
