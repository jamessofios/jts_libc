// intmax_t jts_strcmp(const char *str, const char *str);
.global jts_strcmp
.text

/*
%rdi = str1
%rsi = str2
%rax is:
return 0 if strings are equal
return >0 if str2 is less than str1
return <0 if str1 is less than str2
*/

jts_strcmp:
