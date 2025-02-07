using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PymeCafe.Migrations
{
    /// <inheritdoc />
    public partial class Sinpemovil : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<byte[]>(
                name: "Comprobante",
                table: "PEDIDO",
                type: "varbinary(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Comprobante",
                table: "PEDIDO");
        }
    }
}
