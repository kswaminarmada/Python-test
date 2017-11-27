set @ont = '2017-04-04 19:08:00';
set @oft = '2017-04-04 19:10:59';

update scheduler set ondatetime = @ont, offdatetime = @oft where switchid in ('SB00101','SB00103');
update scheduler set ontime = time(@ont), offtime = time(@oft) where switchid in ('SB00102','SB00104');

update swboard set `status` = 'F' where `status` = 'T';
select * from switchstatus ;