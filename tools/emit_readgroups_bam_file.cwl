#!/usr/bin/env cwl-runner

cwlVersion: v1.0

requirements:
  - $import: readgroup.yml
  - class: InlineJavascriptRequirement

class: ExpressionTool

inputs:
  - id: bam
    type: File

  - id: readgroup_meta_list
    type:
      type: array
      items: readgroup.yml#readgroup_meta

outputs:
  - id: output
    type: readgroup.yml#readgroups_bam_file

expression: |
  ${
    const output = { "bam": inputs.bam,
                     "readgroup_meta_list": inputs.readgroup_meta_list};

    return {'output': output}
  }
