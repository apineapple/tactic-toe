
#include <iostream>
#include <vector>
#include <queue>
#include <unordered_set>
#include <stack>
#include <ctime>
#include <unordered_set>
#include <unordered_map>
#include <deque>


using namespace std;


vector<vector<vector<int>>> big = {
    {{2,2},{3,3}},
	{{4,3},{3,4},{3,5}},
	{{3,2},{4,2},{5,1},{6,3}}, // just added
	{{2,2},{1,2},{2,1},{4,4}},
	{{3,3},{3,4},{4,4}},
	{{6,4},{3,4},{4,3},{4,4}},
	{{2,4},{2,5},{2,6},{3,6}},
	{{3,3},{3,4},{4,3},{4,4}},
	{{3,3},{4,4},{6,4},{4,5},{5,6}},
	{{3,3},{3,4},{3,5},{4,3}},
	{{4,2},{3,3},{3,4},{2,5}},
	{{5,2,1},{3,3},{4,3},{3,4},{2,5},{5,5}},
	{{1,1},{2,1},{4,2},{5,4},{4,5},{2,4}},
	{{1,5},{2,5},{3,5},{2,6},{3,6}},
	{{1,1},{3,1},{2,2},{4,3},{5,4},{2,4}},
	{{2,5},{3,4},{4,4},{5,5}},
	{{3,3},{3,4},{4,4},{4,5}},
	{{2,2},{2,3},{2,4},{3,3},{4,3,1}},
	{{6,4},{7,4},{6,3},{4,3},{2,2}},
	{{3,3},{3,4},{3,5},{4,3}},
	{{1,2},{2,2},{1,3},{2,3},{3,3},{5,3},{4,4},{5,4,1},{5,5,1}},
	{{1,1},{5,1},{1,2},{2,2},{4,2},{5,2}},
	{{1,1},{4,1},{1,2},{2,2},{4,2},{5,2}},
	{{1,1},{1,2},{2,2},{5,1},{5,2},{4,2}},
	{{1,5},{2,5},{3,5},{2,6},{3,6}},
	{{2,4},{3,3},{5,3},{5,1},{5,4}},
	{{4,1},{3,2},{4,2},{3,3},{5,3},{6,4}},
	{{4,1},{3,2},{4,2},{1,3},{3,3},{2,5},{4,5},{6,5}},
	{{3,3},{4,3},{3,4},{3,5}}};


vector<vector<vector<int>>> bigg =  {
    {{4,4}},
	{{4,5}},
	{{4,3}}, // just added
	{{5,5}},
	{{1,5}},
	{{4,6}},
	{{5,6}},
	{{6,5}},
	{{3,6},{4,6}},
	{{2,3},{2,5},{4,5}},
	{{2,6},{4,1}},
	{{5,1}},
	{{1,3}},
	{{6,4}},
	{{1,4}},
	{{5,1}},
	{{6,1}},
	{{6,3}},
	{{1,1}},
	{{2,6}},
	{{6,6}},
	{{4,6}},
	{{3,6}},
 	{{6,1}}, //made by ben
	{{5,1}},
	{{2,2}},
	{{1,2},{5,1},{4,3}},
	{{1,2},{5,1},{4,3}},
	{{5,1}}
};

template<>
struct std::hash<vector<vector<int>>>
{
  std::size_t operator()(const vector<vector<int>>& k) const
  {
    using std::size_t;

    int h = 0;
    for (int i = 0; i < k.size(); i++) {
        h += k[i][0];
        h *= i;
        h += k[i][1];
        h *= i;
    }

    return h;
  }
};


// Define board and goal configurations
vector<vector<int>> b;
vector<vector<int>> g;


clock_t dtime;

// Define visited states and other variables
unordered_map<vector<vector<int>>, vector<vector<int>>> v;
//int t = 0;
//int tm = 0;
//int step = 0;

