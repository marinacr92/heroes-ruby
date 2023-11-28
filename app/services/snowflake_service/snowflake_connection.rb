module SnowflakeService
  class SnowflakeConnection
    def initialize
      @connection = Sequel.connect(
        adapter: 'snowflake',
        driver: SNOWFLAKE_DRIVER,
        server: SNOWFLAKE_HOST,
        uid: SNOWFLAKE_USER,
        pwd: SNOWFLAKE_PASS,
        database: SNOWFLAKE_DATABASE,
        warehouse: SNOWFLAKE_WAREHOUSE,
        )
    end
  end
end
