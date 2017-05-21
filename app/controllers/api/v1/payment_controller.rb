class Api::V1::PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token
end