// Function prototypes
vector<vector<vector<int>>> search(int mode);
vector<vector<vector<int>>> getnbors(vector<vector<int>>& board);
vector<vector<int>> findmoves(vector<vector<int>>& board, vector<int>& block);
bool contains(vector<vector<int>>& tbl, vector<int> elmnt);
bool inbounds(int x, int y);
bool won(vector<vector<int>>& board);
bool isvisited(vector<vector<int>>& board);
bool equal(vector<vector<int>>& tbl1, vector<vector<int>>& tbl2);
vector<vector<vector<int>>> findpath(unordered_map<vector<vector<int>>, vector<vector<int>>>& vp, vector<vector<int>>& final);
void printpath(vector<vector<vector<int>>> path);

int main(int argc, char *argv[]) {

    int mode;

    if (!(argc==2)) {
        cout << "Incorrect commandline usage. ./search [mode 0 for bfs, 1 for dfs]." << endl;
        return 1;
    } else if (!(argv[1][0]=='0' || argv[1][0] == '1')) {
        cout << "Incorrect commandline usage. ./search [mode 0 for bfs, 1 for dfs]." << endl;
        return 1;
    } else {
        mode = stoi(argv[1]);
    }

    for (int i=0; i < big.size(); i++) {
        b=big[i];
        g=bigg[i];

        dtime=clock();
        vector<vector<vector<int>>> path = search(mode); // 0 for BFS
        dtime=clock()-dtime;

        if (!path.empty()) {
            float tm = dtime/CLOCKS_PER_SEC;
            cout << "level " << i+1 <<" found after " << tm << ". visited " << v.size() << endl;
        } else {
            cout <<"level " << i+1<< " not found after " << dtime << " seconds." << endl;
        }

        if (i==20) {
            printpath(path);
        }


    }


    return 0;
}

// BFS or DFS search
vector<vector<vector<int>>> search(int mode) {
    deque<pair<vector<vector<int>>, vector<vector<int>>>> q;
    vector<vector<int>> curr = b;
    vector<vector<int>> prev = {};
    vector<vector<vector<int>>> nbors;

    v.clear();

    q.push_front({curr, {}});

    while (!q.empty()) {
        if (mode == 0){
            curr = q.front().first;
            prev = q.front().second;
            q.pop_front();
        } else {
            curr = q.back().first;
            prev = q.back().second;
            q.pop_back();
        }


        if (!isvisited(curr)) {
            v[curr] = prev;

            if (won(curr)) {
                break;
            }

            nbors = getnbors(curr);

            for (auto& nbor : nbors) {
                if (!isvisited(nbor)) {
                        q.push_back(std::make_pair(nbor, curr));
                }
            }
        }
    }

    if (won(curr)) {
        return findpath(v, curr);
    } else {
        return {};
    }
}

// Get neighboring boards from a single move
vector<vector<vector<int>>> getnbors(vector<vector<int>>& board) {
    vector<vector<vector<int>>> toreturn;
    vector<vector<int>> temp;
    vector<vector<int>> moves;

    for (int i = 0; i < board.size(); i++) {
        vector<int> block = {board[i][0],board[i][1]};
        if (board[i].size() > 2) {
            block.push_back(board[i][2]);
        }
        if (block.size() == 2) {
            moves = findmoves(board, block);
        } else {
            moves = {};
        }
        for (auto& move : moves) {
            temp = board;
            temp[i][0] = move[0];
            temp[i][1] = move[1];
            toreturn.push_back(temp);
        }
    }

    return toreturn;
}

