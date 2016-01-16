/*
 * scr_string_split(string, delimiter, limit)
 * 
 * argument[0]: String to parse
 * argument[1]: Character to split the string
 * argument[2]: Limit of splits (0 for no limits)
 */
 
var str = argument[0];
var char = argument[1];
var limit = argument[2];

var ret;
ret[0] = 1;

var len = string_length(str);
var word = '';

for (var i=1;i<=len;i++){
    var s_chr = string_char_at(str, i);
    if (s_chr == char){
        ret[ret[0]++] = word;
        word = '';
        
        if (limit > 0 && ret[0] == limit + 1){
            return ret;
        }
    }else{
        word += s_chr;
    }
}

if (word != ""){
    ret[ret[0]++] = word;
}

return ret;
