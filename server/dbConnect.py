import mysql.connector

def getConnection():
    # Replace the placeholders with your actual database credentials
    host = '127.0.0.1'
    user = 'sht'
    password = '8R3ud2Yei2AsNO'
    database = 'sht'
    port = 3306

    try:
        # Connect to the database
        connection = mysql.connector.connect(
            host=host,
            user=user,
            password=password,
            database=database,
            port = port
        )
        print("Connected to the database")
        return connection
    except mysql.connector.Error as error:
        print("Error connecting to the database:", error)
        return None

#test the connection
if __name__ == '__main__':
    conn = getConnection()  # Test connection
    if conn:
        conn.close()  # Close the connection after testing
