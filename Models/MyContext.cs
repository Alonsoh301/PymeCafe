using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using PymeCafe.Models;

namespace PymeCafe.Models;

public partial class MyContext : DbContext
{
    public MyContext()
    {
    }

    public MyContext(DbContextOptions<MyContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Categoria> Categoria { get; set; }

    public virtual DbSet<Detallespedido> Detallespedidos { get; set; }

    public virtual DbSet<Notificacion> Notificacions { get; set; }

    public virtual DbSet<Pedido> Pedidos { get; set; }

    public virtual DbSet<Producto> Productos { get; set; }

    public virtual DbSet<Puntosdelealtad> Puntosdelealtads { get; set; }

    public virtual DbSet<Recomendacion> Recomendacions { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }

    public virtual DbSet<Valoracionesdeproducto> Valoracionesdeproductos { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) { }
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
 //       => optionsBuilder.UseSqlServer("server=localhost; database=PymeCafe; integrated security=true; TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Categoria>(entity =>
        {
            entity.HasKey(e => e.CategoriaId).HasName("PK__CATEGORI__F353C1C50B531DE6");

            entity.ToTable("CATEGORIA");

            entity.Property(e => e.CategoriaId).HasColumnName("CategoriaID");
            entity.Property(e => e.NombreCategoria)
                .HasMaxLength(100)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Detallespedido>(entity =>
        {
            entity.HasKey(e => e.DetalleId).HasName("PK__DETALLES__6E19D6FA2F11F711");

            entity.ToTable("DETALLESPEDIDO");

            entity.Property(e => e.DetalleId).HasColumnName("DetalleID");
            entity.Property(e => e.PedidoId).HasColumnName("PedidoID");
            entity.Property(e => e.PrecioUnitario).HasColumnType("decimal(10, 2)");
            entity.Property(e => e.ProductoId).HasColumnName("ProductoID");

            entity.HasOne(d => d.Pedido).WithMany(p => p.Detallespedidos)
                .HasForeignKey(d => d.PedidoId)
                .HasConstraintName("FK__DETALLESP__Pedid__412EB0B6");

            entity.HasOne(d => d.Producto).WithMany(p => p.Detallespedidos)
                .HasForeignKey(d => d.ProductoId)
                .HasConstraintName("FK__DETALLESP__Produ__4222D4EF");
        });

        modelBuilder.Entity<Notificacion>(entity =>
        {
            entity.HasKey(e => e.NotificacionId).HasName("PK__NOTIFICA__BCC120C44EAC3A5D");

            entity.ToTable("NOTIFICACION");

            entity.Property(e => e.NotificacionId).HasColumnName("NotificacionID");
            entity.Property(e => e.FechaEnvio).HasColumnType("datetime");
            entity.Property(e => e.Mensaje)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Notificacions)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__NOTIFICAC__UserI__48CFD27E");
        });

        modelBuilder.Entity<Pedido>(entity =>
        {
            entity.HasKey(e => e.PedidoId).HasName("PK__PEDIDO__09BA1410549D09D4");

            entity.ToTable("PEDIDO");

            entity.Property(e => e.PedidoId).HasColumnName("PedidoID");
            entity.Property(e => e.Comentarios)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.EstadoPedido)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Pedidos)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__PEDIDO__UserID__398D8EEE");
        });

        modelBuilder.Entity<Producto>(entity =>
        {
            entity.HasKey(e => e.ProductoId).HasName("PK__PRODUCTO__A430AE836D9441A6");

            entity.ToTable("PRODUCTO");

            entity.Property(e => e.ProductoId).HasColumnName("ProductoID");
            entity.Property(e => e.CategoriaId).HasColumnName("CategoriaID");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.NombreProducto)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Precio).HasColumnType("decimal(10, 2)");

            entity.HasOne(d => d.Categoria).WithMany(p => p.Productos)
                .HasForeignKey(d => d.CategoriaId)
                .HasConstraintName("FK__PRODUCTO__Catego__3E52440B");
        });

        modelBuilder.Entity<Puntosdelealtad>(entity =>
        {
            entity.HasKey(e => e.PuntosId).HasName("PK__PUNTOSDE__77F5142BC519A10E");

            entity.ToTable("PUNTOSDELEALTAD");

            entity.Property(e => e.PuntosId).HasColumnName("PuntosID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.User).WithMany(p => p.Puntosdelealtads)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__PUNTOSDEL__UserI__4BAC3F29");
        });

        modelBuilder.Entity<Recomendacion>(entity =>
        {
            entity.HasKey(e => e.RecomendacionId).HasName("PK__RECOMEND__104CC1EEF8107DE6");

            entity.ToTable("RECOMENDACION");

            entity.Property(e => e.RecomendacionId).HasColumnName("RecomendacionID");
            entity.Property(e => e.FechaRecomendacion).HasColumnType("datetime");
            entity.Property(e => e.ProductoId).HasColumnName("ProductoID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Producto).WithMany(p => p.Recomendacions)
                .HasForeignKey(d => d.ProductoId)
                .HasConstraintName("FK__RECOMENDA__Produ__45F365D3");

            entity.HasOne(d => d.User).WithMany(p => p.Recomendacions)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__RECOMENDA__UserI__44FF419A");
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__USUARIO__1788CCACCE9AC0A3");

            entity.ToTable("USUARIO");

            entity.Property(e => e.UserId).HasColumnName("UserID");
            entity.Property(e => e.Apellido)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Contraseña)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.CorreoElectronico)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Nombre)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TipoUsuario)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Valoracionesdeproducto>(entity =>
        {
            entity.HasKey(e => e.ValoracionId).HasName("PK__VALORACI__BFB912DD1AC85966");

            entity.ToTable("VALORACIONESDEPRODUCTO");

            entity.Property(e => e.ValoracionId).HasColumnName("ValoracionID");
            entity.Property(e => e.Comentario)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.ProductoId).HasColumnName("ProductoID");
            entity.Property(e => e.UserId).HasColumnName("UserID");

            entity.HasOne(d => d.Producto).WithMany(p => p.Valoracionesdeproductos)
                .HasForeignKey(d => d.ProductoId)
                .HasConstraintName("FK__VALORACIO__Produ__4E88ABD4");

            entity.HasOne(d => d.User).WithMany(p => p.Valoracionesdeproductos)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("FK__VALORACIO__UserI__4F7CD00D");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

public DbSet<PymeCafe.Models.Publicacion> Publicacion { get; set; } = default!;
}
