Return-Path: <SRS0=fCBu=U6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2766CC06510
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:50:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD362133D
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2019 10:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYTeqkpk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F2tVnR2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBD362133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NRZsSilAbfqdPnSJ4ahLjNrIDDb/Ht2XBqWbfp2KLs=; b=TYTeqkpkLUFx/i
	H6kfy3C8TOcn53If0EG6CpCME11eIG0jPc5hniQMn6ZQ9XnE6YpV4RrNKO+wkr05bq+/0lKoOc3We
	vm7wA7hv+jrHmnsKiHT6d/TkXQ7c2by6NJXHPGcr25suVfx6gGZ7RH8tEG1z6ZTz9S0y3DcRDPa35
	W1Q5e3+56yVMDSKYdYq9jyEU4/OsL6Ap0Q579tCuJqKUkyzTZPrAmYHO0PUa8boLotpcCNomVtWqa
	QGtRlRQAfYuCsF05NDpVC1yukD0izQc10in0ge54IvrhuLL9nNp2dquMJaij1AU2mE15sc7foLWPu
	FaR4BUhU4Mf/jo2oECtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhtt2-0001y7-Mp; Mon, 01 Jul 2019 10:50:16 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhtqQ-0006h8-Nm
 for linux-amlogic@lists.infradead.org; Mon, 01 Jul 2019 10:47:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id n9so13315835wru.0
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2019 03:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cDNMs7vyeGU4ItBEGrxn4uIQX4icW4tE6CY0BwZzeYU=;
 b=F2tVnR2jB1XsZNfj2okEZqzs3xC3S6Oouj9gTyIXZeHtZkiw7Tr7BpMKwvWpEsrnEF
 9r0B+gGVGc/sGn7hHLtY8ANc5U1LcH+3Y1eCtdPqJfPltCwiMBEkgJ9G+OKTHAaZlJ48
 yma5ZbqOeVvZh0Eg0T9x+OQQhHnKlMoCgEkD9vYf9NMkRZI3nDx6/gIw2WceJc8G42Wg
 YIsplADMwrUIO7ccZkoaRCM8QfNQjENnDuZVZQNBHjTEE1TlicwLy/mShIMkXuMPsdgV
 Wc53lZRkmtAimiE45onkPUne/3lB73K3/Onicirxd0UcJgqg9IFAhnN9PEwJZzHlgdBH
 SXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cDNMs7vyeGU4ItBEGrxn4uIQX4icW4tE6CY0BwZzeYU=;
 b=Yq0LjuM0SoNP1GEd1Nfg1PYGGs1c6ma9jzxrAIdf1twdonjqtVJb8MhN/BO5pzpS+R
 61boBUuJ11PgxfUzR2pRcJ/p2sWEjjm1EmJR/fhE0do00U+sTMluhuwShX1Oc0nUBhNv
 r+Ua+8kyr4ZuAlYFtCYpEAngaE2XzvlZA0zCrego0pMOMgRy5nqQw24IYKL2trEejjdR
 7/icK7DWikAhfDPVDjHVwlYuwzVD39btIUaBcw/P6/10GUrpdz2nLnsqG2ncnhOFkQMq
 bWlmI3Uo95i54Rt7+a/BDYXwYgeDVz6Pgud2aUx6ctKTRo9RB1cG62xHrujiMOF2qfA7
 sd6A==
X-Gm-Message-State: APjAAAU5Krfn28D778Q8yyDq0gmyZYGa8X0YSy3XFta/SZifzs/L+/rn
 kepui/mEE1ot+neK2TWlUtqQnQ==
X-Google-Smtp-Source: APXvYqxpvZ+wXD54f65Y9xIdncQZjnJsorwD7241UA/QyH8HN4LyX5o51WdwgdOmqi81S5Pu3reXYQ==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr17922728wrt.111.1561978052849; 
 Mon, 01 Jul 2019 03:47:32 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d24sm11658802wra.43.2019.07.01.03.47.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Jul 2019 03:47:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com,
	linux-media@vger.kernel.org
