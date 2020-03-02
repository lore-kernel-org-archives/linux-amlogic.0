Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A21AC3F2D1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 12:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA5E22B48
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 12:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a32tkcYF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enXtbT3e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDA5E22B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLXEZyvCNGZ9oOzxpxYHeszY6ru4EyjrDSpwcgJz9b0=; b=a32tkcYFuGrCES
	P/TPCaQ2wSynFRikH1RUWfXZWyd1845IT1hO6qq+/I2dIkgbkYXQjek8V4Nnr7eP4axPd6Bvy71bY
	AfaQDnIiJM7qOP+hPa7T8/anjR5W0OmP1ocD9le3yWcNFhJOOTb84KfpS4WRzgiNJQfARWXTDGXNq
	pXJAP1C7Q9TXPv2akMSWeCNrc/iHRGSdtdzByMy1rRgf99I4zpGBvm8VRfGP7bNPcCLCHbMSV7Edx
	CuX/7wtCkQ+Vj3ibjGsV4i42CG5b50RJIuh4ogptVYDWbFWcM9U5GxBhT9H+qWUqIAoFcMdVy8mRW
	7DWM9CZP2t0nkcYxC3sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8kat-00011N-7h; Mon, 02 Mar 2020 12:54:47 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8kae-0000pc-Jv; Mon, 02 Mar 2020 12:54:33 +0000
Received: by mail-pf1-x434.google.com with SMTP id i13so5550247pfe.3;
 Mon, 02 Mar 2020 04:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMxGOYQ+JxxN+O1T925iEJ5h0tLf69vjSjHFydFp+AE=;
 b=enXtbT3e+ROcThYr6oVqVBI/HVigs5WOu1/ul3YLMfB3mIdmxS1CxpT7IEA7njxp23
 TQuVb6j2tl5NF7O61Rs268ipaiymB86PQAOD9213Ot1w4PoF/bJY7KeBtsJ6TQTqK1Ol
 oCYlRxZJvMwX241uJ+6vAew3YJwZnlGpOQGFoyLXO1s0MsuX9zoxRGk2wO+s5nY50G8q
 lgTMAAhwJBXR89m0STTfq+JAab1TZ1iVb5sX6GBWwMH53KDsoO/GgcuCaE4+jIVpg0wd
 5ZF6YyLqpQByc10K8yK0MoA88WsgWn9KlHUPhIHxgqAhXK3EeC4Ksvovmhg3C2E69aIs
 DP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMxGOYQ+JxxN+O1T925iEJ5h0tLf69vjSjHFydFp+AE=;
 b=dgPWaFnXemLLIeHzkGWQnOar7JmRy8AO344VQYDPVyjCHVjN3/Hiri26RcHMHI1XhQ
 gnw0kjZS1tGYTvh9OxbAIUClwZaFLX9eTvucFbnJ8aq4qgYwQWdeLzLJLw80YYOYFD9E
 5rapDmPLM4YqiAylQv78xxy9vLJ0BvsOghJ/aYZC4kKpdneKrDznhb6vD92+t96kU/VL
 42aTcAkmin6xqqThK+2sSGPDHz7UtVws3SRIU4DMn8e5NVZXe7xEUxOH7X3xQAcDWJ/Z
 3fa4roMSpHksI0cKRwhvNNDyP6PWztyS+W72VPYDvK7Q8NeQIxDGaqQytxOw9AA0IQpx
 5F0A==
X-Gm-Message-State: ANhLgQ2rx7JVVHsXQ2NE86naeMUA9/CBvJRY1L3oM4N4mIFAyZ+EYhyx
 IcCw1A9mVFXdKeHvEd8U06gmE11d
X-Google-Smtp-Source: ADFU+vv8UO5DZUj4Cm2KLq9PeaLrwLT/JEJcifzctp/QmapoHpejSvulRH8fj/9l9BGFUuZfvFAWJg==
X-Received: by 2002:a63:ce4f:: with SMTP id r15mr6183820pgi.400.1583153671525; 
 Mon, 02 Mar 2020 04:54:31 -0800 (PST)
Received: from localhost.localdomain ([103.51.74.208])
 by smtp.gmail.com with ESMTPSA id p2sm2138238pfb.41.2020.03.02.04.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:54:31 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCHv2 1/2] arm64: dts: meson: Add missing regulator linked to
 VDDAO_3V3 regulator to FLASH_VDD
Date: Mon,  2 Mar 2020 12:53:08 +0000
Message-Id: <20200302125310.742-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200302125310.742-1-linux.amoon@gmail.com>
References: <20200302125310.742-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_045432_655979_50B75CB7 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per schematics add missing VDDAO_3V3 power supply to FLASH_VDD
regulator. Also add TFLASH_VDD_EN signal name to gpio pin.

Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Previous changes:
	drop the logs comments as they were not usefull.
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 0e54c1dc2842..fe5680411c07 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -54,6 +54,7 @@ tflash_vdd: regulator-tflash_vdd {
 		gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&vddao_3v3>;
 	};
 
 	tf_io: gpio-regulator-tf_io {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
