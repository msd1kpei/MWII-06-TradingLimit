delete from xml_element_value where schemaname = 'MWII-06-TradingLimit/AllocatedTradingLimitSet';

insert into xml_element_value(id, schemaname, xpath, val) values (30001001, 'MWII-06-TradingLimit/AllocatedTradingLimitSet', 'pdc/market', 'Equity');
insert into xml_element_value(id, schemaname, xpath, val) values (30001002, 'MWII-06-TradingLimit/AllocatedTradingLimitSet', 'pdc/market', 'Pool'); 