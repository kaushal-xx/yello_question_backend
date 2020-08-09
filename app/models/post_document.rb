class PostDocument < ApplicationRecord
  self.table_name = "post_document"


  def varify_explicit_annotation
    if document_url.present?
      path = document_url.sub('https://storage.googleapis.com', 'gs:/')
      if path.downcase.include?('.mp4') || path.downcase.include?('.mov')
        Thread.new do 
          video = Google::Cloud::VideoIntelligence.video_intelligence_service
          # Register a callback during the method call
          operation = video.annotate_video features: [:EXPLICIT_CONTENT_DETECTION], input_uri: path
          operation.wait_until_done!

          raise operation.results.message? if operation.error?
          explicit_annotation = operation.results.annotation_results.first.explicit_annotation
          self.update(explicit_annotation: explicit_annotation.frames.map{|s| {s.time_offset.seconds => s.pornography_likelihood}}.uniq)
        end
      end
    end
  end

  def annotation
    (self.explicit_annotation||[]).map{|s| s.values}.flatten.uniq.join(', ')
  end

end