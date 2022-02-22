Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC649C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 19:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=51sqVu6adE49XoRfyru6ZixnldNJXCzq9Dn70egjH/k=; b=taUH8YO9kj1oAl
	HRoQGCwMaeXno1sZwctMyCDXvENIvTgkzYL5g5OnJX4mK1NWqIKvoF0R511q9h7SShoECPtiW5dtc
	CVXahkIjz2w7ccpU4mDVUWjDuVZBiDBS76uw3lPY5aR2/17hc5JDzP/k19Qr54KjccEXDiVGnaEt9
	7nxOxlRcZ29aueSMDQu/9cy823YXGVijYuXPIe46b+WnjCCsGuL7mOwahApIk6oN1iAgCGcwXSj+3
	b/y4JX42mV5qO4LrI7N6S0CThLpb0XPIyrgFqUDxHLAXRXZqx4qzPuoQjG2M11JbQBoQiVOR98hMI
	9VNq/XjhG7XwlnShViQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMbCi-00BPf8-4G; Tue, 22 Feb 2022 19:52:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMbCf-00BPdo-TT
 for linux-amlogic@lists.infradead.org; Tue, 22 Feb 2022 19:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645559523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yqAxAt97qCJLV5CPBezCxx4lwmzLsldJjCu+hXm/y4A=;
 b=jTqZAKOt8cXc4pxjij+Sd1Ko8FTIHpJpkFNwjbjSecdpE5HEZbx7cdWc1ahcTczfRxpPbQ
 eykTJy1k2U7aKE+3l9c2Nx/y4OyG5Hw5c8rzfMatmeiorG+LHq6HW9nhmHlIK5MYyfWxTI
 k4IOuPXy5pDh6xTW9XvMQ1w19uvF5I8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-X3RPRka_NBeTOpWaYKOvRw-1; Tue, 22 Feb 2022 14:52:02 -0500
X-MC-Unique: X3RPRka_NBeTOpWaYKOvRw-1
Received: by mail-qv1-f72.google.com with SMTP id
 hu9-20020a056214234900b0042c4017aeb3so848806qvb.14
 for <linux-amlogic@lists.infradead.org>; Tue, 22 Feb 2022 11:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yqAxAt97qCJLV5CPBezCxx4lwmzLsldJjCu+hXm/y4A=;
 b=qKCe2jXX6Bv8bii4yc1Nzr7l+96d41fuZG2aYyHR56VurFxGbI+kWNMxLJF7sOGyPM
 V+8C7/+ctEbe8epKj3s9GgZbY4JdyLxnbxveaG2T3dACTvZ6SLgFkkkPL5mMeAFzcKAU
 IlrGKDmcLv524AoQx72r5XFfX1l1mM9CbgTf1xBQxq0W5WIUx3HVokwzOGd1cYUwcHNL
 3eIHKcIbhyYRs7M1LM78/uBRUpFmQ3gRUm8o2mUIosW/uHRMsUtJpP/Ehs/yNyTOapr2
 gtaYHek77u9mniKLJ7aKfN5R5f4P2R0WtI06Tu+a1jzi92Uz+W94aXfLNX7dzG7+3BRP
 UG7A==
X-Gm-Message-State: AOAM530dpNGfbUUM8V0TuzlO2WPNgRpPvB3btG+O4398at0O/V0C6evA
 C6FT4nUROMRe+f0I54Ofuc8gQJx5Hr13WJ/5bYiy2gy/NYLTvpUjGFC2zh2qKF334xhomTFY+qv
 oizoYNcemtWIM8Rte3gFf43UjzyGLYG0=
X-Received: by 2002:ac8:5ccc:0:b0:2de:2c05:a4d5 with SMTP id
 s12-20020ac85ccc000000b002de2c05a4d5mr9869929qta.77.1645559521581; 
 Tue, 22 Feb 2022 11:52:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm0K5Nq0kkz2hfcMU9ijcXpKdvSZAutJr5ctmWgXao4fnPEQuBInwgg1GxR/g6ikbJVmux0g==
X-Received: by 2002:ac8:5ccc:0:b0:2de:2c05:a4d5 with SMTP id
 s12-20020ac85ccc000000b002de2c05a4d5mr9869904qta.77.1645559521315; 
 Tue, 22 Feb 2022 11:52:01 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id x7sm364155qta.75.2022.02.22.11.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:52:00 -0800 (PST)
From: trix@redhat.com
To: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 jesper.nilsson@axis.com, lars.persson@axis.com, rjui@broadcom.com,
 sbranden@broadcom.com, f.fainelli@gmail.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, dinguyen@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-amlogic@lists.infradead.org,
 Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: cleanup comments
Date: Tue, 22 Feb 2022 11:51:53 -0800
Message-Id: <20220222195153.3817625-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_115206_078879_51A1D460 
X-CRM114-Status: GOOD (  19.32  )
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

From: Tom Rix <trix@redhat.com>

For spdx
Space instead of tab before spdx tag

Removed repeated works
the, to, two

