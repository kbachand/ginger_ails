Rails.configuration.stripe = {

  :publishable_key => "#{ENV['pk_test_vPU1WRKoaw0ZWwGEC8cQGyiC']}",

  :secret_key => "#{ENV['sk_test_3y7d5X8xR2lwldjKNwt2Ev2e']}"

}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
