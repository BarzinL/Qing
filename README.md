# Qing: A Quantum I Ching Hexagram Generator

This project is a Julia script that uses the Quantum Random Number Generator (QRNG) API from [ANU](https://quantumnumbers.anu.edu.au) to generate I Ching hexagrams. It retrieves a quantum random number from the API and maps it directly to one of the 64 hexagrams, making it simple to obtain a reading in a single API call.

## Requirements

To run this program, you need the following Julia packages:
- `HTTP`: For making HTTP requests.
- `JSON`: For parsing JSON responses.

Install these packages using Julia's package manager (`Pkg`):
```julia
using Pkg
Pkg.add("HTTP")
Pkg.add("JSON")
```

## API Key Setup

To use the QRNG API, you need to obtain an API key from [ANU Quantum Random Numbers](https://quantumnumbers.anu.edu.au). Once you have your API key, follow these steps:

1. **Create `apikey.txt`**:
    
    - Create a file named `apikey.txt` in the project root directory.
    - Paste your API key into this file. The file should contain **only** the API key.

3. **Dummy API Key File**:
    
    - A dummy file named `apikey.txt.example` is included in the repository. It serves as a template for others using the project. Make sure to replace `YOUR-API-KEY-HERE` in `apikey.txt.example` when you create your own `apikey.txt`.

## Usage

1. Clone the repository or download the script.
    
2. Open the Julia REPL in your terminal or VSCode.
    
3. Navigate to the project directory using:

```julia
cd("path/to/your/project")
```

4. Run the script:

```julia
julia --project=. main.jl
```

The script will output a hexagram number between 1 and 64 along with a link to the corresponding hexagram's details.

## How It Works

- The script reads your API key from the `apikey.txt` file. If the file is not found, it defaults to reading `apikey.txt.example` or gives an error if neither exists.
- It makes an API request to retrieve a quantum-generated random number using the QRNG API's `uint16` data type.
- The number is mapped to one of the 64 hexagrams using modulo arithmetic.
- The result and a link to the hexagram’s details on [I Ching Online](https://www.iching-online.com/hexagrams/) are printed directly to the console.

### Example Output
```julia
The hexagram result is: 1
You can view the hexagram details here: https://www.iching-online.com/hexagrams/iching-hexagram-111111.html
```

## Customization

You can adjust the API URL and parameters in the `get_qrng_number` function if needed. The API allows you to specify different data types and lengths if you want to experiment with other ranges or formats.

## Troubleshooting

- Ensure you have a valid API key and that it is correctly set in `apikey.txt`.
- Make sure `apikey.txt` is not accidentally committed by verifying it is listed in `.gitignore`.
- If you encounter errors, check the API documentation for any updates or changes to the endpoints.
- Make sure you have internet access when running the script to reach the API.

## License

This project is licensed under the MIT License. Feel free to use, modify, and distribute it as you see fit.

## Credits

- [ANU Quantum Random Numbers](https://quantumnumbers.anu.edu.au) for providing the QRNG API.
- [I Ching Online](https://www.iching-online.com/hexagrams/) for the hexagram resources and information.