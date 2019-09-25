Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D74C432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 19:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 131C321D79
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 19:13:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RRd5j/f2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 131C321D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8Wih1sdDgvbfJbDYUj3gM0k//42rbxoX9KefkbTXGE=; b=RRd5j/f2smBOS1
	n8b5l/qhu6AmpM6UsEaj6oUQc7MXl7kFaZ3LsHdB8GdQ+onS+adWBsQlzIW54Olee+73XvFS+4vZn
	XNgAbj1bNBNV7GO2NNcNVzngbdy8OiKUjUIpQrO/YmVVgAkHml7QpeK232DaSHs4gCIp/YHuO2ZYe
	sn1i64Q5QwOv4s2wpdrwj2P7Obq/foQj+MpjQNCunqXnodaQN+JcnmijLbojp8VTX8q+a6HRMR1CO
	Cfw6W8cPirP8FM1xhkDLEzVBn5JMm5p92R9oN6FMQd2uDfNBrhRcrAyxb/KukbDf34hscBSg8zri9
	buBSYcmibWIG05i5UyIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDCis-0001kj-LT; Wed, 25 Sep 2019 19:13:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDCiI-0001Ck-Sv; Wed, 25 Sep 2019 19:12:37 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5496621D7F;
 Wed, 25 Sep 2019 19:12:34 +0000 (UTC)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] soc: amlogic: ee-pwrc: ensure driver state maches HW state
Date: Wed, 25 Sep 2019 12:12:33 -0700
Message-Id: <20190925191233.22253-3-khilman@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190925191233.22253-1-khilman@baylibre.com>
References: <20190925191233.22253-1-khilman@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_121234_948145_3E6F2EB1 
X-CRM114-Status: GOOD (  13.54  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

During init, ensure that the driver on/off state as well as clock
state matches the hardware state by calling drivers on/off functions
based on whether the HW state is on/off.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 30 +++++++++--------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index dcce8e694a07..2cb5341aedfa 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -323,6 +323,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 				     struct meson_ee_pwrc *pwrc,
 				     struct meson_ee_pwrc_domain *dom)
 {
+	bool is_off;
+
 	dom->pwrc = pwrc;
 	dom->num_rstc = dom->desc.reset_names_count;
 	dom->num_clks = dom->desc.clk_names_count;
@@ -356,27 +358,13 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 	dom->base.power_on = meson_ee_pwrc_on;
 	dom->base.power_off = meson_ee_pwrc_off;
 
-	/*
-         * TOFIX: This is a special case for the VPU power domain, which can
-	 * be enabled previously by the bootloader. In this case the VPU
-         * pipeline may be functional but no driver maybe never attach
-         * to this power domain, and if the domain is disabled it could
-         * cause system errors. This is why the pm_domain_always_on_gov
-         * is used here.
-         * For the same reason, the clocks should be enabled in case
-         * we need to power the domain off, otherwise the internal clocks
-         * prepare/enable counters won't be in sync.
-         */
-	if (dom->num_clks && dom->desc.is_off && !dom->desc.is_off(dom)) {
-		int ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
-		if (ret)
-			return ret;
-
-		pm_genpd_init(&dom->base, &pm_domain_always_on_gov, false);
-	} else
-		pm_genpd_init(&dom->base, NULL,
-			      (dom->desc.is_off ?
-			       dom->desc.is_off(dom) : true));
+	/* Ensure that driver state matches HW state */
+	is_off = dom->desc.is_off ? dom->desc.is_off(dom) : true;
+	if (is_off)
+		meson_ee_pwrc_off(&dom->base);
+	else 
+		meson_ee_pwrc_on(&dom->base);
+	pm_genpd_init(&dom->base, NULL, is_off);
 
 	return 0;
 }
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
