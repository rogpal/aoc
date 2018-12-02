
aoc2:-
    get_list(List),
    checksum(List, Sum),
    writeln(Sum).

aoc2b:-
    get_list(List),
    off_pair_in_list(List, Word1, Word2),
    writeln(Word1),
    writeln(Word2),
    string_codes(Word1, Codes1),
    string_codes(Word2, Codes2),
    only_same(Codes1, Codes2, Codes),
    string_codes(Word, Codes),
    writeln(Word).

off_pair_in_list(List, Word1, Word2):-
    pair(List, Word1, Word2),
    write("Checking "),
    write(Word1),
    write(" and "),
    writeln(Word2),
    diff(Word1, Word2, 1).


diff(Word1, Word2, N):-
    string_codes(Word1, Codes1),
    string_codes(Word2, Codes2),
    diff(Codes1, Codes2, 0, N).

diff([], [], N, N).
diff([Code|Codes1], [Code|Codes2], N, Nr):-
    diff(Codes1, Codes2, N, Nr).
diff([Code1|Codes1], [Code2|Codes2], N, Nr):-
    Code1 \== Code2,
    N1 is N + 1,
    diff(Codes1, Codes2, N1, Nr).

pair(List, Word1, Word2):-
    member(Word1, List),
    delete(List, Word1, NewList),
    member(Word2, NewList).

only_same([], [], []).
only_same([X|R1], [X|R2], [X|R]):-
    only_same(R1, R2, R).
only_same([X|R1], [Y|R2], R):-
    X \== Y,
    only_same(R1, R2, R).


checksum(List, Sum):-
    count_Nchars(List, 2, N1),
    count_Nchars(List, 3, N2),
    Sum is N1 * N2.

count_Nchars([], _, 0):-!.
count_Nchars([Word|Words], N, Count):-
    has_char_count(Word, N),
    !,
    count_Nchars(Words, N, Count1),
    Count is Count1 + 1.

count_Nchars([_|Words], N, Count):-
    !,
    count_Nchars(Words, N, Count).

has_char_count(Word, N):-
    string_codes(Word, CharList),
    empty_assoc(EmptyAList),
    char_count(CharList, EmptyAList, FullAList),
    assoc_to_list(FullAList, PairList),
    member(_-N, PairList).


char_count([], X, X):-!.
char_count([Char|Chars], AList, ResultAList):-
    get_assoc(Char, AList, Val),
    !,
    Val1 is Val + 1,
    put_assoc(Char, AList, Val1, NewAList),
    char_count(Chars, NewAList, ResultAList).

char_count([Char|Chars], AList, ResultAList):-
    !,
    put_assoc(Char, AList, 1, NewAList),
    char_count(Chars, NewAList, ResultAList).


get_list1(X):- split_string("abc,aab,bcd,def,ghj,gjj", ",", "", X).

