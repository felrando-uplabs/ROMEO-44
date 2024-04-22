select observation_dt_key, observation_tm_key, orig_airport_key, dest_airport_key, market_key, outbnd_dptr_dt_key, outbnd_dptr_tm_key, outbnd_fare_basis, outbnd_booking_class_cd, outbnd_seats, 
max(case when outbnd_booking_class_cd like 'A' then price_incl_tax_amt else null end) as booking_class_A,
max(case when outbnd_booking_class_cd like 'B' then price_incl_tax_amt else null end) as booking_class_B,
max(case when outbnd_booking_class_cd like 'C' then price_incl_tax_amt else null end) as booking_class_C,
max(case when outbnd_booking_class_cd like 'D' then price_incl_tax_amt else null end) as booking_class_D,
max(case when outbnd_booking_class_cd like 'E' then price_incl_tax_amt else null end) as booking_class_E,
max(case when outbnd_booking_class_cd like 'F' then price_incl_tax_amt else null end) as booking_class_F,
max(case when outbnd_booking_class_cd like 'G' then price_incl_tax_amt else null end) as booking_class_G,
max(case when outbnd_booking_class_cd like 'H' then price_incl_tax_amt else null end) as booking_class_H,
max(case when outbnd_booking_class_cd like 'I' then price_incl_tax_amt else null end) as booking_class_I,
max(case when outbnd_booking_class_cd like 'J' then price_incl_tax_amt else null end) as booking_class_J,
max(case when outbnd_booking_class_cd like 'K' then price_incl_tax_amt else null end) as booking_class_K,
max(case when outbnd_booking_class_cd like 'L' then price_incl_tax_amt else null end) as booking_class_L,
max(case when outbnd_booking_class_cd like 'M' then price_incl_tax_amt else null end) as booking_class_M,
max(case when outbnd_booking_class_cd like 'N' then price_incl_tax_amt else null end) as booking_class_M,
max(case when outbnd_booking_class_cd like 'O' then price_incl_tax_amt else null end) as booking_class_O,
max(case when outbnd_booking_class_cd like 'P' then price_incl_tax_amt else null end) as booking_class_P,
max(case when outbnd_booking_class_cd like 'Q' then price_incl_tax_amt else null end) as booking_class_Q,
max(case when outbnd_booking_class_cd like 'R' then price_incl_tax_amt else null end) as booking_class_R,
max(case when outbnd_booking_class_cd like 'S' then price_incl_tax_amt else null end) as booking_class_S,
max(case when outbnd_booking_class_cd like 'T' then price_incl_tax_amt else null end) as booking_class_T,
max(case when outbnd_booking_class_cd like 'U' then price_incl_tax_amt else null end) as booking_class_U,
max(case when outbnd_booking_class_cd like 'V' then price_incl_tax_amt else null end) as booking_class_V,
max(case when outbnd_booking_class_cd like 'W' then price_incl_tax_amt else null end) as booking_class_W,
max(case when outbnd_booking_class_cd like 'X' then price_incl_tax_amt else null end) as booking_class_X,
max(case when outbnd_booking_class_cd like 'Y' then price_incl_tax_amt else null end) as booking_class_Y,
max(case when outbnd_booking_class_cd like 'Z' then price_incl_tax_amt else null end) as booking_class_Z
from infare_webfare_fact infare
where outbnd_travel_stopover_pts=0 and carr_key=11
and outbnd_dptr_dt_key >= 64255 AND outbnd_dptr_dt_key <= 64375
and market_key in (select distinct market_key from abk_dw.market_dim mktdm
where (left(od,3) like 'SFO' or right(od,3) like 'SFO')
group by observation_dt_key, observation_tm_key, orig_airport_key, dest_airport_key, market_key, outbnd_dptr_dt_key, outbnd_dptr_tm_key, outbnd_fare_basis, outbnd_booking_class_cd, outbnd_seats
--order by outbnd_dptr_dt_key, outbnd_dptr_tm_key, market_key, observation_dt_key, observation_tm_key