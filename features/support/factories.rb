# encoding: utf-8

FactoryGirl.define do
  factory :account do
    username "fritz"
    password_confirmation { |u| u.password }
    admin false
    email "foo@example.com"
  end

  factory :family do
    name "Rosenblütler"
    energy "Starkzehrer"
    field_state "A"
  end

  factory :plant do
    name "Rüebli"
    seed_from_month 4
    seed_from_day 1
    seed_to_month 6
    seed_to_day 25
    maturity_time_in_days 90
    variability_in_percent 10
  end

  factory :garden do
    name "Rosengarten"
    place "Kuhweide"
    #account @account
  end

  factory :bed do
    name "my_bed"
    field_state "A"
  end


end