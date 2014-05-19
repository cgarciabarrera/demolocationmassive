class PointController < ApplicationController


  def index
    if params[:q].present?
      params[:q].to_i.times do
        @hash = {"la" => rand(-90.0...90.0).to_s, "lo" => rand(-180.0...180.0), "sp" => rand(0.0...200.0)}
        #if $redis.llen(params[:u].to_s)>50000
        #  $redis.rpop(params[:u].to_s)
        #end
        key = params[:u].to_s + ":" + Time.now.strftime("%m%d%H%M").to_s
        #$redis.expire(key, 10)
        $redis.rpush(key, @hash.to_json)

      end

    end
  end


  def cuenta
    @a=0
    $redis.keys("*").each do |k|
     @a=@a + $redis.llen(k)

    end
  end
end
