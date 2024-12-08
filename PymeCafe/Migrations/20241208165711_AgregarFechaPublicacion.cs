using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PymeCafe.Migrations
{
    /// <inheritdoc />
    public partial class AgregarFechaPublicacion : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Publicacion_USUARIO_UsuarioID",
                table: "Publicacion");

            migrationBuilder.AlterColumn<int>(
                name: "UsuarioID",
                table: "Publicacion",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<string>(
                name: "Imagen",
                table: "Publicacion",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(byte[]),
                oldType: "varbinary(max)");

            migrationBuilder.AddForeignKey(
                name: "FK_Publicacion_USUARIO_UsuarioID",
                table: "Publicacion",
                column: "UsuarioID",
                principalTable: "USUARIO",
                principalColumn: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Publicacion_USUARIO_UsuarioID",
                table: "Publicacion");

            migrationBuilder.AlterColumn<int>(
                name: "UsuarioID",
                table: "Publicacion",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<byte[]>(
                name: "Imagen",
                table: "Publicacion",
                type: "varbinary(max)",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            migrationBuilder.AddForeignKey(
                name: "FK_Publicacion_USUARIO_UsuarioID",
                table: "Publicacion",
                column: "UsuarioID",
                principalTable: "USUARIO",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
