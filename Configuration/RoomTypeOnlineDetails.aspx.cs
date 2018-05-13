using System;
using HotelReservationSystemDAL;
using System.Data;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Drawing.Imaging;

public partial class Configuration_RoomTypeOnlineDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.hidRoomTypeId.Value = string.IsNullOrEmpty(Request.QueryString["RoomType_ID"]) ? "0" : Request.QueryString["RoomType_ID"];
            if (this.hidRoomTypeId.Value != "0")
            {
                int roomType = Int32.Parse(this.hidRoomTypeId.Value);
                BindRoomType_OnlineDetails(roomType);
                BindDataList(roomType);
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (this.hidRoomTypeId.Value == "0")
        {
            this.lblResult.Text = "Invalid RoomType. Please select a Room Type from Room Types Screen.";
            return;
        }
        RoomType_OnlineDetails details = new RoomType_OnlineDetails();
        details.RoomType_ID = Int32.Parse(this.hidRoomTypeId.Value);
        details.Description = txtDescription.Text;
        //string txt = txtDescriptionExtender.Decode(txtDescription.Text);

        if (this.hidRoomTypeOnlineId.Value == "0")
        {
            if (details.Insert())
            {
                this.lblResult.Text = "Successfully Inserted";
                this.hidRoomTypeOnlineId.Value = details.RoomType_Online_ID.ToString();
            }
            else
                this.lblResult.Text = "Error Code " + details.ErrorCode.ToString() + "; Description " + details.ErrorDesc.ToString();
        }
        else
        {
            details.RoomType_Online_ID = Int32.Parse(this.hidRoomTypeOnlineId.Value);
            if (details.Update())
                this.lblResult.Text = "Successfully Updated";
            else
                this.lblResult.Text = "Error Code " + details.ErrorCode.ToString() + "; Description " + details.ErrorDesc.ToString();
        }

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Configuration/RoomTypes.aspx", true);
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (upldImage.HasFile)
        {
            try
            {
                RoomType_Image image = new RoomType_Image();
                image.RoomType_ID = Int32.Parse(this.hidRoomTypeId.Value);
                image.RoomType_OnlineID = Int32.Parse(this.hidRoomTypeOnlineId.Value);
                string uploadedFilePath = upldImage.PostedFile.FileName; // This gets the full file path on the client's machine ie: c:\test\myfile.txt
                string uploadedFileName = Path.GetFileName(uploadedFilePath); // use the System.IO Path.GetFileName method to get specifics about the file without needing to parse the path as a string
                Int32 intFileSize = upldImage.PostedFile.ContentLength;
                string strContentType = upldImage.PostedFile.ContentType;
                string extension = Path.GetExtension(uploadedFilePath);
                image.ImageName = uploadedFileName; // use the System.IO Path.GetFileName method to get specifics about the file without needing to parse the path as a string
                image.ImageSize = intFileSize;
                image.ImageLength = intFileSize;
                image.ImageType = strContentType;

                //TODO:Check if the file is of valid extensions

                Image img = Image.FromStream(upldImage.PostedFile.InputStream);
                image.ImageHeight = img.Height;
                image.ImageWidth = img.Width;
                image.ImagePath = "~/Images/RoomTypes/" + uploadedFileName;

                string imageFile = uploadedFileName;
                upldImage.PostedFile.SaveAs(Path.Combine(Server.MapPath("~/Images/RoomTypes"), imageFile));
                byte[] bytUpfile = imageToByteArray(img);
                image.Image = bytUpfile;
                var ratio = (double)100 / img.Height;
                int imageHeight = (int)(img.Height * ratio);
                int imageWidth = (int)(img.Width * ratio);

                Image.GetThumbnailImageAbort dCallback = new Image.GetThumbnailImageAbort(ThumbnailCallback);
                Image thumbnailImg = img.GetThumbnailImage(imageWidth, imageHeight, dCallback, IntPtr.Zero);
                image.ThumbnailHeight = thumbnailImg.Height;
                image.ThumbnailWidth = thumbnailImg.Width;
                image.ThumbnailPath = "~/Images/RoomTypes/Thumbnail/" + uploadedFileName;

                thumbnailImg.Save(Path.Combine(Server.MapPath("~/Images/RoomTypes/Thumbnail"), imageFile), ImageFormat.Jpeg);
                byte[] bytThumbNail = imageToByteArray(thumbnailImg);
                image.Thumbnail = bytThumbNail;
                thumbnailImg.Dispose();
                image.CreatedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);
                image.CreatedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
                image.LastModifiedDate = Utility.GetSqlDateTimeFromDateTime(DateTime.Now);
                image.LastModifiedUser = Utility.GetUserIdFromUserName(HttpContext.Current.User.Identity.Name);

                if (image.Insert())
                {
                    this.lblUploadResult.Text = "Uploaded " + image.ImageName.ToString();
                }
                else
                    this.lblUploadResult.Text = "Error!! Could not upload " + image.ImageName.ToString();

                BindDataList(Int32.Parse(this.hidRoomTypeId.Value));
                lblUploadResult.Text = "Upload Success. File was uploaded and saved to the database.";
            }
            catch (Exception err)
            {
                lblUploadResult.Text = "The file was not updloaded because the following error happened: <br>" + err.ToString();
            }
        }
        else
        {
            lblUploadResult.Text = "No File Uploaded because none was selected.";
        }
    }

    public bool ThumbnailCallback()
    {
        return false;
    }

    protected void BindDataList(int roomType)
    {
        DataTable dt = GetRoomTypePictures(roomType);
        imagesList.DataSource = dt;
        imagesList.DataBind();

        rptrImage.DataSource = dt;
        rptrImage.DataBind();

        //rptrThumbnail.DataSource = dt;
        //rptrThumbnail.DataBind();

    }

    protected void BindRoomType_OnlineDetails(int roomType)
    {
        RoomType_OnlineDetails dtls = new RoomType_OnlineDetails();
        dtls.RoomType_ID = roomType;
        DataTable dt = dtls.SelectOne();
        if (dt.Rows.Count <= 0)
        {
            this.hidRoomTypeOnlineId.Value = "0";
            return;
        }
        this.hidRoomTypeOnlineId.Value = dt.Rows[0]["RoomType_Online_ID"].ToString();
        this.txtDescription.Text = dt.Rows[0]["RoomType_OnlineDetails"].ToString();
    }


    protected byte[] createThumbNail(Stream strmStream)
    {
        byte[] thumbNail;
        Bitmap srcBmp = new Bitmap(strmStream);
        float ratio = srcBmp.Width / srcBmp.Height;
        SizeF newSize = new SizeF(100, 100 * ratio);
        Bitmap target = new Bitmap((int)newSize.Width, (int)newSize.Height);
        using (Graphics graphics = Graphics.FromImage(target))
        {
            graphics.CompositingQuality = CompositingQuality.HighSpeed;
            graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
            graphics.CompositingMode = CompositingMode.SourceCopy;
            graphics.DrawImage(srcBmp, 0, 0, newSize.Width, newSize.Height);
            using (MemoryStream memoryStream = new MemoryStream())
            {
                target.Save(memoryStream, ImageFormat.Png);
                thumbNail = memoryStream.ToArray();
            }
        }
        return thumbNail;

    }

    protected DataTable GetRoomTypePictures(int roomType)
    {
        DataTable dt = new DataTable();
        RoomType_Image image = new RoomType_Image();
        image.RoomType_ID = roomType;
        dt = image.SelectAll();
        return dt;
    }

    public byte[] imageToByteArray(Image imageIn)
    {
        MemoryStream ms = new MemoryStream();
        imageIn.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
        return ms.ToArray();
    }

    public Image byteArrayToImage(byte[] byteArrayIn)
    {
        MemoryStream ms = new MemoryStream(byteArrayIn);
        System.Drawing.Image returnImage = System.Drawing.Image.FromStream(ms);
        return returnImage;
    }

    protected string GetImageString64(byte[] Image)
    {
        // For convert byte image to base 64 string
        string base64String = Convert.ToBase64String(Image, 0, Image.Length);
        return "data:image/png;base64 ," + base64String;
    }


    protected void imagesList_DeleteCommand(object source, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        int id = (int)imagesList.DataKeys[e.Item.ItemIndex];
        RoomType_Image img = new RoomType_Image();
        img.Image_ID = id;
        img.SelectOne();
        string imagePath = Server.MapPath(img.ImagePath.ToString());
        string thumbnailPath = Server.MapPath(img.ThumbnailPath.ToString());
        File.Delete(imagePath);
        File.Delete(thumbnailPath);

        if (img.Delete())
            this.lblUploadResult.Text = "Deleted Successfully !";
        else
            this.lblUploadResult.Text = "Error in Delete !!";

        BindDataList(Int32.Parse(this.hidRoomTypeId.Value));
        
    }
}