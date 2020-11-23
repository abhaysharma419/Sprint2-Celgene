update jp_ops.prd_rlup_dropdn set rank_num=12 where prd_shrt_ds='EM';
update jp_ops.prd_rlup_dropdn set rank_num=13 where prd_shrt_ds='IST';
update jp_ops.prd_rlup_dropdn set rank_num=14 where prd_shrt_ds='SP';
update  jp_ops.prd_rlup_dropdn set prd_shrt_ds='TOTAL (HEMA)' where prd_shrt_ds='TOTAL (HEM)';