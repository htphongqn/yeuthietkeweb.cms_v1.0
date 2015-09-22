﻿<%@ Page Title="" Language="C#" MasterPageFile="~/master/Site.Master" AutoEventWireup="true" CodeBehind="news.aspx.cs" Inherits="yeuthietkeweb.cms.pages.news" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentMain" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Tin tức - Sản phẩm</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Tin tức - Sản phẩm
                    <div class="floatright">
                        <div class="icon_function_items">
                            <a href="#" id="hplCatNews" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Chọn
                                chuyên mục </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplEditorHTMl" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Soạn
                                tin HTML </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplNewsAtt" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />File
                                đính kèm </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplAlbum" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Album
                                hình </a>
                        </div>
                        <div class="icon_function_items">
                            <a href="#" id="hplComment" runat="server">
                                <img src="../Images/ICON_UPDATE.jpg" width="15" height="15" style="border: 0px" />Thông
                                tin phản hồi</a>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6" id="seo">
                            <form>
                                <div class="form-group">
                                    <asp:Label CssClass="user" ID="lblError" runat="server"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <label>Loại thông tin</label>
                                    <asp:RadioButtonList ID="rblNewsType" runat="server" RepeatColumns="5" AutoPostBack="True" class="form-control"
                                        OnSelectedIndexChanged="rblNewsType_SelectedIndexChanged">
                                        <asp:ListItem Text="Tin tức" Value="0" Selected="True"></asp:ListItem>
                                        <%--<asp:ListItem Text="Dịch vụ" Value="1"></asp:ListItem>--%>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="form-group">
                                    <label>Chuyên mục</label>
                                    <asp:DropDownList ID="ddlCategory" runat="server" class="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Mã</label>
                                    <input type="text" name="txtCode" id="txtCode" runat="server" class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label>Tiêu đề</label>
                                    <input type="text" name="txtTitle" id="txtTitle" runat="server" class="form-control"
                                        onkeyup="ParseText(this);" onblur="ParseText(this);" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập tên tiêu đề"
                                        Text="Vui lòng nhập tiêu đề" ControlToValidate="txtTitle" CssClass="errormes"></asp:RequiredFieldValidator>
                                </div>                                
                                <div class="form-group">
                                    <label>Mô tả</label>
                                    <textarea id="txtDesc" runat="server" class="form-control" onkeyup="ParseDesc(this);"
                                        onblur="ParseDesc(this);"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Liên kết</label>
                                    <input type="text" name="txtUrl" id="txtUrl" runat="server" class="form-control" />
                                    <asp:DropDownList ID="ddlTarget" runat="server" style="margin-top: 10px;width: 80px;"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>Cho phép phản hồi</label>
                                    <asp:RadioButtonList ID="rblFeefback" runat="server" RepeatColumns="5">
                                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Có" Selected="True" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="form-group">
                                    <label>Hiển thị</label>
                                    <asp:RadioButtonList ID="rblStatus" runat="server" RepeatColumns="5">
                                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="Có" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="form-group">
                                    <label>Hiển thị trang chủ</label>
                                    <asp:RadioButtonList ID="rblNewsPeriod" runat="server" RepeatColumns="4" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem Text="Khuyến mãi" Value="1"></asp:ListItem>   
                                        <asp:ListItem Text="Nổi bật" Value="2"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="Khác" Value="20"></asp:ListItem>  
                                    </asp:RadioButtonList>
                                </div>
                                <div class="form-group">
                                    <label>Hiển thị trong chi tiết</label>
                                    <asp:RadioButtonList ID="rblShowDetail" runat="server" RepeatColumns="5">
                                        <asp:ListItem Text="Không" Value="0"></asp:ListItem>
                                        <asp:ListItem Selected="True" Text="Có" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="form-group">
                                    <label>Thứ tự</label>
                                    <input type="text" name="txtOrder" id="txtOrder" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                        onblur="this.value=formatNumeric(this.value);" maxlength="4" class="form-control"
                                        value="1" />
                                </div>
                                <div class="form-group">
                                    <label>Thứ tự trang chủ</label>
                                    <input type="text" name="txtOrderPeriod" id="txtOrderPeriod" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                        onblur="this.value=formatNumeric(this.value);" maxlength="4" class="form-control"
                                        value="1" />
                                </div>
                                <div class="form-group">
                                    <label>Lượt xem</label>
                                    <input type="text" name="txtCount" id="txtCount" runat="server" onkeyup="this.value=formatNumeric(this.value);"
                                        onblur="this.value=formatNumeric(this.value);" maxlength="6" class="form-control"
                                        value="1" />
                                </div>
                                <div class="form-group" id="trUploadImage3" runat="server">
                                    <label>Ảnh đại diện</label>
                                    <input id="fileImage3" type="file" name="fileImage1" size="50" runat="server" class="form-control"/>
                                </div>
                                <div class="form-group" id="trImage3" runat="server">
                                    <asp:ImageButton ID="btnDelete3" runat="server" ImageUrl="../images/delete_icon.gif"
                                        BorderWidth="0" Width="13px" OnClick="btnDelete3_Click" ToolTip="Xóa hình minh họa này">
                                    </asp:ImageButton>
                                    <asp:HyperLink runat="server" ID="hplImage3" Target="_blank"></asp:HyperLink><br />
                                    <img id="Image3" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label>SEO Title</label>
                                    <input type="text" name="txtSeoTitle" id="txtSeoTitle" runat="server" class="form-control"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập SEO Title"
                                        Text="Vui lòng nhập Seo Title" ControlToValidate="txtSeoTitle" CssClass="errormes"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>SEO URL</label>
                                    <input type="text" name="txtSeoUrl" id="txtSeoUrl" runat="server" class="form-control"/>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập SEO URL"
                                        Text="Vui lòng nhập Seo URL" ControlToValidate="txtSeoUrl" CssClass="errormes"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label>SEO Keyword</label>
                                    <textarea id="txtSeoKeyword" runat="server" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>SEO Description</label>
                                    <textarea id="txtSeoDescription" runat="server" class="form-control"></textarea>
                                </div>
                                <div class="form-group" style="margin-bottom:0">
                                    <label><asp:Literal ID="lbMessage" runat="server" Text=""></asp:Literal></label>
                                </div>
                                <asp:LinkButton ID="lbtDelete" runat="server" OnClick="lbtDelete_Click" OnClientClick="return confirm('Bạn có chắc chắn xóa không?');"
                                    CssClass="btn btn-default" CausesValidation="false">Xóa</asp:LinkButton>
                                <asp:LinkButton ID="lbtSaveNew" runat="server" OnClick="lbtSaveNew_Click" CssClass="btn btn-default">
                                    Lưu và thêm mới
                                </asp:LinkButton>
                                <asp:LinkButton ID="lbtSave" runat="server" OnClick="lbtSave_Click" CssClass="btn btn-default">Lưu</asp:LinkButton>
                                <a href="category_list.aspx" class="btn btn-default">
                                    Quay lại
                                </a>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="g1" />
                            </form>
                        </div>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="../js/jquery.min.1.7.2.js" type="text/javascript"></script>
    <script src="../js/JqueryCollapse/jquery.collapse.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        new jQueryCollapse($("#seo"), {
            query: 'div h2'
        });

        new jQueryCollapse($("#dvPrice"), {
            query: 'div h2'
        });

        function ParseText(objsent) {
            ParseUrl(objsent, document.getElementById('ContentMain_txtSeoUrl'));
            document.getElementById('ContentMain_txtSeoTitle').value = objsent.value;
            document.getElementById('ContentMain_txtSeoKeyword').value = objsent.value;
        }
        function ParseDesc(objsent) {
            document.getElementById('ContentMain_txtSeoDescription').value = objsent.value;
        }
        function ParseTextEn(objsent) {
            ParseUrl(objsent, document.getElementById('ContentMain_txtSeoUrlEn'));
            document.getElementById('ContentMain_txtSeoTitleEn').value = objsent.value;
            document.getElementById('ContentMain_txtSeoKeywordEn').value = objsent.value;
        }
        function ParseDescEn(objsent) {
            document.getElementById('ContentMain_txtSeoDescriptionEn').value = objsent.value;
        }
    </script>
    <script type="text/javascript" language="javascript">
        function ToggleAll(e, action) {
            if (e.checked) {
                CheckAll();
            }
            else {
                ClearAll();
            }
        }

        function CheckAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = true;
            }
            ml.ContentMain_GridItemList_toggleSelect.checked = true;
        }

        function ClearAll() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect") > 0)
                    e.checked = false;
            }
            ml.ContentMain_GridItemList_toggleSelect.checked = false;
        }

        function selectChange() {
            var radioButtons = document.getElementsByName("rblType");
            for (var x = 0; x < radioButtons.length; x++) {
                if (radioButtons[x].checked) {
                    if (radioButtons[x].value == 1)
                    { CheckAll(); }
                }
            }

        }

        function ToggleAll1(e, action) {
            if (e.checked1) {
                CheckAll1();
            }
            else {
                ClearAll1();
            }
        }

        function CheckAll1() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];

                if (e.name.toString().indexOf("chkSelect1") > 0)
                    e.checked1 = true;
            }
            ml.ContentMain_DataGridSize_toggleSelect.checked1 = true;
        }

        function ClearAll1() {
            var ml = document.forms[0];
            var len = ml.elements.length;
            for (var i = 1; i < len; i++) {
                var e = ml.elements[i];
                if (e.name.toString().indexOf("chkSelect1") > 0)
                    e.checked1 = false;
            }
            ml.ContentMain_DataGridSize_toggleSelect.checked1 = false;
        }

        function selectChange() {
            var radioButtons = document.getElementsByName("rblType");
            for (var x = 0; x < radioButtons.length; x++) {
                if (radioButtons[x].checked1) {
                    if (radioButtons[x].value == 1)
                    { CheckAll(); }
                }
            }

        }              
    </script>
</asp:Content>