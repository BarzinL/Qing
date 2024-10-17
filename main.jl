using HTTP
using JSON

# Function to read the API key from a file
function read_api_key(filename::String)
    open(filename, "r") do file
        return strip(readline(file))
    end
end

# Load the API key from apikey.txt
api_key = read_api_key("apikey.txt")

# Function to retrieve a quantum random number
function get_qrng_number(api_url, api_key, length::Int=1, data_type::String="uint16")
    # Construct the full API URL with parameters
    full_url = "$api_url?length=$length&type=$data_type"
    
    # Make the API request
    response = HTTP.get(full_url, ["x-api-key" => api_key])
    if response.status == 200
        data = JSON.parse(String(response.body))
        return data["data"][1]  # Access the first random number in the array
    else
        error("API request failed with status: $(response.status)")
    end
end

# Function to generate the binary representation for each hexagram
function hexagram_to_binary(hexagram_num::Int)
    # The 64 hexagrams in binary representation from 1 to 64
    hexagrams = [
        "111111", "000000", "010001", "100010",
        "010111", "111010", "000010", "010000",
        "110111", "111011", "000111", "111000",
        "111101", "101111", "000100", "001000",
        "011001", "100110", "000011", "110000",
        "101001", "100101", "100000", "000001",
        "111001", "100111", "100001", "011110",
        "010010", "101101", "011100", "001110",
        "111100", "001111", "101000", "000101",
        "110101", "101011", "010100", "001010",
        "100011", "110001", "011111", "111110", 
        "011000", "000110", "011010", "010110",
        "011101", "101110", "001001", "100100",
        "110100", "001011", "001101", "101100",
        "110110", "011011", "110010", "010011",
        "110011", "001100", "010101", "101010"
    ]
    return hexagrams[hexagram_num]
end

function generate_hexagram()
    # Replace with your actual API URL
    api_url = "https://api.quantumnumbers.anu.edu.au"
    
    # Get a quantum random number
    random_number = get_qrng_number(api_url, api_key, 1, "uint16")
    
    # Map the random number to a hexagram
    hexagram_num = random_number % 64 + 1  # I Ching has 64 hexagrams
    binary_code = hexagram_to_binary(hexagram_num)
    
    # Generate the URL for the hexagram
    hexagram_url = "https://www.iching-online.com/hexagrams/iching-hexagram-$binary_code.html"
    
    # Output the hexagram and the URL
    println("The hexagram result is: $hexagram_num")
    println("You can view the hexagram details here: $hexagram_url")
end

# Run the function
generate_hexagram()