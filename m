From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 19 May 2017 12:05:01 +0200
Subject: [PATCH 00/10] clk: implement clock rate protection mechanism
In-Reply-To: <20170518163804.14123-1-jbrunet@baylibre.com>
References: <20170518163804.14123-1-jbrunet@baylibre.com>
Message-ID: <1495188301.2426.3.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, 2017-05-18 at 18:37 +0200, Jerome Brunet wrote:
> This Patchset is related the RFC [0] and the discussion around
> CLK_SET_RATE_GATE available here [1]
> 
> The goal of this patchset is to provide a way for consumers to inform the
> system that they depend on the rate of the clock source and can't tolerate
> other consumers changing the rate or causing glitches.
> 
> 

Stephen, Mike,

I've realized that a few more changes would improve set_rate changes handling.
Please ignore this series.

I'll send another one soon.

Cheers

Jerome
