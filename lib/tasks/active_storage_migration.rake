namespace :active_storage do
  desc 'Migrate Active Storage attachments to Amazon S3'
  task migrate: :environment do
    ActiveRecord::Base.transaction do
      ActiveStorage::Attachment.find_each do |attachment|
        if attachment.service_name == 'local'
          io = attachment.blob.service.download(attachment.blob.key)
          attachment.blob.service = ActiveStorage::Service.configure(:amazon)
          attachment.blob.key = attachment.blob.key.sub(/^#{attachment.blob.service.bucket.name}\//, '')
          attachment.blob.upload(io)
          attachment.service_name = 'amazon'
          attachment.save!
        end
      end
    end
    puts 'Active Storage attachments migration completed successfully!'
  end
end
