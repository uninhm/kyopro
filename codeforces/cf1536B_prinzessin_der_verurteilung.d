// Vicfred
// https://codeforces.com/contest/1536/problem/B
// brute force, constructive
import std.algorithm;
import std.container;
import std.conv;
import std.functional;
import std.stdio;

bool lexi(string a, string b) {
    if(a.length < b.length)
        return true;
    return a < b;
}

void main() {
    auto rbtree = new RedBlackTree!(string,lexi);
    for(char c = 'a'; c <= 'z'; ++c) {
        string one = [c];
        rbtree.insert(one);
        for(char d = 'a'; d <= 'z'; ++d) {
            string two = [c, d];
            rbtree.insert(two);
            for(char e = 'a'; e <= 'z'; ++e) {
                string three = [c, d, e];
                rbtree.insert(three);
            }
        }
    }

    int t;
    readf("%s\n", &t);

while(t--) {
    int n;
    readf("%s\n", &n);
    string s;
    readf("%s\n", &s);

    foreach(item; rbtree) {
        if(count(s, item) > 0) {
            continue;
        }
        item.writeln;
        break;
    }
}
}
