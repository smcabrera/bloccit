describe Topic do
  describe 'scopes' do
    before do
      @public_topic = Topic.create
      @private_topic = Topic.create(public: false)
    end

    describe 'publicly_viewable' do
      it 'returns a relation of all public topics' do
        expect(Topic.publicly_viewable).to eq( [@public_topic] )
      end
    end

    describe 'privately_viewable' do
      it 'returns a relation of all private topics' do
        expect(Topic.privately_viewable).to eq( [@private_topic] )
      end
    end

    describe 'visible_to(user)' do
      it 'returns all topics if the user is present' do
        user = true
        expect(Topic.visible_to(user)).to include( @private_topic )
        expect(Topic.visible_to(user)).to include( @public_topic )
      end
    end

    it 'returns only public topics if user is nil' do
      expect(Topic.visible_to(nil)).to eq( [@public_topic] )
    end
  end
end
