class EmailWorker
  include Sidekiq::Worker

  def perform(index)
    user = User.find(user_id)
    # UserMailer.welcome_email(user).deliver
    Shop.create(name: index);
  end
end
