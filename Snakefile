rule parse_BLAST_results:
	input:
		"pipetest/inputs/{sample}_contigs_blasted.txt"
	output:
		"pipetest/parsed/{sample}_parsed_hits.txt"
	shell:
		"python3 scripts/parse_BLAST_results.py {input} {output}"

rule download_hits_align_contigs:
	input:
		contigs="pipetest/inputs/{sample}_contigs.fa",
		parsed_hits="pipetest/parsed/{sample}_parsed_hits.txt"
	output:
		directory("pipetest/zipped_results/{sample}")
	shell:
#		"bash scripts/dl_wrapper.sh {input.contigs} spade pipetest/zipped_results/{wildcards.sample}/ {input.parsed_hits}"
		"python3 scripts/download_hits_align_contigs.py {input.contigs} spade {output} {input.parsed_hits}"


# sample_22

#bash scripts/dl_wrapper.sh pipetest/inputs/sample_22_contigs.fa spade pipetest/zipped_results/sample_22 pipetest/parsed/sample_22_parsed_hits.txt