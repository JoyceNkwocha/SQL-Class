-- --  Finding 5 oldest users from ig_clone

  select * from users
  order by created_at limit 5;
  
  -- Find the most popular registeration date to run an email campaign
select  dayname(created_at) as day, count(created_at) as total from users 
group by dayname(created_at)
order by total desc;

-- Identify inactive users from the table
select username from users
left join photos on user.id = photos.user_id
where photos.id is null;

 -- or 
 select username from users
left join photos on users.id = photos.user_id
where photos.image_url is null;

-- Finding which photo has the most likes
select username, photos.id, photos.image_url, count(*) as total from photos
join likes on likes.photo_id = photos.id
join users on users.id = photos.user_id
group by photos.id
order by total desc 
limit 1;

-- Finding how many times a user posts on an avearge (per day)
-- we'll use a subquery
select
(select count(*) from photos) / (select count(*) from users)
 from users as avg ;
 
 -- Five most popular hashtags
 
select tags.tag_name, count(*) as total from photo_tags
join tags on photo_tags.tag_id = tags.id
group by tags.id
order by total desc
limit 5;


select username from users
left join photos on users.id = photos.user_id
left join likes on users.id = likes.user_id
where image_url is Null and photo_id is not null
group by username;

 -- OR
  select username, count(*) as num_likes from users
  join likes on users.id = likes.user_id
  group by likes.user_id
  having num_likes = (select count(*) from photos)
  order by username;

 