--- src/fGrayline.pas.orig	2015-03-04 15:17:21 UTC
+++ src/fGrayline.pas
@@ -383,7 +383,7 @@ begin
     RBNSpotList[i].band := '';
   ImageFile := dmData.HomeDir+'images'+PathDelim+'grayline.bmp';
   if not FileExists(ImageFile) then
-    ImageFile := ExpandFileNameUTF8('..'+PathDelim+'share'+PathDelim+'cqrlog'+
+    ImageFile := ExpandFileNameUTF8('%%PREFIX%%'+PathDelim+'share'+PathDelim+'cqrlog'+
                  PathDelim+'images'+PathDelim+'grayline.bmp');
   ob:=new(Pgrayline,init(ImageFile))
 end;
