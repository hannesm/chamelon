let magic = "littlefs"

type superblock = {
  version : Cstruct.uint32;
  block_size : Cstruct.uint32;
  block_count : Cstruct.uint32;
  name_length_max : Cstruct.uint32;
  file_size_max : Cstruct.uint32;
  file_attribute_size_max : Cstruct.uint32;
}

[%%cstruct
  type superblock = {
    version : uint32_t;
    block_size : uint32_t;
    block_count : uint32_t;
    name_length_max : uint32_t;
    file_size_max : uint32_t;
    file_attribute_size_max : uint32_t;
  } [@@big_endian]]

let parse cs =
  {
    version = get_superblock_version cs;
    block_size = get_superblock_block_size cs;
    block_count = get_superblock_block_count cs;
    name_length_max = get_superblock_name_length_max cs;
    file_size_max = get_superblock_file_size_max cs;
    file_attribute_size_max = get_superblock_file_attribute_size_max cs;
  }
