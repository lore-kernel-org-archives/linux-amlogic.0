Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064D0C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Jun 2023 13:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pts/kqNUGIk5TlGyyYHgvHXqC+BqZXE7xXUj4VyolkQ=; b=mUi9dXd9CgRkKM
	05Vb2OdCMBxjh+8fXVZSaellpWb+5DVNklyxpTVPbeifuad6+xBU0WUzWApXjn887pCdkGmEcEBP5
	sSYVfHPRC3JscEDKqJ+llDE378lAzn/z+AswSmt2Ss2/rSsgY/XUrXDG5yHAXcwXTtHjj/VLuy5oc
	c8rp4H+WbKocE1mrBt9WBgQUywMQlKOUggGibKZ5dxruzF9tvYaR79kau81LGYxmF2jfpEKPylPpK
	Hr1jYAF42jProUTgcKHF43moHEsRyS6RM5Pt8P/zh9oro9/cAhtcJUq4KWzO5f7DM3UVgQtTLOmMo
	2gE7fA+PJU4jxztxmzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7yiM-00GFKh-2L;
	Sat, 10 Jun 2023 13:33:10 +0000
Received: from smtp-18.smtpout.orange.fr ([80.12.242.18] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7yiG-00GFIM-0g
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Jun 2023 13:33:08 +0000
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 7yi5qGFtQVKwS7yi5qth7a; Sat, 10 Jun 2023 15:32:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1686403976;
	bh=kw2eOSJ4V5gSFaEZFeVcNGutktWcvfZoGnpsREiIJQQ=;
	h=From:To:Cc:Subject:Date;
	b=UtCoAA5syEW/TxvW4W3YpIYtZSU51UIR9jSTzm0tptj+Llh8jKD4DCGH2QIA/fsut
	 1zufdLSmvyXqCzcKqAPUMBblgm0zfyf/C2QGvVj9rQGax99LWOMO8tLpSGZEsv+x2Q
	 +BILiaTpujcAaEUs+x/SfrZngrnu2oTmR6MApU+YNNPXA1vuRecdft8E5GNVsXvkx1
	 tol9LhHVe+ETUjfgYK0xGEPM/0MPOZRifUkRoLRns0UtbUCQT9n8l7SnNoN4uljYZb
	 0XH7n06C+3ARMwBK3GMAgjj0iIq4RIhOEih4M7KbTX1+HsyC1Vh9V076htHamhKxT6
	 HaiiVWE4x5riw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 10 Jun 2023 15:32:56 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Felipe Balbi <balbi@kernel.org>,
	Yue Wang <yue.wang@amlogic.com>,
	Hanjie Lin <hanjie.lin@amlogic.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] usb: dwc3-meson-g12a: Fix an error handling path in dwc3_meson_g12a_probe()
Date: Sat, 10 Jun 2023 15:32:52 +0200
Message-Id: <9d28466de1808ccc756b4cc25fc72c482d133d13.1686403934.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_063304_679478_7EF081C3 
X-CRM114-Status: UNSURE (   9.84  )
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

If dwc3_meson_g12a_otg_init() fails, resources allocated by the previous
of_platform_populate() call should be released, as already done in the
error handling path.

Fixes: 1e355f21d3fb ("usb: dwc3: Add Amlogic A1 DWC3 glue")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 365aec00d302..e99c7489dba0 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -796,7 +796,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = dwc3_meson_g12a_otg_init(pdev, priv);
 	if (ret)
-		goto err_phys_power;
+		goto err_plat_depopulate;
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -804,6 +804,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_plat_depopulate:
+	of_platform_depopulate(dev);
+
 err_phys_power:
 	for (i = 0 ; i < PHY_COUNT ; ++i)
 		phy_power_off(priv->phys[i]);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
