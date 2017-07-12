From: sboyd@codeaurora.org (Stephen Boyd)
Date: Tue, 11 Jul 2017 19:03:14 -0700
Subject: [PATCH v3 09/10] clk: fix incorrect usage of ENOSYS
In-Reply-To: <20170612194438.12298-10-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-10-jbrunet@baylibre.com>
Message-ID: <20170712020314.GX22780@codeaurora.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/12, Jerome Brunet wrote:
> ENOSYS is special and should only be used for incorrect syscall number.
> It does not seem to be the case here.
> 
> Reported by checkpatch.pl while working on clock protection.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Could also go earlier in the series.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
