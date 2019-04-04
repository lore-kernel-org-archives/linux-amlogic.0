Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6184C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7438720855
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeMdUG4B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uWRc+fU0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7438720855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7xFkePxlKqMJ78WwkJXUfrfnMd9HirWFFx5TQ6ET+o=; b=MeMdUG4BY3x+V4
	8GuU1FomXmelxpEmtnBailBBVpbdlv1v48W2Y53aDc33jh5xZLprfoEG1Hh2CIq9ossgegUm03JFO
	Tx7AVF+QBjXWpiM9Aa/wxw7reStSPc/Cbomzz7Z66hULo2Zecf7YnxVeoYsMDlLKVW0mON/e71EB4
	WorfsUp00t3MFeLWgO2fZcNbMgasXuBOpXw/HvywOWaAP0Slo7/h9h+f6tOm/PTHLNBfASWNS5S5L
	gtye5YCss0UHXrEOD+ZQeefT/zwN8k0xBiVPkZtvj3rsylmc8Zo7p/q4EJStiC4Y6mCcikoyTAZ5W
	TUq30ec7aZtbS0dFYwTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC0Nc-0004GG-Lp; Thu, 04 Apr 2019 11:18:00 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC0NX-000487-Qu
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 11:17:57 +0000
Received: by mail-wm1-x342.google.com with SMTP id 4so2571778wmf.1
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 04:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Vn9RR550Eyl4ELYsr1mmHgCuBIbCpOqQ6bfLv4sARg=;
 b=uWRc+fU0O+nKHBDEQJJXZ7Z2j7snQLXa/BT8codA7325VHzO8/xA/fSJHg2ARzNjtb
 sDQrVIfah0PZxPEavE4ijLEa12EnW7HzSY1MER2Ey8l1qtZVnwIHbVZuFiK5zxAZRoao
 DiBgtqs07mEyREAAd4ip1Ixy5fNWyhexonV5VEPCfOfhj/emGycOHa1kGym4ppaIk7FF
 ju/44J11q9bIq6xFUh1QMaBcp1V6Ql2U2j/rA+5uY5Ta2bIOBJ7Jco9Dr5Ly1TeLaFzF
 Uo5HPCCGTjhERrzBEU0ocbptHeOMQ/OPdWeALZZg8ZYI2JfpzusG6VVDFfYls2O5JEQb
 vUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Vn9RR550Eyl4ELYsr1mmHgCuBIbCpOqQ6bfLv4sARg=;
 b=rakjMzV+AqnWF3VcmX1UBcTN/kNXOMREadQ1tz78op7ZKjvOGFdcRIDhkjPl2lDkG/
 jRXryWG1q3j4wz36kP1vD2WYRTLijqmBh1DfpZuc4zaHOvvlB9OLgk2ts67d2bYlkhGj
 Ae2/kVLOHzvNBNeBzgcIRBGilpuoYSkOIEsktJq+i4xgQWlqNsMuLVWm2c7cs/lfMkii
 2DGuUvlwSAyRLlScuFBHBt+zOami5EJVi4X7ld/wq1W4/SdnW+imUFofoWZHHBtYLw5N
 OWh2Q/ruPk0sr6pD117z6spCfni0wosUAi3gMqcQ33KJghGZ1tEUDN0nk0jJbYu+rQkN
 WULw==
X-Gm-Message-State: APjAAAWc8Z4CUfIroyzs0Mgt7TlCwesXIkZ55EAN/Dpdn4aYReiOj0wd
 W8sszVTnfMQh3T7al2d3Fqzu2w==
X-Google-Smtp-Source: APXvYqz1ZAXalx43MSQ/mSwlII9JoTKJQx4QnyxFvl27QsSvAlkGdELj6N9F7OAQA6rSrCzd3iZ4hw==
X-Received: by 2002:a7b:c923:: with SMTP id h3mr3611271wml.34.1554376674104;
 Thu, 04 Apr 2019 04:17:54 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id z23sm9024771wma.0.2019.04.04.04.17.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 04:17:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 6/6] ASoC: meson: axg-tdmout: add g12a support
Date: Thu,  4 Apr 2019 13:17:33 +0200
Message-Id: <20190404111733.28705-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404111733.28705-1-jbrunet@baylibre.com>
References: <20190404111733.28705-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_041756_066906_84E5EDC8 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The axg tdmout driver just need a different skew offset to operate
correctly on the g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmout.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 3984818e2a7c..527bfc4487e0 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -243,10 +243,23 @@ static const struct axg_tdm_formatter_driver axg_tdmout_drv = {
 	},
 };
 
+static const struct axg_tdm_formatter_driver g12a_tdmout_drv = {
+	.component_drv	= &axg_tdmout_component_drv,
+	.regmap_cfg	= &axg_tdmout_regmap_cfg,
+	.ops		= &axg_tdmout_ops,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk = true,
+		.skew_offset = 2,
+	},
+};
+
 static const struct of_device_id axg_tdmout_of_match[] = {
 	{
 		.compatible = "amlogic,axg-tdmout",
 		.data = &axg_tdmout_drv,
+	}, {
+		.compatible = "amlogic,g12a-tdmout",
+		.data = &g12a_tdmout_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmout_of_match);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
