SRCS = step0_repl.erl
BINS = $(SRCS:%.erl=%)

#####################

.PHONY: clean stats stats-lisp

define dep_template
.PHONY: $(1)
$(1): $(SOURCES_BASE) src/$(1).erl
	MAL_STEP=$(1) rebar compile escriptize
endef

$(foreach b,$(BINS),$(eval $(call dep_template,$(b))))

clean:
	rebar clean

stats: $(SOURCES)
	@wc $^
stats-lisp: $(SOURCES_LISP)
	@wc $^
