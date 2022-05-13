describe RSpecUUID::Matchers do
  context "with a valid UUID" do
    let(:uuid) { "992c94bd-5870-4e02-ad2d-a9435f7fffe6" }

    specify { expect(uuid).to be_a_uuid }
  end

  context "with Faker UUIDs" do
    specify do
      100.times { expect(Faker::Internet.uuid).to be_a_uuid }
    end
  end

  context "with invalid UUIDs" do
    specify { expect("abc").not_to be_a_uuid }
    specify { expect(:xyz).not_to be_a_uuid }
    specify { expect(123).not_to be_a_uuid }
    specify { expect(nil).not_to be_a_uuid }
  end

  it "fails with a useful message" do
    expect {
      expect(nil).to be_a_uuid
    }.to fail_including("expected a UUID")
  end

  it "fails with a useful negation message" do
    expect {
      expect(Faker::Internet.uuid).not_to be_a_uuid
    }.to fail_including("did not expect a UUID")
  end
end
