require "paperclip"
require "paperclip/smart_data_uri_adapter/version"
require "base64" # this should have been required by Paperclip

module Paperclip
  class SmartDataUriAdapter < DataUriAdapter

    class << self

      def replace_original_adapter
        found = registered_handlers.find &original_adapter?
        Paperclip::DataUriAdapter.register unless found
        data_uri_test = find_and_delete_original_adapter
        Paperclip.io_adapters.register Paperclip::SmartDataUriAdapter, &data_uri_test
      end

      private

      def find_and_delete_original_adapter
        data_uri_test, * = registered_handlers.find &original_adapter?
        registered_handlers.delete_if &original_adapter?
        data_uri_test
      end

      def registered_handlers
        Paperclip.io_adapters.registered_handlers
      end

      def original_adapter?
        @original_adapter_evaluator ||= ->(args) { test, adapter = args
          adapter == Paperclip::DataUriAdapter
        }
      end

    end

    def initialize(*)
      super

      self.original_filename = "file.#{guessed_file_ext}"
    end

    private

    def guessed_file_ext
      MIME::Types[content_type].first.extensions.first || "jpeg"
    end

  end
end

Paperclip::SmartDataUriAdapter.replace_original_adapter # replace Paperclip::DataUriAdapter
