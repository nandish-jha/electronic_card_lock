module electronic_card_lock
(
	input wire key_0, key_1,
	output reg card_read
);

/*
18 bit num (slide SW)
	16 of which are combination
	2 are carry (explained later)
	
read this num and place it in 16 bit register of 18 ffs

card_number 18 bit, transfer the num here (input will be slide switches

2 seconds for the user to open door (pulse of 2 seconds)
This pulse genetrated by set reset ff under control of push buttons

refer...
	pulse - card_read (done using set clear ff, setting and clearing done with 2 push button keys)
*/

always @ *
	if (key_0 == 1'b0)
		card_read = 1'b0;
	else if (key_1 == 1'b0)
		card_read = 1'b1;

endmodule
