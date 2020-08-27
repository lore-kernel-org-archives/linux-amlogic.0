Return-Path: <SRS0=UOMd=CF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5514C433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 14:48:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 762EF2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2020 14:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tl5RVVDQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S4pcjGYX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 762EF2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rdSuZlQXpO6Spzp+iL4/6ljohdSsn7vqUDUdQrpVjxI=; b=Tl5RVVDQRb01885rkIBueNnBsh
	TCszBEhkXcpZZ0bGhwzSFEPT99svrk2vPFf7kl/ISid68XgP5wV2ee4VPEncareST2fNmjKYMdIW2
	wBzHzqDSMUa2Qmuavv19sZqa7urZiLP83P1gJXiEmL3ichVjIXejY7Gfd3S+7aDYwYZcQnlfRJA5n
	ncklNvJ60seANRnYfSjgwou3s6OIsI7GEev4qrIJXU/vF59OlSdkaebYwCGFQK3uT0uQvO8ZApddh
	HYB4O5N+HK//cBtT8ZaDGtpQRCxuzYUjyslrG92UW43TNe9Y4EScnUadjqTwZ0Jgmyq4FZy7i0zQZ
	eSYZ2Kpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBJCa-0005qq-Rv; Thu, 27 Aug 2020 14:48:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBJCX-0005pd-RD
 for linux-amlogic@lists.infradead.org; Thu, 27 Aug 2020 14:48:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id w2so5211751wmi.1
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Aug 2020 07:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=US0rKLWi0Ij67svDuIlZzqQZrRksxzdQhyeGx2i0lHA=;
 b=S4pcjGYXLbtMtCdpP90WCSGT29fBBzW7vj9f/R0GaIuYOTidERM3wLubMrY4hB2pbg
 blCZiFzfpu7LOlZm6YLit8h2vBenAXIDzbDKpM1nyGz68tCsEf6aFR2LSVWXDA7UQFCi
 WdYhRjw+1HzPQng1fIkDEVMVYcChzzL2se2+/0o39WTH6pL6dzkjK9YOX3zfOt59Hpov
 GFIB09ihBviRr0RBGQ/59DE1I0zW9GY3AXKRJmmsRdkAzy83fGSOOEGX4+VsQReIfA77
 o1ay6NYxCmZ3A6ZpgyPhpvuXQanBmWwCd5U0T9nIpgxp/O7eFuV6j2CmKkNpXrP58sHC
 l3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=US0rKLWi0Ij67svDuIlZzqQZrRksxzdQhyeGx2i0lHA=;
 b=EIVUdn4Dlkbn46GQOY9TYMWB0iXkC5rtjbS8tuA/pldBR7Z/sBfeQZxlSj7QH6SW+0
 mpRXUoQ7CsHP2Np6istcNR4xe++5bzfFPKUY51JO6EmjhIiszLTiosFX8cLk4GaZnuGs
 NONJHWdoZrqKikz3wGjUlWxTtTWig4Ax6ik8btMR4KEblPGU3UJkeUI8CSxqmQKZu68s
 oRG/NwVChKfVw+1vAVGqzWjBKLjQ/BwvCRYG+8ZysnR/aknS3UCWel3FoSyJzedJd49h
 CuJfih1KR4j+gkT5d62JERXk3CkVdAbJS7X1MjW6CU+Vt8UfMSJLXYoEyNW85v31llSO
 MFjQ==
X-Gm-Message-State: AOAM530ibehPGbXxAuxhx6OHxDFvudhXFtbhPijhM+rOewIu38UbQ+zK
 RS0Nn+rO7rgcdfS402Wz0fzkDA==
X-Google-Smtp-Source: ABdhPJz1h5Fc45F5daqe66MhiGIVffd268qdCjCnPYhDLTXCqIsKqtcM61Fi0N5Ml5xq7+km3yCXYw==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr10242160wmc.122.1598539707094; 
 Thu, 27 Aug 2020 07:48:27 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 33sm6756659wri.16.2020.08.27.07.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 07:48:26 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] Revert "usb: dwc3: meson-g12a: fix shared reset control use"
Date: Thu, 27 Aug 2020 16:48:10 +0200
Message-Id: <20200827144810.26657-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_104830_016335_831F5AD6 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Dan Robertson <dan@dlrobertson.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This reverts commit 7a410953d1fb4dbe91ffcfdee9cbbf889d19b0d7.

This commit breaks USB on meson-gxl-s905x-libretech-cc. Reverting
the change solves the issue.

In fact, according to the reset framework code, consumers must not use
reset_control_(de)assert() on shared reset lines when reset_control_reset
has been used, and vice-versa.

Moreover, with this commit, usb is not guaranted to be reset since the
reset is likely to be initially deasserted.

Reverting the commit will bring back the suspend warning mentioned in the
commit description. Nevertheless, a warning is much less critical than
breaking dwc3-meson-g12a USB completely. We will address the warning
issue in another way as a 2nd step.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 88b75b5a039c..1f7f4d88ed9d 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 		goto err_disable_clks;
 	}
 
-	ret = reset_control_deassert(priv->reset);
+	ret = reset_control_reset(priv->reset);
 	if (ret)
-		goto err_assert_reset;
+		goto err_disable_clks;
 
 	ret = dwc3_meson_g12a_get_phys(priv);
 	if (ret)
-		goto err_assert_reset;
+		goto err_disable_clks;
 
 	ret = priv->drvdata->setup_regmaps(priv, base);
 	if (ret)
@@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-			goto err_assert_reset;
+			goto err_disable_clks;
 	}
 
 	/* Get dr_mode */
@@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-		goto err_assert_reset;
+		goto err_disable_clks;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		ret = phy_init(priv->phys[i]);
 		if (ret)
-			goto err_assert_reset;
+			goto err_disable_clks;
 	}
 
 	/* Set PHY Power */
@@ -809,9 +809,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	for (i = 0 ; i < PHY_COUNT ; ++i)
 		phy_exit(priv->phys[i]);
 
-err_assert_reset:
-	reset_control_assert(priv->reset);
-
 err_disable_clks:
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
