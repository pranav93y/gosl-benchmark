// Copyright 2016 The Gosl Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build ignore

package main

import (
	//"github.com/cpmech/gosl/io"
	"github.com/cpmech/gosl/la"
	"math/rand"
	"time"
    "os"
    "fmt"
)


func random(min, max int) int {
	rand.Seed(time.Now().Unix())
	return rand.Intn(max - min) + min
}

func main() {


	arg := os.Args[1]
    var div int
    n, _ := fmt.Sscanf(arg, "%d", &div)
    //div := strconv.Atoi(arg[0])
    if n != 1 {
      fmt.Printf("Incorrect input...")
      return
    }

    fmt.Printf("input: %d\n", div)


	// given the following matrix of complex numbers:
	//      _                                                  _
	//     |  19.73    12.11-i      5i        0          0      |
	//     |  -0.51i   32.3+7i    23.07       i          0      |
	// A = |    0      -0.51i    70+7.3i     3.95    19+31.83i  |
	//     |    0        0        1+1.1i    50.17      45.51    |
	//     |_   0        0          0      -9.351i       55    _|
	//
	// and the following vector:
	//      _                  _
	//     |    77.38+8.82i     |
	//     |   157.48+19.8i     |
	// b = |  1175.62+20.69i    |
	//     |   912.12-801.75i   |
	//     |_     550-1060.4i  _|
	//
	// solve:
	//         A.x = b
	//
	// the solution is:
	//      _            _
	//     |     3.3-i    |
	//     |    1+0.17i   |
	// x = |      5.5     |
	//     |       9      |
	//     |_  10-17.75i _|

	// input matrix in Complex Triplet format
	A := new(la.TripletC)
	A.Init(5, 5, 16) // 5 x 5 matrix with 16 non-zeros
 
	//var b []float64

	// r1 := 0.0
	// r2 := 0.0
	// //c1 := 0
	// //c2 := 0

	// for i := 0; i < 10; i++ {
	// 	for j := 0; j < 10; j++{
	// 		r1 = float64(random(0, 99999));
	// 		//c1 = random(0, 99999)
	// 		//c2 = random(0, 99999)
	// 		A.Put(i, j, r1)
	// 	}
	// 	r2 = float64(random(0, 99999))
	// 	b = append(b, r2)
	// }


	// first column
	A.Put(0, 0, 19.73+0.00i)
	A.Put(1, 0, +0.00-0.51i)

	// second column
	A.Put(0, 1, 12.11-1.00i)
	A.Put(1, 1, 32.30+7.00i)
	A.Put(2, 1, +0.00-0.51i)

	// third column
	A.Put(0, 2, +0.00+5.0i)
	A.Put(1, 2, 23.07+0.0i)
	A.Put(2, 2, 70.00+7.3i)
	A.Put(3, 2, +1.00+1.1i)

	// fourth column
	A.Put(1, 3, +0.00+1.000i)
	A.Put(2, 3, +3.95+0.000i)
	A.Put(3, 3, 50.17+0.000i)
	A.Put(4, 3, +0.00-9.351i)

	// fifth column
	A.Put(2, 4, 19.00+31.83i)
	A.Put(3, 4, 45.51+0.00i)
	A.Put(4, 4, 55.00+0.00i)

	// right-hand-side
	b := []complex128{
		+77.38 + 8.82i,
		+157.48 + 19.8i,
		1175.62 + 20.69i,
		+912.12 - 801.75i,
		+550.00 - 1060.4i,
	}

	// // solution
	// xCorrect := []complex128{
	// 	+3.3 - 1.00i,
	// 	+1.0 + 0.17i,
	// 	+5.5 + 0.00i,
	// 	+9.0 + 0.00i,
	// 	10.0 - 17.75i,
	// }

	// solve
	
	for j :=0; j < 10000/div; j++{
		for i := 0; i < 3000; i++ {
			la.SpSolveC(A, b)	
		}
	}
	//x := la.SpSolveC(A, b)

	// output
	//io.Pf("x = %.6f\n\n", x)
}
