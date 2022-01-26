Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ABCC2BA4C
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 11:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oCC8yBENR0KUZmcao5yFjKjJCNenkM3QRui6cDO+o8k=; b=4XNxPOAq+qNugz
	ql6cBdI5NCI0Zo7iu4palhQLztKdLTFvIKLWEAQRQiFv1hAy1zZ9vIyux1qAy/VbkPC3vLztyBEuU
	4vrAOIArzKm+ImaJv0hBjBqq3Qi5ffDzzjSZWIpwt2nWaOJZ6NKQb6C4b5Q1EfPjYwwlgaHEVz5AC
	c7LAwH04GVkESUZnZCMX2ulz3zIaxbml5ifkxQBDzj/XPe2TjHuholZGR79LlsYker9+UeJ/xAm02
	RQ363ED1kt0UrYck0dd2ZFPNrRIZsAmIkqFF5bwCgp4tBYrPxVS+lSTBTq5kEvTkG6KjfHB/QiaUP
	ZroaRTYm5SoK4MlW2Dww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgHr-00BQbX-Di; Wed, 26 Jan 2022 11:16:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCg6j-00BO3i-61; Wed, 26 Jan 2022 11:04:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id y17so11702839plg.7;
 Wed, 26 Jan 2022 03:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=RR4ouPM813OFDy+c0edjOK1JRioWIwLVRFDpfla460c=;
 b=HP+tuwnNz6Y8+d3OMO5kJD2QNVUOgiTLtaVUi8wf1JlUByCQWmDWDbDr/kNgfWoBhb
 7QYoWHRB9esF44iy+btd+d6ZfWligwEPii61Qclc4Vpjnhjo8wWqsLmwToWWi/Z7KaBl
 jfKTrU0vecIWJesPNgZBvHRaU+dKM3DgjbfDg7eFmkWUxizbfMcFH9eJRjSbBBMJzsDN
 WLLuq3MBzCD1SGEJvpT+pawxdNmNOF52nPcZbinDLvNtEnwTF3Jf9hUaV0V60PzZ05dZ
 ZjfHms8JFXWTiwo7GZTFH4MmCGHkh3HxYxokd2jZRZe2JJ2bxdrWsvXHbqFWgepKJTAa
 /Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RR4ouPM813OFDy+c0edjOK1JRioWIwLVRFDpfla460c=;
 b=5MXYo7tyCIenDY5W4gjNJ3HRooPOn387RR4EoZdrUfsWzhZV3XEYNSMQmwWhsHq3i8
 yTcbLvD+9Qs7FPed8mtWQN37CyNRLdVErWwko+NYyISMNp/iixeYI86cgxIZ1yxmIOdN
 yloEJOikYlx10eRBHI6pzSuUGB8d0E7pmGt//ruviW4MMlt83WLLVWahFW+3K9LzuBnl
 VDc6HAT1oj0qY94KIWu2GTnOxQVDRCz0+vuBP1uCENQ1BrJ8gu8gAbh7U6PA7lVIY/Ls
 F0dGNkQxV3xYLAm05HW9ZzRdq+lDt/CWx1s/sSlbj+blznO/T3rp5C/0G9ms8usT+dDU
 V32Q==
X-Gm-Message-State: AOAM532SED/YCzR70u8F9v5jgsD8X5F8FMW6q8BwieBhtyM2RoYhGH0D
 OdFkKbXMGDQ3Brcyqnv74YY=
X-Google-Smtp-Source: ABdhPJx2FwKdI5cKtqHUQdZWmt2+i2FAlaBuvr89STNb/9Amb3meY+F5YYosOYWzHq/p02vC+1Ny/w==
X-Received: by 2002:a17:90b:3106:: with SMTP id
 gc6mr8081129pjb.77.1643195094691; 
 Wed, 26 Jan 2022 03:04:54 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id s12sm1706080pfd.112.2022.01.26.03.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:04:54 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] spi: meson-spicc: add IRQ check in meson_spicc_probe
Date: Wed, 26 Jan 2022 11:04:47 +0000
Message-Id: <20220126110447.24549-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_030457_316338_182F1C76 
X-CRM114-Status: GOOD (  12.05  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This check misses checking for  platform_get_irq()'s call and may passes
the negative error codes to devm_request_irq(), which takes unsigned IRQ #,
causing it to fail with -EINVAL, overriding an original error code.
Stop calling devm_request_irq() with invalid IRQ #s.

Fixes: 454fa271bc4e ("spi: Add Meson SPICC driver")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/spi/spi-meson-spicc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index c208efeadd18..0bc7daa7afc8 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -693,6 +693,11 @@ static int meson_spicc_probe(struct platform_device *pdev)
 	writel_relaxed(0, spicc->base + SPICC_INTREG);
 
 	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto out_master;
+	}
+
 	ret = devm_request_irq(&pdev->dev, irq, meson_spicc_irq,
 			       0, NULL, spicc);
 	if (ret) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
