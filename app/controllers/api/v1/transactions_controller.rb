# frozen_string_literal: true

module Api
  module V1
    class TransactionsController < ApplicationController
      def index
        render json: { banks: Bank.all }, status: :ok
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
