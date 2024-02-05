def ver_propiedades_disponibles(cursor):
    # Lógica para obtener y mostrar propiedades disponibles
    cursor.execute("SELECT * FROM Propiedades WHERE estado='disponible'")
    propiedades = cursor.fetchall()
    return propiedades


def ver_detalles_propiedad(cursor, id_propiedad):
    # Lógica para obtener y mostrar detalles de una propiedad
    cursor.execute("SELECT * FROM Propiedades WHERE id_propiedad=%s", (id_propiedad,))
    propiedad = cursor.fetchone()

    if propiedad:return propiedad
        
    else: return None

def crear_contrato(cursor, conexion, id_propiedad, nombre_cliente, fecha_inicio, fecha_fin, monto, monto_abonado):
    
    # Obtener detalles de la propiedad
    cursor.execute("SELECT * FROM Propiedades WHERE id_propiedad=%s", (id_propiedad,))
    propiedad = cursor.fetchone()

    if propiedad:
        print("\nDetalles de la Propiedad:")
        print(f"ID: {propiedad[0]}")
        print(f"Nombre: {propiedad[2]}")
        print(f"Dirección: {propiedad[3]}")
        # Agrega más detalles según sea necesario


        # Lógica para crear un contrato en la base de datos
        cursor.execute("INSERT INTO Contratos (id_propiedad, id_inquilino, fecha_inicio, duracion_meses, monto_total, monto_abonado, estado) "
                       "VALUES (%s, %s, %s, %s, %s, %s, 'activo')",
                       (id_propiedad, nombre_cliente, fecha_inicio, fecha_fin, monto, monto_abonado))

        # Actualizar el estado de la propiedad a 'ocupada'
        cursor.execute("UPDATE Propiedades SET estado='reservado' WHERE id_propiedad=%s", (id_propiedad,))
        conexion.commit()

        print("\nContrato creado exitosamente.")
    else:
        print("Propiedad no encontrada.")