Replacements
much much to a much
'to to' to 'to do'
aready to already
Comunications to Communications
freqency to frequency

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/at91/sckc.c              | 2 +-
 drivers/clk/axis/clk-artpec6.c       | 2 +-
 drivers/clk/bcm/clk-iproc.h          | 2 +-
 drivers/clk/bcm/clk-kona-setup.c     | 2 +-
 drivers/clk/clk-fractional-divider.c | 2 +-
 drivers/clk/clk-si5341.c             | 2 +-
 drivers/clk/meson/meson8b.c          | 2 +-
 drivers/clk/mmp/pwr-island.c         | 2 +-
 drivers/clk/socfpga/clk-gate-s10.c   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 2d65770d8665..fdc9b669f8a7 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -535,7 +535,7 @@ static int clk_sama5d4_slow_osc_prepare(struct clk_hw *hw)
 
 	/*
 	 * Assume that if it has already been selected (for example by the
-	 * bootloader), enough time has aready passed.
+	 * bootloader), enough time has already passed.
 	 */
 	if ((readl(osc->sckcr) & osc->bits->cr_oscsel)) {
 		osc->prepared = true;
diff --git a/drivers/clk/axis/clk-artpec6.c b/drivers/clk/axis/clk-artpec6.c
index f95959ff85ac..a3f349d4624d 100644
--- a/drivers/clk/axis/clk-artpec6.c
+++ b/drivers/clk/axis/clk-artpec6.c
@@ -2,7 +2,7 @@
 /*
  * ARTPEC-6 clock initialization
  *
- * Copyright 2015-2016 Axis Comunications AB.
+ * Copyright 2015-2016 Axis Communications AB.
  */
 
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/bcm/clk-iproc.h b/drivers/clk/bcm/clk-iproc.h
index a48ddd3e0b28..d7e5b94bed45 100644
--- a/drivers/clk/bcm/clk-iproc.h
+++ b/drivers/clk/bcm/clk-iproc.h
@@ -89,7 +89,7 @@
  * Parameters for VCO frequency configuration
  *
  * VCO frequency =
- * ((ndiv_int + ndiv_frac / 2^20) * (ref freqeuncy  / pdiv)
+ * ((ndiv_int + ndiv_frac / 2^20) * (ref frequency  / pdiv)
  */
 struct iproc_pll_vco_param {
 	unsigned long rate;
diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index e65eeef9cbaf..5dd65164c8b1 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -510,7 +510,7 @@ static bool kona_clk_valid(struct kona_clk *bcm_clk)
  * placeholders for non-supported clocks.  Keep track of the
  * position of each clock name in the original array.
  *
- * Allocates an array of pointers to to hold the names of all
+ * Allocates an array of pointers to hold the names of all
  * non-null entries in the original array, and returns a pointer to
  * that array in *names.  This will be used for registering the
  * clock with the common clock code.  On successful return,
diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 4274540327ce..8efa5142ff8c 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -34,7 +34,7 @@
  * and assume that the IP, that needs m and n, has also its own
  * prescaler, which is capable to divide by 2^scale. In this way
  * we get the denominator to satisfy the desired range (2) and
- * at the same time much much better result of m and n than simple
+ * at the same time a much better result of m and n than simple
  * saturated values.
  */
 
diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 071f5a1c8a1c..41851f41b682 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -655,7 +655,7 @@ static unsigned long si5341_synth_clk_recalc_rate(struct clk_hw *hw,
 	f = synth->data->freq_vco;
 	f *= n_den >> 4;
 
-	/* Now we need to to 64-bit division: f/n_num */
+	/* Now we need to do 64-bit division: f/n_num */
 	/* And compensate for the 4 bits we dropped */
 	f = div64_u64(f, (n_num >> 4));
 
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index cd0f5bae24d4..8f3b7a94a667 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2232,7 +2232,7 @@ static struct clk_regmap meson8b_vpu_1 = {
 };
 
 /*
- * The VPU clock has two two identical clock trees (vpu_0 and vpu_1)
+ * The VPU clock has two identical clock trees (vpu_0 and vpu_1)
  * muxed by a glitch-free switch on Meson8b and Meson8m2. The CCF can
  * actually manage this glitch-free mux because it does top-to-bottom
  * updates the each clock tree and switches to the "inactive" one when
diff --git a/drivers/clk/mmp/pwr-island.c b/drivers/clk/mmp/pwr-island.c
index ab57c0e995c1..edaa2433a472 100644
--- a/drivers/clk/mmp/pwr-island.c
+++ b/drivers/clk/mmp/pwr-island.c
@@ -76,7 +76,7 @@ static int mmp_pm_domain_power_off(struct generic_pm_domain *genpd)
 	if (pm_domain->lock)
 		spin_lock_irqsave(pm_domain->lock, flags);
 
-	/* Turn off and isolate the the power island. */
+	/* Turn off and isolate the power island. */
 	val = readl(pm_domain->reg);
 	val &= ~pm_domain->power_on;
 	val &= ~0x100;
diff --git a/drivers/clk/socfpga/clk-gate-s10.c b/drivers/clk/socfpga/clk-gate-s10.c
index 32567795765f..3930d922efb4 100644
--- a/drivers/clk/socfpga/clk-gate-s10.c
+++ b/drivers/clk/socfpga/clk-gate-s10.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier:	GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017, Intel Corporation
  */
-- 
2.26.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
