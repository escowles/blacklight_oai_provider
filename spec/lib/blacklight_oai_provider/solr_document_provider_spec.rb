require 'spec_helper'

RSpec.describe BlacklightOaiProvider::SolrDocumentProvider do
  subject(:provider) { described_class.new(controller, options) }

  let(:options) { {} }
  let(:controller) { CatalogController.new }


  describe '#initialize' do
    let(:view_context) { double("ViewContext") }

    before do
      allow(controller).to receive(:view_context).and_return(view_context)
      allow(view_context).to receive(:oai_catalog_url).and_return(:some_path)
      allow(view_context).to receive(:application_name).and_return(:some_name)
    end

    context 'with no options provided' do
      it 'sets the default repository name and url' do
        expect(provider.url).to eq :some_path
        expect(provider.name).to eq :some_name
      end

    end

    context 'with options provided' do
      let(:options) { { provider: { repository_url: '/my/custom/path', repository_name: 'My Custom Name' } } }

      it 'uses the repository name and url set into the options' do
        expect(provider.url).to eq '/my/custom/path'
        expect(provider.name).to eq 'My Custom Name'
      end
    end
  end
end