// Find possible moves for a single block on a board
vector<vector<int>> findmoves(vector<vector<int>>& board, vector<int>& block) {
    int x = block[0];
    int y = block[1];
    vector<vector<int>> blockmoves;

    //Top
    if(inbounds(x,y-1) && !contains(board, {x,y-1})) {
        if(contains(board,{x,y+1}) || (contains(board,{x-1,y+1}) && contains(board,{x+1,y+1}))) {
            blockmoves.push_back({x,y-1});
        }        
    }

    //Top Right
    if(inbounds(x+1,y-1) && !contains(board, {x+1,y-1})) {
        if(contains(board,{x-1,y+1}) || (contains(board,{x-1,y}) && contains(board,{x,y+1}))) {
            blockmoves.push_back({x+1,y-1});
        }        
    }

    //Top Left
    if(inbounds(x-1,y-1) && !contains(board, {x-1,y-1})) {
        if(contains(board,{x+1,y+1}) || (contains(board,{x+1,y}) && contains(board,{x,y+1}))) {
            blockmoves.push_back({x-1,y-1});
        }        
    }

    //Left
    if(inbounds(x-1,y) && !contains(board, {x-1,y})) {
        if(contains(board,{x+1,y}) || (contains(board,{x+1,y+1}) && contains(board,{x+1,y-1}))) {
            blockmoves.push_back({x-1,y});
        }        
    }

    //Right
    if(inbounds(x+1,y) && !contains(board, {x+1,y})) {
        if(contains(board,{x-1,y}) || (contains(board,{x-1,y-1}) && contains(board,{x-1,y+1}))) {
            blockmoves.push_back({x+1,y});
        }        
    }

    //Bottom
    if(inbounds(x,y+1) && !contains(board, {x,y+1})) {
        if(contains(board,{x,y-1}) || (contains(board,{x+1,y-1}) && contains(board,{x-1,y-1}))) {
            blockmoves.push_back({x,y+1});
        }        
    }

    //Bottom Right
    if(inbounds(x+1,y+1) && !contains(board, {x+1,y+1})) {
        if(contains(board,{x-1,y-1}) || (contains(board,{x,y-1}) && contains(board,{x-1,y}))) {
            blockmoves.push_back({x+1,y+1});
        }        
    }

    //Bottom Left
    if(inbounds(x-1,y+1) && !contains(board, {x-1,y+1})) {
        if(contains(board,{x+1,y-1}) || (contains(board,{x,y-1}) && contains(board,{x+1,y}))) {
            blockmoves.push_back({x-1,y+1});
        }        
    }

    return blockmoves;
}

// Other helper functions (contains, inbounds, won, setvisited, isvisited, equal, findpath)
// Implement these based on the Lua equivalents provided
bool contains(vector<vector<int>>& tbl, vector<int> elmnt) {
    for(int i=0;i<tbl.size();i++) {
        if(tbl[i][0]==elmnt[0] && tbl[i][1]==elmnt[1]) {
            return true;
        }
    }
    return false;
}

bool inbounds(int x, int y) {
 if(x>6 || x<1 || y>6 || y<1) {
    return false;
 } else {
    return true;
 }
}

bool won(vector<vector<int>>& board) {
    int goalscovered = 0;

    for(auto target : g) {
        if (contains(board,target)) {
            goalscovered++;
        }
    }
    if(goalscovered==g.size()) {
        return true;
    } else {
        return false;
    }
}

bool isvisited(vector<vector<int>>& board) {
    if (v.count(board)) {
        return true;
    } else {
        return false;
    }
}

bool equal(vector<vector<int>>& tbl1, vector<vector<int>>& tbl2) {
    if(tbl1.size() != tbl2.size()) {
        return false;
    } else {
        for (int i=0; i < tbl1.size(); i++) {
            if (!contains(tbl1,tbl2[i])) {
                return false;
            }
        }
    }
    return true;
}

vector<vector<vector<int>>> findpath(unordered_map<vector<vector<int>>, vector<vector<int>>>& vp, vector<vector<int>>& final) {
    vector<vector<vector<int>>> toreturn;
    stack<vector<vector<int>>> path;
    auto curr = final;
    auto prev = vp[final];

    while (!prev.empty()) {
        path.push(curr);
        curr=prev;
        prev=vp[curr];
    }

    toreturn.push_back(curr);

    while (!path.empty()) {
        toreturn.push_back(path.top());
        path.pop();
    }

    return toreturn;
}

void printpath(vector<vector<vector<int>>> path) {
    cout << "{";

    for(auto& board : path) {
        cout << "{";

        for(auto& block: board) {
            cout << "{";
            cout << block[0] <<","<<block[1];
            if(block.size()==3) {
                cout << ","<<block[2];
            }
            cout << "},";
        }

        cout << "},";
    }

    cout << "}" << endl;

    return;
}