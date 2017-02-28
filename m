From: sboyd@codeaurora.org (Stephen Boyd)
Date: Tue, 28 Feb 2017 13:26:54 -0800
Subject: [PATCH] clk: meson: fix SET_PARM macro
In-Reply-To: <20170228093016.5624-1-jbrunet@baylibre.com>
References: <20170228093016.5624-1-jbrunet@baylibre.com>
Message-ID: <20170228212654.GM25384@codeaurora.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 02/28, Jerome Brunet wrote:
> parameter val is not enclosed in parenthesis which is buggy when given an
> expression instead of a simple value
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Fixes tag? Is there a place in the code that is using a complex
expression for val right now?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
