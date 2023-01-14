function M0 = getM0_red_177x233_colpiv()
    ix = [45 59 67 45 59 67 71 79 11 53 64 45 59 67 98 103 11 15 53 64 76 59 67 71 79 98 103 105 68 80 99 106 100 102 11 53 64 66 101 102 68 11 15 64 66 76 78 101 102 52 63 10 44 58 5 27 37 20 33 39 65 40 52 63 75 10 14 44 58 70 40 60 68 39 57 67 103 10 14 63 75 10 14 58 70 5 9 11 27 37 51 53 64 20 33 39 43 45 57 59 67 26 36 4 19 32 81 5 9 11 13 15 37 51 64 76 33 39 43 57 59 67 69 71 79 26 36 50 52 63 4 8 10 19 32 42 44 58 3 5 25 27 37 18 20 31 33 39 5 9 11 13 15 39 57 67 69 79 36 50 63 75 4 8 10 12 14 32 42 58 70 3 5 7 9 11 25 37 51 64 18 31 33 39 41 43 57 59 67 24 26 36 2 4 17 19 32 4 8 10 12 14 3 5 7 9 11 13 15 31 39 41 57 67 69 79 24 36 50 63 2 4 6 8 10 17 32 42 58 1 3 5 25 37 16 18 31 33 39 2 4 6 8 10 12 14 1 3 5 7 9 11 2 4 16 31 39 41 57 67 24 36 2 4 17 32 2 4 6 8 10 1 3 5 16 31 39 97 63 39 5 37 38 52 63 10 44 58 61 95 5 27 37 20 33 39 90 55 65 93 97 35 40 89 10 48 58 61 95 5 30 38 33 39 88 90 55 65 93 23 35 40 89 10 48 61 5 30 38 88 23 35 40 65 77 97 104 102 99 107 63 75 36 10 14 58 61 70 73 95 5 9 11 37 38 51 54 64 66 101 33 39 43 57 59 67 90 98 103 26 36 4 19 32 83 109 55 65 77 93 104 100 35 40 47 60 62 68 89 96 81 85 107 110 10 14 48 61 73 5 9 11 30 38 54 56 66 67 88 94 103 4 32 83 86 109 23 35 40 47 49 60 62 68 81 85 110 4 83 86 65 77 104 40 60 68 72 80 106 65 81 82 97 107 108 34 40 92 10 14 61 73 5 9 11 13 15 38 54 66 78 39 57 67 69 79 103 105 36 50 63 4 8 10 32 42 58 61 83 84 95 109 3 5 25 29 37 38 18 31 33 39 87 90 35 40 47 60 62 68 72 74 80 55 65 81 82 85 93 108 110 22 34 35 40 89 92 4 8 10 48 61 83 84 86 3 5 29 30 38 31 39 87 88 22 23 34 35 40 40 60 68 72 80 65 77 81 82 104 108 34 40 46 60 68 92 28 81 91 107 4 8 10 12 14 61 73 83 84 3 5 7 9 11 29 38 54 66 31 39 41 57 67 87 24 36 2 4 17 21 32 83 109 22 34 35 40 46 47 60 62 68 28 81 85 91 110 2 4 21 83 86 34 40 46 60 68 72 80 28 65 81 82 34 40 91 108 34 40 92 34 40 46 60 68 28 81 91 2 4 6 8 10 21 61 83 84 1 3 5 29 38 16 31 39 87 22 34 35 40 2 4 21 83];
    jx = [1 1 1 2 2 2 2 2 29 29 29 30 30 30 30 30 31 31 31 31 31 32 32 32 32 32 32 32 33 33 33 33 60 60 61 61 61 61 61 62 63 65 65 65 65 65 65 65 66 68 68 69 69 69 70 70 70 71 71 71 74 75 78 78 78 79 79 79 79 79 80 80 80 81 81 81 81 82 82 83 83 84 84 84 84 85 85 85 85 85 85 85 85 86 86 86 86 86 86 86 86 87 87 88 88 88 91 92 92 92 92 92 92 92 92 92 93 93 93 93 93 93 93 93 93 94 94 94 94 94 95 95 95 95 95 95 95 95 96 96 96 96 96 97 97 97 97 97 99 99 99 99 99 100 100 100 100 100 101 101 101 101 102 102 102 102 102 102 102 102 102 103 103 103 103 103 103 103 103 103 104 104 104 104 104 104 104 104 104 105 105 105 106 106 106 106 106 107 107 107 107 107 108 108 108 108 108 108 108 109 109 109 109 109 109 109 110 110 110 110 111 111 111 111 111 111 111 111 111 112 112 112 112 112 113 113 113 113 113 114 114 114 114 114 114 114 115 115 115 115 115 115 116 116 117 117 117 117 117 117 118 118 119 119 119 119 120 120 120 120 120 121 121 121 122 122 122 125 128 129 130 130 130 131 131 132 132 132 132 132 133 133 133 134 134 134 134 136 136 137 137 139 139 139 141 141 141 141 141 142 142 142 143 143 143 143 144 144 145 147 147 147 147 148 148 148 149 149 149 150 151 151 151 152 152 153 153 154 155 157 158 158 159 160 160 160 160 160 160 160 161 161 161 161 161 161 161 161 161 161 162 162 162 162 162 162 162 162 162 163 163 164 164 164 164 164 165 165 165 166 166 167 168 168 168 168 168 168 168 168 169 169 170 170 171 171 171 171 171 172 172 172 172 172 172 172 172 173 173 173 173 175 175 175 175 175 176 176 176 176 176 176 176 176 177 177 178 179 179 179 180 180 181 183 183 183 183 183 183 184 184 184 185 185 185 187 187 187 188 188 188 188 189 189 189 189 189 189 189 189 189 190 190 190 190 190 190 190 191 191 191 192 192 192 192 192 192 192 192 192 192 192 193 193 193 193 193 193 194 194 194 194 194 194 195 195 195 195 195 195 195 195 195 196 196 196 196 196 197 197 197 199 199 199 199 199 199 200 200 200 200 200 200 200 200 201 201 201 201 201 202 202 202 202 203 203 203 203 203 204 204 204 204 204 205 205 205 205 206 206 208 208 208 208 208 208 209 209 210 210 211 211 211 211 211 211 211 211 211 212 212 212 212 212 212 212 212 212 213 213 213 213 213 213 214 214 215 215 215 215 215 215 215 216 216 216 216 216 216 216 216 216 217 217 217 218 218 219 219 219 219 219 220 220 220 220 220 220 220 221 221 221 221 222 222 223 223 225 225 225 226 226 226 226 226 227 227 228 229 229 229 229 229 229 229 229 229 230 230 230 230 230 231 231 231 231 232 232 232 232 233 233 233 233];
    kx = [1 -1 1 -1 2 -3 1 -1 1 1 -1 1 -2 3 1 -1 -3 -1 -1 2 1 2 -6 1 -2 -1 2 1 -1 -1 -1 1 1 1 3 1 -2 -1 1 1 1 -6 -2 2 2 1 1 -1 -1 1 -1 1 1 -1 1 1 -1 1 -1 1 1 1 -1 2 1 -3 -1 -1 2 1 1 1 -1 1 1 -2 1 -1 -1 -1 -1 2 1 -1 -1 -3 -1 3 -1 2 1 1 -2 -1 2 -3 1 1 -1 -2 3 1 -1 1 1 -1 1 3 2 -6 1 -2 -1 -1 2 1 -1 3 -1 2 2 -6 1 1 -2 -1 2 1 1 -2 -3 -1 3 -1 2 1 1 -2 -1 3 1 1 -2 1 1 -1 -2 3 -1 -1 2 -1 1 -1 -1 2 -1 1 -1 -1 2 1 3 2 -6 1 -2 -1 -1 2 1 2 -6 1 -2 3 -1 2 1 -1 -1 2 2 -6 1 1 -2 -1 3 1 1 -2 -1 3 1 1 -2 -1 -1 2 -1 1 -1 3 -1 2 -3 1 -1 -1 3 -1 2 -3 1 -1 -1 2 1 -1 2 -6 1 -2 3 -1 2 1 -1 1 -2 3 1 -1 1 1 -2 -1 3 -1 3 -1 2 -3 1 -1 -1 2 -3 1 -1 1 1 -1 -1 2 -3 1 -1 1 1 -1 -1 2 1 -1 1 -2 1 -1 1 1 -1 1 1 -1 1 1 1 1 -2 1 1 1 -1 3 1 -2 -1 1 1 1 -1 1 -2 2 1 1 -1 1 1 -1 1 1 3 1 -1 -2 1 1 1 -1 -1 1 1 1 1 -1 1 1 -2 2 1 1 1 -1 1 1 -1 1 1 -1 1 1 1 -1 1 1 1 1 1 1 1 -6 -2 2 2 1 1 -1 -4 -2 6 1 1 1 1 -2 -2 1 2 -3 1 -1 -2 4 -1 1 -1 1 -1 3 1 -2 -1 1 -1 2 1 -1 1 1 2 -3 1 -1 -2 3 -1 1 -1 1 1 1 -3 -1 -1 2 1 -3 -1 3 -1 2 1 1 -2 1 -1 1 -1 3 -1 -2 1 1 -1 2 -3 1 1 -1 -2 3 -1 1 1 1 -1 1 -1 -1 -1 1 1 -3 1 -2 1 -1 1 1 1 -1 1 -1 1 1 2 1 -1 -1 3 2 -6 1 -2 -1 -1 2 1 1 1 -4 1 -2 1 1 1 1 -1 -6 -2 6 2 1 -2 -2 2 1 1 -1 -2 4 1 1 -1 -1 1 -2 -2 4 1 1 -1 3 -1 2 2 -6 1 1 -2 1 -2 2 1 -1 1 1 -1 1 -2 -2 4 1 1 -3 -1 3 1 -2 2 1 -1 -1 3 1 1 -2 -1 1 1 1 1 1 -1 -2 3 -1 -1 2 -1 1 2 1 -1 -1 1 -1 2 -3 1 -1 1 -1 1 -1 1 1 3 2 -6 1 -2 2 1 -1 -1 2 -6 1 -2 3 -1 2 1 -1 2 -3 1 -1 1 -1 1 -1 -2 6 1 1 -2 -2 1 -1 2 2 -6 1 1 -2 -1 3 1 -2 1 1 1 -1 3 1 -2 1 -1 3 -1 2 -3 1 -1 -1 -1 2 1 1 -1 -1 1 -1 1 1 1 -2 1 -1 1 1 -1 1 2 -6 1 -2 3 -1 -1 2 1 1 -2 3 1 -1 1 -2 2 1 1 -1 -1 2 -1 2 1 -1];
    M0 = sparse(ix,jx,kx,110,233);
end