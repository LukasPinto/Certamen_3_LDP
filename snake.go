package main

import (
    "flag"
    "fmt"
    "math/rand"
    "os"
    "os/signal"
    "syscall"
    "time"
)

func ctrl_c() {
    fmt.Print("\n\n[!] Saliendo.....\n")
}

// iterar sobre un array e imprimirlo
func show_board(board [][]int) {
    for _, i := range board {
        for _, j := range i {
:...skipping...
package main

import (
    "flag"
    "fmt"
    "math/rand"
    "os"
    "os/signal"
    "syscall"
    "time"
)

func ctrl_c() {
    fmt.Print("\n\n[!] Saliendo.....\n")
}

// iterar sobre un array e imprimirlo
func show_board(board [][]int) {
    for _, i := range board {
        for _, j := range i {
            fmt.Print(j, " ")
        }
        fmt.Println(" ")
    }
}

func generate_point(board [][]int, columns int, rows int) ([][]int, []int) {
    rand_y := rand.Intn(rows)
    rand_x := rand.Intn(columns)
    board[rand_y][rand_x] = -1
    point := make([]int, 2)
    point[0] = rand_y
    point[1] = rand_x
    return board, point
}

// generar serpiente, pero sin verificar si la posicion esta ocupada
func generate_snake(columns int, rows int) [][]int {
    rand_y := rand.Intn(rows)
    rand_x := rand.Intn(columns)
    snake := make([][]int, 1)
    for i := range snake {
        snake[i] = make([]int, 2)
    }
    snake[0][0] = rand_y
    snake[0][1] = rand_x
    return snake
}

func insert_snake(snake [][]int, board [][]int) [][]int {
    board[snake[0][0]][snake[0][1]] = 1
    return board
}

func swap_snake(snake [][]int, point []int) [][]int {
    aux := make([][]int, 0)
    aux = append(aux, point)

    for _, i := range snake {
        aux = append(aux, i)
    }

    aux = aux[:len(aux)-1]
    return aux
}

func add_tail(snake [][]int, point []int) [][]int {
    aux := make([][]int, 0)
    aux = append(aux, point)

    for _, i := range snake {
        aux = append(aux, i)
    }

    return aux
}

// se utiliza la distancia de manhatan para mover a la serpiente
func move_y(snake [][]int, board [][]int, point []int) [][]int {
    //para el eje y
    dest := make([]int, 0)

    snapshot_snake := make([][]int, 0)
    snapshot_snake = snake
    //mover cabeza de la serpiente
    if snake[0][0] > point[0] {
        dest = append(dest, snake[0][0]-1, snake[0][1])
        snake = swap_snake(snake, dest)
        //snake[0][0] = snake[0][0] - 1
    } else if snake[0][0] < point[0] {
        dest = append(dest, snake[0][0]+1, snake[0][1])
        snake = swap_snake(snake, dest)
        //snake[0][0] = snake[0][0] +1
    }
    if snake[0][0] == point[0] && snake[0][1] == point[1] {

        fmt.Printf("%v \n\n", snake)
        return add_tail(snapshot_snake, point)
    }

    return snake
}

func move_x(snake [][]int, board [][]int, point []int) [][]int {
    //para el eje x
    dest := make([]int, 0)
    snapshot_snake := make([][]int, 0)
    snapshot_snake = snake

    if snake[0][1] > point[1] {
        dest = append(dest, snake[0][0], snake[0][1]-1)
        //fmt.Printf(" destino : %v \n" , dest)
        snake = swap_snake(snake, dest)
        //fmt.Printf(" Se movio hacia : %v \n ", snake)
    } else if snake[0][1] < point[1] {
        dest = append(dest, snake[0][0], snake[0][1]+1)
        fmt.Printf(" estaba en  : %v \n", snake)
        snake = swap_snake(snake, dest)
        fmt.Printf(" Se movio hacia : %v \n ", snake)

    }
    if snake[0][0] == point[0] && snake[0][1] == point[1] {

        return add_tail(snapshot_snake, point)
    }

    return snake
}

func update_board(board [][]int, snake [][]int, point []int) [][]int {
    for i := 0; i < len(board); i++ {
        for j := 0; j < len(board[0]); j++ {
            if board[i][j] > 0 {
                board[i][j] = 0
            }
        }
    }

    for _, i := range snake {
        board[i[0]][i[1]] = 1
    }
    return board
}

// mover a la serpiente
// mueve la cabeza hacia adelante y luego eliminar la ultima posicion de la cola
// si es que encuentra un punto simplemente no se le borra la cola

// variables globales
var point []int

func main() {
    rand.Seed(time.Now().UnixNano())
    columns := flag.Int("c", 10, "Número de columnas")
    rows := flag.Int("r", 10, "Número de filas")
    flag.Parse()
    fmt.Println(*columns, "x", *rows)
    // incializacion rapida de un array de m*n
    board := make([][]int, *rows)
    for i := range board {
        board[i] = make([]int, *columns)
    }

    rand_y := rand.Intn(*rows)
    rand_x := rand.Intn(*columns)
    fmt.Println(rand_y, "  ", rand_x)
    board, point = generate_point(board, *columns, *rows)

    //generar el punto
    //generar una serpiente
    //hacer que se mueve hacia el punto
    snake := make([][]int, 2)
    snake = generate_snake(*columns, *rows)

    board = insert_snake(snake, board)
    show_board(board)
    aux := make([][]int, 0)
    _ = aux

    for {

        snake = move_x(snake, board, point)
        show_board(board)
        fmt.Printf("%v \n", snake)
        snake = move_y(snake, board, point)
        show_board(board)
        if snake[0][0] == point[0] && snake[0][1] == point[1] {
            aux, point = generate_point(board, *columns, *rows)
        }
        board = update_board(board, snake, point)

        time.Sleep(1500 * time.Millisecond)
    }
    fmt.Printf("%v \n", snake)
    board = insert_snake(snake, board)
    /* para probar el swap de posiciones para luego mover la serpiente
    aux := [][]int{ {1,2},{3,4}}
    swap_snake(aux,point)
    */
    show_board(board)
    time.Sleep(1500 * time.Millisecond)
}

func init() {
    c := make(chan os.Signal)
    signal.Notify(c, os.Interrupt, syscall.SIGTERM)
    go func() {
        <-c
        ctrl_c()
        os.Exit(0)
    }()

}