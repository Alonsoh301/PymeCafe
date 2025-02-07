using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PymeCafe.Migrations
{
    /// <inheritdoc />
    public partial class RenamePublicacionTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Publicacion",
                columns: table => new
                {
                    PublicacionID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Titulo = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Descripcion = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FechaPublicacion = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UsuarioID = table.Column<int>(type: "int", nullable: false),
                    Imagen = table.Column<byte[]>(type: "varbinary(max)", nullable: false),
                    ImagenRuta = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Publicacion", x => x.PublicacionID);
                    table.ForeignKey(
                        name: "FK_Publicacion_USUARIO_UsuarioID",
                        column: x => x.UsuarioID,
                        principalTable: "USUARIO",
                        principalColumn: "UserID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Publicacion_UsuarioID",
                table: "Publicacion",
                column: "UsuarioID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Publicacion");
        }
    }
}
