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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74CB0C433EA
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4616F207FB
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tBXMiYhb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKEVxq8x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4616F207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwPE7rYRrDzCfV9XiYuGzUsSIl+umzOZTugL1URDwQM=; b=tBXMiYhb6muavMq5BZ2D7SuxYk
	Y66Ze++elcmNVxlrL3HfjATGQG9mH3SAscumZFUWCcVaLiXWeU99VYndrxnYiH+4TnKbs31RLewqX
	0Dcm2tmJcHHHsoxl1DQtHAbB6uEFyLF7fhwwI6onLy4fCXO7kMoF8btFnStM+MPSfotWitUi+fblh
	sA5ZXA94OEXf3t3UIDHa2JrVHYN6IP/789AEwoclZ5cnXfrOui6HmJClaW4VhC1iKlBU6vg6WfrtL
	X+QSsE95fisRagnyfjNbmgRnK6Go33QXGWK3y2z6DHCcjGKNzyvBKyrdpQT/8V6tJWQce8dWl5GdI
	F5a9SVWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgnD-0001Eo-Ea; Sat, 18 Jul 2020 06:57:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgn6-0001C7-5F; Sat, 18 Jul 2020 06:57:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id b6so13213357wrs.11;
 Fri, 17 Jul 2020 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UrTzQqJfmOE3wc4LgtWfzvjavE1CxqA487snNOvdDF4=;
 b=nKEVxq8xAgb3BSHbys0l9zq2gcV8D7HhIfslhM/xLae2SyJP+Sg0JAaB6eGnECz8DT
 RXca2F5O/JilwetdteyW/89mjPpFvb4BxpqWPNhNKjmckmEWfzbxMDLE2gugFREWvUK3
 PHWgG+u445q55dd1KAsu1Vp22zN3kHuPVG2fm7Fd5gzZ9qZpVNWfBWDq1qKW0uAm0LeC
 uRUSca4zJ++vK2WxSXib9cWMQzjR9+3YuF7wlJFAl7G5GlqE1Z1qvembQBd638C0NoFt
 sHd3lH64y+OalOu7bnvroC9NEFZbJWQCn45XCGRkFb7o3verprQfuWNGgqSlXcYTJk2n
 02vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UrTzQqJfmOE3wc4LgtWfzvjavE1CxqA487snNOvdDF4=;
 b=CwEqBWhteif5WRCmSQ+R3P6m4tzM3nMKbBcqVDC998YbsUMhgyM6tzVyxj1SNFG/Vk
 rE9Og+dVdqXSLzDiV/N7OD9Y/IQaXoTzIYj5YUL12ntj+C7pDMUkeYBw3M/ZaZUl1uN4
 J//ZKTKwj9RdbtFilCrlEP/oIHktAOLbIM03mRkV+SALSVMuTiaeoBXJqJfQOA2U5iVU
 oIqEdSxDFazpkK2L103m6v7MmpumIqEPInA1kBPrN7TfBmtFlEi3bPFqZsw7u8Gr24+E
 V2KIUefTs1ZvmKBq9KFjfTfaktkiGqUj4G3lPv8fdZ0EAIiqPJs12d0JuzjAR3oM1u5q
 el1g==
X-Gm-Message-State: AOAM532nOPJ/qUmAx4AxawmRrxCaWOscESkB4v24dk5P3CFj7Rosi3ou
 wBE+xZ60jLdhg4q2H41OkRk=
X-Google-Smtp-Source: ABdhPJxT+zWK7JQj0ZP6zsmrAOMrSNN5TIxi/onMGo7pglJq/uFAcC4q4lZL3vH6T/yRTz7ae2lnWg==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr14400539wru.410.1595055466673; 
 Fri, 17 Jul 2020 23:57:46 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:46 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] arm64: dts: meson: add audio playback to a95x
Date: Sat, 18 Jul 2020 06:57:28 +0000
Message-Id: <20200718065739.7802-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025748_246275_2B34CA2D 
X-CRM114-Status: GOOD (  10.82  )
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
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 67d901ed2fa3..b5b11cb9f393 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -10,6 +10,7 @@
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "nexbox,a95x", "amlogic,meson-gxbb";
@@ -139,6 +140,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-NEXBOX-A95X";
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
 
 &cvbs_vdac_port {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
