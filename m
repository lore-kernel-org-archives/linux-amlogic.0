Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE3FC433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:38:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF226101E
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FF226101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DH53C+F2cnE25laeVFMtXuWjhaycsibb1pDWUv4eKno=; b=DOF7rIVabUis5dQiEawKXfz0ld
	Jmemm1nBFYDOrbKeb9uPPTYyv5HQty93EOiWYT7sqyEWjjcO/pPQPtaun73f9vSzLs2e0Jnj1KHfu
	8L9ohXye9+MlE1/kgMo2P5xMEEMNDT8i/oHedVMof0ZlTc3OknNJ13/n2AW47xMdcwrBR2FffBE8J
	HpWw0Eu806q6UvaeH8bI5tQlybORTg/XNnczL5devzDlAEVnTgf+9ghv+YmQRcC9i/HLOIP2DE/HA
	mwtWp3kR2AsD6QhajvNAd7KKEJq7zT8t9dNnCPXGaQ6kRERIhWp7hz6IajfG6H4kOBSxdWIAOBbva
	Gdg04y8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcDQK-006SDS-Uj; Thu, 29 Apr 2021 20:38:13 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDQI-006SBp-CZ; Thu, 29 Apr 2021 20:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pWM5Xu7wIYzZp7eGSboEhbdiiLmMWtTkOWFVFd4JcnA=; b=FsgjVq67UKDuorYRR6OpMiOshy
 UjhDymCQCviEUZIXRKzXrx2L+aBkxZZA51u74/adYkbwYk+5hUkoVXkrsZotRsKMJaqNjznhMSUDA
 SeiuszL37j8jT889mf7OAck+1DSzgiqUQa3xGm9YB2RYt657Otx8ydbLNCRniLUMqm/6Nbf5APaxy
 x4sQLd38cMar8YYvSloig/6h2oxlmViKTL4EDKRgNegNBnurx08Yd8NTh7N3BesxH3Y1IwyA4SdKb
 pkeXChrHcqZ+iEVruIyOPx60BXUCGru8aOeRIMjMoaz11Lf11V96YoxiuV2ACkPRW+wBDpECQKOW/
 3U9ackcA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDQ5-000xph-5M; Thu, 29 Apr 2021 20:37:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id x7so68176144wrw.10;
 Thu, 29 Apr 2021 13:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pWM5Xu7wIYzZp7eGSboEhbdiiLmMWtTkOWFVFd4JcnA=;
 b=hLFx5PLWQIR3xKQ/5IvKVagswkOhcm/GYU8c3GAMQo/ARWnheC5evOm0VRegdVMQdj
 lPVmQRHkXHfAaD24FiV3svwy5Uu7udU0IgFQjrDFeZSDxpfIa/119r4zjJf/SlQXDSfE
 amaHQw4lU5hruHI5Aea41azqdX411FSF2RNw1Ihf+x1pPT7NHbA+OFOtFh4wpfDoU2yk
 T7tFv0ATcuhV7ZuFOy9WiW6Q7oMKHxD8xQXxOZ43njQuUjudVul3ranRu9e9N2+K3/R5
 dyjpFKpVyojtPLDAqB2tGDJyNk20yjdbekRxPUokFE9YsRSIEhQVSflEby+8OqkUf8zP
 EB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pWM5Xu7wIYzZp7eGSboEhbdiiLmMWtTkOWFVFd4JcnA=;
 b=sE2o07kxOMfONdpeSeJsD17lU3Qip4xoiKY4jivvn5W6gJXZ/zkKvSi2o6WyIBPxuR
 9ljEXgOWtI+izTRAtI5y0Ksd3oyA6JfLhGMLz85uq0o8oNHSZLotsCHpzIsTrOG2jWB5
 oHCRd89w7UssukFBGTspcMVDS34vCshGBy8MSvT8ifnrZGrq/XaLu1qAhw7u8gbe+Jye
 3QKRErHXGEMNP547RTP65UiYrxqkOmr2bZeXagw4DmKpuur9fxaS+WkqUjXcT+9L4GG+
 85sQF692upkr34JOLmT+fdngKuKGN6JB9sF53shP+CtAJPH48RYca3C5H7v5qCrHsag1
 rJ6Q==
