Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD67DC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1FNJ1j5C8i4dQsF2K1OOVVOYb+O5xymAmaWu6cmTmkI=; b=KBb9oPjC83GfLg
	Rk4qB0XsGCXTCQoMXR+FQZw6GS/FztKyVF0qDlgrF2g0yUnGVYvOtmu7OIpx+Ua+tMyJ6Mi9jm51K
	7aAn57I6PGk7dguXsILVGTi/AmieToh9NrN++bTgeFsPnr7DGMwX1bfOhVGsPMP+rcAgtvNnM6mLb
	97HQhh+WWjDsoOEYLQhBDJ5kzxPS/ClKOhlktJ3FQDlH1LWXmUzTtqjYJTMt8yXsrsZAX6TFhEOsp
	rsG9zAJF0mQ62GqGI74lHv46stT/2vDQORoDYjQ+jWoY8+H2q0DNgrsDKcB8QTRuycsA37X/wbQHw
	qSGyDYzHD9MJXuJhnE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pafD1-00FAsW-88; Fri, 10 Mar 2023 16:03:07 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pae22-00Emjz-5T; Fri, 10 Mar 2023 14:47:43 +0000
Received: by mail-oi1-f181.google.com with SMTP id c11so4409593oiw.2;
        Fri, 10 Mar 2023 06:47:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRN0jAfi5iqcqL3ePabHiQPwHcWvAmjJJvRbEXcLzU0=;
        b=IWpYseYKU3+3V/8qC0JtmxuSWAKuZX0oW6NmSgJu3NmAAS+1OwmcZcgddCcqDxfksn
         DJFHY9afCKdDtSAGYO20osz3mpe0qNMxcdsplRk3x915MsW2nDp37G3gustLuWkicU+q
         VjiTJtrWdLfk9GCbP29+w28q8jZotmSAErYpqRXyAWnp415Gch0YxGbXXn186Qsc75Vv
         /biqXNh3M7KlFW/qR9stiybYqnECBb0dn7EyGMfC1XjOyoPvH9mooA0EBisox5ZaMg9p
         h4K+mCo7A08AvrVmJwVtDmhAu9amgxfWveRcTSd9RHj6lfr7IT/Y9IpCf+msDyYbiw8+
         bCbw==
X-Gm-Message-State: AO0yUKU6qxahoPjUi7ncQbKurZr8sZAGLBijsabB8/3ZLAIu/f2xCXtT
	magWoEjiOU3PurGfRMqHxw==
X-Google-Smtp-Source: AK7set8NyE9pelZcNVRqymxGqcdHaorNLGYGKwkwEPG5NWZLihqksz6QnJRuEAnZN8WQX6FSLVz58g==
X-Received: by 2002:a05:6808:2805:b0:37a:f32f:730c with SMTP id et5-20020a056808280500b0037af32f730cmr10660264oib.35.1678459660802;
        Fri, 10 Mar 2023 06:47:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y63-20020aca3242000000b00383eaea5e88sm953962oiy.38.2023.03.10.06.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:40 -0800 (PST)
Received: (nullmailer pid 1543406 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:12 -0000
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Neil Armstrong <neil.armstrong@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] mfd: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:12 -0600
Message-Id: <20230310144712.1543379-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_064742_241473_6F881267 
X-CRM114-Status: GOOD (  13.40  )
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/mfd/bcm2835-pm.c | 2 +-
 drivers/mfd/khadas-mcu.c | 2 +-
 drivers/mfd/stmpe.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 49cd1f03884a..aa1263d22249 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -28,7 +28,7 @@ static const struct mfd_cell bcm2835_power_devs[] = {
 static int bcm2835_pm_get_pdata(struct platform_device *pdev,
 				struct bcm2835_pm *pm)
 {
-	if (of_find_property(pm->dev->of_node, "reg-names", NULL)) {
+	if (of_property_present(pm->dev->of_node, "reg-names")) {
 		struct resource *res;
 
 		pm->base = devm_platform_ioremap_resource_byname(pdev, "pm");
diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
index 7338cc16f327..1c807c0e6d25 100644
--- a/drivers/mfd/khadas-mcu.c
+++ b/drivers/mfd/khadas-mcu.c
@@ -112,7 +112,7 @@ static int khadas_mcu_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	if (of_find_property(dev->of_node, "#cooling-cells", NULL))
+	if (of_property_present(dev->of_node, "#cooling-cells"))
 		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 					    khadas_mcu_fan_cells,
 					    ARRAY_SIZE(khadas_mcu_fan_cells),
diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index c304d20bb988..a92301dfc712 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1378,7 +1378,7 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 
 	stmpe_of_probe(pdata, np);
 
-	if (of_find_property(np, "interrupts", NULL) == NULL)
+	if (!of_property_present(np, "interrupts"))
 		ci->irq = -1;
 
 	stmpe = devm_kzalloc(ci->dev, sizeof(struct stmpe), GFP_KERNEL);
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
