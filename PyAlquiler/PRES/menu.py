from acceso.conexion import conectar_base_datos
from acceso.funciones_db import ver_propiedades_disponibles, ver_detalles_propiedad, crear_contrato
from NEG.validarDatosContrato import validar_datos_contrato


def contrato():
    print("\n--- Contrato ---")
    print 
def mostrar_menu():
    print("\n--- Menú ---")
    print("1. Ver Propiedades Disponibles")
    print("2. Ver Detalles de Propiedad")
    print("3. Crear Contrato")
    print("4. Salir")

def ejecutar_opcion(opcion):
    conexion, cursor = conectar_base_datos()

    if opcion == '1':
        propiedades = ver_propiedades_disponibles(cursor)
        print("\nPropiedades Disponibles:")
        for propiedad in propiedades:
            print(f"ID: {propiedad[0]}, Nombre: {propiedad[2]}, Estado: {propiedad[5]}")
    elif opcion == '2':
        id_propiedad = int(input("\nIngrese el ID de la propiedad para ver detalles: "))
        propiedad = ver_detalles_propiedad(cursor, id_propiedad)
        if propiedad:
            print(f"\nDetalles de la Propiedad:")
            print(f"ID: {propiedad[0]}")
            print(f"Nombre: {propiedad[2]}")
            print(f"Dirección: {propiedad[3]}")
        else:
            print(f"\nPropiedad no encontrada")
        # Agrega más detalles según sea necesario
    elif opcion == '3':
        id_propiedad = int(input("\nIngrese el ID de la propiedad para la cual desea crear un contrato: "))
        # Ingresar datos del cliente
        nombre_cliente = input("\nIngrese el id del cliente: ")
        fecha_inicio = input("Ingrese la fecha de inicio del contrato (YYYY-MM-DD): ")
        fecha_fin = input("Ingrese la duración en meses:")
        monto = float(input("Ingrese el monto del contrato: "))
        monto_abonado = float(input("Ingrese la cantidad abonada inicialmente: "))
        if validar_datos_contrato(nombre_cliente, fecha_inicio, fecha_fin, monto, monto_abonado):
            crear_contrato(cursor, conexion, id_propiedad, nombre_cliente, fecha_inicio, fecha_fin, monto, monto_abonado)
        
    

    cursor.close()
    conexion.close()
