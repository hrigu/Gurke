# encoding: utf-8

def doldenbluetler
  name = "Doldenblütler"
  create_or_get_family(name)
end


def huelsenfruechtler
  name = "Hülsenfrüchtler"
  create_or_get_family(name)
end


def ruebli
  plant = Factory.create(:plant, family: doldenbluetler)
end

def buschbohne
  family = huelsenfruechtler
  plant = Factory.create(:plant, name: "Buschbohne", maturity_time_in_days: 60, family: family)
end

private

def create_or_get_family(name)
  Family.find_by_name name ||= Factory.create(:family, name: name)
end
