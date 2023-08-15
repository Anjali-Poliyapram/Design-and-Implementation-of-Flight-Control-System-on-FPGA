module flight_control_module(v1,v2,v3,v4,s1,s2,result);
input [7:0]v1,v2,v3,v4;
input s1,s2;
output reg[7:0] result;
reg[7:0] tt1,tt2,tt3,tt4;
reg [15:0] rpm1,rpm2,rpm3,rpm4;
parameter c1=32'd27,c2=32'd3,c3=32'd1400,c5=32'd10;
always@(*)
begin
assign rpm1=(c3*v1)-((c1/c5)*(v1**c2));
assign rpm2=(c3*v2)-((c1/c5)*(v2**c2));
assign rpm3=(c3*v3)-((c1/c5)*(v3**c2));
assign rpm4=(c3*v4)-((c1/c5)*(v4**c2));
if(rpm1>16'b0000101010011100)
begin
tt1=8'b11111111;
end
else
begin
tt1=8'b00000000;
end
if(rpm2>16'b0000101010011100)
begin
tt2=8'b11111111;
end
else
begin
tt2=8'b00000000;
end
if(rpm3>16'b0000101010011100)
begin
tt3=8'b11111111;
end
else
begin
tt3=8'b00000000;
end
if(rpm4>16'b0000101010011100)
begin
tt4=8'b11111111;
end
else
begin
tt4=8'b00000000;
end
case({s1,s2})
3'b00:result<=tt1;
3'b01:result<=tt2;
3'b10:result<=tt3;
3'b11:result<=tt4;
endcase
end
endmodule
 