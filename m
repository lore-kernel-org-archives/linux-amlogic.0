Return-Path: <SRS0=nqA+=MI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4249FC07E95
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:38:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097C5613F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jul 2021 10:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097C5613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rW5hTAEUGRYzV+Itj1y2d3dYIPRp7B1LUUEOgix+1yM=; b=spjQTtp28o2FBI
	dUg5xhRkSTi2zBZAUx7QAOIDldcbI4hmv1TM2IaBBmD6agt12YOKM598tdZpo0eA89txxXd0xNa84
	cS51Odai60UtGAk/E+JlhqutjemRaGtwztu9ghjzJme2rmLLE+zxkexwEFrdn0Ut8NWvdUmDdI0XC
	mGMHTYJ9rGcwgk+J9FrFhfrc+ayftI2S3C6lPMcise4Q0+G5E8/+7K/AFuOzKLp4+cX6PF631vOl2
	j+fe4sPy+OLCkYe6LKKBaflpmXBu8o5DR/7n2C6RJ36CURgNtCdsyjOiLnagW1Hibfm0ZBsyY7s28
	Eh21Od1soIla1+f8ZTBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4LEs-0048xr-Pl; Fri, 16 Jul 2021 10:38:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4LEK-0048fW-6O; Fri, 16 Jul 2021 10:38:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id a127so8552564pfa.10;
 Fri, 16 Jul 2021 03:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VmmdmkhCXO7AkJW07YrDSJja8AB+CMGTjyDZ72pZ3SM=;
 b=XLSE0l9iqM0FUsdbXgwyYeUrxZueBS2H6c7hqHRL9yloc2KjuRPsCFY3K0pJgN92Jl
 I9S81ExFA/RPQv40q29hoSSelFqrR9ivp1lUaAz/6Stwhu6zR8137DTnjOpD6NalZNyi
 tNm1WWPQbRBc7D6YJMSnmh8zapD4oxafFu7J2Bq2kMnAU8Ofu+WjuhZD+U8vs9Pv4ELL
 LaLf79ZEbZ5A/kLT0Jppqmff93zKY4Ku32+2+IZ0XR3Mpg9T7xqtH+0buG0S2xibGBaa
 zGQ+f0bd9lIJ5JmAcZpotR+I+V6rUUJKdn35klF80vjgtPpiDymMNs9A9u6abhyRMZLw
 Jz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VmmdmkhCXO7AkJW07YrDSJja8AB+CMGTjyDZ72pZ3SM=;
 b=nlSnlL52s4/nv0+POXk0I3tpz4nUQqAs/W0s1meB++x+29sF16W+OtJHZ5WwTi93HW
 XL7fBLmVppOnjLFqyfp/97FgSnYZ7MDKqayKZsDKO1sbbrlfzw73dA5/ij2QfD66Vs4c
 vxM3GNga0aNr7hK7R4/JF+ZXhZjwF5J5a3VoXQP8x1ZFd3XVbDu6VsHY78vAOkY5gvBV
 uLUHTFNOTd6UvgNFOA8Za0ayVaQWgNqS93yTZkMw1wkyHZ/8q6mAYL9X7aPBKtbD3fj1
 yttN+SsKLj1M+uQ4a0bgqro6jM2rNazzZ0pYYlHw3EM9oYOBCQRoKZeviePSX/0JJBlb
 rIVQ==
X-Gm-Message-State: AOAM533ZqScH9rXn1vRV9gppGQ/vEFtDxiekdaMuHoWxd0TQw3TTR1CR
 0Ma5affmzmFguY6AGtDlXg7h7kovm+Q=
X-Google-Smtp-Source: ABdhPJwcfKzs6LufNBOvTwQDhzOMXdnw2fdKAY5SkFQfRpvVwVTYBM5CiUo9KwmAaTJF9L0qBS4k9Q==
X-Received: by 2002:a05:6a00:2:b029:32e:3ef0:770a with SMTP id
 h2-20020a056a000002b029032e3ef0770amr9954297pfk.8.1626431882813; 
 Fri, 16 Jul 2021 03:38:02 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id d29sm10070111pfq.193.2021.07.16.03.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 03:38:02 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>, devicetree@vger.kernel.org
Subject: [PATCHv2 2/4] arm64: dts: amlogic: odroidc2: Fix the chip enable
 signal for usb power
Date: Fri, 16 Jul 2021 10:36:34 +0000
Message-Id: <20210716103651.1455-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716103651.1455-1-linux.amoon@gmail.com>
References: <20210716103651.1455-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_033804_269316_6ADEAD86 
X-CRM114-Status: GOOD (  11.41  )
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

Fix the chip enable signal changing from Active High to Active Low
to enable input power to USB power. Also updated signal name as per
the shematics.

Fixes: 5a0803bd5ae2 ("ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes")

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch in this series
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 201596247fd9..3f4f16a5dedd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -38,12 +38,11 @@ usb_otg_pwr: regulator-usb-pwrs {
 		regulator-max-microvolt = <5000000>;
 
 		/*
-		 * signal name from schematics: PWREN
+		 * signal name from schematics: PWREN - GPIOAO.BIT5
 		 */
-		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
+		gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
 		/*
-		 * signal name from schematics: USB_POWER
+		 * signal name from schematics: USB_POWER - P5V0
 		 */
 		vin-supply = <&p5v0>;
 	};
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
