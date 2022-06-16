﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FreePurchase.aspx.cs" Inherits="WebAppPOSAdmin.Pedidos.FreePurchase" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Controles/notificaciones.ascx" TagPrefix="uc1" TagName="notificaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <uc1:notificaciones runat="server" ID="notificaciones" />
    <div class="panel panel-primary quitar-margin">
        <div class="panel-heading">
            <div class="panel-title">
                <h4><span class="glyphicon glyphicon-list-alt"></span>&nbsp&nbsp Relación Compras Por Pedido</h4>
            </div>
        </div>
        <div class="panel-body" style="min-height: 250px">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="col-lg-2">
                        <asp:Label Text="Fecha Inicial:" runat="server" />
                        <div class="input-group">
                            <asp:TextBox runat="server" CssClass="form-control text-center" ID="txtFecha_ini" value="" placeholder="dd/mm/aaaa" />
                            <span class="input-group-addon">
                                <asp:Image ID="imgCalendarIni" ImageUrl="~/Images/calendar.png" runat="server" />
                            </span>
                        </div>
                        <cc1:CalendarExtender ID="calFecha_ini" runat="server" PopupButtonID="imgCalendarIni" TargetControlID="txtFecha_ini" Format="dd/MM/yyyy" />
                    </div>
                    <div class="col-lg-2">
                        <asp:Label Text="Fecha Final:" runat="server" />
                        <div class="input-group">
                            <asp:TextBox runat="server" CssClass="form-control text-center" ID="txtFecha_fin" value="" placeholder="dd/mm/aaaa" />
                            <span class="input-group-addon">
                                <asp:Image ID="imgCalendarEnd" ImageUrl="~/Images/calendar.png" runat="server" />
                            </span>
                        </div>
                        <cc1:CalendarExtender ID="calFecha_fin" runat="server" PopupButtonID="imgCalendarEnd" TargetControlID="txtFecha_fin" Format="dd/MM/yyyy" />
                    </div>
                    <div class="form-group col-lg-4">
                        <asp:Label Text="Observaciones:" runat="server" />
                        <asp:TextBox runat="server" PlaceHolder="Observaciones..." CssClass="form-control" ID="txtFindObservaciones" />
                    </div>
                    <div class="form-group col-lg-2">
                        <asp:Label Text="Cod. Barras:" runat="server" />
                        <asp:TextBox runat="server" PlaceHolder="Entrada" CssClass="form-control" ID="txtFindBarCode" />
                    </div>
                    <div class="col-lg-2">
                        <div>&nbsp;</div>
                        <asp:Button Text="Ver" ID="btnVer" runat="server" CssClass="form-control btn btn-primary" OnClick="btnVer_Click" ValidationGroup="eventoVer" />
                    </div>
                    <div class="col-lg-10 col-lg-offset-1" style="margin-top: 25px;">
                        <asp:GridView ID="gvRelacion" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gvRelacion_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="fecha_compra" HeaderText="Fecha compra" ReadOnly="True" SortExpression="fecha_compra" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="observaciones" HeaderText="Observaciones" ReadOnly="True" SortExpression="observaciones" />
                                <asp:BoundField DataField="no_factura" HeaderText="No. Factura" ReadOnly="True" SortExpression="no_factura" />
                                <asp:TemplateField HeaderText="Acciones" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ImageUrl="~/Images/view.png" runat="server" ID="ibtView" CommandName="view" CommandArgument='<%#Bind("id_compra") %>' ToolTip="Ver detalle" data-toggle="modal" data-target="#myModal" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="panel-footer">
        </div>

        <!-- MODAL VIEW DETAIL PURCHASE -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Detalle de Pedido</h4>
                            </div>
                            <div class="modal-body">
                                <div class="col-lg-2">
                                    <asp:Label Text="#Factura:" runat="server" />
                                    <asp:TextBox runat="server" ID="txtNumFactura" CssClass="form-control text-center" placehorder="# Factura" />
                                </div>
                                <div class="col-lg-8">
                                    <asp:Label Text="Observaciones:" runat="server" />
                                    <asp:TextBox runat="server" ID="txtObservaciones" CssClass="form-control" placehorder="Observaciones:" />
                                </div>
                                <div class="col-lg-2">
                                    <div>&nbsp;</div>
                                    <asp:Button Text="Guardar" ID="btnGuardarFactura" runat="server" CssClass="form-control btn btn-success" OnClientClick="confirm('Desea almacenar el número de factura indicado?');" OnClick="btnGuardarFactura_Click" />
                                </div>
                                <div class="col-lg-12">
                                    <asp:GridView ID="gvDetailPurchase" runat="server" AutoGenerateColumns="False" CssClass="table table-striped">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Código Barras" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <input type="radio" name="rows" onfocus="selected_row(this); return false" />&nbsp;<%# Eval("cod_barras") %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="cod_interno" HeaderText="Código Int." ReadOnly="True" SortExpression="cod_interno" ItemStyle-HorizontalAlign="center" />
                                            <asp:BoundField DataField="descripcion" HeaderText="Descripción" ReadOnly="True" SortExpression="descripcion" />
                                            <asp:BoundField DataField="unidad" HeaderText="UM" ReadOnly="True" SortExpression="unidad" ItemStyle-HorizontalAlign="center" />
                                            <asp:BoundField DataField="umc" HeaderText="UMC" ReadOnly="True" SortExpression="umc" ItemStyle-HorizontalAlign="center" />
                                            <asp:BoundField DataField="cant_cja" HeaderText="Cant Cja" ReadOnly="True" SortExpression="cant_cja" ItemStyle-HorizontalAlign="center" DataFormatString="{0:G9}" />
                                            <asp:BoundField DataField="cant_pza" HeaderText="Cant Pza" ReadOnly="True" SortExpression="cant_pza" ItemStyle-HorizontalAlign="center" DataFormatString="{0:G9}" />
                                            <asp:BoundField DataField="costo" HeaderText="Costo" ReadOnly="True" SortExpression="costo" ItemStyle-HorizontalAlign="center" DataFormatString="{0:F2}" />
                                            <asp:BoundField DataField="costo_total" HeaderText="Total" ReadOnly="True" SortExpression="costo_total" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F2}" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <asp:Label runat="server" ID="lblTotal" Style="font-weight: bolder" Text="$0.00" />
                                </div>
                            </div>
                            <div class="row">&nbsp;</div>
                            <div class="modal-footer">
                                <asp:Button Text="Crear PDF" ID="btnPDF" runat="server" CssClass="btn btn-danger" OnClick="btnPDF_Click" />
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            </div>
                            <div class="row">&nbsp;</div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
