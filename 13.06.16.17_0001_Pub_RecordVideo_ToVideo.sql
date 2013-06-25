if (not exists (select name from syscolumns where id = object_id('Pub_RecordVideo') and name = 'ToVideo'))   
Begin

ALTER TABLE Pub_RecordVideo ADD
ToVideo int default(0) not null

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发布视频次数
   type:text' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Pub_RecordVideo', @level2type=N'COLUMN', @level2name=N'ToVideo'

Update Pub_RecordVideo Set ToVideo = 1

End