get_list(X):-split_string("pnebjqralgdgckzfifvtxywomu
pnebjqsalrdgcqzfihotxhwomu
pneajqsalrdgckzfihytxywoml
pnepjqsalrwgckztihvtxywomu
pnhbjqsalrdgckzfimvtxywodu
pnwbjqsdlrdgckzfihvnxywomu
inebjqnalrdgckzfihvtxzwomu
pnebjssalhdgckzfihvtsywomu
pnebjqjalrdgckzfiavtxywoku
vnebjqsalrdgckzfihvbxmwomu
phebjksaurdgckzfihvtxywomu
pneojqealrdgckzhihvtxywomu
snebjqsalrdgckzqihvtxyzomu
pnebjqsalrtackzfihvtxswomu
bnebjqlalrdgckzfihvtxywhmu
pnebjqfalrdgckzfijvtxywomi
fnehjbsalrdgckzfihvtxywomu
pnebjasalrdgckzdihvtxqwomu
pnebjhsaljdgckzfihvtxywmmu
pnebjqsalrdgckzfihvsxykoau
pnebjqsalrdgckzbihvtdywomc
pnobjqsalrxgckzfihvtxywomh
pnebjqstlrdgchzfihvtxywnmu
pnebjquaxrdgckzfihvtxywolu
pqebjqsalrdgcdzfihvtcywomu
xnabjqsalrdgckzfihvtxywmmu
rnebjqsalrdgckzfihvtxmwouu
vaebjqsalrdgckcfihvtxywomu
pnebjqsalrpgcnzfihvbxywomu
pcvbjqsalrdjckzfihvtxywomu
pneyjqsafrdgckzfihdtxywomu
pxedjqsalrdgckzfihvtxyzomu
pnebjqsalrdgctzfihnyxywomu
pnebjqsalrdgckzfihvtnylsmu
pnebjqsalrdyckzfihvbxycomu
fnebjqsalrdgckzfihvtxtwomc
pnobjqsalrdgckdfihvtxywomh
pqebjqsalrdgcqzfihvtxywymu
pnebxqsalrdgckzficvtwywomu
pnebjqshlragczzfihvtxywomu
pnebqqsalrdackzfihttxywomu
pnebjqsalrdsckwfbhvtxywomu
pnehjqsalrdgcuzfxhvtxywomu
pnebjqsavrdgckzfihvexywomn
pnebunsalrdgckzfihvtxywomi
pnebjxsalrdgckzfmhvtpywomu
rnebjqsalrdghkzfihztxywomu
pnebjqsalrigcbzfihvfxywomu
pnebqqsalrggckzfihvtxyromu
pnebjqsalrdgchzfihvtxylmmu
pnebeqsalrdgckzdihvtxywoms
pnebjqsalrdgckzzihvfxywozu
pnzbjgsalrtgckzfihvtxywomu
pnebjqsaledgckzjihvtxzwomu
pnebjqsalydgckqfihvtxywouu
pnebjqsalrdgckufihvqxdwomu
pnebjqsylrdgckzfihvdxyjomu
pnemjqsalrdgckzeihvtxywoqu
plebjasalrdgckzfihvtxywomb
pnebjqsadrdgckufihvtxyfomu
pbebjqsaardgckzfihvtxmwomu
pnebjqsalrdgcmzfihotxywgmu
pnebjqsaprdgcizfihvtxywhmu
pnebjqsalrkgcuzfihvtlywomu
pnebjqsalrdnckzfihvtxysomg
pnebjqdafrdgckzfihctxywomu
pnebjqsalrdgckzfihutxkwomp
pnebvqsalrdgclzfimvtxywomu
pnebjqralrdgcktfihvtxiwomu
pneujqsalrdsckzfzhvtxywomu
pnebfqgalrdgckzfihvtxywjmu
pneyjqsalrkgckzfihctxywomu
pndbjqsalrdgckzfjhvtxywouu
pneljnsalrdgcozfihvtxywomu
phebjqsalrdgckzfihxtxdwomu
pnlbjqsalrhgckzfzhvtxywomu
pnebjqsalrsgckzfiovtxywwmu
pncbjqsalrdgfkzfivvtxywomu
nnebjqsalrdgckzfthvtxycomu
pnebjqwalsdgckzfixvtxywomu
pnebjtsalrdgcfzfimvtxywomu
pnebjqsvlrdgckzfihutxfwomu
pnebjmsalrdgckzkxhvtxywomu
pnekjqsllrdgckzfinvtxywomu
pneijqsxlrdgckzfihvtxywjmu
wnxbjqsafrdgckzfihvtxywomu
pnebjqskledgokzfihvtxywomu
pnebjqvalrdgckzfihvtxytoju
pneqjqsalrdgckzfilvthywomu
pnebjqsalrdgckzfihvokywomf
bnebjqsalrdgckufihvtxywimu
pnebjqsaurdgckzfihvtrywosu
pnebjmsaludgckzfihvtxywomn
pnebdqsalrdgcktfihvtxywodu
pnebjqjylzdgckzfihvtxywomu
piebjqsalrdgcrzfihstxywomu
pnebjqsaurdgckwfnhvtxywomu
pnebxqsajrdgcjzfihvtxywomu
pnebjqsalrdghsdfihvtxywomu
pnebcqsxlrdgckzfihvtxyaomu
pnefjqsalrdgckzfuhvtxyworu
pnebjqsalrdlcksfihvteywomu
pnebjqlalrgackzfihvtxywomu
pnebdqsalrdickzfihvtxdwomu
pneujksalrdgctzfihvtxywomu
pnebjqsalrduckzfihvsxywomf
pnebjqsalrdgckcfihotxywomd
envbjqsalsdgckzfihvtxywomu
pnebjqsalzdgcvzzihvtxywomu
pnebjqsalrdyckzflhvyxywomu
pnebjqsalrdglkzfihstxymomu
pnebmqsalrdgokzfihvtxywoml
pnebjqsylrdnckzfihatxywomu
pnebjqaflndgckzfihvtxywomu
pneboqsagragckzfihvtxywomu
peebjqstlndgckzfihvtxywomu
onebjqsklrdgckzfihvtxmwomu
pnebjqjnlrdgckrfihvtxywomu
pnebjqsalrhgckzfihvqxywomh
pnebjqsalrdgckzzihvtxowomw
pnebjgsalrdgckffihltxywomu
znebaqsalcdgckzfihvtxywomu
pnnbjqeasrdgckzfihvtxywomu
rnebjqaalrxgckzfihvtxywomu
pnebjqsalrdgckaxphvtxywomu
pnebjcnalrdgnkzfihvtxywomu
pnebjasalbdgckzmihvtxywomu
pnebjqsalrdgckefjhvtmywomu
pnebjqsalrdgmkzfihvtxyoomb
pnebjqsalrkgckogihvtxywomu
pnwbjqsalrdgckztihvtxywomt
pnebjqsalrdgckzfihotgnwomu
pnebjqsdlrrgckzfihvtxyaomu
pnebvasalrdgckzfihvtsywomu
pnebrqqalrvgckzfihvtxywomu
tnebjqsglrdgqkzfihvtxywomu
pnebjqsatrsgckifihvtxywomu
pneboqsalrdgckzfihvkxywomi
pnezaqsalrdgcktfihvtxywomu
pnebjqsnlrdgckzfihvfxqwomu
pneajqsaxrmgckzfihvtxywomu
pnebjosalodgckzfihvxxywomu
pnebjqsalndgckmfihvtfywomu
pneejqsalidgckzfihgtxywomu
pnecjqsalrdgckzfihptxiwomu
tnebjqsalrdgckznihvxxywomu
ptebjqsalrdgckzfimvtxywomm
wnebjqsalndgckzfihvtxywoju
fnebmqsplrdgckzfihvtxywomu
pnlbjqsalrdghkzficvtxywomu
pnebjqsesrdgckzdihvtxywomu
pnebjqsalregokzfirvtxywomu
pnebjtualrtgckzfihvtxywomu
pnebjwsdlrdgckzfihvtxywoml
pnlbjqsayrdgckzfqhvtxywomu
pnebjwsalpdgckzfihvtxywomc
pnqbjqsalcdgckzhihvtxywomu
pneujqsalrdgckzfhhvtxrwomu
pnebjqsalqdgcizfihvtxywimu
pnebjqsacldgckzfihvwxywomu
puebjqsalrdgckzfbhvtxyeomu
pnebjqsalrdgcyimihvtxywomu
pnebjlsalrdgckzfihvtxiwome
pnebfusalrdgckzfihvtxywodu
pnebjqsalrdgvazfirvtxywomu
pnebjqsalrdgckyfohvtxywomz
gnenjqsalrdgckzfihvtxynomu
mnebjqsalrdgckhfihvtxycomu
phebjqsalrdgckzfihvtxtworu
pnebjqsalrdgdkzfihvtxywfmj
pneveqsairdgckzfihvtxywomu
pnebjqsalcdlckzfihvtxywomg
pneajqsalrdgckzfihvtxygoxu
puebjqdclrdgckzfihvtxywomu
tuebjqsalrdgckzfihvtxywoou
pwenjqsalrdgckzfihvtxywomg
pnebjqsalrdgckzfihhltywomu
pnebjqsalrdgchzqievtxywomu
pnegjqsalrdgckzfiovtxywdmu
pnebjaralrqgckzfihvtxywomu
pnebjqsalrdrckzfimvtxywomm
pnebjqsalrdgckzfpgvtxewomu
pnebjqsalrdhcqzfihitxywomu
pnebjqsalrjgckefihmtxywomu
pnebjcsalrdgcksfikvtxywomu
pnebjqsalrdgckzfihvtxywdjc
pnebjqsazrjgckzjihvtxywomu
pnfbjqsclrdgckzfihvtxybomu
pnebjqsalrdgckuqihvtxyaomu
pfpbjzsalrdgckzfihvtxywomu
pnevjqsalrdgckwfihytxywomu
pnebjqsqlrkgckzfihvtvywomu
pneejqsalrdlckzfihvtxywopu
pnebjqsalcdgxkzfihvtxywomd
pneqjqsalrdgcvzzihvtxywomu
pnvbjqsalydgctzfihvtxywomu
pnebjqsalrdgckzzihvfxywomn
pnybjqsaerdgckzfihstxywomu
pnobjqsalrdkckzfihvtxywomv
pnebjqsalridckzfihvtxywfmu
pnhbjqsaludgckyfihvtxywomu
pnetjqsaprdgykzfihvtxywomu
wnebjqsalrdvcfzfihvtxywomu
pnetjqsalrdmckwfihvtxywomu
pnebjysalrdgcszfihvtxnwomu
pnebjqsrlrdgckzfihvtxywkhu
pnubjqsplrdgcjzfihvtxywomu
pnebjqsalrdzckzficjtxywomu
pnebjqsalregckzfinvtxywoku
pnebjqsalrcgckyfivvtxywomu
pyenjqsalrdgckzfihvnxywomu
prebjqsalrdnckzfihvtxysomg
pnebjnsalrdgchzfihvaxywomu
pnebjqsalrdgckzfihxagywomu
pnebjqsalrdgckzvihvtoywoml
pnebjqsilrdgckzfihvtfywgmu
pnebjqmalrdgckzfihvtvawomu
pnebqqsalrdgckzfiuvtfywomu
pneqjqsalrdgckzfihvqxywomi
pnebjesalrsgckzfihvtxywmmu
znebjqsblrdgckzfihvlxywomu
pnebjqsalrdgckzfuhvtlyworu
pnebjqsylrdgckzfihvqxpwomu
onebjqsalfdgckifihvtxywomu
pnebjusalrdgckzfihvtxywyml
pnebjssflrdgckzfigvtxywomu
pnebjfsdzrdgckzfihvtxywomu
pnebjqsalrdgcktfihvixywocu
gnebjqnaqrdgckzfihvtxywomu
pnebjqsaqrugckzfihhtxywomu
pnebjqsxlrdgckzfihvtxlwosu
pnebjzsalrdgckzmihvtxywovu
pnebgqsalrdgckzfizvtxyjomu
pnebjqsmlrdgckzfihvtxywsmi
pnebjqsakmdgckzjihvtxywomu
pnebjqdglrdgckvfihvtxywomu
pnebmhsalrdgckxfihvtxywomu
pneejqsalrdlckzfihvnxywomu
bnebjqsalmdgckzfihvfxywomu
bnebjnsalrdgcizfihvtxywomu
pnebjqsalhdgcdzfihvbxywomu
pnebjqsjlrdgckzfihvgiywomu
pnebjisalrdgckzfihvtxywqmi
pdebjqsalrdickzfihhtxywomu
pnebjqsalrdkckzfihvjeywomu
pneyjqsalrqgckzfihvtxywohu
pnebjqsalrdgckcfihvtxjlomu
plebqwsalrdgckzfihvtxywomu
pnebjqlalrdgckzfihetxynomu
sngbjqsalrdgckzfihvmxywomu", "\n", "", X).

