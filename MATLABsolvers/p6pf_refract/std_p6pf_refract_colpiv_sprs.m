% Input: coefficient matrix C of size 4x27

% Monomial vector: [w*x^2*y*z, w*y^2*z*x, x*z^3*w, y*z^3*w, y*x^2*w, x^3*y, w*x*y^2, y^3*x, x*z^2*w, z^2*x^2, z^2*y*w, z^2*y*x, y^2*z^2, z^4, z*x*w, z*x^2, z*y*w, z*y^2, z^3, x*w, x^2, y*w, y*x, y^2, z^2, z, 1]

function [w, x, y, z] = std_p6pf_refract_colpiv_sprs(C)

    i_dx = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 21, 21, 21, 21, 21, 21, 22, 22, 22, 22, 22, 22, 23, 23, 23, 23, 23, 23, 24, 24, 24, 24, 24, 24, 25, 25, 25, 25, 25, 25, 26, 26, 26, 26, 26, 26, 27, 27, 27, 27, 27, 27, 28, 28, 28, 28, 28, 28, 29, 29, 29, 29, 29, 29, 30, 30, 30, 30, 30, 30, 31, 31, 31, 31, 31, 31, 32, 32, 32, 32, 32, 32, 33, 33, 33, 33, 33, 33, 34, 34, 34, 34, 34, 34, 35, 35, 35, 35, 35, 35, 36, 36, 36, 36, 36, 36, 37, 37, 37, 37, 37, 37, 38, 38, 38, 38, 38, 38, 39, 39, 39, 39, 39, 39, 40, 40, 40, 40, 40, 40, 41, 41, 41, 41, 41, 41, 42, 42, 42, 42, 42, 42, 43, 43, 43, 43, 43, 43, 44, 44, 44, 44, 44, 44, 45, 45, 45, 45, 45, 45, 46, 46, 46, 46, 46, 46, 47, 47, 47, 47, 47, 47, 48, 48, 48, 48, 48, 48, 49, 49, 49, 49, 49, 49, 50, 50, 50, 50, 50, 50, 51, 51, 51, 51, 51, 51, 52, 52, 52, 52, 52, 52, 53, 53, 53, 53, 53, 53, 54, 54, 54, 54, 54, 54, 55, 55, 55, 55, 55, 55, 56, 56, 56, 56, 56, 56, 57, 57, 57, 57, 57, 58, 58, 58, 58, 58, 58, 59, 59, 59, 59, 59, 59, 60, 60, 60, 60, 60, 60, 61, 61, 61, 61, 61, 61, 62, 62, 62, 62, 62, 62, 63, 63, 63, 63, 63, 63, 64, 64, 64, 64, 64, 64, 65, 65, 65, 65, 65, 65, 66, 66, 66, 66, 66, 66, 67, 67, 67, 67, 67, 67, 68, 68, 68, 68, 68, 68, 69, 69, 69, 69, 69, 69, 70, 70, 70, 70, 70, 70, 71, 71, 71, 71, 71, 71, 72, 72, 72, 72, 72, 72, 73, 73, 73, 73, 73, 73, 74, 74, 74, 74, 74, 74, 75, 75, 75, 75, 75, 75, 76, 76, 76, 76, 76, 76, 77, 77, 77, 77, 77, 77, 78, 78, 78, 78, 78, 78, 79, 79, 79, 79, 79, 79, 80, 80, 80, 80, 80, 80, 81, 81, 81, 81, 81, 81, 82, 82, 82, 82, 82, 82, 83, 83, 83, 83, 83, 83, 84, 84, 84, 84, 84, 84, 85, 85, 85, 85, 85, 85, 86, 86, 86, 86, 86, 86, 87, 87, 87, 87, 87, 87, 88, 88, 88, 88, 88, 88, 89, 89, 89, 89, 89, 89, 90, 90, 90, 90, 90, 90, 91, 91, 91, 91, 91, 91, 92, 92, 92, 92, 92, 92, 93, 93, 93, 93, 93, 93, 94, 94, 94, 94, 94, 94, 95, 95, 95, 95, 95, 95, 96, 96, 96, 96, 96, 96, 97, 97, 97, 97, 97, 97, 98, 98, 98, 98, 98, 98, 99, 99, 99, 99, 99, 99, 100, 100, 100, 100, 100, 100, 101, 101, 101, 101, 101, 101, 102, 102, 102, 102, 102, 102, 103, 103, 103, 103, 103, 103, 104, 104, 104, 104, 104, 104, 105, 105, 105, 105, 105, 105, 106, 106, 106, 106, 106, 106, 107, 107, 107, 107, 107, 107, 108, 108, 108, 108, 108, 108, 109, 109, 109, 109, 109, 109, 110, 110, 110, 110, 110, 110, 111, 111, 111, 111, 111, 111, 112, 112, 112, 112, 112, 112, 113, 113, 113, 113, 113, 113, 114, 114, 114, 114, 114, 114, 115, 115, 115, 115, 115, 115, 116, 116, 116, 116, 116, 116, 117, 117, 117, 117, 117, 117, 118, 118, 118, 118, 118, 118, 119, 119, 119, 119, 119, 119, 120, 120, 120, 120, 120, 120, 121, 121, 121, 121, 121, 121, 122, 122, 122, 122, 122, 122, 123, 123, 123, 123, 123, 123, 124, 124, 124, 124, 124, 124, 125, 125, 125, 125, 125, 125, 126, 126, 126, 126, 126, 126];
    j_dx = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 15, 16, 17, 19, 24, 25, 34, 36, 37, 44, 57, 84, 85, 110, 131, 5, 6, 8, 9, 12, 13, 15, 16, 17, 19, 24, 25, 30, 31, 38, 42, 44, 46, 57, 85, 91, 99, 100, 102, 131, 145, 12, 13, 15, 16, 21, 22, 24, 25, 30, 31, 32, 33, 50, 54, 57, 70, 84, 85, 91, 99, 102, 110, 121, 123, 145, 154, 21, 22, 24, 25, 28, 29, 30, 31, 32, 33, 62, 66, 70, 72, 99, 100, 102, 110, 123, 131, 135, 137, 154, 158, 34, 35, 36, 37, 38, 39, 40, 43, 44, 45, 46, 47, 48, 49, 57, 58, 60, 61, 69, 84, 99, 100, 101, 103, 132, 146, 38, 40, 44, 46, 50, 51, 52, 55, 57, 58, 59, 60, 61, 69, 70, 71, 84, 99, 100, 103, 111, 121, 122, 124, 146, 155, 50, 52, 57, 62, 63, 64, 67, 69, 70, 71, 72, 73, 84, 99, 100, 101, 103, 111, 121, 124, 132, 135, 136, 138, 155, 159, 7, 10, 14, 17, 18, 20, 26, 27, 35, 37, 40, 41, 42, 46, 47, 48, 59, 84, 85, 100, 101, 102, 103, 104, 133, 147, 17, 23, 26, 27, 40, 42, 46, 52, 53, 54, 59, 60, 84, 85, 100, 101, 102, 104, 112, 121, 122, 123, 124, 125, 147, 156, 52, 54, 64, 65, 66, 68, 84, 85, 100, 101, 102, 103, 104, 112, 121, 122, 123, 125, 133, 135, 136, 137, 138, 139, 156, 160, 74, 75, 76, 77, 78, 79, 80, 83, 86, 87, 88, 89, 90, 92, 105, 106, 107, 109, 113, 126, 127, 128, 129, 130, 148, 157, 78, 80, 86, 88, 93, 94, 95, 98, 105, 106, 107, 108, 109, 113, 126, 127, 128, 130, 134, 140, 141, 142, 143, 144, 157, 161, 93, 95, 105, 107, 114, 115, 116, 119, 126, 127, 128, 129, 130, 134, 140, 141, 142, 144, 148, 149, 150, 151, 152, 153, 161, 162, 140, 151, 152, 157, 161, 162, 78, 95, 96, 108, 129, 143, 70, 135, 136, 146, 155, 159, 126, 142, 143, 148, 157, 161, 121, 137, 138, 147, 156, 160, 32, 135, 145, 154, 158, 57, 100, 101, 111, 132, 146, 52, 66, 67, 103, 124, 138, 84, 102, 103, 112, 133, 147, 93, 116, 117, 129, 143, 152, 8, 16, 19, 46, 91, 110, 15, 25, 84, 91, 110, 131, 44, 59, 61, 84, 111, 132, 27, 46, 60, 85, 112, 133, 74, 80, 81, 89, 108, 129, 21, 29, 64, 100, 121, 135, 105, 128, 129, 134, 148, 157, 95, 118, 119, 130, 144, 153, 75, 82, 83, 90, 109, 130, 76, 88, 89, 92, 113, 134, 86, 107, 108, 113, 134, 148, 99, 121, 122, 132, 146, 155, 24, 31, 100, 110, 131, 145, 30, 33, 121, 131, 145, 154, 100, 123, 124, 133, 147, 156, 80, 97, 98, 109, 130, 144, 56, 93, 94, 106, 127, 141, 50, 64, 65, 101, 122, 136, 38, 52, 53, 59, 101, 122, 5, 13, 40, 46, 84, 100, 12, 22, 52, 84, 100, 121, 1, 6, 35, 37, 46, 84, 3, 9, 11, 19, 37, 91, 17, 20, 27, 37, 48, 112, 34, 40, 41, 47, 59, 101, 36, 46, 47, 49, 61, 111, 35, 42, 43, 48, 60, 103, 40, 54, 55, 60, 103, 124, 142, 149, 152, 157, 161, 162, 80, 93, 96, 108, 129, 143, 72, 121, 136, 146, 155, 159, 128, 140, 143, 148, 157, 161, 123, 135, 138, 147, 156, 160, 33, 135, 145, 154, 158, 84, 99, 101, 111, 132, 146, 54, 64, 67, 103, 124, 138, 85, 100, 103, 112, 133, 147, 95, 114, 117, 129, 143, 152, 9, 15, 19, 46, 91, 110, 16, 24, 84, 91, 110, 131, 46, 57, 59, 61, 111, 132, 17, 27, 60, 84, 112, 133, 75, 78, 81, 89, 108, 129, 22, 28, 64, 100, 121, 135, 107, 126, 129, 134, 148, 157, 97, 116, 119, 130, 144, 153, 77, 86, 89, 92, 113, 134, 88, 105, 108, 113, 134, 148, 70, 100, 122, 132, 146, 155, 25, 30, 100, 110, 131, 145, 31, 32, 121, 131, 145, 154, 102, 121, 124, 133, 147, 156, 82, 95, 98, 109, 130, 144, 56, 74, 79, 87, 106, 127, 52, 62, 65, 101, 122, 136, 40, 50, 53, 59, 101, 122, 6, 12, 40, 46, 84, 100, 13, 21, 52, 84, 100, 121, 2, 5, 35, 37, 46, 84, 4, 8, 11, 19, 37, 91, 10, 20, 27, 46, 48, 112, 35, 38, 41, 47, 59, 101, 37, 44, 47, 49, 61, 111, 7, 40, 43, 48, 60, 103, 42, 52, 55, 60, 103, 124, 150, 152, 153, 157, 161, 162, 94, 96, 98, 108, 129, 143, 73, 136, 138, 146, 155, 159, 141, 143, 144, 148, 157, 161, 136, 138, 139, 147, 156, 160, 72, 135, 137, 145, 154, 158, 69, 101, 103, 111, 132, 146, 65, 67, 68, 103, 124, 138, 101, 103, 104, 112, 133, 147, 114, 116, 118, 128, 142, 151, 115, 117, 119, 129, 143, 152, 17, 19, 44, 46, 91, 110, 57, 84, 85, 91, 110, 131, 58, 59, 60, 61, 111, 132, 26, 27, 59, 60, 112, 133, 78, 80, 82, 88, 107, 128, 79, 81, 83, 89, 108, 129, 62, 64, 66, 100, 121, 135, 127, 129, 130, 134, 148, 157, 117, 119, 120, 130, 144, 153, 93, 95, 97, 107, 128, 142, 87, 89, 90, 92, 113, 134, 106, 108, 109, 113, 134, 148, 71, 122, 124, 132, 146, 155, 99, 100, 102, 110, 131, 145, 70, 121, 123, 131, 145, 154, 122, 124, 125, 133, 147, 156, 63, 65, 67, 101, 122, 136, 51, 53, 55, 59, 101, 122, 38, 40, 42, 46, 84, 100, 50, 52, 54, 84, 100, 121, 7, 34, 35, 37, 46, 84, 10, 11, 19, 36, 37, 91, 18, 20, 27, 47, 48, 112, 39, 41, 43, 47, 59, 101, 45, 47, 48, 49, 61, 111, 14, 41, 43, 48, 60, 103, 23, 53, 55, 60, 103, 124];
    C_dx = [1, 5, 9, 13, 17, 25, 29, 33, 41, 49, 53, 57, 65, 69, 73, 77, 85, 21, 37, 45, 61, 81, 89, 93, 101, 105, 1, 5, 9, 13, 17, 25, 33, 41, 49, 53, 57, 65, 77, 85, 21, 29, 37, 45, 61, 69, 73, 81, 89, 93, 101, 105, 1, 5, 9, 13, 17, 25, 33, 41, 57, 65, 77, 85, 21, 29, 37, 81, 45, 49, 53, 61, 69, 73, 89, 93, 101, 105, 1, 5, 9, 13, 17, 25, 33, 41, 57, 65, 21, 29, 61, 81, 37, 45, 49, 53, 69, 73, 89, 93, 101, 105, 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 69, 73, 81, 65, 77, 85, 89, 93, 101, 105, 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 45, 49, 53, 61, 77, 81, 41, 57, 65, 69, 73, 85, 89, 93, 101, 105, 1, 5, 9, 17, 21, 25, 29, 37, 57, 61, 77, 81, 13, 33, 41, 45, 49, 53, 65, 69, 73, 85, 89, 93, 101, 105, 5, 13, 29, 41, 49, 53, 69, 73, 1, 9, 17, 21, 25, 33, 37, 45, 61, 57, 65, 77, 81, 85, 89, 93, 101, 105, 13, 29, 49, 53, 1, 5, 9, 17, 21, 25, 37, 45, 33, 41, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 101, 105, 1, 5, 17, 21, 25, 29, 9, 13, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 101, 105, 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 101, 105, 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 101, 105, 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93, 101, 105, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 98, 90, 102, 106, 58, 86, 90, 98, 102, 106, 58, 90, 98, 86, 102, 106, 98, 58, 90, 86, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 98, 102, 90, 106, 86, 98, 102, 58, 90, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 58, 86, 90, 98, 102, 106, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 79, 67, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 99, 91, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 99, 91, 79, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 79, 67, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 79, 67, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 99, 103, 91, 107, 67, 99, 103, 79, 91, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 67, 79, 91, 99, 103, 107, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 96, 100, 84, 92, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 96, 100, 84, 92, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 96, 84, 92, 100, 104, 108, 96, 100, 104, 84, 92, 108, 96, 100, 104, 84, 92, 108, 84, 92, 96, 100, 104, 108, 84, 92, 96, 100, 104, 108, 96, 84, 92, 100, 104, 108, 96, 84, 92, 100, 104, 108];
    M = sparse(i_dx,j_dx,C(C_dx),126,162);

    [L,~,Pi] = lu(M(:,1:33));
    Pi = Pi';
    M = [Pi*L Pi(:,34:end)]\M(:,34:end);
    M = full(M(34:end,:));

    [L,UR,Pi] = lu(M(:,1:40));
    Pi = Pi';
    M = [Pi*L Pi(:,41:end)]\M(:,41:end);
    MP = M(1:40,:);
    NP = M(41:end,:);

    [Q,U,Pi] = qr(NP(:,1:end-5));
    A = UR\[MP(:,1:end-5)*Pi MP(:,end-4:end)];
    B = U(:,1:53)\[U(:,54:end) Q'*NP(:,end-4:end)];
    M = [-A(:,end-35:end)+A(:,1:end-36)*B; -B];

    xP = [90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 1, 2, 100, 101, 102, 103, 104, 3, 105, 106, 107, 108, 109, 110, 111, 112, 5, 6, 7, 8, 10, 113, 114, 11, 115, 116, 13, 14, 16, 117, 118, 119, 120, 121, 122, 123, 124, 20, 21, 22, 23, 25, 26, 125, 27, 28, 30, 32, 33, 35, 38, 41, 42, 43, 44, 46, 126, 127, 48, 49, 51, 53, 54, 56, 59, 128, 129, 62, 63, 65, 67, 68, 70, 73, 76, 77, 79, 82, 86];
    P1 = [(1:84)*Pi 85:89];
    T = getT(M,[90:129 P1(1:end-36)],P1(end-35:end),xP);

    [V,~] = eig(T);
    sol = V([32, 33, 34, 35],:)./(ones(4,1)*V(36,:));

    if(find(isnan( sol(:) )) > 0)
        w = zeros(1,0);
        x = zeros(1,0);
        y = zeros(1,0);
        z = zeros(1,0);
    else
        %I = find(not(imag( sol(1,:) )));
        w = sol(1,:);
        x = sol(2,:);
        y = sol(3,:);
        z = sol(4,:);
    end

end