X-Gm-Message-State: AOAM531LyfsFDU3Non/3EJC18Dxgvy9ycrCj/QwbOJ/TGEIm5nYUzSrA
 bPwiFo/F0lp3j0ODeJLGWPk=
X-Google-Smtp-Source: ABdhPJxxMcPB1qB93AqtUnS0W3Ivqgh+wLZPQhhTw0o5uWxhLaDTAKddo/FzVK4CmSCTMhM3hNuPhw==
X-Received: by 2002:adf:e8c4:: with SMTP id k4mr1841574wrn.262.1619728674667; 
 Thu, 29 Apr 2021 13:37:54 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137153600428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3715:3600:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id x25sm11635783wmj.34.2021.04.29.13.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 13:37:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH RFC] soc: amlogic: meson-ee-pwrc: Drop the .shutdown callback
 from the driver
Date: Thu, 29 Apr 2021 22:37:23 +0200
Message-Id: <20210429203723.1177082-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_133757_250942_FE5177E1 
X-CRM114-Status: GOOD (  42.98  )
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

Stefan reports that rebooting his ODROID-N2+ (using a G12B SoC) results
in the board hanging. His kernel config uses:
  CONFIG_MESON_EE_PM_DOMAINS=y
  CONFIG_DRM_MESON=m

He reports that his kernel config results in the DRM driver's .shutdown
callback to be executed after the power domain driver's .shutdown
callback. That's problematic because meson_ee_pwrc_shutdown disables the
clock which are used by the VPU IP. This causes the board to hang.

Further he reports that changing from CONFIG_DRM_MESON=m to
CONFIG_DRM_MESON=y reverses the order in which the DRM and power domain
driver's shutdown functions are executed, making the reboot successful.

The reason why we use meson_ee_pwrc_shutdown is because of the VPU power
domain (which is causing the problem described above). It can be left
enabled by u-boot. According to the original TOFIX comment in
meson_ee_pwrc_init_domain we need to be careful because disabling the
power domain could "cause system errors". As a workaround the clocks
are manually enabled in meson_ee_pwrc_init_domain and the power domain
is marked as GENPD_FLAG_ALWAYS_ON (so it can never be turned off).

Experimenting has shown that the power domain itself can be disabled as
long as we keep the clocks enabled if u-boot enabled the power domain
but we don't have any driver enabled for the VPU (CONFIG_DRM_MESON=n).

Keeping the clocks enabled is the responsibility of the CCF drivers, not
the power domain driver. Even better: this is already covered as all
gates in the VPU and VAPB tree on GX an G12 SoCs have the
CLK_IGNORE_UNUSED flag set, meaning: if the bootloader has previously
enabled the clock we're not touching it until a driver explicitly asks
to enable (and then disable) it. In case of CONFIG_DRM_MESON=n we're
never calling meson_ee_pwrc_on, meaning that we always keep the state of
the clocks as set by u-boot.

The original TOFIX comment also mentioned that we need to make sure not
to mess up the clock's prepare/enable ref-counters. This is the only
requirement that's left for the meson-ee-pwrc driver that needs to be
managed for the VPU power domain.

Three steps can improve this situation:
- Don't prepare and enable the clocks (just to fix the ref-counting) in
  meson_ee_pwrc_init_domain if u-boot left that power domain enabled.
  Instead, remember if the clocks are enabled in meson_ee_pwrc_{on,off}
  and only disable them if we have previously turned them on ourselves.
- Drop GENPD_FLAG_ALWAYS_ON as we can always manage the state of the VPU
  power domain if both the power domain controller and DRM driver are
  enabled (=m or =y). If the power domain driver is enabled but the DRM
  driver is disabled we can still use meson_ee_pwrc_off because it's not
  trying to disable the clocks anymore
- Drop meson_ee_pwrc_shutdown as it's the responsibility of the genpd
  framework to call meson_ee_pwrc_off when needed (either when a power
  domain is being disabled - regardless of whether it's was used by a
  driver before or not). Now there's also no more shutdown callback
  ordering dependency between the power domain driver and other drivers
  anymore.

