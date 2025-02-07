using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PymeCafe.Migrations
{
    /// <inheritdoc />
    public partial class AgregarColumnaFoto : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Foto",
                table: "PRODUCTO",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Foto",
                table: "PRODUCTO");
        }
    }
}
