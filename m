Return-Path: <SRS0=ok2G=7I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645D5C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37556208B8
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:30:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A87qVWuA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jXqpT17h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37556208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CEuhAWHU/sD682VVG1Kl5xaqTG2zXY1npNcRe1RzLgA=; b=A87qVWuAebufAm
	R9Lj5leHLy1e9w/PRRXLA8gcs8vKZP1GpkEgyoWyOpToCQzx/5RJtKJAL5OVN4H3BxNmc9MZuTqEV
	+74M4a8VEwijxPl1usOnSEF2uOEg5qlIzAgAU635et8/gGOrDPTr635oRZekjkcZaAM212SLlIE+w
	BVoO2jSkR644Jqkl/CXRLXnO/g6qCI2jcSi59pZT1u6jqCc3i5j+s3sjTi+L7Cb2aMm9nLw6OcI1o
	Moyqh+yRixob6GhM/FTE3kxwoTyJj779oClgcVyvHyXIRKBlVVQoSlJIyvEBTM0Hc4+s3Kjho1Yuf
	P39v4LPVoiN6C6Rewg3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdgDI-0007UE-6f; Tue, 26 May 2020 20:30:16 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdgDE-00075U-VE; Tue, 26 May 2020 20:30:14 +0000
Received: by mail-ej1-x643.google.com with SMTP id y13so3318634eju.2;
 Tue, 26 May 2020 13:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+HLyQeHEwRkmBN7Mz1fWdkXpoemib6Ct8xH1uqDFVgM=;
 b=jXqpT17hC9igpJGL8HqGKNSS1UpVOL7bro0lhrsTvwHSTf3+2sZmgHAZq3AmMUN1u4
 qmFWaqtO5r5SV/aJJGR7/gy/iFe3UC1WIkMs/RVrQtoHON7mQ81GTCHXFax3O1QnW8e4
 SsLD/tkyohqFtjaLi7YLYiqi3eq0y7ZCtPWuY0S0xMWuH4oF/EMAWtIJdgYvFx4x9g4P
 AMQGTDivXwDTtuctM3ElwNCTec3EHAb9u2PA8KUWGMC8i5HmPwR5VxsktsrLlZSRtD6H
 mO+B/1E5RbIv/5q2xI4e5ROZOCsZY/1nyzUZtts/2X4titAry4ZX5yFDy2AWNPlSxaie
 vfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+HLyQeHEwRkmBN7Mz1fWdkXpoemib6Ct8xH1uqDFVgM=;
 b=Ub6oCarWJCHqIpiF0/5WNNn708DzFltz07Yj5pIHSCmJ59X2zvlwIsPS+Uqa+Ae+e6
 nnv/FP1ls3Xx6FhQHZEX4jbXuPYGD8Wfty88tpcaazs0ivWyM6ZvRzuQTacET67vweTg
 0vxJ1QnQDw5eLhhuzHqLQgY/V7/OFbJkI4VYi4RwE0eDbJ8tzm9uJZ9JOlzGUi/IAA2U
 q6qfXxiXlkNFC8+8W79xl6yYKImip2IK7BZcsMAXYBFtJ3Pjjy6aModxKRJ6DwlD2hMe
 9395KqUzF6EQYa2hLeY20Oz2zhKHTGEZa5Ih1Hk7g7bVaeP8eIrQo/wtrvCp1gHXXIu1
 xIDg==
X-Gm-Message-State: AOAM531XETdVfmej9TDcfqhl7EfGrn7EJb6oQLFt1T5z7YBy+6vXlACS
 2jPeyvwSMOHAMYxWyedgdi0=
X-Google-Smtp-Source: ABdhPJxqtvm6ZozNr3OfWjYHXrv9+mhZTQjYNNza+YL7N1NIhEwIs64tPCmgerGMOLsrKUYhFRDdAw==
X-Received: by 2002:a17:906:4815:: with SMTP id
 w21mr2784486ejq.533.1590525009201; 
 Tue, 26 May 2020 13:30:09 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137189200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3718:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id ce16sm735517ejb.76.2020.05.26.13.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 13:30:08 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Subject: [PATCH for-5.8 2/2] usb: dwc3: meson-g12a: fix USB2 PHY
 initialization on G12A and A1 SoCs
Date: Tue, 26 May 2020 22:29:43 +0200
Message-Id: <20200526202943.715220-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
References: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_133013_012048_29193F07 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: hanjie.lin@amlogic.com, "kernelci.org bot" <bot@kernelci.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, yue.wang@amlogic.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

dwc3_meson_g12a_usb2_init_phy() crashes with NULL pointer on an SM1
board (which uses the same USB setup as G12A) dereference as reported
by the Kernel CI bot. This is because of the following call flow:
  dwc3_meson_g12a_probe
    priv->drvdata->setup_regmaps
      dwc3_meson_g12a_setup_regmaps
        priv->usb2_ports is still 0 so priv->u2p_regmap[i] will be NULL
    dwc3_meson_g12a_get_phys
      initializes priv->usb2_ports
    priv->drvdata->usb_init
      dwc3_meson_g12a_usb_init
        dwc3_meson_g12a_usb_init_glue
          dwc3_meson_g12a_usb2_init
            priv->drvdata->usb2_init_phy
              dwc3_meson_g12a_usb2_init_phy
                dereferences priv->u2p_regmap[i]

Call priv->drvdata->setup_regmaps only after dwc3_meson_g12a_get_phys so
priv->usb2_ports is initialized and the regmaps will be set up
correctly. This fixes the NULL dereference later on.

Fixes: 013af227f58a97 ("usb: dwc3: meson-g12a: handle the phy and glue registers separately")
Reported-by: "kernelci.org bot" <bot@kernelci.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index ce5388338389..1f7f4d88ed9d 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -708,11 +708,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	priv->drvdata = of_device_get_match_data(&pdev->dev);
-
 	priv->dev = dev;
-	ret = priv->drvdata->setup_regmaps(priv, base);
-	if (ret)
-		return ret;
 
 	priv->vbus = devm_regulator_get_optional(dev, "vbus");
 	if (IS_ERR(priv->vbus)) {
@@ -749,6 +745,10 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clks;
 
+	ret = priv->drvdata->setup_regmaps(priv, base);
+	if (ret)
+		return ret;
+
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
