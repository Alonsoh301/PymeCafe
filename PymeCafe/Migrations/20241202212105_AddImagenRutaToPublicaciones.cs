using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PymeCafe.Migrations
{
    /// <inheritdoc />
    public partial class AddImagenRutaToPublicaciones : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CATEGORIA",
                columns: table => new
                {
                    CategoriaID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreCategoria = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__CATEGORI__F353C1C50B531DE6", x => x.CategoriaID);
                });

            migrationBuilder.CreateTable(
                name: "USUARIO",
                columns: table => new
                {
                    UserID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    Apellido = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    CorreoElectronico = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    Contraseña = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: false),
                    TipoUsuario = table.Column<string>(type: "varchar(20)", unicode: false, maxLength: 20, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__USUARIO__1788CCACCE9AC0A3", x => x.UserID);
                });

            migrationBuilder.CreateTable(
                name: "PRODUCTO",
                columns: table => new
                {
                    ProductoID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NombreProducto = table.Column<string>(type: "varchar(100)", unicode: false, maxLength: 100, nullable: true),
                    Descripcion = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Precio = table.Column<decimal>(type: "decimal(10,2)", nullable: true),
                    CategoriaID = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__PRODUCTO__A430AE836D9441A6", x => x.ProductoID);
                    table.ForeignKey(
                        name: "FK__PRODUCTO__Catego__3E52440B",
                        column: x => x.CategoriaID,
                        principalTable: "CATEGORIA",
                        principalColumn: "CategoriaID");
                });

            migrationBuilder.CreateTable(
                name: "NOTIFICACION",
                columns: table => new
                {
                    NotificacionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<int>(type: "int", nullable: true),
                    Mensaje = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    FechaEnvio = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__NOTIFICA__BCC120C44EAC3A5D", x => x.NotificacionID);
                    table.ForeignKey(
                        name: "FK__NOTIFICAC__UserI__48CFD27E",
                        column: x => x.UserID,
                        principalTable: "USUARIO",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "PEDIDO",
                columns: table => new
                {
                    PedidoID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<int>(type: "int", nullable: true),
                    FechaPedido = table.Column<DateOnly>(type: "date", nullable: true),
                    EstadoPedido = table.Column<string>(type: "varchar(50)", unicode: false, maxLength: 50, nullable: true),
                    Comentarios = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__PEDIDO__09BA1410549D09D4", x => x.PedidoID);
                    table.ForeignKey(
                        name: "FK__PEDIDO__UserID__398D8EEE",
                        column: x => x.UserID,
                        principalTable: "USUARIO",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "PUNTOSDELEALTAD",
                columns: table => new
                {
                    PuntosID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<int>(type: "int", nullable: true),
                    PuntosAcumulados = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__PUNTOSDE__77F5142BC519A10E", x => x.PuntosID);
                    table.ForeignKey(
                        name: "FK__PUNTOSDEL__UserI__4BAC3F29",
                        column: x => x.UserID,
                        principalTable: "USUARIO",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "RECOMENDACION",
                columns: table => new
                {
                    RecomendacionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserID = table.Column<int>(type: "int", nullable: true),
                    ProductoID = table.Column<int>(type: "int", nullable: true),
                    FechaRecomendacion = table.Column<DateTime>(type: "datetime", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__RECOMEND__104CC1EEF8107DE6", x => x.RecomendacionID);
                    table.ForeignKey(
                        name: "FK__RECOMENDA__Produ__45F365D3",
                        column: x => x.ProductoID,
                        principalTable: "PRODUCTO",
                        principalColumn: "ProductoID");
                    table.ForeignKey(
                        name: "FK__RECOMENDA__UserI__44FF419A",
                        column: x => x.UserID,
                        principalTable: "USUARIO",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "VALORACIONESDEPRODUCTO",
                columns: table => new
                {
                    ValoracionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProductoID = table.Column<int>(type: "int", nullable: true),
                    UserID = table.Column<int>(type: "int", nullable: true),
                    Comentario = table.Column<string>(type: "varchar(255)", unicode: false, maxLength: 255, nullable: true),
                    Calificacion = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__VALORACI__BFB912DD1AC85966", x => x.ValoracionID);
                    table.ForeignKey(
                        name: "FK__VALORACIO__Produ__4E88ABD4",
                        column: x => x.ProductoID,
                        principalTable: "PRODUCTO",
                        principalColumn: "ProductoID");
                    table.ForeignKey(
                        name: "FK__VALORACIO__UserI__4F7CD00D",
                        column: x => x.UserID,
                        principalTable: "USUARIO",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "DETALLESPEDIDO",
                columns: table => new
                {
                    DetalleID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PedidoID = table.Column<int>(type: "int", nullable: true),
                    ProductoID = table.Column<int>(type: "int", nullable: true),
                    Cantidad = table.Column<int>(type: "int", nullable: true),
                    PrecioUnitario = table.Column<decimal>(type: "decimal(10,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__DETALLES__6E19D6FA2F11F711", x => x.DetalleID);
                    table.ForeignKey(
                        name: "FK__DETALLESP__Pedid__412EB0B6",
                        column: x => x.PedidoID,
                        principalTable: "PEDIDO",
                        principalColumn: "PedidoID");
                    table.ForeignKey(
                        name: "FK__DETALLESP__Produ__4222D4EF",
                        column: x => x.ProductoID,
                        principalTable: "PRODUCTO",
                        principalColumn: "ProductoID");
                });

            migrationBuilder.CreateIndex(
                name: "IX_DETALLESPEDIDO_PedidoID",
                table: "DETALLESPEDIDO",
                column: "PedidoID");

            migrationBuilder.CreateIndex(
                name: "IX_DETALLESPEDIDO_ProductoID",
                table: "DETALLESPEDIDO",
                column: "ProductoID");

            migrationBuilder.CreateIndex(
                name: "IX_NOTIFICACION_UserID",
                table: "NOTIFICACION",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_PEDIDO_UserID",
                table: "PEDIDO",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_PRODUCTO_CategoriaID",
                table: "PRODUCTO",
                column: "CategoriaID");

            migrationBuilder.CreateIndex(
                name: "IX_PUNTOSDELEALTAD_UserID",
                table: "PUNTOSDELEALTAD",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_RECOMENDACION_ProductoID",
                table: "RECOMENDACION",
                column: "ProductoID");

            migrationBuilder.CreateIndex(
                name: "IX_RECOMENDACION_UserID",
                table: "RECOMENDACION",
                column: "UserID");

            migrationBuilder.CreateIndex(
                name: "IX_VALORACIONESDEPRODUCTO_ProductoID",
                table: "VALORACIONESDEPRODUCTO",
                column: "ProductoID");

            migrationBuilder.CreateIndex(
                name: "IX_VALORACIONESDEPRODUCTO_UserID",
                table: "VALORACIONESDEPRODUCTO",
                column: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "DETALLESPEDIDO");

            migrationBuilder.DropTable(
                name: "NOTIFICACION");

            migrationBuilder.DropTable(
                name: "PUNTOSDELEALTAD");

            migrationBuilder.DropTable(
                name: "RECOMENDACION");

            migrationBuilder.DropTable(
                name: "VALORACIONESDEPRODUCTO");

            migrationBuilder.DropTable(
                name: "PEDIDO");

            migrationBuilder.DropTable(
                name: "PRODUCTO");

            migrationBuilder.DropTable(
                name: "USUARIO");

            migrationBuilder.DropTable(
                name: "CATEGORIA");
        }
    }
}
