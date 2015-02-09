PICASSO ?= picasso
BUILD ?= build
VSH := $(sort $(wildcard *.v.pica))
SHBIN := $(addprefix $(BUILD)/,$(VSH:.v.pica=.shbin))

.PHONY: all clean

all: $(SHBIN)

$(BUILD):
	mkdir -p $@

$(BUILD)/%.shbin: %.v.pica %.g.pica | $(BUILD)
	$(PICASSO) -o $@ $^

$(BUILD)/%.shbin: %.v.pica | $(BUILD)
	$(PICASSO) -o $@ $<

clean:
	rm -rf $(BUILD)
