module Api
  module V1
    class BanksController < ApplicationController
      def index
        banks = Bank.all
        render json: banks
      end

      def create
        bank = Bank.new(bank_params)
        if bank.save
          render json: bank
        else
          render json: { errors: bank.errors }, status: :unprocessable_entity
        end
      end

      def update
        bank = Bank.find(params[:id])
        if bank.update(bank_params)
          render json: bank
        else
          render json: { errors: bank.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        bank = Bank.find(params[:id])
        bank.destroy
        head :no_content
      end

      private

      def bank_params
        params.require(:bank).permit(:name)
      end
    end
  end
end
