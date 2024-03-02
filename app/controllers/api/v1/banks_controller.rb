# frozen_string_literal: true

module Api
  module V1
    class BanksController < ApplicationController
      def index

      end

      def create
      end

      def update
      end

      def destroy
      end

      private

      def permitted_params
        params.require(:name)

        params.permit(:name)
      end
    end
  end
end
