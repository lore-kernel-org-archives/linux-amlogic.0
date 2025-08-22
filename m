Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CF6CA0EEB
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Aug 2025 05:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3rrxiidUOlU+41iBj0rrOyTjec1xtcP6NFSOccpFQWg=; b=XkiHzN7hRFlNUC
	yVZ+U64AP+BADQ/SNSgUXhliP6pCgZvzOnHi+eze+fFaytvstZZb6xNdjLlkilZhORkDeOzbApdtm
	hfjNe+K91N3f8Fb+drei52Dk+E/qkiv9+PIK7a39Efyk2fUALCnz5jYZZhswsVZvdv4OqM97ySuXh
	uLFBfTIiKD3kGnDol//fcdqsJmhdPygY/612YdxohfAw2aoX7CK+Jgp8iQzUHrsSvX46rOFCQQnh0
	8RMTZg4mI9oHuKEYjJTgGq+hpuhOnBN8NsFymGBNTWiyg4Ol0T+SHqBsEVR2cvlqwOcmL2PKwjR/y
	ZkMGJjYrpUbcFloOORLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKPl-00000001at5-0NOG;
	Fri, 22 Aug 2025 05:34:13 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFXl-000000011A3-0106
	for linux-amlogic@lists.infradead.org;
	Fri, 22 Aug 2025 00:22:10 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7e87030df79so173159485a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Aug 2025 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1755822128; x=1756426928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvGMV188YiibtGuznHf40d1pmt+2SAT1gXmJIlT35ZM=;
        b=fe9Ey2BOKS9f5bkWaQC9uTQvEudHxw9Qr/hAAUFo55AHuQz11JXS3k1Y2duUTuX4cV
         7iPvnSboC804ZnTWLcJCXDfuN9h3rMe/fiTDUT1mCmORb6bCEuWPNIJWgWj6bT9foVi5
         EUwjmzXhX/fEEDehbogpjoiOWgfS1iwlBgPDR4AbrjqZgcQAGKsPZpZwBD9s0ZwXQoMc
         R5ZJZqHN8NLTTH0UG2EapAKppiMWsYjJNzNGMeyqcS4dARuitoo6ADi25xwcUBCj0Yir
         AM39cfNW0Jk9iObwvo9kXBbp9qGrSnbkaBrtZnXk0eJstQFMhNz466Wrng2+EZJFrYOO
         Vnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755822128; x=1756426928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvGMV188YiibtGuznHf40d1pmt+2SAT1gXmJIlT35ZM=;
        b=YwDC0omsZBp0aQingfDpx9BdHaJnQsu99ZVVnwLnNcdVQvzYCB7SxvSiNXmcTA5w1s
         FGsYJj+QvBuNVfVFvFZwQJ3ankujAU4pSu9VTS4DnEqJbXfrR6XRPS8Hd4tlBdQlo8fy
         n8MecJOCgS35Kt08NCcRCf73o5K886SLFMXA+slJiJaVkmfRXhWK/ZrBD2LV2c7m/DNy
         77dy28krGwrWqo61hcf4PBc6TM+ib0eC8RKtBZlbZFfHSQ1HBnvomnQ9HJi7D84HCVmQ
         FR17a7izWds8icd58ZqUG+lfV45rhiyQK4JlH4Iu4Xw1mmLPDvPDeh2yFE411ywkjzNu
         tnZA==
X-Forwarded-Encrypted: i=1; AJvYcCWN4hvxil/xk7rflbfsK+tHq6qB2D2h/BIf7yiCk2ysRfM4poMTXN3fcQlbYy55Y569zCOR4iynE1wA7VVv@lists.infradead.org
X-Gm-Message-State: AOJu0YxbwBPB6Grn0exjp1xo4E6Sgi352/42IuScXLD0vg2ZE1WM0bE7
	Pj9DImivG0XyFCcXHUpUAUQH1Efvvt+SlHrE4EXNcd7+AX1UZeR1X321ea0iTC0JCw==
