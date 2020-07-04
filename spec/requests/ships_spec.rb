require 'rails_helper'

RSpec.describe "Ships", type: :request do
  let(:ships) { create_list(:ship, 5) }
  let(:ship_id) { ships.first.id }

  describe "#CREATE" do

    context 'when the request is valid' do
      it 'creates a ship without containers or sailors and returns status code 201' do
        expect {post '/ships', params: { ship: {name: "APL CALIFORNIA", ship_owner: "cma cgm"} }}.to change { Ship.count }.by(1)
        expect(response).to have_http_status(201)
      end

      # it 'creates a ship with containers & sailors' do
      #   expect {post '/ships', params: { ship: {ship_owner: "cma cgm", name: "APL CALIFORNIA",
      #     containers_attributes:
      #       [{contanier_type: "40st", quantity: 100}],
      #     sailors_attributes:
      #       [{sailor_type: "captain", name: "John"}]
      #     }}}.to change { Container.count }.by(1).and change { Sailor.count }.by(1)
      #     puts response
      #     expect(response).to have_http_status(201)
      # end
    end

    context 'when the request is NOT valid' do
      before {post '/ships', params: { ship: {ship_owner: "Fake owner", name: "APL CALIFORNIA"}}}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it "expects to return error if wrong param passed" do
        expect(json["errors"][0]).to eq "Ship owner is not included in the list"
      end
    end
  end

  describe '#DESTROY' do
    before { delete "/ships/#{ship_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe '#UPDATE' do
    before { patch "/ships/#{ship_id}", params: { ship: {ship_owner: "cma cgm", name: "CMA CGM Koper"}}}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'updates the ship record' do
      expect(ships.first.reload.name).to eq "CMA CGM Koper"
    end

    it 'returns an empty response body' do
      expect(response.body).to be_empty
    end

    it 'creates nested record' do
      puts first_nested_container
      expect { patch "/ships/#{ship_id}", params: { ship: {ship_owner: "cma cgm", name: "CMA CGM Koper", containers_attributes: [{container_type: "40st", quantity: 100}] }}}.to change { Container.count }.by(1)
    end

    # it "destroys nested record" do
    #   puts cargo
    #   expect{patch "/ships/#{ship_id}", params: { ship: {containers_attributes: [{_destroy: first_nested_container.id}]
    #   }}}.to change { Container.count }.by(-1)
    # end

  end

end







































#
