Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9A3C25B06
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Aug 2022 21:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oqgtW/GCRSjxoBfgRXPM34RMxAkJsEeLESxJUk1li5M=; b=0qT8YDfOJAiYO7
	vqziffTjT6BLwkg7+LWBTri03nj+MsDW4bVOCfZNsMekqxtIq52bKUy8ghQzkJaPAcudaA07gI/2H
	yAO5DQ4R165zYW/C9hXSwJijLi7GxLTgb9ZxbEp9ZQ9UAEwpwIPGAIxx4fT51CyiaVKyqYN5FQukO
	FgeMrhyG7QvSf8rKENJKeT6UOI/o0BchnbD64JE8tyhBBZHyLQRvx3xlQwoFC4nEyLIULWCa7VduE
	gNnP5Xkb/WA3nrDTc6tHVvA6yV6PE1mtErXUu3OgnmOOStZMuwqBLuNA5NObknCCEAAIKdlqrsQp5
	vngxO5khl1uIieEZNAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNL6L-009Eid-B5; Sun, 14 Aug 2022 21:24:53 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNL6H-009EgW-Km; Sun, 14 Aug 2022 21:24:50 +0000
Received: by mail-ej1-x631.google.com with SMTP id gk3so10666664ejb.8;
        Sun, 14 Aug 2022 14:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=Xs2VrrzvmLsyH+hJRZNUJZgI2UgrYiUWsrlPMZ36jPPYAVszv08PHRLhLjfLp6Bfrv
         YZOhQ3dGW54YvbbVI9tCJAF6OByRQXWgI/a4pZlQfhgn12nBHzwz+omjpjy79e39MhUF
         YmERME28kY5R85B5Afu7ZAchrc9WEKGtxRHkF5eGN6RGOfDADBMdTtJv8gPFB99wi8S/
         V9ptLemIPoQQ4OmXhQkS0A4LPZdktDltawbfOo6KS2VEYGheC2Tk5BQj7Z1lFNqFh+CR
         ND0ZbnFFpVmm5V1J23akX6FNxYuD9Y9PyLlwBRTAkipaEfyHi0wvug36z27Rly2to0HG
         lBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=TeJLO5FGTN/tMx+KXy1PJOTGSaWzUoi+jD5WpdDOHMnjV2GgsLLoLDIEvxYlyPbv9x
         Ty08aNOHPxQ3jZSliv+fClazGJjrw6J/Pr314DFtjVNiD22L5sUjoW1R/Fc4q6Ismc6f
         I29xVNkotyRAuAJHVKXB4QYqTA+5KhK2Vnz3yXU5iidPySU+TDTU0GqtHL6kPfD8Zksq
         tZFeAxv2yxFViY4GoXDXjJySFwaStDfLVyoBFG292Ql2z1w30q8BBWUB+GQ2NdSYTu25
         BVRHcRuR/kzNFge2FVCeORzp19H2KEoOXUY/JI6ay+rAT/6CSoOZyBI2z9L+EGqzo8r1
         UMyg==
X-Gm-Message-State: ACgBeo2kVdXE2tcE5IhK/YBaLY2Xu45bXc2ilPajY2C+FiidcHQLaNUC
	UGmp+lNE2N7cOWz2l2jzFgA=
X-Google-Smtp-Source: AA6agR4qBFMCJH3ypksedrohz+KCGvROtq1GbZ4RYBN5NpUdX40/VFaL7P6q9Ww7l1Wy6FhKV+KPvw==
X-Received: by 2002:a17:907:2c4a:b0:730:87ff:b69 with SMTP id hf10-20020a1709072c4a00b0073087ff0b69mr8585364ejc.116.1660512286556;
        Sun, 14 Aug 2022 14:24:46 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id dk19-20020a0564021d9300b0043df042bfc6sm5409260edb.47.2022.08.14.14.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:24:46 -0700 (PDT)
Message-ID: <c31a2f7e-4506-5b83-be5b-674980777859@gmail.com>
Date: Sun, 14 Aug 2022 23:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: clk: meson: pll: copy retry workaround from vendor driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_142449_727730_9432C13F 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

On a S905X4-based system this call fails randomly.
The vendor driver has a retry mechanism and on my system
the second attempt is successful always.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/meson/clk-pll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 9e55617bc..daa025b6d 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 
 static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
 {
-	meson_clk_pll_init(hw);
+	int retries = 10;
 
-	if (meson_clk_pll_wait_lock(hw))
-		return -EIO;
+	do {
+		meson_clk_pll_init(hw);
+		if (!meson_clk_pll_wait_lock(hw))
+			return 0;
+		pr_info("Retry enabling PCIe PLL clock\n");
+	} while (--retries);
 
-	return 0;
+	return -EIO;
 }
 
 static int meson_clk_pll_enable(struct clk_hw *hw)
-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