X-Gm-Gg: ASbGncuXC7yHLpjCqjJjRlAskduRg6VkZgpuy9CnY0S5/avCZ1ogplNulZTTrtvLQSx
	1ecTU7jcRCvhoDz67/gNyet+KhGeuzORNP5vBwlJzn3+74sfAiO3Q14cUEjiOqPMml134/V6+4G
	l0LawXqCDdrugo4LGN1YT7Narv4iYjrJFMcSax0l6IJ4Elj9HKg0JYFWuTl4PGwLfKpA9r4WrPb
	LJqpjFLj0aiuJQw4UHlZO4JgCClJKuEjXAWXYofIi/4+KzrE6LeWnLujbXPZoxHFmiUB2xZX9J8
	DM4s5PVZpmXzizJEmvosOKH1MqKY6WVLrlsTqIdJixf9owbnpLnzsI1HertIzRcw7tplAjswwZk
	0Jc06nhf4exnV8zjhgvAnWQCjetD6pHGJPEuOzmEf
X-Google-Smtp-Source: AGHT+IGHm6rZ2RaOlXfMgFSf4U8z7KV1Q+DwlLKsqiFCn1DG+L7TJ0TPCwJKMIb2sZIk+AiQv0UV3A==
X-Received: by 2002:a05:620a:3195:b0:7e8:2989:1149 with SMTP id af79cd13be357-7ea1103a64fmr184064785a.49.1755822127818;
        Thu, 21 Aug 2025 17:22:07 -0700 (PDT)
Received: from localhost ([2607:fb91:3b82:29b4:add9:bee5:e413:378f])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e87e075df5sm1228228685a.30.2025.08.21.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 17:22:07 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>
Cc: Da Xue <da@libre.computer>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and hifi pll
Date: Thu, 21 Aug 2025 20:22:02 -0400
Message-ID: <20250822002203.1979235-1-da@libre.computer>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172209_056282_D3869A78 
X-CRM114-Status: GOOD (  11.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The bit range 17:0 does not match the datasheet for A311D / S905D3.
Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.

The frac field is missing for sys pll so add that as well.

Patched:

+ sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
/sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
996999
500000
+ sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
 hifi_pll                      0    +/-1562Hz
 sys_pll_div16                 0    +/-1562Hz
 sys_pll_cpub_div16            0    +/-1562Hz
+ sudo cat /sys/kernel/debug/clk/clk_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
    hifi_pll_dco                     0       0        0        0
       hifi_pll                      0       0        0        0
    sys_pll_dco                      1       1        0        3999999985
       sys_pll                       0       0        0        499999999
          sys_pll_div16_en           0       0        0        499999999
             sys_pll_div16           0       0        0        31249999
    fixed_pll_dco                    1       1        1        3987999985
       fixed_pll                     3       3        1        1993999993

Unpatch:

+ sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
/sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
1000000
500000
+ sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
 hifi_pll                      0    +/-1562Hz
 sys_pll_div16                 0    +/-1562Hz
 sys_pll_cpub_div16            0    +/-1562Hz
+ sudo cat /sys/kernel/debug/clk/clk_summary
+ grep -i '\(sys_\|hifi_\|fixed_\)pll'
    hifi_pll_dco                     0       0        0        0
       hifi_pll                      0       0        0        0
    sys_pll_dco                      1       1        0        4800000000
       sys_pll                       0       0        0        1200000000
          sys_pll_div16_en           0       0        0        1200000000
             sys_pll_div16           0       0        0        75000000
    fixed_pll_dco                    1       1        1        3999999939
       fixed_pll                     3       3        1        1999999970

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/clk/meson/g12a.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 66f0e817e416..f78cca619ca5 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
 		.frac = {
 			.reg_off = HHI_FIX_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_FIX_PLL_CNTL0,
@@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
 			.shift   = 10,
 			.width   = 5,
 		},
+		.frac = {
+			.reg_off = HHI_SYS_PLL_CNTL1,
+			.shift   = 0,
+			.width   = 19,
+		},
 		.l = {
 			.reg_off = HHI_SYS_PLL_CNTL0,
 			.shift   = 31,
@@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
 		.frac = {
 			.reg_off = HHI_HIFI_PLL_CNTL1,
 			.shift   = 0,
-			.width   = 17,
+			.width   = 19,
 		},
 		.l = {
 			.reg_off = HHI_HIFI_PLL_CNTL0,
-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
