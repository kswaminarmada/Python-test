set @ont = '2017-05-13 07:52:00';
set @oft = '2017-05-13 08:17:59';

update SwitchScheduler set StartDateTime = @ont, StopDateTime = @oft where swid in (1,3);
update SwitchScheduler set StartTime = time(@ont), StopTime = time(@oft) where swid in (2,4);

update SwitchScheduler set SwStatus = 0 where SwStatus = 1;
select * from SwitchScheduler where IsScheduled = 1 and (ScheduleGrpID =1 or ScheduleGrpID = (select GetActiveScheduleGroup()));