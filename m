Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDF8C4708F
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:48:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA876138C
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 08:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA876138C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RxCdbl9LMlzVVvuZoP8oJ8d+Ti3pAD0Y3zIGkWjRL/8=; b=M3Jj5bhYI6Lgb6
	P4hxm5kTcnPlnbTkbKibpR2gNtccs64HZZ5FoUy5SMrup5rIxQoS3wzNkDvfsXCsf5OLANA377lVJ
	wSrQ3vjI/ccUQvujsRuN1mPZf2dQXbMKW38FSizxSdlg7pMWubpMIAINCkIJdmDQMo8/rMZq1JP7Y
	8PsixviciCguS9LEmdwtcvrcv4wWvYsMfmQiKIDU3NKIpyvBjLA8WmkQefdfxfU02QKw94lhujjsP
	tPQ8qOV4s1maoAXQeToV3v+ku2VDaBuxTmSsJFFSYfXMNPu6a5sg2hgzzcjd8nWJBe27UYjl9uNAI
	8sP2vPARicf78vorDhJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo04k-00FQ1S-36; Tue, 01 Jun 2021 08:48:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo04h-00FPy0-CR
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 08:48:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id l2so5908122wrw.6
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HsyI5GdZuVzBJ4Q40lGtjbheVohc16mnJhwL7iMTmSw=;
 b=xaimFvKzZB07yjuzlZWyPID+i3O41/kcqJPcS6iQTWYstiOp6aDbYne2LEu5c5Bux7
 3X91TH+ey2cmfMXZ8kv0um25JeEv8d8DqKkZfsjA0q4JdTqyq9I6DPvCkw9m4c1tt1tf
 lPn1qCjbi02nMpYFRTg/itPrKYtWrubWxcg56rL0v7agha79MwcofUh5IEPUhisFoHHi
 5UqOQYX3i8u2pq8/W+d/9E1fc17DzamiGADiKsbfUwM7uvp1mIfiiQ5SLqhtevM5f3pl
 BnMKeRC6P3WWASjB21jSQrIW4tuqsodmzAcONWwCXZj3Zh7rFDkH9hvR5rdJCpUtLySu
 zguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HsyI5GdZuVzBJ4Q40lGtjbheVohc16mnJhwL7iMTmSw=;
 b=g4X+PlVH4TR4CPWwYWO1sZrkmOYiTuuCCIyYso2svDgugpRhPpAfy6dCW8Xy5luu0B
 DMPVs3ILYU10ZJTh2kg/9E51BblCG/Hl6ptsrsc6O6Tq5UXfOrDCu1be2dR3gEczmS3r
 8T1ygb+AZzLycBVYpYD5XIoeQstjB9WWHvCGKf1Nu7ZaVWMpyc62tEDNzQ2mjDLMCEai
 4ptlEBPOJg0I2RcUWFXPv4TLM52wzI0gjuwItWVa3XZ5nMFuloI4WyoGRsQ4FpqOxLSs
 7hLfFMp1ywPdvvJ0FUG74VNNsktCSOXJhRCK/gk+9u3CfhcObW4Bjkk76abmxDu0j6m/
 b/dQ==
X-Gm-Message-State: AOAM533nq//D/k7WMegLnt8ogAQ9GlGynULjpWsx0sItdsbf2nXqJ7SK
 mTfCwwIc6htZvHMnx2DSBJbNWA==
X-Google-Smtp-Source: ABdhPJwicPfpiz9Ps9bnHfK5U9UhZq6pV1e3HJK+KjRppnJs8C7vVjbqoq40pD23inszRKpnR1omzw==
X-Received: by 2002:a5d:4c49:: with SMTP id n9mr26124117wrt.417.1622537313482; 
 Tue, 01 Jun 2021 01:48:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 t14sm1710470wmq.16.2021.06.01.01.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 01:48:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org
Cc: linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0 is
 disabled
