select t_name, count(*)
from tag, post_tag, post,
 ( select k_person2id
   from knows
   where
   k_person1id = --1--
   union
   select k2.k_person2id
   from knows k1, knows k2
   where
   k1.k_person1id = --1-- and k1.k_person2id = k2.k_person1id and k2.k_person2id <> --1--
 ) f
where
ps_p_creatorid = f.k_person2id and
ps_postid = pst_postid and
pst_tagid = t_tagid and
t_name <> '--2--' and
exists (select * from tag, post_tag where pst_postid = ps_postid and pst_tagid = t_tagid and t_name = '--2--')
group by t_name
order by 2 desc, t_name
limit 10
