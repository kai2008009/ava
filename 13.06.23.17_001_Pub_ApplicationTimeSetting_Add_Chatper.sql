if (not exists (select name from syscolumns where id = object_id('Pub_ApplicationTimeSetting') and name = 'Chatper'))   
Begin

ALTER TABLE Pub_ApplicationTimeSetting ADD
Chatper nvarchar(128)

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'µÚ¼¸½Ú¿Î
   type:text' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'Pub_ApplicationTimeSetting', @level2type=N'COLUMN', @level2name=N'Chatper'

End