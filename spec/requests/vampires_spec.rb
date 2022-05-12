require 'rails_helper'

RSpec.describe "Vampires", type: :request do
  describe "GET /index" do 
    it 'returns a list of all vampires' do 
      Vampire.create(
        name: 'Fangs',
        age: 174,
        enjoys: 'Brushing their teeth, drinking their friends',
       
        image: 'http://vampire.com'
      )
      get '/vampires'
      vampire = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(vampire.length).to eq(1)
    end
  end  

  describe "POST /create" do
    it 'can create a vampire' do
      vampire_params = {
        vampire: {
          name: 'Fangs',
          age: 174,
          enjoys: 'Brushing their teeth, drinking their friends',
          image: 'http://vampire.com'
        }
      }
      post '/vampires', params: vampire_params
      vampire = Vampire.first
      expect(response).to have_http_status(200)
      expect(vampire.name).to eq('Fangs')
      expect(vampire.age).to eq(174)
      expect(vampire.enjoys).to eq('Brushing their teeth, drinking their friends')
      expect(vampire.image).to eq('http://vampire.com')
    end
  end

  describe "PATCH /update" do
    it 'can create a vampire' do
      vampire_params = {
        vampire: {
          name: 'Fangs',
          age: 174,
          enjoys: 'Brushing their teeth, drinking their friends',
          image: 'http://vampire.com'
          }
        }
      post '/vampires', params: vampire_params
      vampire = Vampire.first

      update_vampire_params = {
        vampire: {
          name: 'Fangs',
          age: 175,
          enjoys: 'Brushing their teeth, drinking their friends',
          image: 'http://www.catpics.com'
        }
      }
      patch "/vampires/#{vampire.id}", params: update_vampire_params
      updated_vampire = Vampire.find(vampire.id)
      expect(response).to have_http_status(200)
      expect(updated_vampire.age).to eq(175)
    end
  end

  describe "DELETE /destroy" do
    it 'can destroy a vampire' do 
      vampire_params = {
        vampire: {
          name: 'Fangs',
          age: 174,
          enjoys: 'Brushing their teeth, drinking their friends',
          image: 'http://vampire.com'
          }
        }
      post '/vampires', params: vampire_params
      vampire = Vampire.first

      delete "/vampires/#{vampire.id}", params: vampire_params
      expect(response).to have_http_status(200)
      expect(Vampire.find_by(id:vampire.id)).to be_nil
    end 
  end
end
