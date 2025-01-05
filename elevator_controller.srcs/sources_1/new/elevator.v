module elevator(
    input clk,
    input [4:0]btn,  // Botones para las plantas 1 a 5
    output [4:0]nfloor,  // Estado de los botones activados
    output wire[7:0]by,  // Indicador de botón activado
    output [6:0]seg,  // Display de 7 segmentos
    output reg lift_open  // Estado de la puerta del ascensor
);
    parameter N = 99_999999;
    assign by = 8'b1111_1110;  // Valor fijo para los LEDs de botón
    reg [4:0] btn_pre_re, btn_buff, btn_off, btn_test;
    reg clk_200ms;
    reg clk_1s;
    reg clk_3s;
    reg [31:0] count, count1, count3;
    reg [6:0] dout;
    reg [1:0] lift_state;
    reg [2:0] lift_num;
    
    initial begin
        btn_off <= 5'b11111;  // Todos los botones apagados inicialmente
        btn_pre_re <= 0;
        lift_num <= 1;  // El ascensor comienza en la planta 1
        lift_state <= 0;
        lift_open <= 1;  // Las puertas están abiertas inicialmente
    end
    
    // Generación de los relojes de 200ms, 1s y 3s
    always @(posedge clk) begin
        clk_200ms <= 0;
        if (count < N / 5)
            count <= count + 1;
        else begin
            count <= 0;
            clk_200ms <= 1;
        end
    end

    always @(posedge clk) begin
        clk_1s <= 0;
        if (count1 < N)
            count1 <= count1 + 1;
        else begin
            count1 <= 0;
            clk_1s <= 1;
        end
    end

    always @(posedge clk) begin
        clk_3s <= 0;
        if (count3 < (3 * N - 3))
            count3 <= count3 + 1;
        else begin
            count3 <= 0;
            clk_3s <= 1;
        end
    end

    // Registro de cambios en los botones
    always @(posedge clk_200ms) begin
        btn_pre_re = btn_pre_re ^ btn;
        btn_pre_re = btn_pre_re & btn_off;
    end

    // Lógica para manejar los estados del ascensor
    always @(posedge clk_1s) begin
        btn_buff = btn_pre_re;
        case(lift_state)
            0: begin  // Estado 0: ascensor en espera
                if ((btn_buff >> lift_num) > 0) begin
                    #(5 * N);
                    lift_num = lift_num + 1;  // Subir ascensor
                    lift_state = 1;
                end
                
                // Lógica de parada en planta
                if ((btn_buff & (1 << (lift_num - 1))) > 0) begin
                    btn_buff = btn_buff & (~(1 << (lift_num - 1)));
                    btn_off = ~(1 << (lift_num - 1));
                    lift_open = 1;
                    #(5 * N);
                    lift_open = 0;
                    lift_state = 0;
                end
                
                // Lógica para bajar
                if ((1 << (lift_num - 1)) > btn_buff) begin
                    if (btn_buff > 0) begin
                        #(5 * N);
                        lift_num = lift_num - 1;  // Bajar ascensor
                        lift_state = 2;
                    end
                end
            end

            1: begin  // Estado 1: ascensor subiendo
                if ((btn_buff >> lift_num) > 0) begin
                    if ((btn_buff & (1 << (lift_num - 1))) > 0) begin
                        btn_buff = btn_buff & (~(1 << (lift_num - 1)));
                        btn_off = ~(1 << (lift_num - 1));
                        lift_open = 1;
                        #(5 * N);
                        lift_open = 0;
                        lift_num = lift_num + 1;
                    end
                    else
                        lift_num = lift_num + 1;
                end
                else begin
                    btn_buff = btn_buff & (~(1 << (lift_num - 1)));
                    btn_off = ~(1 << (lift_num - 1));
                    lift_open = 1;
                    #(5 * N);
                    lift_open = 0;
                    lift_state = 0;
                end
            end

            2: begin  // Estado 2: ascensor bajando
                btn_test = (btn_buff << (6 - lift_num));
                if (btn_test > 0) begin
                    if ((btn_buff & (1 << (lift_num - 1))) > 0) begin
                        btn_buff = btn_buff & (~(1 << (lift_num - 1)));
                        btn_off = ~(1 << (lift_num - 1));
                        lift_open = 1;
                        #(5 * N);
                        lift_open = 0;
                        lift_num = lift_num - 1;
                    end
                    else
                        lift_num = lift_num - 1;
                end
                else begin
                    btn_buff = btn_buff & (~(1 << (lift_num - 1)));
                    btn_off = ~(1 << (lift_num - 1));
                    lift_open = 1;
                    #(5 * N);
                    lift_open = 0;
                    lift_state = 0;
                end
            end
        endcase
    end

    // Display de la planta actual en el display de 7 segmentos
    always @(posedge clk) begin
        case(lift_num)
            1: dout = 7'b1001111;  // Planta 1
            2: dout = 7'b0010010;  // Planta 2
            3: dout = 7'b0000110;  // Planta 3
            4: dout = 7'b1001100;  // Planta 4
            5: dout = 7'b0100100;  // Planta 5
            default: dout = 7'b0000001;  // Error, muestra un 0
        endcase
    end

    assign nfloor = btn_pre_re;  // Estado de los botones
    assign seg = dout;  // Estado del display de 7 segmentos
endmodule