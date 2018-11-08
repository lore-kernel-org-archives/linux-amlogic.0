From: sboyd@kernel.org (Stephen Boyd)
Date: Thu, 08 Nov 2018 10:21:01 -0800
Subject: [PATCH] clk: meson: axg: mark fdiv2 and fdiv3 as critical
In-Reply-To: <20181108093123.21498-1-jbrunet@baylibre.com>
References: <20181108093123.21498-1-jbrunet@baylibre.com>
Message-ID: <154170126140.88331.14691547333216324636@swboyd.mtv.corp.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Jerome Brunet (2018-11-08 01:31:23)
> Similar to gxbb and gxl platforms, axg SCPI Cortex-M co-processor
> uses the fdiv2 and fdiv3 to, among other things, provide the cpu
> clock.
> 
> Until clock hand-off mechanism makes its way to CCF and the generic
> SCPI claims platform specific clocks, these clocks must be marked as
> critical to make sure they are never disabled when needed by the
> co-processor.
> 
> Fixes: 05f814402d61 ("clk: meson: add fdiv clock gates")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> 
> Hi Stephen,
> 
> If you can put this one in clk-fixes as well, it would be awesome.
> It is basically the same thing as the change you took this Tuesday.
> 
> Since then, we had reports the same problem with SCPI was happening
> on the axg, calling for the same fixup.
> 

Ok. I suppose someone needs to work on clk handoff................ me?
