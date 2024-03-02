module Api
  module V1
    class TransactionsController < ApplicationController
      def index
        account = Account.find(params[:account_id])
        transactions = account.transactions
        render json: transactions
      end

      def create
        account = Account.find(params[:account_id])
        transaction = account.transactions.build(transaction_params.merge!(bank_id: account.bank_id))
        if transaction.save
          render json: transaction
        else
          render json: { errors: transaction.errors }, status: :unprocessable_entity
        end
      end

      def update
        transaction = Transaction.find(params[:id])
        if transaction.update(transaction_params)
          render json: transaction
        else
          render json: { errors: transaction.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        transaction = Transaction.find(params[:id])
        transaction.destroy
        head :no_content
      end

      private

      def transaction_params
        params.require(:transaction).permit(:amount, :date, :description)
      end
    end
  end
end
