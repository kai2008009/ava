if (not exists (select Guid from Sys_SecurityMenu where Guid = '760e83a1eea24d9c98594414081bb4bd'))   
Begin
INSERT INTO Sys_SecurityMenu ([Guid], [Version], [Status], [SortNumber], [Name], [PageUrl], [ImageUrl], [Type], [SecurityMenuGuid], [Depth], [Description]) VALUES (N'760e83a1eea24d9c98594414081bb4bd', 2, 1, 12, N'∆¿¬€¡–±Ì', N'/Pub/Comment/List.aspx', N'130609143549000-00325.jpg', 1, N'd1e40f87a3f44b708c0d77a3828e93ce', 3, null)
END