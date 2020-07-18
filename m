Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D6EC433E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00A7620809
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8OYtMKp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9q4k/1U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00A7620809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3d+1qMAMCn/Ioafkz8OMog6BT9KDCTieY6SDpBFTj0=; b=Q8OYtMKpbEYOEcIoDs3ZPFrcAO
	OU/x8L5xmkGkqDSjXLk3CbVfNziWTxOr5REtW+FKOUrlNo+3UNkpu6zGrfvy1LAiHNbvJnz/gqclr
	5URqroMAAc79NSAA8DAjsJ+2uRIoahjp8Dh9Y1Ze0M3XHVQvuoQeuUIe8Z0q3gVBTcBKXn1xtrwrx
	V2ooBykDq+SH+WS0wvnTp5JyT5wBoJMIXYATUh26Bt6O9V6JJxu/ldAIRhgRrkXZFPcnFDImlloP0
	z7XNNQvj+5uLbG2B0a61yMaCHEVEtvPD69RXUt7PtGCdZBk/Dc2bmesKZL6iLzguOHfFQeEtg/CiG
	fZjj50mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgny-0001Yy-S2; Sat, 18 Jul 2020 06:58:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnE-0001F0-Fd; Sat, 18 Jul 2020 06:57:57 +0000
Received: by mail-wm1-x344.google.com with SMTP id j18so17746063wmi.3;
 Fri, 17 Jul 2020 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6vYF1uN6y1MEmfx/aSCmf3xT19pRJOVeWursMQGhdC8=;
 b=r9q4k/1UmOpnNBFOhm8kzTNUat2F0iPzWuggKmToYGhPmp4mQRg8S0msDjtyjs+qYm
 b4DwLCCVNLlFSgL3gQ52FWkH69J6TOE2SPbhNNgvV9q+JEWpU8a5cxRzIT6sW/nbALXX
 QI291noBxQ43LnnDHCvUmvSie9eHV73krHsCkYf8YeNxYxnTOJCG3OFEuH0bHKTOpk9u
 Vzh9JWpKWOoKIz5p4BpUnEtMsqVt6MJ3Pi09bpg8xiOqwpH8UGv+uagQIDNi0NjwVRM7
 wv+pRjtzGbD327/2zzmCwMTfDwaCJ67CzeNnT0370VkOlPMd2Ps+MSQzYLpSvUHYEO4J
 2PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6vYF1uN6y1MEmfx/aSCmf3xT19pRJOVeWursMQGhdC8=;
 b=hxkiCrHeMFI+BQNMpJ+MuodFKMsnabYpSiImrNHEQaIKRU6310FKpy/02PSXu2c7TN
 oY4AGmGsNf32JYEbBZeNJO57wcI+suZU9EJsfP3g9fVRMgpeHvdE4BGpJ0rXm3mILu5S
 MUA2Ofu9HptJl32BBE9s68vlLu/3iqvRFwiDTQ0kEoxW/LvY2xPVCcW3BMrC89xapqUf
 8mGcbvmzy2PyMc5ILXaLr0srFOC8svXEuuTVY0kYqxDKoO7yF1dz7MGLcS5N4JqeU6mX
 uCzeYrwGyk6lvili3X9MxCSBblfoEatH36ZV0991coroHCu+ldcIkYhG4+5ZUEz69BVB
 FJ3g==
X-Gm-Message-State: AOAM5320Q1tnNJ1iSID3EAVne/nSYIoMH+fZ2473ZvxkdblmS2cWZfQo
 /LqAlJ5kWJTM3ssKYx7fplw=
X-Google-Smtp-Source: ABdhPJxdylbi50zUlqb1YYOa/Ff6SMhJbfn7P8x62EDO+8C6uMeUywN98DVmiDvFARfD4Pn7nGRWdA==
X-Received: by 2002:a1c:2183:: with SMTP id h125mr13322903wmh.83.1595055475237; 
 Fri, 17 Jul 2020 23:57:55 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:54 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] arm64: dts: meson: add audio playback to odroid-c2
Date: Sat, 18 Jul 2020 06:57:32 +0000
Message-Id: <20200718065739.7802-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025756_593777_5E96D675 
X-CRM114-Status: GOOD (  10.73  )
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
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 70fcfb7b0683..9d8c919c6e19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -9,6 +9,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
@@ -172,6 +173,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-ODROID-C2";
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
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
