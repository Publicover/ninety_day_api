require 'rails_helper'

RSpec.describe 'Seasons API', type: :request do
  let!(:seasons) { create_list(:season, 15) }
  let(:season_id) { seasons.first.id }

  describe 'GET /seasons' do
    before { get '/seasons' }

    it 'returns seasons' do
      expect(json).not_to be_empty
      expect(json.size).to eq(15)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /seasons/:id' do
    before { get "/seasons/#{season_id}" }

    context 'when the season exists' do
      it 'returns the season' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(season_id)
      end

      it 'returns status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the season does not exist' do
      let(:season_id) { 1_000 }

      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns Couldn\'t find season' do
        expect(response.body).to match(/Couldn't find Season/)
      end
    end
  end
end


#   let(:user) { create(:user) }
#   let!(:words) { create_list(:word, 20) }
#   let(:word_id) { words.first.id }
#   let(:definition) { words.first.definition }
#   let(:headers) { valid_headers }
#
#   describe 'GET words' do
#     before { get '/words', params: {}, headers: headers }
#
#     # test index returning list of 10 random words
#     it 'returns words' do
#       expect(json).not_to be_empty
#       expect(json.size).to eq(10)
#     end
#
#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end
#   end
#
#   describe 'GET /words/:id' do
#     before { get "/words/#{word_id}", params: {}, headers: headers }
#
#     context 'when the record exists' do
#       it 'returns the word' do
#         expect(json).not_to be_empty
#         expect(json['id']).to eq(word_id)
#       end
#
#       it 'returns the status code 200' do
#         expect(response).to have_http_status(200)
#       end
#     end
#
#     context 'when the record does not exist' do
#       let(:word_id) { 1_000 }
#
#       it 'returns status code 404' do
#         expect(response).to have_http_status(404)
#       end
#
#       it 'returns Couldn\'t find Word' do
#         expect(response.body).to match(/Couldn't find Word/)
#       end
#     end
#   end
#
#   # this started with definitions as their own table with the intent to serialize
#   #   requests. also, users could make changes to the database in case I made an
#   #   error somewhere. in retrospect, I don't really need to do that since I'm
#   #   going to open this up. I'll leave all the tests for user changes, though.
#
#   # describe 'POST /words' do
#   #   let(:valid_attributes) { { 'name' => 'NAME' }.to_json }
#   #
#   #   context 'when the request is valid' do
#   #     before { post '/words', params: valid_attributes, headers: headers }
#   #
#   #     it 'creates a word' do
#   #       expect(json['name']).to eq('NAME')
#   #     end
#   #
#   #     it 'returns status code 201' do
#   #       expect(response).to have_http_status(201)
#   #     end
#   #   end
#   #
#   #   context 'when the request is not valid' do
#   #     before { post '/words', params: {}, headers: headers }
#   #
#   #     it 'returns status code 422' do
#   #       expect(response).to have_http_status(422)
#   #     end
#   #
#   #     it 'returns Validation Failed' do
#   #       expect(response.body)
#   #         .to match(/Validation failed: Name can't be blank/)
#   #     end
#   #   end
#   # end
#   #
#   # describe 'PUT /words/:id' do
#   #   let(:valid_attributes) { { name: 'NAME' }.to_json }
#   #
#   #   context 'when the record exists' do
#   #     before { put "/words/#{word_id}", params: valid_attributes, headers: headers }
#   #
#   #     it 'updates the record' do
#   #       expect(response.body).to be_empty
#   #     end
#   #
#   #     it 'returns status code 204' do
#   #       expect(response).to have_http_status(204)
#   #     end
#   #   end
#   # end
#   #
#   # describe 'DELETE /words/:word_id' do
#   #   before { delete "/words/#{word_id}", params: {}, headers: headers }
#   #
#   #   it 'returns status code 204' do
#   #     expect(response).to have_http_status(204)
#   #   end
#   # end
# end
