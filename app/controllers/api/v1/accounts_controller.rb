# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      
      def amount
        render json: { amount: account.transactions.sum(:amount) }
      end

      private

        def account
          @account ||= Account.find_by!(id: params[:id], bank_id: params[:bank_id])
        end
    end
  end
end
