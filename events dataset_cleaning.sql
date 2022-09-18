SELECT * FROM tblCountry;

SELECT * FROM tblEvent;

select * from tblContinent;

select * from vwEvents;

select categorical_initial, 
count (EventId) as no_of_events, 
avg(len(EventName)) as average_name_length
from 
    (select a.categorical_initial,
    a.EventId,
    b.EventName
    from
        (select EventId, SUBSTRING(EventName,1,1) as categorical_initial
        from dbo.tblEvent) a 
    left JOIN
        (select EventId, EventName from dbo.tblEvent) b 
    on a.EventId = b.EventId) c ---subquery phai co ten 
where categorical_initial in ('C', 'D', 'E', 'G', 'H', 'L', 'N')
group by categorical_initial;

--select the table that has been uploaded on the file csv 
select top 10 * from dbo.[working_directory\df_gateway_1000]




