# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
# Copyright 2023-2024 Arm Limited and/or its affiliates.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.


# Alterd version to run in the docker (Instead of reading the entire file into memory and converting all bytes at once, 
# let's process it incrementally using generators to reduce memory and CPU overhead)

import binascii
import os
from argparse import ArgumentParser, ArgumentTypeError

bytes_per_line = 32
hex_digits_per_line = bytes_per_line * 2

def input_file_path(path):
    if os.path.exists(path):
        return path
    else:
        raise ArgumentTypeError(f"input filepath:{path} does not exist")

parser = ArgumentParser()
parser.add_argument("-p", "--pte", help="ExecuTorch .pte model file", type=input_file_path, required=True)
parser.add_argument("-d", "--outdir", help="Output dir for model header", type=str, required=False, default=".")
parser.add_argument("-o", "--outfile", help="Output filename for model header", type=str, required=False, default="model_pte.h")
parser.add_argument("-s", "--section", help="Section attribute for the data array", type=str, required=False, default="network_model_sec")

def hex_generator(file):
    """Generator that yields hex-formatted bytes line by line."""
    while chunk := file.read(bytes_per_line):
        hexstream = binascii.hexlify(chunk).decode("utf-8")
        yield ", ".join(f"0x{hexstream[i:i+2]}" for i in range(0, len(hexstream), 2))

if __name__ == "__main__":
    args = parser.parse_args()
    outfile = os.path.join(args.outdir, args.outfile)
    attr = f'__attribute__((section("{args.section}"), aligned(16))) char '

    with open(args.pte, "rb") as fr, open(outfile, "w", buffering=1024 * 1024) as fw:
        fw.write(attr + "model_pte[] = {\n")
        fw.writelines(line + ",\n" for line in hex_generator(fr))
        fw.write("};\n")

    print(f"Processed {args.pte} -> {outfile}")
