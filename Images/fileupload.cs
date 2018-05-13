<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<script runat="server">
 
 protected void btnUploadToDb_Click(object sender, EventArgs e)
 {
	 if (uplFileUploader.HasFile){
		 try{
			 string strTestFilePath = uplFileUploader.PostedFile.FileName; // This gets the full file path on the client's machine ie: c:\test\myfile.txt
			 string strTestFileName = Path.GetFileName(strTestFilePath); // use the System.IO Path.GetFileName method to get specifics about the file without needing to parse the path as a string
			 Int32 intFileSize = uplFileUploader.PostedFile.ContentLength;
			 string strContentType = uplFileUploader.PostedFile.ContentType;
			 
			 // Convert the uploaded file to a byte stream to save to your database. This could be a database table field of type Image in SQL Server
			 Stream strmStream = uplFileUploader.PostedFile.InputStream;
			 Int32 intFileLength = (Int32)strmStream.Length;
			 byte[] bytUpfile = new byte[intFileLength + 1];
			 strmStream.Read(bytUpfile, 0, intFileLength);
			 strmStream.Close();
			 
			 saveFileToDb(strTestFileName, intFileSize, strContentType, bytUpfile); // or use uplFileUploader.SaveAs(Server.MapPath(".") + "filename") to save to the server's filesystem.
			 lblUploadResult.Text = "Upload Success. File was uploaded and saved to the database.";
			}
			catch(Exception err){
				lblUploadResult.Text= "The file was not updloaded because the following error happened: " + err.ToString();
			}
		}
	 else
	 {
		lblUploadResult.Text = "No File Uploaded because none was selected.";
	 }
 }
 
 protected void saveFileToDb(string strTestFileName, Int32 intFileSize, string strContentType, byte[] bytUpfile) {
	 string testDbConnection = "Data Source=myServer;Initial Catalog=myDatabase;Persist Security Info=True;User ID=myUserAccount;Password=myPassword";
	 // string testDbConnection = "Data Source=VMCorpDev1;Initial Catalog=PropertyManagement;Persist Security Info=True;User ID=ais_devel;Password=devel";
	 // string strInsertStmt = string.Format("INSERT INTO [PropMgtFileAttachments] ([AttachedFileName],[CreatedBy],[CreatedDt],[AttachedFile]) VALUES ('{0}','John Doe',GETDATE(),@TestFile)", strTestFileName);
	 string strInsertStmt = string.Format("INSERT INTO [TestFileTable] ([AttachedFileName],[CreatedBy],[CreatedDt],[AttachedFile]) VALUES ('{0}','3733',GETDATE(),@TestFile)", strTestFileName);
 
 using (SqlConnection conn = new SqlConnection(testDbConnection)) {
	 SqlCommand cmdCommand = conn.CreateCommand();
	 cmdCommand.CommandText = strInsertStmt;
	 cmdCommand.CommandType = CommandType.Text;
	 cmdCommand.Parameters.AddWithValue("@TestFile", bytUpfile);
	 cmdCommand.Connection.Open();
	 cmdCommand.ExecuteNonQuery();
	}
 
 }
 
 protected void Button1_Click(object sender, EventArgs e) {  
             StartUpLoad();  
}  
     
