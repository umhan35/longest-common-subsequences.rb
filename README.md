# Longest common subsequences

It solves the [longest common subsequences problem](http://en.wikipedia.org/wiki/Longest_common_subsequence_problem).

## Run it

`ruby main.rb`, you can also run test: `ruby test.rb`

Notes: it's writtern in Ruby 1.8.7... Ruby 1.9.3 is not a friend of him...

[output](output) is the output.

## Longest common subsequences explaination

Virtually all living cells contain components called microtubules, which serve
multiple purposes including helping the cells hold their shape. One component
of microtubules is a protein called alpha-tubulin. This protein is very similar in
all species of living things; but we can get some idea of the connections between
different species by measuring the small differences between their alpha-tubulin
genes.

[tubulin.txt](tubulin.txt) is a data file of protein sequences for alpha-
tubulin in five different living things: Drosophila melanogaster (common fruit
fly); Homo sapiens (human being); Rattus norvegicus (Norway rat); Schis-
tosoma mansoni (a type of parasitic worm); and Zea mays (maize or corn
plant). Note that each line in the file consists of the species name (two words),
a colon, a space, and then approximately 450 lower-case alphabetic charac-
ters expressing the sequence of amino acid residues for the alpha-tubulin pro-
tein in that species. (Sequences obtained from the NCBI Protein database at
http://www.ncbi.nlm.nih.gov/protein.)

This software is to measure the similarities and differences between these se-
quences by computing their pairwise edit distances (with edits defined as in-
sertion or deletion). For any two strings, the edit distance is the sum of the
lengths of the two strings, minus two times the length of their longest common
subsequence. For instance, between the strings “ABCD” and “XBCYDQ” the 
longest common subsequence is “BCD” and so the edit distance is 4+6−2·3 = 4
(corresponding to deleting “A” and then inserting “X,” “Y,” and “Q”). This is
a simplified version of similar distance functions actually used in computational
biology research.

Write software to measure the edit distance between the gene sequences.
Compute the distance between each pair of sequences, the output needed
to demonstrate how it runs, and a table of the distances computed. Which two
species are closest together by this measurement? Whichtwo are farthest apart?