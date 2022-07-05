Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC06C43334
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FvlEtRmkYZnYVPDusxDYQFpEmDo7lVoe7nFwANQ1qIE=; b=tntkAhnRxtFqdY
	DxNnoBBgmnB3D9HZ7kW/+VBeEYC7wWyi5by11sEMXWXTwUxnE3lWNG6ZJCPqUkBQiKjCrymB9h7mc
	9Ny3TVsjMxIJkA3GjL1FTNUwXycQiRn4B+1sp1GJOBotEFYu6yQZdqZpBKqbXXee6a9SihIf7pwZs
	gAM5NONW1b+M2/XcINLAwNx0dzZrYOy6yr/SV52iAJhoAI+zKuazv8I9aneDd5JBWHDdLdSBqMlAu
	HJezB//4wuELcv6k5km7Yd+5Z9MRRlMZdFzakAuLJVTW8M/Jugk3s/JlHL2AbBDoxiVRuNedvGDuj
	vGcm1F9czIB3uEhHqFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jZe-000pQG-Mx; Tue, 05 Jul 2022 14:30:46 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8jZR-000pL7-No
	for linux-amlogic@lists.infradead.org; Tue, 05 Jul 2022 14:30:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id cl1so17846364wrb.4
        for <linux-amlogic@lists.infradead.org>; Tue, 05 Jul 2022 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9da/QeGRcCpJ3hrNNbUxLvYG+ekB8n1mPdVYqACHlDE=;
        b=qJ1jQ4Djp+QCkJQZAfjaPN1oWlWpXMqSQ7m1QtXXjO1NjnA2KMKPRbfyFYbsGMc9Mk
         ckvOYj5vSNE3GJ6eYUhFTR3DSG7OD25RC3cIfWY968lh20+Z8ssqVY+TrQ3mit9Ydnjs
         y/3/Mm3p/Zpj/dO2+AIAYwmBUFsgRYpI7A/f+V6db+/I3sPm4De5fxXdPXdb9P+08iuZ
         yMLSiPQ9zPhWjNvWAmDlt+LALLKMIWe3t/ifboqldxkOcF+ZASqx/E6P3LGhI+Zsvcxo
         +5nEgBXHNbPVhc797wnVMsDM9bMjG5j4SsRA3x7dVK7UmHB+zRstrfjdnoW0W77tXULt
         07Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9da/QeGRcCpJ3hrNNbUxLvYG+ekB8n1mPdVYqACHlDE=;
        b=OBhHKyaIsb4FRkicVVm7kQuHtdAPgK6CHVyl+pbtcxIfs9pCpfWV/o2qIijOhiM5Pg
         iZa0i8zGAoy9TsYahiTfEPc1hva/rtK8v44/IN2YElMeNwvabs1g19h41sTKpjtPRLZz
         Z4x7JchiTrWh2aj0SEpNfL86vm4gWeEllCzCOg/4rYw2MX5Xj59CHL28EF6o2uG4aeeb
         xkgtSsiKMUph2uwGPKET6lvtRdOGrMEaXP+km5W4vaKZwYtjnp0UpBmdONvswkxSWgf1
         PrgGDtGAAPTtJ2iokOwORkZbEauPPzaGIVQrIgD/XY60yn15AeVCzvYUHGJRBqA94v+5
         Fs9g==
X-Gm-Message-State: AJIora8AyEK4jyHGQIeOe7t7adlF1P0NQE/N1buMJOwZFkHQNboq5fYl
	rB4GbtkmAP0QjPz64+iSBlY1GQ==
X-Google-Smtp-Source: AGRyM1uIuR4D4oP9T7niGz4yUtI/9LS6rl4g2JOCPOUNle/hM11AhMMJzP+iEitvCALdmqMvJWVYig==
X-Received: by 2002:a05:6000:1011:b0:21d:4212:854a with SMTP id a17-20020a056000101100b0021d4212854amr24909543wrx.179.1657031426855;
        Tue, 05 Jul 2022 07:30:26 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c8-20020a05600c0a4800b003a02f957245sm18525743wmq.26.2022.07.05.07.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 07:30:26 -0700 (PDT)
From: Philippe Boos <pboos@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Neil Armstrong <narmstrong@baylibre.com>
Cc: Philippe Boos <pboos@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] watchdog: meson: keep running if already active
Date: Tue,  5 Jul 2022 16:24:44 +0200
Message-Id: <20220705142444.17063-1-pboos@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_073033_799551_E975737C 
X-CRM114-Status: GOOD (  12.52  )
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

If the watchdog is already running (e.g.: started by bootloader) then
the kernel driver should keep the watchdog active but the amlogic driver
turns it off.

Let the driver fix the clock rate then restart the watchdog if it was
previously active.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Philippe Boos <pboos@baylibre.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..8c2c6f7f3bb5 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -146,6 +146,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct meson_gxbb_wdt *data;
 	int ret;
+	u32 regval;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -177,6 +178,8 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
+	regval = readl(data->reg_base + GXBB_WDT_CTRL_REG);
+
 	/* Setup with 1ms timebase */
 	writel(((clk_get_rate(data->clk) / 1000) & GXBB_WDT_CTRL_DIV_MASK) |
 		GXBB_WDT_CTRL_EE_RESET |
@@ -186,6 +189,13 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
+	if ((regval & GXBB_WDT_CTRL_EN) != 0) {
+		ret = meson_gxbb_wdt_start(&data->wdt_dev);
+		if (ret)
+			return ret;
+		set_bit(WDOG_HW_RUNNING, &data->wdt_dev.status);
+	}
+
 	watchdog_stop_on_reboot(&data->wdt_dev);
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
