/*
function integer getSeed;
// task gets a seed from the Linux date program. 
// call "date" and put out time in seconds since Jan 1, 1970 (when time began)
// and puts the results in a file called "now_in_seconds"
integer fp;
integer fgetsResult;
integer sscanfResult;
integer NowInSeconds;
reg [8*10:1] str;
begin
    $system("date +%s > now_in_seconds");                                       
            
    fp = $fopen("now_in_seconds","r");
    fgetsResult = $fgets(str,fp);
    sscanfResult = $sscanf(str,"%d",NowInSeconds);
    getSeed = NowInSeconds;
    $fclose(fp);
    //$display("seed = %d\n",getSeed);
//    start=$random(seed); 
end
endfunction
*/

task testSerialAdder;
    input logic [15:0] NumTrials;
    // constrained random test of adder
logic debug;
logic [31:0] expectedOut;
logic [31:0] errors;
logic [WORDWIDTH-1:0] expectedOutTrimmed;
logic expectedCarryOut;
begin
    errors = 0;
    debug = 0;
//    getSeed;
    $display("Running %d trials of random additions:\n", NumTrials);
    for (int testNum = 0; testNum < NumTrials; testNum++) begin
        a = $urandom()%(2**WORDWIDTH);
        b = $urandom()%(2**WORDWIDTH);
        expectedOut = a + b;
        if (expectedOut >= (2**WORDWIDTH)) begin
            expectedCarryOut = 1;
            expectedOutTrimmed = expectedOut[WORDWIDTH-1:0];
        end
        else begin
            expectedCarryOut = 0;
            expectedOutTrimmed = expectedOut[WORDWIDTH-1:0];
        end
        @(posedge done);
        if (debug) begin
            $display("------ test # %d --------",testNum);
            $display("a = %d, b = %d \n",a,b);
            $display("expectedOut = %d, expectedCarryOut = %d \n", expectedOut, expectedCarryOut);
            $display("expectedOut = %d, carry_out = %d \n", expectedCarryOut, carry_out);
            $display("expectedOutTrimmed = %d, sum = %d",expectedOutTrimmed,sum_reg);
            $display("------------------------\n");
        end // if (debug);
        assert ( (sum_reg == expectedOutTrimmed) 
                && (expectedCarryOut == carry_out) ) 
        else begin
            $display("ERROR in Trial %d!\n",testNum);
            $display("expectedCarryOut = %d, carry_out = %d", expectedCarryOut, carry_out);
            $display("expectedOutTrimmed = %d, sum = %d",expectedOutTrimmed,sum_reg);
            errors++;
        end // assert
    end // for
    $display("%d tests complete. Total Errors = %d",NumTrials,errors);
`ifdef __ICARUS__
    if (errors != 0) $stop(0);
    $finish(0);
`endif
end // begin
endtask
    
