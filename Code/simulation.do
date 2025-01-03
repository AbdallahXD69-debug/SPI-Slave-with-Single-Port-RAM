vlib work

vlog RAM.v SPI.v Wrapper.v Wrapper_tb.v

vsim -voptargs=+acc work.Wrapper_tb

add wave *

run -all

