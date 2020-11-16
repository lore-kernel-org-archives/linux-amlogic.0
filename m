Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDEFC64E69
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5CCA2222E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="po8T4MDV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+mB1NlC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5CCA2222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwPE7rYRrDzCfV9XiYuGzUsSIl+umzOZTugL1URDwQM=; b=po8T4MDVYjNNhEtIboZM5R/JNj
	GTaXPBHPMX9YHBJ113MqEPUeR4ZFthBpObwzGpwn+VutwJ7izIxspR3kRkg1aV+FYqcdQ4Slgy2my
	Y8qOK0ZCxYdG5pI8NZH9HP3GTmal98wEFd1wHwEKhDFLKiqCAvMqNcw5gQIXOjzVK2SbLMPCkxVHx
	Uh7ljezPH1Cjf23HmTEfcPsB1RPjhYdosDUvWWDp0OTh3AzE3fdnFE3w1/Hfz2p7TeOiCgTb1v1mU
	Zj2NMua7BS9cBpil+zlL2SHmpQFcuhugqqljPj8xDnjaVhn0EygqH1PJ3qfcSpy5048SAKEuHek41
	+WvTj8Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXsl-0001AW-5Q; Mon, 16 Nov 2020 06:20:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsU-00013q-Ck; Mon, 16 Nov 2020 06:20:39 +0000
Received: by mail-wr1-x42a.google.com with SMTP id k2so17419055wrx.2;
 Sun, 15 Nov 2020 22:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UrTzQqJfmOE3wc4LgtWfzvjavE1CxqA487snNOvdDF4=;
 b=W+mB1NlC2H1+vj/gVQqlYXnEWkHgsAO24vZIi9pz20IpYaV3YDCnVnm52SEtMu74ga
 0prdFzLY4GzBCBdbhMTseqWN4nD1oc+NI9ivyc1E/v70v6AALE0oduJpAwXpyLQ65x/H
 ANSimfsx1NIZZhGDXF679gmF39FrgbbjFaCh/CjL0rNkmTAf6ydFE+9+0/QI43rpv/Xd
 9yLu07nVfpJYPcaB1T9nqTj5Wd+gSAB0R3HFIbY2q34nEO9CSZ+DO/3tYy24Q6rxn5aO
 VsAZV3pbjAREiN6UXD192tyiOXQS9pVU4lsEEcJNc+fT1FrNYtlZKpH6VCAELG492UJV
 R/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UrTzQqJfmOE3wc4LgtWfzvjavE1CxqA487snNOvdDF4=;
 b=rji4Y5SlsM5+fGnzHed5wjjO1MvxH3vwguxr46GJ49LdnwIppzr4XQ3c7lrCNb8Peh
 TYvwdJnoRqNtXztoJ84ZxPVug2a8kiyX4TYr7sCaHcQ+96vml1mn9Hk9W7U8f/rFJYRW
 xmiNK64EJ5K1Lx8WuEEief+Dg/MzgFiaEzN9816dd3Av+ITUOA5Rjph6Bc82QM4Y28nD
 S44SA83giRPxFxOwKlEGPoJO9Gz3GwAqI2dGCBB4sqcdIThhmoH7HQkVlkdhr+/FBgIu
 eLq6laEKmmXxd1VBs5yuj0UYo4O+bwX/TbdhNuBtPIQVgV61ldMp0zZGQH7fSNrCI9CG
 YjHA==
X-Gm-Message-State: AOAM532aaj/F48UE67ylHY8WvxJv/ualOFnt1wdhmCdHsa1yY9zh/H63
 +87Cd5sfJhheWSy1x7ZOHtE=
X-Google-Smtp-Source: ABdhPJw1jWE/jLVlMkHw4VsyWrjjt8pDzvDYLQhanqj63agvp4cq96/BakhhffvQIMqt0u063QVVUA==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr17467481wrn.208.1605507637390; 
 Sun, 15 Nov 2020 22:20:37 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:36 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/7] arm64: dts: meson: add audio playback to a95x
Date: Mon, 16 Nov 2020 06:20:25 +0000
Message-Id: <20201116062031.11233-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116062031.11233-1-christianshewitt@gmail.com>
References: <20201116062031.11233-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012038_527703_2D47A4C7 
X-CRM114-Status: GOOD (  13.88  )
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
