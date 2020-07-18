Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699BAC433E4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3402E20724
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ksfm/aHf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPJpR4r8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3402E20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Pk3vF50ESHZcpfQJ9f1EUt7hVg4dMuyz9kcXUOW7Gs=; b=ksfm/aHfpQ4hcvnTopkKn0mWlM
	50gAXOdoEX4jodG5pl6u2Ffpzfux2ItdarJhIfNzYcG/eLUPQCTKfiP5zpDXb/B+VzaEt66bMHNKP
	Pc13+WpQjh8oHE0eTJnhgOdRMlJ84NyJUu+WhWKOn3L9FXT+wJdaL7Mu/odHfox7CB0gEzStBSead
	KMPmYdmiORWBf5ThjAsPQ5EkIVsIlaHeFLDj9ltnupfAh41TeaNsuW0ILOlXP+0TQSWtQGJwRpOUQ
	GUD9JpgCNJwbsafwitmjtnrnywHLqwhrajD3bj+mzoRMAtnlXdm9Q6OXveulOzO7Nhvgz+N88W2sH
	F0jF6PWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgoJ-0001hl-3e; Sat, 18 Jul 2020 06:59:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnG-0001Fu-HV; Sat, 18 Jul 2020 06:57:59 +0000
Received: by mail-wr1-x444.google.com with SMTP id z13so13242532wrw.5;
 Fri, 17 Jul 2020 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ylzKfvJHgekxjZxp4VQuW17EoD7pYVoukf8XeW0SJg8=;
 b=nPJpR4r8aWcg21Jci2wdL9PPFkYkK3SovheA8oW0iOctEWsGMb0hoqZl+PgWgygYsP
 nRTxIFBSNRQnROHrwxaLbjoZsSUCN7tJdtXwnjBlvOVPZt3Hp3wX2Qu2hB8lysDU75bS
 xSH/snWzBSXRzNlso6CBnscdWqfTEt+I5PbrSZIrrwy796oFW/4YHNF2f13nVsKyAK/H
 6MYXZPUE8sVEeagfZ0HDsh9ejhHT8EwiAnI3jbVGAoRraDc2swQjFDZAVoV4G0GCkh9Y
 2CpawS7R03MKzyzqTfNwUac/1IH+XeT/Jo2X9gw995k6cGQkbvDCOGQuRnjQX4Yl2560
 Pggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ylzKfvJHgekxjZxp4VQuW17EoD7pYVoukf8XeW0SJg8=;
 b=oeZHOWqFbgZ4cOgEkPC1LL3uQ5BVThGi1DpETMQLJOaabwuh49UYsuGO9VPy4XC6k/
 ChEGmcEL93DC8qQG+WnLtR8i7ANiKLvS7mR0B3ft1PS41st+wFnHW37oDXs9F2+X8kCV
 zOjzKYnL6oXqSSwsSvUfUj+JhOaWkEEqNt32Ny9nXBQUwMjWWrq+K7vRZ5HHvz+rp+zP
 iEMLuqx2no3b2h4MuCzfNzuCUO7vJCv8eTHgCf3bxP1d68CVz5leaV6WXbn3DAXbvOuh
 hThnC1rTkoeruGxKYsni9Z52N8vN4Jarg1kiIXy1Bx4wSBz4n/55bB969LWytwlnURtQ
 QIYA==
X-Gm-Message-State: AOAM531VzgmjdyZbchnlSCK/r+8eLPpwBN6+MFrLLORhN1gJw309/oKE
 85YUib9w1CymZCZc+1MYfrQ=
X-Google-Smtp-Source: ABdhPJyAQvdVb5lV8Tc2ia6rNx22vRUUaGpgY2GDkA2oJxe8zKwjgMj/Ha9H9SDMRqmQO0JsLaPyJA==
X-Received: by 2002:adf:b1ca:: with SMTP id r10mr14528884wra.150.1595055477364; 
 Fri, 17 Jul 2020 23:57:57 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:56 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 06/12] arm64: dts: meson: add audio playback to p201
Date: Sat, 18 Jul 2020 06:57:33 +0000
Message-Id: <20200718065739.7802-7-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025758_717097_C6805AEF 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-p201.dts      | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
index 150a82f3b2d7..2e2bccbcfd43 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
@@ -8,10 +8,50 @@
 /dts-v1/;
 
 #include "meson-gxbb-p20x.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p201", "amlogic,meson-gxbb";
 	model = "Amlogic Meson GXBB P201 Development Board";
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-P201";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &ethmac {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
