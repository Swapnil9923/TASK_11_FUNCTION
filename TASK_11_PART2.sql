Select * from matches

select * from players

select * from records

create or replace function players_team(sixes int)
returns varchar as $$
Declare 
     Players_team varchar;
begin 
   case when sixes<15 then players_team :='afganistan';
        when sixes between 15 and 30 then players_team :='safrica';
        when sixes between 30 and 50 then players_team :='Australia';
        when sixes > 50 then players_team :='India';
       End case;
return players_team;
End
$$ language plpgsql;

select players_team(45)
select players_team(60)

create or replace function players_name(hundreds int)
returns varchar as $$
Declare 
     Players_name varchar;
begin 
   case when hundreds<10 then players_name :='dhawan';
        when hundreds between 10 and 40 then players_name :='steve';
        when hundreds between 40 and 50 then players_name :='dhoni';
        when hundreds between 50 and 90 then players_name :='rohit';
        when hundreds >90 then players_name :='sachin';
       End case;
return players_name;
End
$$ language plpgsql;


select players_name(110)


create or replace function check_totalsixes(player_id int)
Returns text as $$
Declare 
    total_sixes text;
	sum_totalsixes int;
Begin
    select sum(sixes) into sum_totalsixes from records where playerid=player_id;
     if sum_totalsixes>25 then  total_sixes :='bastmen is good';
     elseif sum_totalsixes between 25 and 40 then  total_sixes :='bastment is awesome';
	 elseif sum_totalsixes>40 then  total_sixes :='Batsmen is beast';
     End if;
     return total_sixes;
   End ;
$$ LANGUAGE plpgsql;

drop function check_totalsixes
	
select sum(sixes),playerid,check_totalsixes(2) from  records group by playerid
        