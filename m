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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2FAC4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1823120855
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eG5BW2T5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxZLwRsL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1823120855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3d+1qMAMCn/Ioafkz8OMog6BT9KDCTieY6SDpBFTj0=; b=eG5BW2T5E7DJL8Tvzp1/RHkymz
	8un22fn4BS7GTjMDfmIfARiEYfvS74RFbz8uNAEFeZQXdAluS7LxHYnDxKV/veD8e1JRJGmz1S1sF
	lqkZPrr3+1ABB2ELhVF+DGZf6vDnup/NDJ51fzGKXXHfHMyOLp6RDv7n7TzCJXUu6cASvLEwn43we
	zznrDjQam/S/RnRXfO2kGARUcs1Q1kYoh4xlenavTFn4borxC6mUlFI49B0n2dNAsEYnnjilgt4AZ
	GPfHkheoJMb11ASjvRxvYxaaimJTv00G2E5IP5bDMLna3ZuVXa7wZv7+lkNE+QQrhB5Ip8CYD1UVh
	Jmd3QNvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXtb-0001Xx-2e; Mon, 16 Nov 2020 06:21:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsc-00017H-OY; Mon, 16 Nov 2020 06:20:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so200418wrg.7;
 Sun, 15 Nov 2020 22:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6vYF1uN6y1MEmfx/aSCmf3xT19pRJOVeWursMQGhdC8=;
 b=HxZLwRsL9L3clU/gWk0Q9ZInhSslRrsA3tfRAZPyQtD9eDKYPLlgBIS2bTqeZmqYqb
 uT5GZrmkK9M6Itn+7tOyMtiqZKSfXYHC/XbiW3c9doJhHlrf4LD/6+7Dr3QUTpXoicNF
 CLbo7/Mp9lNnC841ZwXezHm0M11uK0hrfFynPB/1ONz3kK2dtyP7SLUJ6HrQBbceh2cA
 zIUydObcGuEFBYCAfH1AOOv9z1FAtSN/NYKs8wdU9UkP+OvTrfosFH+8Q8xbKr3AGf/W
 qRc+862chJCB9r/dghsQ6H61/jdNXFHdKBVgLmxRfrcYdgA/CZj9Od06wJuzHLGt2BJu
 M9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6vYF1uN6y1MEmfx/aSCmf3xT19pRJOVeWursMQGhdC8=;
 b=OoqAviwRpIFvJzM5Tj5iJuHRS+oOvKOI3+T2yfLoTdeQovh4X16wJF2BeQAwCzRXWI
 TG8unjKvEovAtgQLEyqntHlYxHLzREt9VXHwdogJFMCX85I9NDh0MM0uu38R2SKo4oKe
 v8EeSeEqdW8lnbW094wdT5nA0Dy3CdO+pdtrkUAOSPfrNpW/jy/O0FdyTfmn+Wjm9WwT
 QWn6WPVz2sH0YbFQpXPjXfuhYfW7Wsh6QJmLhFDQaNQNogErFT2UaQoB8narGfHZGmvF
 t9t4f0Hwz2JikpTkxH3pji3ifxfud5wd2XGE02cHa+wvHasAMWXYsD/+F6f9jxJEuJYZ
 uV8g==
X-Gm-Message-State: AOAM532AQhNJP99IEWBQM1L25QanlrjRrxoKLyCt2EX427IxLkfFPqgH
 WzqqUf7EdDNv9f0T32yL/Ws=
X-Google-Smtp-Source: ABdhPJxWY5DjtO0AcBcOkDH5D624IlsLS+3TwQg7ls2RUOyHEZm1AaMxIVyQh8Y4+yULr/0oNbXAwA==
X-Received: by 2002:a5d:4c52:: with SMTP id n18mr17452650wrt.68.1605507645868; 
 Sun, 15 Nov 2020 22:20:45 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:45 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] arm64: dts: meson: add audio playback to odroid-c2
Date: Mon, 16 Nov 2020 06:20:29 +0000
Message-Id: <20201116062031.11233-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116062031.11233-1-christianshewitt@gmail.com>
References: <20201116062031.11233-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012046_868835_1877003C 
X-CRM114-Status: GOOD (  13.98  )
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
