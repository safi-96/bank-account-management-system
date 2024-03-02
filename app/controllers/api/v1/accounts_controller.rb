# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      def create
        account = bank.accounts.new(account_params)
        if account.save
          render json: account
        else
          render json: { errors: account.errors }, status: :unprocessable_entity
        end
      end

      def update
        account = bank.accounts.find(params[:id])
        if account.update(account_params)
          render json: account
        else
          render json: { errors: account.errors }, status: :unprocessable_entity
        end
      end

      def amount
        render json: { amount: account.transactions.sum(:amount) }
      end

      private

      def account_params
        params.require(:account).permit(:name)
      end

      def account
        @account ||= Account.find_by!(id: params[:id], bank_id: params[:bank_id])
      end

      def bank
        @bank ||=  Bank.find(params[:bank_id])
      end
    end
  end
end
