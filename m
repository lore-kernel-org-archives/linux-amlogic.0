From: sboyd@kernel.org (Stephen Boyd)
Date: Mon, 16 Apr 2018 09:24:54 -0700
Subject: [PATCH 0/2] clk: honor CLK_MUX_ROUND_CLOSEST in mux
In-Reply-To: <20180409135921.5617-1-jbrunet@baylibre.com>
References: <20180409135921.5617-1-jbrunet@baylibre.com>
Message-ID: <152389589448.51482.15489333464741262913@swboyd.mtv.corp.google.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Jerome Brunet (2018-04-09 06:59:19)
> CLK_MUX_ROUND_CLOSEST is part of clk_mux and meson's clk_regmap
> documentation, so it should be honored by the determine_rate() callback.
> 
> It is note the case ATM. The series fixes this problem.

I'll apply these for clk-fixes.
