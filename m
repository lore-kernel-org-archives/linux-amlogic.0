Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316FCC5519F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:21:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ACE02240B
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yDMY3L+/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B1o8QfhU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ACE02240B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5dRe8Lzz2acUflT89rd32uG8M1J0DNtLK7DUJTrfhUA=; b=yDMY3L+/939Ypwbt4nR9jvMFz
	JO58oUjC9wM8wpUs1D8zfNKosFYIXWJaLUnIRQ/qS+SfKUEY/B44BiylVwA8uHOz2ej1xFrf8Nhvk
	vKJUDfEY3hPZHoHu9Vub+xZnKSSWK2v8EDEAlzPUDkyFXJyStFM4SimtutCNNvTOirid/lWOAo/tu
	j8ouGmwuR6w4qCdCH/S9YsTGMB1HUwZ6tAzJcWKbg0b19/qjCg8VTsOk4pN8IG0rCXLO2n8SJ2WNQ
	H5/CA4zuDtiB4CjIdKzQOWEBXADnuI6TBwNrRaGLKGg24+71n5CSXkiKPlqaqVP7ZZy1DaMl4fctR
	+fr2MblhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8EK-0004FC-9E; Fri, 20 Nov 2020 15:21:44 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8ED-0004Cd-B9
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:21:38 +0000
Received: by mail-wm1-x343.google.com with SMTP id w24so10142412wmi.0
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jm+LFDsAuAlmnsLcsYBo3X+JB70zBAzOQ+j9Y6X8SV8=;
 b=B1o8QfhUaAkuDIE7zaKnwLdUJFGU9EpmJ/AXRnkr8n1lQGNN7X3z0DIbbN4eAWvudC
 8TIIDQu6AeNW1hSPtPgSlUHoxholmvzgWme/IKqlQ4aAP9xohTrtxRFsZb4PfttaW7dH
 SUKggtOCIaIDPmjLGlhq/w7xRED2gzY/nWNWXNs9bZhxsUv8UBHh8NwuBa3bytOz1MZU
 wU8S5J3Yc9Bgvv4iW/ju59WMnxzIx4yhYncmn8xBeJAlAalEdNORAQcwDTjLjAqEIlbt
 VaNB4M7kVv0CWrERBdHTGZ6VzuvOBiJ1qNXyYbWAZ8w0OAs8vP0H/lAXnUHhHTckDUOE
 jOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jm+LFDsAuAlmnsLcsYBo3X+JB70zBAzOQ+j9Y6X8SV8=;
 b=ItWtTslhWcfNLRROoFXmhENAQQOOfXyWArhtbwsSixlO0ki/4iCkIY2gSHy/GBhli+
 uCHaiUmoFucnVvJ1LNTpTdAy7TL83WaRMK2sKIzbZ5qSNblsQSec3HYhcdTNhf0+LgiU
 FFelYuyIQ7IHwbd8Q0ww9LByUBD3h+HuB+f+uQPTCTDX4c3l6FQ3TgaTrAyECiPZ6ESW
 Mwfw15s+s1l+YSiqQpd4ghN5EekdiIFSaJVUX6adzCCf5MrNSjnQuZrne5dkbgJxdIRv
 AQdZ5qsD+qarUVuCo/CDyqbjDB0Vg1ftkI2OG4ZfWP8VNk8OK4hKFK0ZLF3tDSkKTnSB
 zlYQ==
X-Gm-Message-State: AOAM531rmtfBO6LtRCXjnrnPm60ADxEu8nO0zsEMLocUihGMTTO1Zzth
 HjrJTSI+BaH2KoobHkjM14Is6A==
X-Google-Smtp-Source: ABdhPJxW9wpHe9bTMR1XYCVyzhK/t1cjxnWRn6ytW2lmjiPCB6+Pbl5traLKq5nBRBvk8p66drVzvQ==
X-Received: by 2002:a7b:c950:: with SMTP id i16mr2987010wml.136.1605885696147; 
 Fri, 20 Nov 2020 07:21:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id j71sm4773757wmj.10.2020.11.20.07.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:21:35 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/2] arm64: dts: meson-axg: add PWRC node
Date: Fri, 20 Nov 2020 16:21:30 +0100
Message-Id: <20201120152131.3918814-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201120152131.3918814-1-narmstrong@baylibre.com>
References: <20201120152131.3918814-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_102137_504366_97F8BF4B 
X-CRM114-Status: GOOD (  15.02  )
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

This adds the power controller PWRC node and the corresponding ethernet power domain.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b9efc8469265..288667699ec0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
 #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
+#include <dt-bindings/power/meson-axg-power.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -187,6 +188,7 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			power-domains = <&pwrc PWRC_AXG_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
 
@@ -1117,6 +1119,46 @@ clkc: clock-controller {
 					clocks = <&xtal>;
 					clock-names = "xtal";
 				};
+
+				pwrc: power-controller {
+					compatible = "amlogic,meson-axg-pwrc";
+					#power-domain-cells = <1>;
+					amlogic,ao-sysctrl = <&sysctrl_AO>;
+					resets = <&reset RESET_VIU>,
+						 <&reset RESET_VENC>,
+						 <&reset RESET_VCBUS>,
+						 <&reset RESET_VENCL>,
+						 <&reset RESET_VID_LOCK>;
+					reset-names = "viu", "venc", "vcbus",
+						      "vencl", "vid_lock";
+					clocks = <&clkc CLKID_VPU>,
+						 <&clkc CLKID_VAPB>;
+					clock-names = "vpu", "vapb";
+					/*
+					 * VPU clocking is provided by two identical clock paths
+					 * VPU_0 and VPU_1 muxed to a single clock by a glitch
+					 * free mux to safely change frequency while running.
+					 * Same for VAPB but with a final gate after the glitch free mux.
+					 */
+					assigned-clocks = <&clkc CLKID_VPU_0_SEL>,
+							  <&clkc CLKID_VPU_0>,
+							  <&clkc CLKID_VPU>, /* Glitch free mux */
+							  <&clkc CLKID_VAPB_0_SEL>,
+							  <&clkc CLKID_VAPB_0>,
+							  <&clkc CLKID_VAPB_SEL>; /* Glitch free mux */
+					assigned-clock-parents = <&clkc CLKID_FCLK_DIV4>,
+								 <0>, /* Do Nothing */
+								 <&clkc CLKID_VPU_0>,
+								 <&clkc CLKID_FCLK_DIV4>,
+								 <0>, /* Do Nothing */
+								 <&clkc CLKID_VAPB_0>;
+					assigned-clock-rates = <0>, /* Do Nothing */
+							       <250000000>,
+							       <0>, /* Do Nothing */
+							       <0>, /* Do Nothing */
+							       <250000000>,
+							       <0>; /* Do Nothing */
+				};
 			};
 		};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
