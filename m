Return-Path: <SRS0=gLzN=FV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32009C4361B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Dec 2020 15:08:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6FE3233F6
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Dec 2020 15:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6FE3233F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cpIkv9ofOoc6nE3l2X8JNSOaICK4GH7N0xLfF7uRxeM=; b=W3+Itbg2wjVxY8UOPW0n69qMSs
	tNjuU+iBzrBBn/PPrEKHbSDbFYxVxPug4E/1iPrfbyx+182xy/6x3LK3PuI8lrWAbfNLLZGFGWYSD
	ev7Y1dsZA03Qtf8/DEC+eLCokolPHC8gRSsLhxIgtDKZ1VDBKNtKce8OmY4LZWlbW+fFPSu41z0an
	LZA4nLU3ZBc/61rTkR6QI0E3BzEwi/Uqwclx4Ez3gm9eU05eXu8SuTjf4+Ut3+jno8WskSBIhCyos
	OjRgBhlTRGXFtDEzy+4a7Buk+yHWHK7vI/xfK+GW6Q8av+Hw84U5HMgrRjMszuN5DkqLXjLNJzJGR
	d5Nrpv3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kputY-0008Cv-BL; Thu, 17 Dec 2020 15:08:44 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kputV-0008C4-Pv
 for linux-amlogic@lists.infradead.org; Thu, 17 Dec 2020 15:08:42 +0000
Received: by mail-ed1-x52b.google.com with SMTP id cm17so28997428edb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Dec 2020 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMTdGaZz4epAF+h7Vd7eoxRPSBCFlzhMnNdcHFWnV2E=;
 b=I+skmb5KXzOywyDXyDuqmQZUCxvxJexgo9S7JdYiSIIbpjJI+efsBbBEqZiHwZ7dGy
 qTmcRDFbZ88zADmj51WkixxV7kI6jw1VyG7Ex0FtJNAN5j/5hDZakhfJKgc14r1XBGHR
 /FKdHIIFdAx9nSQVOmD4FRd9z6gVrkiYqiL5XEM76af2oJJEhoTr6AOKLxPcrmoqy3Ie
 nTVyzqKoRzvIr4FXOBpJHmjDfyTi8KULgIT0ywfXGIioheUgHnuHKvLiTDwKsyKQH/sQ
 +2jFyZ8hu/wYBOEqjSzjkHxMu2sZ1pxQNOQKRBD6O1iSQH4+hiDIMG26dBkPgJ1EvzSR
 QrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oMTdGaZz4epAF+h7Vd7eoxRPSBCFlzhMnNdcHFWnV2E=;
 b=YoBmBtwf9gMNGWUEZJH+1YmfhXE55N28ccZvG0a23T5M1lzzCyV1mtqIvAGk6V6GMO
 Yd6CCrpVErMwhPLoTPghtHgobPZCUJI5DEh5IeYuV/LkTjAW5U9u6xnoRMccTcj8ytiv
 BF51heKZiCHtnBzD+LeVNQqQCWrWlyTVcICUM5cSq5RHWK+y4S9yzsKwH5f5K477FS8W
 foTXUkjxzQ5YvE2eMZINGjBho3vh7J5FfxUX9LMx9EaliMgPTCj4fwadsigAmXkF2sUd
 57J4wANv0CsbeBHammDC09AOlFTdmPdxWbSNcQ49veW5kyDrx0AfRIKkkO/ecs1HLw50
 amhg==
X-Gm-Message-State: AOAM533oJB2k9zZsnlQ0xow6DXSlAAsLoHooDya5DKXxcb0Qq4drynX8
 KWd6RtiugGxZUje3E8dff2kUMkS1iI5YGY7L
X-Google-Smtp-Source: ABdhPJzToiS9DNA9nvKxMA55z2+ccMLPeBi2mj6gfCBdo9SCEIyCgtEBh+GVDXsOPgSA9ByNoUQcFg==
X-Received: by 2002:a05:6402:c0b:: with SMTP id
 co11mr37972133edb.180.1608217719534; 
 Thu, 17 Dec 2020 07:08:39 -0800 (PST)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id k21sm3909042ejv.80.2020.12.17.07.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 07:08:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: axg-tdmin: fix axg skew offset
Date: Thu, 17 Dec 2020 16:08:34 +0100
Message-Id: <20201217150834.3247526-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_100841_851427_A9AF814C 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The signal captured on from tdm decoder of the AXG SoC is incorrect. It
appears amplified. The skew offset of the decoder is wrong.

Setting the skew offset to 3, like the g12 and sm1 SoCs, solves and gives
correct data.

Fixes: 13a22e6a98f8 ("ASoC: meson: add tdm input driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmin.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index 88ed95ae886b..b4faf9d5c1aa 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -224,15 +224,6 @@ static const struct axg_tdm_formatter_ops axg_tdmin_ops = {
 };
 
 static const struct axg_tdm_formatter_driver axg_tdmin_drv = {
-	.component_drv	= &axg_tdmin_component_drv,
-	.regmap_cfg	= &axg_tdmin_regmap_cfg,
-	.ops		= &axg_tdmin_ops,
-	.quirks		= &(const struct axg_tdm_formatter_hw) {
-		.skew_offset	= 2,
-	},
-};
-
-static const struct axg_tdm_formatter_driver g12a_tdmin_drv = {
 	.component_drv	= &axg_tdmin_component_drv,
 	.regmap_cfg	= &axg_tdmin_regmap_cfg,
 	.ops		= &axg_tdmin_ops,
@@ -247,10 +238,10 @@ static const struct of_device_id axg_tdmin_of_match[] = {
 		.data = &axg_tdmin_drv,
 	}, {
 		.compatible = "amlogic,g12a-tdmin",
-		.data = &g12a_tdmin_drv,
+		.data = &axg_tdmin_drv,
 	}, {
 		.compatible = "amlogic,sm1-tdmin",
-		.data = &g12a_tdmin_drv,
+		.data = &axg_tdmin_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmin_of_match);
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