Date: Tue,  1 Jun 2021 10:48:30 +0200
Message-Id: <20210601084830.260196-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; h=from:subject;
 bh=Qf752RJbSHGdE83hMRrW4mM1Uj4TitFrYwm+jlRhNvY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfRG0QSALHdUEWJSyZF78sJxWZurbP2ZCdFuehVl
 tryIs/6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX0RgAKCRB33NvayMhJ0ediEA
 DAEklNiHPCq29uk/iUjjt18PU0FxsriKAlJsf0WAkT4X8QAiBmOmFWHhG52Ugh1DIAar9YxggiaLVp
 nxIoiNOEcUG0n8PYca4XoMrrT/K9Qg6gyuEvdtdf5im26Z/pZzMpSQdaG+yzXlOdzA4vRxVv531vZb
 HE2G7Y5C3/G4eVYIXeN25A61PxbEp0XQLJgrIbZQrsa2x34Da0So46A1PBZ+/KG9xyi+lYk/uo8Ol9
 +1CoMKDwOJr36+PL2pDgXEG8bPMqbJdOEcuMXihqH9ZOdSSaRqiX/Xcll0063Hgzp0sSid7J1Eux8W
 gZ3Y2egjh3e1b2q3dPU9JHrDyAMTCKtqzlwTzs2g3TZE+XT5deZ5THiOyZ8T/Ix2y4L1P71LeSuJNS
 T4MsZIp+MZueAd8D6CzH/rQZ5ogCFHdde8gA1ukOF2ow/Ji4P6fzzTSi6BbnreT1fv/ZGxJdIuPqe5
 3ChDtsFjVHfhBHOC8R4mOiLV+r7lriC2CdtjSesNqpyy4AhHLqFgJF0tUweDK4axJuKblZdeSKYLW9
 cN/48ySEMgJKSp7eHV6wLlIwsWhj79IUbfaBAcb5TQHwh/w9XfRLHGeXrqljzkz1KcOYFK8hEMMTqP
 GeqUnb0elGu5F1Qkh3MHos8Bfr7d5LhnJNGf48gOJpL5I8+HP1qXf2LUG4lg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_014835_483629_1153E460 
X-CRM114-Status: GOOD (  14.57  )
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

When only PHY1 is used (for example on Odroid-HC4), the regmap init code
uses the usb2 ports when doesn't initialize the PHY1 regmap entry.

This fixes:
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
...
pc : regmap_update_bits_base+0x40/0xa0
lr : dwc3_meson_g12a_usb2_init_phy+0x4c/0xf8
...
Call trace:
regmap_update_bits_base+0x40/0xa0
dwc3_meson_g12a_usb2_init_phy+0x4c/0xf8
dwc3_meson_g12a_usb2_init+0x7c/0xc8
dwc3_meson_g12a_usb_init+0x28/0x48
dwc3_meson_g12a_probe+0x298/0x540
platform_probe+0x70/0xe0
really_probe+0xf0/0x4d8
driver_probe_device+0xfc/0x168
...

Fixes: 013af227f58a97 ("usb: dwc3: meson-g12a: handle the phy and glue registers separately")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index bdf1f98dfad8..9c944bc6d555 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -651,7 +651,7 @@ static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
 		return PTR_ERR(priv->usb_glue_regmap);
 
 	/* Create a regmap for each USB2 PHY control register set */
-	for (i = 0; i < priv->usb2_ports; i++) {
+	for (i = 0; i < priv->drvdata->num_phys; i++) {
 		struct regmap_config u2p_regmap_config = {
 			.reg_bits = 8,
 			.val_bits = 32,
@@ -659,6 +659,9 @@ static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
 			.max_register = U2P_R1,
 		};
 
+		if (!strstr(priv->drvdata->phy_names[i], "usb2"))
+			continue;
+
 		u2p_regmap_config.name = devm_kasprintf(priv->dev, GFP_KERNEL,
 							"u2p-%d", i);
 		if (!u2p_regmap_config.name)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
