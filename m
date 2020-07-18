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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6657EC433F1
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:00:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 309B72076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 07:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TOmxnoBh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLVfAbEE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 309B72076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjICXT0jziLpg+UoF6nxWDTVYM+dw9tMrxNPojKbmCI=; b=TOmxnoBhFoj70hihGateoy5akz
	+N95KnQ4aJZqLL1BnglS4QIK2LcntuLRLLCqGZYwPsWpYEJBaMyE6C57YGCD8golMGZCWdzYvIw+r
	3ea0MAH1rrr6fZauxH3UEoAkDiexcrQ8SA5jE/Aq+iDctbF2gIgPixz6tov04L4yYjNcT8TXxYiSJ
	7FJI0lkC8OdnUhUvstFkl2I6WRqBx1anl5Zo01xhC5p6RgA4ApcO8xnHqIyXCkNbj+RhXmHTNJQNM
	6Jkcmoyu+Ycuh/naSrz7Rdvbgxx3frycN5pymhcKP/bqYGzoKSUMmZ4Ai0nDRnj/K8Kbs9AAlL+lB
	R5Sdf07Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgpH-0002M8-80; Sat, 18 Jul 2020 07:00:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnR-0001LB-4j; Sat, 18 Jul 2020 06:58:10 +0000
Received: by mail-wr1-x441.google.com with SMTP id z2so13280246wrp.2;
 Fri, 17 Jul 2020 23:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+sbzGxZrB59pV6U+pYub8QGMoi1y6WlUsM0RAR+NpTo=;
 b=MLVfAbEEt8OAz+5SAcw5V9iCQGbToqL+cmlSIIL8EpSA5td5CPH+5VRKLJ1yqXeMNK
 SzgM3CMnrxFlqh42qGcDI48MkYDTAgACq+2sa/8OcFzSi097xlhleH7JcH25pC/h55QB
 RS81OLa3zJ8ip/sWEf6dYPZBbdEylZpZjwDebRMra5YFEgliCzfnerO5rY8hvyMaRaqN
 89DZCM2CS71AcUqH43J+kAeuGlS/jc+O7SIle0NI5gmVQb892V5Xentb5B5s7Qta3tQL
 jGNXwoamC+JYy85rOlDgOAs+AEGuK+t6p4cYBtSLMAsDV+gO3ITZrbxyLInK1DRfLow+
 tIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+sbzGxZrB59pV6U+pYub8QGMoi1y6WlUsM0RAR+NpTo=;
 b=MQxhtqQYuZRERrLJGH+d+aMH3gCyVIAcFSoFG7yaUHauKQeQErssqL3lKNr3ygCEOj
 W2uPLNhFaEnMYEGWlpc3B4OAyDAtyg19aVVJ7gHSCcK+fBxVzj65LVjP0sA9y7UacScZ
 IwN+FrhrC6J1wgeUaiYobNW4zag8SkWt8mvTuQtj3o2eUxtazkvhs+I8wYkexpmDyBon
 yHWgupOTffWpgFf8SMqgwalYnOrc32DHvupL7pZL1GRi9vABOWK6Nb2y1Y7A3qbEhdGi
 0p1CdB7+MnKrltLZBVtoldTQXyjK+z3zWQqxH+wfFCqtdkwWt4swlrKexfIpUW+a9g6r
 lTAw==
X-Gm-Message-State: AOAM533++yaPNbzDinBRkPPdZXlhtrWT9hQoqgemZR3GhgW7SS4J0fbt
 2uimriKTrWc5ZlteXIIF2dc=
X-Google-Smtp-Source: ABdhPJzzF7AVveOnVICfgyrqrnbw/GMJl08joyt9cIy/Hji+DY2GExCAGi3oh67Ji1N4fp8pOjJmyw==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr14296531wrw.16.1595055488234; 
 Fri, 17 Jul 2020 23:58:08 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:58:07 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 11/12] arm64: dts: meson: add audio playback to wetek-hub
Date: Sat, 18 Jul 2020 06:57:38 +0000
Message-Id: <20200718065739.7802-12-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025809_284137_654021DC 
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
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index 83b985bb015e..0c1570153842 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -7,10 +7,50 @@
 /dts-v1/;
 
 #include "meson-gxbb-wetek.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "wetek,hub", "amlogic,meson-gxbb";
 	model = "WeTek Hub";
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-WETEK-HUB";
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
 
 &ir {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
