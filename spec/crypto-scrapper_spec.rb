require '../lib/crypto-scrapper'

describe "Test of 10 currencies that have a market price" do
  it "bitcoin" do
    expect(crypto_scrapper[1]).not_to be_nil
  end

  it "Etherum" do
    expect(crypto_scrapper[2]).not_to be_nil
  end

  it "Stellar" do
    expect(crypto_scrapper[3]).not_to be_nil
  end

  it "EOS" do
    expect(crypto_scrapper[10]).not_to be_nil
  end

  it "TRON" do
    expect(crypto_scrapper[15]).not_to be_nil
  end

  it "Dash" do
    expect(crypto_scrapper[20]).not_to be_nil
  end

  it "Avalanche" do
    expect(crypto_scrapper[25]).not_to be_nil
  end

  it "Ren" do
    expect(crypto_scrapper[26]).not_to be_nil
  end

  it "Nano" do
    expect(crypto_scrapper[28]).not_to be_nil
  end

  it "SwissBorg" do
    expect(crypto_scrapper[30]).not_to be_nil
  end
end