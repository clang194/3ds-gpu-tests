PICASSO ?= picasso
BUILD ?= build
VSH := $(sort $(wildcard *.v.pica))
SHLIST := $(sort $(wildcard *.shlist))
SHBIN := $(addprefix $(BUILD)/,$(VSH:.v.pica=.shbin) $(SHLIST:.shlist=.shbin))

.PHONY: all clean

all: $(SHBIN)

$(BUILD):
	mkdir -p $@

$(BUILD)/%.shbin: %.v.pica %.g.pica | $(BUILD)
	$(PICASSO) -o $@ $^

$(BUILD)/%.shbin: %.v.pica | $(BUILD)
	$(PICASSO) -o $@ $<

$(BUILD)/%.shbin: %.shlist | $(BUILD)
	$(PICASSO) -o $@ $$(cat $<)

clean:
	rm -rf $(BUILD)
