Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA90AC46478
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CE00218BA
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMYK3I44";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JrcDlvvT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CE00218BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfkIUsosfvBrfuAJ4cM514gcrgMNwRrzATRTctkokRw=; b=IMYK3I44x1lLJQ
	XfihHwwzLNi0kSt2GfDQib3CAxSgZIzm8ICplnPieysqjNdWg/CVIRpCuIKAwx7AXZgsfBWMurp6d
	+5lyCggDXivjE+NAXrUB8zSRI2BzHwaZsmy55DOiLtkYEpIu5HJB7Hf0oQQpVILy3SGp8OcAZ7a7m
	LkvUAXjPCcJ6ehNhXPcD9p6is+7aSehg39wvIhOjL13BVM9aCcBxGxgF4qSxx8vvrqlGCRI6rd8ds
	eZVtRO8FVs3Kgqlm0o+P2j2W20swjtRZZ2GrlrZoZwI+dt6ikJZ5KypKfZtEkSW1ozIlZG7M4cNZK
	1MpVQMZAgavpSxqsYXTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hie3O-0004Oj-OY; Wed, 03 Jul 2019 12:08:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hie3L-0004Jr-O9
 for linux-amlogic@lists.infradead.org; Wed, 03 Jul 2019 12:08:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id c2so2500434wrm.8
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2019 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6jmfxNF0bKXTHuQ9MiaMGLVqO2khGBwkEkz0kXerFA=;
 b=JrcDlvvTu/UsNIG0vNxgNTXhOeeuaxZSo57yFAMP/xUZSJ0e+TmYtRFDzHNVWp3/2W
 WL7VXbaVLmT0arVzNS3T6C6CTredekNz7iHmVMUKkzUOkMQqzjJgSJxtZrK9xi60Omzm
 7rMGge4rmwUX+m0a7K72LzFQxvk6I1a5msWlscLQi9xL2pFct8QbyQ9pN5btRBkmlak4
 28L6JNF30BSyhM5y8HR5cccDJt1pSGxI8NxN6gvkrSyFIdW+wiIPTsdYhjcCXIkwcTjH
 f63rXZf/IzhUP5KlgoPcMSvkpDEqS7ubdYS70hqaG4LPhLfTSntiquOLtUwmlLIgqgrb
 ATUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6jmfxNF0bKXTHuQ9MiaMGLVqO2khGBwkEkz0kXerFA=;
 b=WC1odRwlvMaiP3UBoAVzrT1o4X0vk6cMr0hAn/8HP2OpM6R+jgGDjAFv3YsHr/fhpt
 ad/ixw8qHztR3cMOk8idTvvztqGOuzWzeAQM4od8ZapvxmD78LwMciuR6u9cP07ZrWrD
 VmUzKLw6xFGMecz6ywWb8NVed0Icp993yQ6mibTW6AnWYX5NyIdaR3Ch9gyDAOiGW9yl
 Mdst20+qKcRm9ksLgGCo+SocOOhB5qff7uWo8jIxhdf583TeLbwnqbExx7sjxZvKsywM
 ydJgtl4OavfrOP+AJiewSR+pz7xa10ON/ezAFjTP02Gz2Xvb1Wla64TwrCCKYVbD/Axq
 ukfg==
X-Gm-Message-State: APjAAAUW5qp8f4kT9/cd724DyPHLPxxMYBKcJehNHz1oL/8Yhmd4ciU3
 4mzL91aAv+SvMb9tbHUOFfv1VQ==
X-Google-Smtp-Source: APXvYqw931AA2gewVKXUYTgyeeVPRjW4aXRpl7vYMadJOlnoIda8+dbNBrBJbhCSF/FyzoCyWHZOZw==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr3594718wrx.226.1562155675701; 
 Wed, 03 Jul 2019 05:07:55 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z126sm2767638wmb.32.2019.07.03.05.07.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:07:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] ASoC: meson: axg-tdm-formatter: add reset
Date: Wed,  3 Jul 2019 14:07:49 +0200
Message-Id: <20190703120749.32341-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703120749.32341-1-jbrunet@baylibre.com>
References: <20190703120749.32341-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_050759_957406_789571ED 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the optional reset line handling which is present on the new SoC
families, such as the g12a. Triggering this reset is not critical but
it helps solve a channel shift issue on the g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 0c6cce5c5773..2e498201139f 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <sound/soc.h>
 
 #include "axg-tdm-formatter.h"
@@ -20,6 +21,7 @@ struct axg_tdm_formatter {
 	struct clk *lrclk;
 	struct clk *sclk_sel;
 	struct clk *lrclk_sel;
+	struct reset_control *reset;
 	bool enabled;
 	struct regmap *map;
 };
@@ -75,6 +77,24 @@ static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 	if (formatter->enabled)
 		return 0;
 
+	/*
+	 * On the g12a (and possibly other SoCs), when a stream using
+	 * multiple lanes is restarted, it will sometimes not start
+	 * from the first lane, but randomly from another used one.
+	 * The result is an unexpected and random channel shift.
+	 *
+	 * The hypothesis is that an HW counter is not properly reset
+	 * and the formatter simply starts on the lane it stopped
+	 * before. Unfortunately, there does not seems to be a way to
+	 * reset this through the registers of the block.
+	 *
+	 * However, the g12a has indenpendent reset lines for each audio
+	 * devices. Using this reset before each start solves the issue.
+	 */
+	ret = reset_control_reset(formatter->reset);
+	if (ret)
+		return ret;
+
 	/*
 	 * If sclk is inverted, invert it back and provide the inversion
 	 * required by the formatter
@@ -306,6 +326,15 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Formatter dedicated reset line */
+	formatter->reset = reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(formatter->reset)) {
+		ret = PTR_ERR(formatter->reset);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to get reset: %d\n", ret);
+		return ret;
+	}
+
 	return devm_snd_soc_register_component(dev, drv->component_drv,
 					       NULL, 0);
 }
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
