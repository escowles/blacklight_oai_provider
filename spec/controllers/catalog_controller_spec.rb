require 'spec_helper'

describe CatalogController do
  it "has a Blacklight module" do
    expect(Blacklight).to be_a_kind_of Module
  end

  it 'has blacklight configuration' do
    expect(described_class.blacklight_config).to be_a_kind_of Blacklight::Configuration
  end

  describe '#oai' do
    it 'responds to oai' do
      expect(controller).to respond_to :oai
    end
  end

  describe '#oai_config' do
    it 'returns correct configuration' do
      expect(controller.oai_config).to match(
        provider: {
          repository_name: "Test Repository",
          repository_url: "http://localhost",
          record_prefix: "test",
          admin_email: "root@localhost",
          deletion_support: "persistent",
          sample_id: "109660"
        },
        document: { model: SolrDocument, limit: 25 }
      )
    end
  end

  describe '#oai_provider' do
    it 'returns BlacklightOaiProvider::SolrDocumentProvider' do
      expect(controller.oai_provider).to be_a BlacklightOaiProvider::SolrDocumentProvider
    end
  end
end