Subject: [RFC 08/11] media: platform: meson-ao-cec-g12a: add support for SM1
Date: Mon,  1 Jul 2019 12:47:02 +0200
Message-Id: <20190701104705.18271-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701104705.18271-1-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_034734_798545_13F61971 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Amlogic SM1 SoC Family to the G12A AO-CECB
derivative.

It only adds a single init register.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/meson/ao-cec-g12a.c | 37 +++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/meson/ao-cec-g12a.c b/drivers/media/platform/meson/ao-cec-g12a.c
index 3620a1e310f5..1c696a126ee8 100644
--- a/drivers/media/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/platform/meson/ao-cec-g12a.c
@@ -121,6 +121,9 @@
 #define CECB_CTRL_TYPE_NEXT	2
 
 #define CECB_CTRL2		0x01
+
+#define CECB_CTRL2_RISE_DEL_MAX	GENMASK(4, 0)
+
 #define CECB_INTR_MASK		0x02
 #define CECB_LADD_LOW		0x05
 #define CECB_LADD_HIGH		0x06
@@ -165,6 +168,11 @@
 
 #define CECB_WAKEUPCTRL		0x31
 
+struct meson_ao_cec_g12a_data {
+	/* Setup the internal CECB_CTRL2 register */
+	bool				ctrl2_setup;
+};
+
 struct meson_ao_cec_g12a_device {
 	struct platform_device		*pdev;
 	struct regmap			*regmap;
@@ -175,6 +183,7 @@ struct meson_ao_cec_g12a_device {
 	struct cec_msg			rx_msg;
 	struct clk			*oscin;
 	struct clk			*core;
+	const struct meson_ao_cec_g12a_data *data;
 };
 
 static const struct regmap_config meson_ao_cec_g12a_regmap_conf = {
@@ -620,6 +629,10 @@ static int meson_ao_cec_g12a_adap_enable(struct cec_adapter *adap, bool enable)
 	regmap_update_bits(ao_cec->regmap, CECB_GEN_CNTL_REG,
 			   CECB_GEN_CNTL_RESET, 0);
 
+	if (ao_cec->data->ctrl2_setup)
+		regmap_write(ao_cec->regmap_cec, CECB_CTRL2,
+			     FIELD_PREP(CECB_CTRL2_RISE_DEL_MAX, 2));
+
 	meson_ao_cec_g12a_irq_setup(ao_cec, true);
 
 	return 0;
@@ -639,6 +652,7 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret, irq;
 
+
 	hdmi_dev = cec_notifier_parse_hdmi_phandle(&pdev->dev);
 	if (IS_ERR(hdmi_dev))
 		return PTR_ERR(hdmi_dev);
@@ -647,6 +661,12 @@ static int meson_ao_cec_g12a_probe(struct platform_device *pdev)
 	if (!ao_cec)
 		return -ENOMEM;
 
+	ao_cec->data = of_device_get_match_data(&pdev->dev);
+	if (!ao_cec->data) {
+		dev_err(&pdev->dev, "failed to get match data\n");
+		return -ENODEV;
+	}
+
 	spin_lock_init(&ao_cec->cec_reg_lock);
 	ao_cec->pdev = pdev;
 
@@ -757,8 +777,23 @@ static int meson_ao_cec_g12a_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct meson_ao_cec_g12a_data ao_cec_g12a_data = {
+	.ctrl2_setup = false,
+};
+
+static const struct meson_ao_cec_g12a_data ao_cec_sm1_data = {
+	.ctrl2_setup = true,
+};
+
 static const struct of_device_id meson_ao_cec_g12a_of_match[] = {
-	{ .compatible = "amlogic,meson-g12a-ao-cec", },
+	{
+		.compatible = "amlogic,meson-g12a-ao-cec",
+		.data = &ao_cec_g12a_data,
+	},
+	{
+		.compatible = "amlogic,meson-sm1-ao-cec",
+		.data = &ao_cec_sm1_data,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, meson_ao_cec_g12a_of_match);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
