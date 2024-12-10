using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PymeCafe.Migrations
{
    /// <inheritdoc />
    public partial class RemoveImagenColumn : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Publicacion_USUARIO_UsuarioID",
                table: "Publicacion");

            migrationBuilder.DropIndex(
                name: "IX_Publicacion_UsuarioID",
                table: "Publicacion");

            migrationBuilder.DropColumn(
                name: "Imagen",
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
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "UsuarioID",
                table: "Publicacion",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<string>(
                name: "Imagen",
                table: "Publicacion",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_Publicacion_UsuarioID",
                table: "Publicacion",
                column: "UsuarioID");

            migrationBuilder.AddForeignKey(
                name: "FK_Publicacion_USUARIO_UsuarioID",
                table: "Publicacion",
                column: "UsuarioID",
                principalTable: "USUARIO",
                principalColumn: "UserID");
        }
    }
}
