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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F265C43458
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694642076D
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KOSo7CWk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caYg/F1C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694642076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asE5S9SkJwiFyxEVX1d4dB0PPFcoC8gFkgyBO8KVPRM=; b=KOSo7CWkkzRqsSbOG6f/L03bih
	KNfxld+0JZcsZFbImmIeIa2UTRe1ieMwlt2g3D5+ha5pPrGe9+KYExTOw+3VbwNYCX5fuX9Q/DLbd
	Z3jcbFCfFsjsZTIcMA+qapF77dByfCrnhZDU8xPDtSVbjUM4kCQza+1uEyK1fpYwRSoAq7oelsyu6
	TFKaLp27IstWmNkJzm0v5G7MMHr2zhYAOvQ37nJNOiGs3BsCWS5LLjaslLnUdn2YMxAe3I3wAhsTz
	20DA+SWpXz3NYhhtgGzTQrgksRJyeH8rsw5AEnA9hEp3Q1fNMwzaTErgSUMW91LqrFkT/n9RFCnDS
	Yxv2txLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgne-0001Qx-Lk; Sat, 18 Jul 2020 06:58:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnA-0001DL-Gg; Sat, 18 Jul 2020 06:57:53 +0000
Received: by mail-wm1-x342.google.com with SMTP id j18so17745964wmi.3;
 Fri, 17 Jul 2020 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0aTKJ5HZFsSQ+eCcPAw4QelVRGYoHt0VsuUcLv/a/yw=;
 b=caYg/F1CiwwGkHeQR/B4qjCLeL6H2OxPLCrC64xVRKZ5qK692K0AEr6GJgBw6r16zd
 9n1fNjzLqULafFSRpHgpPBmvwQ1xWACjR7Ml10/v6S+2XTAJ7bok15B/jllJYgmL2PLi
 NiAl0QriTi6R5ak+hJaTtj45aMicNAJP8WQaWNaLNm4T00Q0ZXuFfvNcu6/eRGQYD37i
 XsMR7dQ5SHUKS2GfXlK8lE0p3Xrynm4nxpt2cYvKs2118gAWngDJVdOhmDk8vaEX4hxz
 /0pO8GfJiXUed2NNCcdpaWUBXjkhuqTAdn27VpUygM8J6az8Wx3QpyTtcx9oJ/Vx3aZz
 rPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0aTKJ5HZFsSQ+eCcPAw4QelVRGYoHt0VsuUcLv/a/yw=;
 b=dogMelk1BZtfslKFqglOXQLHTqsC51qUO5vXzl8A3KUeCok8vYyHjv4PzpOt5srHTu
 xigWqH6OfPMk60KuOoBEcWB5lv/Rce6RPSRqstgYpFJMS8pNpvdvYX8csfTLuGedd5rH
 sD5sq3lst6VCrUMJHhOx7OK4kTD5iYqcvtrjFl9sTzvZCstQ35fDOq2LQ9xEOL36i8bN
 1qRFr9qNNStPVk5BIs/v2gmeRwV2Zf9TKxiSA26s8yCs61Gq7CbsOhUMYu5bUfKop0IH
 cOU9s542+NT98yCl1uXXpoyqNUSYP8omYDBgUnekSRkOhEdhl8YDuSrAKxJ0TQY6QUbX
 ZxoQ==
X-Gm-Message-State: AOAM533nIbELgIJf4zbKbfassqBe+YUTzqdQevQYLORMZ1dWohDwOBTn
 kkgOuyDsL4UOpkh6yCElzwc7POT+
X-Google-Smtp-Source: ABdhPJx+0bXWdJ5NE92Hqa5rIB9eDMnmi3al+CVIzyGEaTEXb1ufuNsWoDnDnbQDUATAG7sFuy5bVg==
X-Received: by 2002:a7b:c956:: with SMTP id i22mr13218592wml.95.1595055471013; 
 Fri, 17 Jul 2020 23:57:51 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:57:50 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] arm64: dts: meson: add audio playback to nanopi-k2
Date: Sat, 18 Jul 2020 06:57:30 +0000
Message-Id: <20200718065739.7802-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025752_608126_AAF610FD 
X-CRM114-Status: GOOD (  10.83  )
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
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7be3e354093b..8e5df00b06a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -7,6 +7,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
@@ -130,6 +131,45 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-NANOPI-K2";
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
