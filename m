Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93539C4727D
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 22:22:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D5823A62
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 22:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rql4dCvY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ijGeb349"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95D5823A62
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EhjuEzattwu/EN80vSot8xk462Z+XKF4sMFr2BxFPR4=; b=rql4dCvYjhx/Oz+MF0GRG/U4V0
	vB12pM4l1NXhqs8c2fCLT3pI/vFfq2PpF6lExYaJA5W87OAu7W+PKtlLwVSQFzhHJAq8HNR3HnTT2
	LetBTTejfJhRMsyHAR02SET7LChcNyWxuDxeq6eQgsIC9liRz+WnfrKS308ZYcCQn6TFAJ36O4NWV
	tUlx8aKdw2JVNHIBjpzBt5l75nVw/EgSjpUsiiSERQ+8dVMY1tpcyEF21GyrgDaqnJ9QrvNQRXwSI
	MgE2DS4utxbLfr6k+92oRKOvEnQLJw/Ge23YAao6G07PnpjVVJ0iwGctu9ElzJ/jCvA+AKT0+pXZz
	sBQ0W/rA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKUBv-0000Bn-P1; Mon, 21 Sep 2020 22:21:47 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKUBm-00009G-Kr
 for linux-amlogic@lists.infradead.org; Mon, 21 Sep 2020 22:21:40 +0000
Received: by mail-pg1-x542.google.com with SMTP id g29so10269598pgl.2
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Sep 2020 15:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykwjXB6WdjqJ2Er4PKprTUmmzZunM3e7B0bH3KcPPYs=;
 b=ijGeb349Qylq0i1CgeSHKT0hJkZZZS4KfX+SHA9IbLTBpxC4tuvuLiBnQyINbOYbJb
 mqewvppe7FDvprL48bpBq1vGPfNsHLCpxfM3uDKvA5ztJu/S4Z5PjJS+vvw5ZkZkAiNz
 4VutBFDVPUNzmOpuWtWYRLBiEQa7P6hQVqKUOtxpipGXFKPkWu/ht11hhznG7MzFRQk9
 qHkr7JMtFdg3AD9ggcDvwecWVCKAmv17WjsaqXGxKjnYIgl20Y5lOYlTzLCwZw3AADux
 YBvS5oWMd1rBakS144aLK2tIu7FXHOyKsL97TNRo2dr/Fy/u1rSKJkhQqdRq8BRd5asZ
 cNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykwjXB6WdjqJ2Er4PKprTUmmzZunM3e7B0bH3KcPPYs=;
 b=LgDVey0v6HtAYsLRDmseP1nV5n5M8U4wuwUx9BKHwMxCVi2HfH1PMZidBsA+FVZKp3
 dIZZh7jetmU7Alh8YXLZ0ysJ4pktOW8AoDcrNvAu4sB0IX7A2DGo+doXHlyyqoLaFeGy
 YYeVv87mnjpendS/LwsRJYYBf0Kv1k5zykg3TpU5nLURjfPbTxwlWHTn4zIf7ofsq72I
 eKZf2JponwsAfeUJk36TLtEvpwJKRGtmMCQTxlFMftfxmfyyVxuPG+HvL5XxjSu1RGHX
 zK1H5m5DxGOWpRiMcjiIVLh+SNlatsEx78GmXWKXwUnsz5rP1o2gguHddXCGA+us+uuk
 e0Ew==
X-Gm-Message-State: AOAM531uPMtlNDFb60/+ULBTVy3AkltY2gv1WMdbkRe2wkgfnR+k6TXR
 C7jW1OsFD+VnYF9g7Wn04ukG1RjgVtvydg==
X-Google-Smtp-Source: ABdhPJwDM3/meWjbdyVZyiUxFW3WwB1EdEPWDYHuApqSJlshXSM5afAB66ItHRM/P+f3aHb4b4ETbg==
X-Received: by 2002:a63:778d:: with SMTP id s135mr1300542pgc.219.1600726896256; 
 Mon, 21 Sep 2020 15:21:36 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x5sm11834198pgf.65.2020.09.21.15.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 15:21:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH] soc: amlogic: pm-domains: use always-on flag
Date: Mon, 21 Sep 2020 15:21:35 -0700
Message-Id: <20200921222135.7145-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_182138_719561_60C51DEA 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rather than use a governor to keep these domains always-on, instead
use the flag GENPD_FLAG_ALWAYS_ON.  This has the same effect, but with
much lower overhead since the governor path is not used at all.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c     | 4 ++--
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 43665b77aa9e..a8f18bb17491 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -433,8 +433,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 		if (ret)
 			return ret;
 
-		ret = pm_genpd_init(&dom->base, &pm_domain_always_on_gov,
-				    false);
+		dom->base.flags = GENPD_FLAG_ALWAYS_ON;
+		ret = pm_genpd_init(&dom->base, NULL, false);
 		if (ret)
 			return ret;
 	} else {
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 511b6856225d..21b4bc811c00 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -339,8 +339,8 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	pm_genpd_init(&vpu_pd->genpd, &pm_domain_always_on_gov,
-		      powered_off);
+	vpu_pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
+	pm_genpd_init(&vpu_pd->genpd, NULL, powered_off);
 
 	return of_genpd_add_provider_simple(pdev->dev.of_node,
 					    &vpu_pd->genpd);
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
