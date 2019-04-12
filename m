Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C26DC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 458B02084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 12:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jylH3z6N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LoYp4Hfs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 458B02084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhe9ekz0LUjQp7BI9SALQRa3rpNB63WW9B0V7EK2JOY=; b=jylH3z6NqPUXj+
	+64B2R15b/ukAk1N6mGkyIzCHSTbulbWT/3Ut9WIEU5NZOoNQR/zqakOCrq+JmgfQydwChOQrG1RZ
	ogK0iBtZhaaSObU2E3TSLMFlE8FBLlIKHvQER/OjgLE5L+CaZL1oqlkpBJbfXa7UMGHWnNVvPDigG
	RUusdKxJHBKUnNwRjH+fS7nHtDOVeYgEYy6RLS9LMXOLpIZcghsqT+lEa32bMm4RyK46D1ijtUlGX
	v3oKFND+OvVi8pzirbTubUOzoR0hRh+tn96dTURQa8KbzQ2OnPNHbQjqxvh9JbuniJGov8mnD2l5/
	K9JYBNUOShBFxt0Y50XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEvgB-0004YF-Vg; Fri, 12 Apr 2019 12:53:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEvex-00030F-9m
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 12:52:05 +0000
Received: by mail-wm1-x344.google.com with SMTP id z6so407332wmi.0
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2XgHdka99JxAH5bHt7QNVLYXwa4NYXicHBYGQh/K/U=;
 b=LoYp4HfsTJ5FffilToBeq3hf38rheo1/X2SZYNC8RiUZL8PK2c0mOJmHVO8WRJWkG7
 9EAjSSQy74qy8kNTNCnt+CuLOeEW/pPXOMN5n62xB1jw13CIsRU6qDbN1AZ2cA7M0L+6
 7X5KJqZpKJIu408rWW2j8viRuP/UDOJo7mHIn3SQHUo2J/brKcceEChlaTe5SDyx5/+s
 9cBMjfMOYMh/g35TNOl7qlB7QVadE2uhABLgY690wECOobMkVdHHxg9wTMCBcWTBsW39
 t8s5VLeFhEn+QT0oodLAIdnYQXMmi4SDOzmyQUGnB0dQ0ZL748fAPGIf+dNvIo0+6J5Y
 T75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S2XgHdka99JxAH5bHt7QNVLYXwa4NYXicHBYGQh/K/U=;
 b=pt14cHVybzH+UJdwAVPqPPSD9NPe6kuLSxyoEZHOqqarcH/enQOoIHdkt8sJgbwx64
 kWxGWzFWAIe09Z5E3dPH74xbiGVMW7UZ7rkeYtdMbVV969gO/1MABYZ+SGElCpW+2/Co
 eeuqW/ZIyr3aCjySPtOAjh132dH92ptV8BjT5JJj0438VdG+aGeWgNiro9HTzUSLA7db
 QTQNHHKF/tBLiz2B1iRkQByqcd1JFK7HDaog9n274iqltkB+ZVRdXaJ4xprYSrQzBpM9
 7MhDwRqNWas5GHv94R+RveH781qZAFGjwEJMneUm/4uLnWf1XeVWgRvcgibGH3Z0nPg/
 RBDw==
X-Gm-Message-State: APjAAAXB7Wpor+zwKe/+INrbcYETWqc07FBgduT/pv+PI0l5ihOZexST
 Ez10Jt1DuyrF2oaCuoUVtDrtJA==
X-Google-Smtp-Source: APXvYqwZNcVmfesEvsS9kQo3zK1W6pR/gwgB05Ni/jHWLnfkJTuuNFJxxSjEkDSckQYCiwGH1YsKBA==
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr11375013wmk.18.1555073517956; 
 Fri, 12 Apr 2019 05:51:57 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 b3sm42049702wrx.57.2019.04.12.05.51.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Apr 2019 05:51:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 7/7] arm64: dts: meson: g12a: add spdifin
Date: Fri, 12 Apr 2019 14:51:36 +0200
Message-Id: <20190412125136.28232-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412125136.28232-1-jbrunet@baylibre.com>
References: <20190412125136.28232-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_055159_665865_22CE9F69 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the spdif input device of the g12a SoC

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index ab46b2b0fb86..41419ff74be7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -427,6 +427,19 @@
 					status = "disabled";
 				};
 
+				spdifin: audio-controller@400 {
+					compatible = "amlogic,g12a-spdifin",
+						     "amlogic,axg-spdifin";
+					reg = <0x0 0x400 0x0 0x30>;
+					#sound-dai-cells = <0>;
+					sound-name-prefix = "SPDIFIN";
+					interrupts = <GIC_SPI 151 IRQ_TYPE_EDGE_RISING>;
+					clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+						 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+					clock-names = "pclk", "refclk";
+					status = "disabled";
+				};
+
 				spdifout: audio-controller@480 {
 					compatible = "amlogic,g12a-spdifout",
 						     "amlogic,axg-spdifout";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