Fixes: eef3c2ba0a42a6 ("soc: amlogic: Add support for Everything-Else power domains controller")
Reported-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Neil, I would like you to specifically review (and re-test) the original
TOFIX part. I *believe* that I understand the original problem and hope
that my approach also works in that scenario, but I am not 100% sure.

Kevin, as you're my go-to genpd expert I am also asking you to review
this to point out any issues you see.


 drivers/soc/amlogic/meson-ee-pwrc.c | 76 ++++++++++++-----------------
 1 file changed, 31 insertions(+), 45 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 50bf5d2b828b..534c33ba31ce 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -353,10 +353,26 @@ static int meson_ee_pwrc_off(struct generic_pm_domain *domain)
 
 	if (pwrc_domain->num_clks) {
 		msleep(20);
-		clk_bulk_disable_unprepare(pwrc_domain->num_clks,
-					   pwrc_domain->clks);
+
+		/*
+		 * We are only allowed to turn off the clocks here if we
+		 * have previously enabled them ourselves. In other words:
+		 * for an "unused" power domain (which is not used by any
+		 * power domain consumer) we have not enabled the clocks
+		 * previously so we keep them in the state they are.
+		 * This is relevant for the VPU power domain which may
+		 * have been enabled by u-boot. If the display driver in
+		 * Linux is disabled then we need to keep the clocks in
+		 * the state as u-boot set them, otherwise the board will
+		 * hang.
+		 */
+		if (pwrc_domain->enabled)
+			clk_bulk_disable_unprepare(pwrc_domain->num_clks,
+						   pwrc_domain->clks);
 	}
 
+	pwrc_domain->enabled = false;
+
 	return 0;
 }
 
@@ -392,8 +408,14 @@ static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
 	if (ret)
 		return ret;
 
-	return clk_bulk_prepare_enable(pwrc_domain->num_clks,
-				       pwrc_domain->clks);
+	ret = clk_bulk_prepare_enable(pwrc_domain->num_clks,
+				      pwrc_domain->clks);
+	if (ret)
+		return ret;
+
+	pwrc_domain->enabled = true;
+
+	return 0;
 }
 
 static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
@@ -434,33 +456,11 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
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
-	if (dom->num_clks && dom->desc.get_power && !dom->desc.get_power(dom)) {
-		ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
-		if (ret)
-			return ret;
-
-		dom->base.flags = GENPD_FLAG_ALWAYS_ON;
-		ret = pm_genpd_init(&dom->base, NULL, false);
-		if (ret)
-			return ret;
-	} else {
-		ret = pm_genpd_init(&dom->base, NULL,
-				    (dom->desc.get_power ?
-				     dom->desc.get_power(dom) : true));
-		if (ret)
-			return ret;
-	}
+	ret = pm_genpd_init(&dom->base, NULL,
+			    (dom->desc.get_power ?
+			     dom->desc.get_power(dom) : true));
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -528,19 +528,6 @@ static int meson_ee_pwrc_probe(struct platform_device *pdev)
 	return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
 }
 
-static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
-{
-	struct meson_ee_pwrc *pwrc = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0 ; i < pwrc->xlate.num_domains ; ++i) {
-		struct meson_ee_pwrc_domain *dom = &pwrc->domains[i];
-
-		if (dom->desc.get_power && !dom->desc.get_power(dom))
-			meson_ee_pwrc_off(&dom->base);
-	}
-}
-
 static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
 	.count = ARRAY_SIZE(g12a_pwrc_domains),
 	.domains = g12a_pwrc_domains,
@@ -606,7 +593,6 @@ MODULE_DEVICE_TABLE(of, meson_ee_pwrc_match_table);
 
 static struct platform_driver meson_ee_pwrc_driver = {
 	.probe = meson_ee_pwrc_probe,
-	.shutdown = meson_ee_pwrc_shutdown,
 	.driver = {
 		.name		= "meson_ee_pwrc",
 		.of_match_table	= meson_ee_pwrc_match_table,
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
