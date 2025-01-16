import argparse
from PIL import Image
from torchvision import transforms
import numpy as np
import os

# Define the preprocessing transform
transform = transforms.Compose([
    transforms.Grayscale(num_output_channels=1),
    transforms.Resize((28, 28)),
    transforms.ToTensor(),
    transforms.Normalize((0.5,), (0.5,))
])

# Define the main function
def main():
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Generate C++ header file from image.")
    parser.add_argument("image_path", type=str, help="Path to the input image.")
    parser.add_argument("output_folder", type=str, help="Folder to save the generated C++ header file.")
    args = parser.parse_args()

    # Ensure the output folder exists
    os.makedirs(args.output_folder, exist_ok=True)

    # Define the output file path
    header_file_path = os.path.join(args.output_folder, "image_data.h")

    # Load and preprocess the image
    image = Image.open(args.image_path).convert('L')

    # Apply the transform
    processed_image = transform(image).unsqueeze(0)  # Add batch dimension

    # Convert the processed image to a flattened numpy array
    flattened_image = processed_image.squeeze().numpy().flatten()

    # Generate a C++ header file
    header_content = f"""#ifndef IMAGE_DATA_H
#define IMAGE_DATA_H

const float image_data[] = {{
{', '.join([f"{value:.6f}" for value in flattened_image])}
}};

#endif // IMAGE_DATA_H
"""

    # Save the header file
    with open(header_file_path, "w") as header_file:
        header_file.write(header_content)

    print(f"C++ header file '{header_file_path}' generated successfully!")

# Entry point of the script
if __name__ == "__main__":
    main()
