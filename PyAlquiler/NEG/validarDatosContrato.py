import datetime
def validar_datos_contrato(nombre_cliente, fecha_inicio, fecha_fin, monto, monto_abonado):
    # Validar que los campos no estén vacíos
    if not nombre_cliente or not fecha_inicio or not fecha_fin:
        print("Error: Todos los campos deben ser completados.")
        return False

    # Validar que las fechas tengan el formato correcto (YYYY-MM-DD)
    try:
        datetime.datetime.strptime(fecha_inicio, "%Y-%m-%d")
    except ValueError:
        print("Error: Formato de fecha incorrecto. Utilice YYYY-MM-DD.")
        return False

    # Validar que el monto y el monto abonado sean números positivos
    if not (isinstance(monto, (int, float)) and isinstance(monto_abonado, (int, float)) and monto >= 0 and monto_abonado >= 0):
        print("Error: El monto y el monto abonado deben ser números positivos.")
        return False

    return True