private void StartUpLoad() {  
        //get the file name of the posted image  
        string imgName = FileUpload1.FileName;  
        //sets the image path  
        string imgPath = "ImageStorage/" + imgName;            
       //get the size in bytes that  
  
       int imgSize = FileUpload1.PostedFile.ContentLength;  
      
       //validates the posted file before saving  
        if (FileUpload1.PostedFile != null && FileUpload1.PostedFile.FileName != "") {  
           // 10240 KB means 10MB, You can change the value based on your requirement  
                if (FileUpload1.PostedFile.ContentLength > 10240) {  
                           Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);  
                 }  else {  
                           //then save it to the Folder  
                           FileUpload1.SaveAs(Server.MapPath(imgPath));  
                           Image1.ImageUrl = "~/" + imgPath;  
                           Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Image saved!')", true);  
                }  
    
          }  
}  

 public ActionResult Create(ArtWork artwork, HttpPostedFileBase image)
        {
           if (ModelState.IsValid)
            {
                if (image != null)
                {
                    //attach the uploaded image to the object before saving to Database
                    artwork.ImageMimeType = image.ContentLength;
                    artwork.ImageData = new byte[image.ContentLength];
                    image.InputStream.Read(artwork.ImageData, 0, image.ContentLength);

                    //Save image to file
                    var filename = image.FileName;
                    var filePathOriginal = Server.MapPath("/Content/Uploads/Originals");
                    var filePathThumbnail = Server.MapPath("/Content/Uploads/Thumbnails");
                    string savedFileName = Path.Combine(filePathOriginal, filename);
                    image.SaveAs(savedFileName);
                    
                    //Read image back from file and create thumbnail from it
                    var imageFile = Path.Combine(Server.MapPath("~/Content/Uploads/Originals"), filename);
                    using (var srcImage = Image.FromFile(imageFile))
                    using (var newImage = new Bitmap(100, 100))
                    using (var graphics = Graphics.FromImage(newImage))
                    using (var stream = new MemoryStream())
                    {
                        graphics.SmoothingMode = SmoothingMode.AntiAlias;
                        graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        graphics.DrawImage(srcImage, new Rectangle(0, 0, 100, 100));
                        newImage.Save(stream, ImageFormat.Png);
                        var thumbNew = File(stream.ToArray(), "image/png");
                        artwork.ArtworkThumbnail = thumbNew.FileContents;
                    }                
                }

               //Save model object to database
                db.ArtWorks.Add(artwork);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(artwork);
        }
		
	
public class ShowImage : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
       Int32 empno;
       if (context.Request.QueryString["id"] != null)
            empno = Convert.ToInt32(context.Request.QueryString["id"]);
       else
            throw new ArgumentException("No parameter specified");
 
       context.Response.ContentType = "image/jpeg";
       Stream strm = ShowEmpImage(empno);
       byte[] buffer = new byte[4096];
       int byteSeq = strm.Read(buffer, 0, 4096);
 
       while (byteSeq > 0)
       {
           context.Response.OutputStream.Write(buffer, 0, byteSeq);
           byteSeq = strm.Read(buffer, 0, 4096);
       }       
       //context.Response.BinaryWrite(buffer);
    }
 
    public Stream ShowEmpImage(int empno)
    {
		string conn = ConfigurationManager.ConnectionStrings     ["EmployeeConnString"].ConnectionString;
        SqlConnection connection = new SqlConnection(conn);
        string sql = "SELECT empimg FROM EmpDetails WHERE empid = @ID";
        SqlCommand cmd = new SqlCommand(sql,connection);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@ID", empno);
        connection.Open();
        object img = cmd.ExecuteScalar();
        try
        {
            return new MemoryStream((byte[])img);
        }
        catch
        {
            return null;
        }
        finally
        {
            connection.Close();
        }
    }
 
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
 
 
}

protected string GetImageString64(byte[] Image)
{
    // For convert byte image to base 64 string
    string base64String = Convert.ToBase64String(Image, 0, Image.Length);
    return "data:image/png;base64 ," + base64String;
}	

		
</script>
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title></title>
</head>
<body>
 <form id="form1" runat="server">
 <asp:FileUpload ID="uplFileUploader" runat="server" />
 <asp:Button ID="btnUploadToDb" runat="server" Text="Upload to Database" OnClick="btnUploadToDb_Click" />
 <br>
 <asp:Label ID="lblUploadResult" runat="server" Text=""></asp:Label>
 
 <br />
        <div>
            <asp:GridView ID="gvGallery" runat="server" AutoGenerateColumns="false" Width="50%">
                <EmptyDataTemplate>
                    <div style="text-align:center">
                        No Image Found
                    </div>
                </EmptyDataTemplate>
                <Columns>
                    <asp:BoundField HeaderText="Title" DataField="ImageTitle" />
                    <asp:TemplateField ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Width="100px" ImageUrl='<%#Eval("Picture").ToString() == ""?"": GetImageString64((byte[])Eval("Picture")) %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
 
 </form>
</body>
</html>