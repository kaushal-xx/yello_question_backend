class Api::V1::PostDocumentsController < ApplicationController

	def annotation
		post_document = PostDocument.find_by_id params[:post_document_id]
		if post_document.blank?
      		render json: {message: 'Post Document is not present'}, status: :unprocessable_entity
		else
			post_document.varify_explicit_annotation
			render json: {post_document: post_document, message: 'Success'}, status: :ok
		end
	end

end