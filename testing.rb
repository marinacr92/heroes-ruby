# Snowflake
SNOWFLAKE_DRIVER = '/usr/lib/snowflake/odbc/lib/libSnowflake.so'
SNOWFLAKE_USER = 'climacenter'
SNOWFLAKE_PASS = 'Clima.Center*2023!'
SNOWFLAKE_HOST = 'zq33159.west-europe.azure.snowflakecomputing.com'
SNOWFLAKE_ACC = 'zq33159.west-europe.azure'
SNOWFLAKE_WAREHOUSE = 'COMPUTE_WH'
SNOWFLAKE_DATABASE = 'DWH_CORPORATIVO'

connection = nil
begin
  # DATABASE.LAYER.TABLE
  table_name = "#{SNOWFLAKE_DATABASE}.BRONZE.CC_PRODUCTS_SD"
  connection = Sequel.connect(
    adapter: 'snowflake',
    driver: SNOWFLAKE_DRIVER,
    server: SNOWFLAKE_HOST,
    uid: SNOWFLAKE_USER,
    pwd: SNOWFLAKE_PASS,
    database: SNOWFLAKE_DATABASE,
    warehouse: SNOWFLAKE_WAREHOUSE,
  )
  results = connection.fetch("SELECT COUNT(*) FROM #{table_name} WHERE ORDERID IS NOT NULL")
  pp '*' * 365, connection, connection.class
  # # Process the query results
  # results.each do |row|
  #   puts "\e[33m#{row}\e[0m" #if row[:serialnumberid].present?
  # end
rescue => e
  puts "\e[31m#{e.message}\e[0m"
  puts "\e[31m#{e.backtrace.find { |a| a.include?('testing') }}\e[0m"
ensure
  connection&.disconnect
end

# 1000035944 BBBB01866
# 1000018581 BBGB00289
# 1000019219 BBGB00666
