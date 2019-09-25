Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547B8C432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:35:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2936321D80
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:35:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ew29mUdQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/y8cEL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2936321D80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qj6uLeZQwCuX2kZ9J9moMTPNV6hxp7q0lWgBMs/FmgM=; b=Ew29mUdQkKmcJV
	eoi4Y3oAoopaFZ/1+1OKKfk89/gMM73s9Ne6YW9OS6HE998dW+5aV+v3dG33TBDcqUC4nvDyFpT7l
	HgR3sKh4cOJcF9W/kEnf07f16YiCqzUQRHO7+aJfvi3LS/YyBr0dZe24dvZFUoIX7QthHp1Dr5+vd
	0EjEmTMqY8/u/PzUfrsB3A9OmNrnGWWor2GtLfGs1e5EErppQU1ll127opTbo7yj979FOEMKenvTU
	o28p00Fo/av/ZjN6EvvnH/Ukkjx3bbTg0rTgI3PigqVV9NMsW2Bo0ZIp3NpTlIBPQwDCcZ1ct9aIV
	E1OrXQl0TIKqQ4JcNu3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDEwi-0000YM-8g; Wed, 25 Sep 2019 21:35:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDEwb-0000Vs-RT; Wed, 25 Sep 2019 21:35:33 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83E3A21D82;
 Wed, 25 Sep 2019 21:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569447329;
 bh=qm/TdfonbBzBB/AEHmYGEpSlc7ICBztPIwTfuRqbwv0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h/y8cEL15FyXJTSLNSZSc+k2fzrMcA62zUDP0csgm/5a/oHeq7hjHdO3+TE3RC6st
 W0uleeTy6Jz39AWP6uZQlF8WwahXXnzNjcv89jO03sDOcmtDn15/oUMF/iZWaTM+Gn
 F/uJ1kwkcR8hqxdOs6ZKMUQaCbUeagY49RY0o+Yo=
From: Kevin Hilman <khilman@kernel.org>
To: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/2] soc: amlogic: ee-pwrc: ensure driver state maches HW
 state
Date: Wed, 25 Sep 2019 14:35:28 -0700
Message-Id: <20190925213528.21515-3-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190925213528.21515-1-khilman@kernel.org>
References: <20190925213528.21515-1-khilman@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_143532_635045_C4379FE8 
X-CRM114-Status: GOOD (  14.66  )
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

From: Kevin Hilman <khilman@baylibre.com>

During init, ensure that the driver on/off state as well as clock and
reset state matches the hardware state.  Do this by always calling the
drivers 'on' function, and then callling the 'off' function if the
HW state was initially detected as off.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index dcce8e694a07..2e8eee0dc166 100644
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
@@ -356,27 +358,12 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
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
+	meson_ee_pwrc_on(&dom->base);
+	if (is_off)
+		meson_ee_pwrc_off(&dom->base);
+	pm_genpd_init(&dom->base, NULL, is_off);
 
 	return 0;
 }
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
