Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F935606A32C
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vRrDf0mB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=B1k/VJ9H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZxhPYmoGSQq9mTfyZWhv45x0jWX1GjFGbwGBjl1Td2g=; b=vRrDf0mBvN4nz5I2vhtjSQiar5
	yYWhft6ZI1W7ZPapOfcue3mjnkmc/5jvUQxkewOpfqONQ1fHHj+tYO4WkNs+bLi9lT0TH2wV7S3NK
	JOWSwJXEOhZ9K0N9e5UG/M48ElktS/xSvQzOK6dA8WTQbHql4EIOW6/iSgVbalvYSrd04yxtk8BVV
	4GFdzHyT1CrAL9Ata7FiLtJoDMiy5rMJT4uM1DFCuB5qNgvrmcj6o2LewQLBLoGAQxAwJw6Q831Br
	B0K7rKJu1H1jPiriFIQH+Fm/75Q7/AzFbSYfimqBxPB0rnFV+NWESPwAv+6R4e+B2h30FSu0UR79m
	bD2hB5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0f-0000000A7lg-0PSL;
	Thu, 29 Oct 2026 18:37:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0c-0000000A7ja-1D62
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso21604185e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299072; x=1793903872; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=B1k/VJ9H5N5QQzeIkBKyuV61DAvpXsdXfpiaRTPZxiBt4QC1oqOumM7CupVDHBjHiM
         78OHhHk9/vniQ53lxbD5M9btKGbh0DikU7qHgu8qmQu7hgq6RC+S88GmsK2PJQfAefW8
         8oVuieoJ/6pQ5Adq/Ah3ca/SgFBEuhP991zjGEeu9A6Fy6IE7DEiFfBUpb6z8Hmi/sa2
         wF2W3mxn0Xtz8oeMfCHJsCiQ2ag3HnHYuej/NN2gBPINIOGWKeiiTW+BhMwlF8LtdjGW
         cMF4FTQrMaNMwPFOiF9XJtAv7v+ecnP//1rLtZu9F32nF0yxvNMKGYBFPqXITnPK+Lsb
         XbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299072; x=1793903872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0JzWuHSZxiNILu81vxHkBC1eR8z4avkRtzlz0Wpj+s=;
        b=ZUTPlvTR4WDBNny8OmMwrty81CKBrFPD7y0GVOHT8PDiYFzvjZMF/KwmzTGTnr7/Ec
         0wk+GYdkjt49jl1kaXiLDQOSAIe/bJbBbS7LCap1lYY+9upQ3gEhia97ll9eHFPGHc1R
         XiXJI+lSfPlTadW2m8mYe73WDvDn56CgPbp122sjpceS11x+dxHxAK82pzGN2rSPDb9Y
         zJVTaDNKD6RuEgL5xbdX4LM3XAhPB4y+s6+NodPeqb3mQGVE/fvDLXCgXb5TAqAW9WmW
         zUwqDy1wTNvpqmjTAI0EpKSmHcAW8BAjJkZAAgyr5QU4KRVRC+aM+JLTBlvLhA0xWc+A
         ptyw==
X-Gm-Message-State: AFq9FYK7W36E/+MOon5jydkbb+AXYPstzDRH4C77zw/K1ufoXOaBKP2f
	SU/iHkEQOzfFmx00Ug2omdyYlv131t7CyFTuB2BrCeoBK15p6nTKOWmtNK7CpeG8ASA=
X-Gm-Gg: AYBFou0NpVsbsZ5uhaG3vgmguOs4L8Jwvh0Q7GFt8aRtF81whCd9kjnqsQAZSQ53A/e
	OYq5VlK+DnceYfNRq03RIBLOOQwSLHSNwriXA80jAZxG+g/vaNIXUrwlCVoMjdeBIspZrsZ82EU
	5X/xeqZufn0wbziutmHj8Af5FEAH9dKgb+noMlkm7obsyxmygfRN4+MwY1j6nLsJkmIDYkxnQcn
	6nogOqdUkQrWJshv1K+MhJjD0At1fDjMEhO8MX5PSl4anRqYzJn7snHKUGEjpY/9UjrGnEEbn+6
	4BVMsKRTTxjhtnYr+mwgyblWMxiltVJuxuZGd+P39wbDHvdf+0XOqoluHQF0PO6y1ly1Z7oB+d6
	7Sw8nuamvr1AYRJ78XoatnLr8Q3Kro5nTxCcwRB0v8IorbUJ/fsUlM0i0t4jDpk1mNo/U8nBgOx
	JqhJCbCYWkpHtPaGKvjAGCWx/+ViyILt5u6NPmwzgsmJVpopSUS6NyCqInnbZu7f+n2YsvWQBpz
	MJJYWVJYR81amh/iUKf2ctFifMT5v+1Pbp5Ahp8SByPvz48F145ZLz5nxvyKs0Mpb3p0KaiV/I/
	ZdA7ZDwsaTwJZwZS+Ritrmmi8DoGsssI94VzuTcoDR3V+0OBKxcTo3lLBaIkgNdDaQ+kR5G0D7C
	vZS7wu3EJN1BB1Znu8w==
X-Received: by 2002:a05:600c:4705:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a966587157mr144058185e9.16.1793299072008;
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:51 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:34 +0100
Subject: [PATCH v2 1/3] clk: meson: gxbb: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-1-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_113754_339758_AE14ACC1 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905X datasheet revision 0.2, page 70.

Fixes: a8080f247bcd ("clk: meson-gxbb: Add video clocks")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..b483164955b9 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -2370,7 +2370,7 @@ static struct clk_regmap gxbb_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = gxbb_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
