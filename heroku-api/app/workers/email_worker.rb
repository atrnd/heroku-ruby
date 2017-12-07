class EmailWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    # UserMailer.welcome_email(user).deliver
    1000000.times do |i|
      Shop.create(name: i)
    end
  end
end
