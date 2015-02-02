module API
	class V1 < Grape::API
		prefix 'v1'
		format :json

		get :hello do
			{ text:'hello' }
		end

		resource :memos do
			get do
				Memo.all
			end

			get ':id' do
				Memo.find(params[:id])
			end

			post do
				Memo.create(
					:title => params[:title],
					:body => params[:body],
					:author => params[:author]
				)
			end
		end
	end
end
