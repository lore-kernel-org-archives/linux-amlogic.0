Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4534EC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3C92075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:23:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="grebBPNN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r2OcgSMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3C92075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePuZSeaw5778yiccVzdMHnv5uvvDOu/45u74M3PIhCk=; b=grebBPNN75f3ul
	1lX3IZWgdu4SVeP8dIo1FScgW6clkw3ZLBkPsOdFXOigqoXuWQ8rmPbYncvbV8ZyT1DmJL78iWcVd
	2i/GyoOy8nFYTSLlxK9AmJjMJOWsuZNADyXD4M3IxUY7u943OxgCgrfIv0NHhbk1eQQnC7u9glqMl
	SWuclutssdaT3GKHgnj1p1qi2v5Fbn+gi7SqrMZM6p/UPec5N9sflaD7rC4WEzk7xi/KOW9EmBEdP
	L5h6wttC3h4BPJNkPndwwnTYdoeXAA/SdZlxLD4BRymNFK02w5NtRJ7QGKygOi7K7CjRBSv1cQ/h2
	qBHkGrJCYMElCGPhZZZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFav-0003VC-Ie; Mon, 27 May 2019 13:23:17 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFZo-0002B3-VR
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:22:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id m3so16943244wrv.2
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0UO6p2NGpn6/x+RK1bJoMUDg+U4e7UPzCJT+tP40PaA=;
 b=r2OcgSMZb0v4j6KbwLI3lZude7y52PSXwphSwGgAIB9u+xVVV7O/ahSo2ZS/LMcwH4
 wqshUKB2VvyaIvZhSS1V6K9UjnbU/mlFMiBkGhIM8CIkv4bJvseyfm2UDDmt9hu2xBT6
 7mNhfmxgyl+059rx5X70BqJVEko6sOMPVDMUIj17uk3Mz9YHuInOrtmJOrdDUh5agYy3
 HWxtSiW4Dv1vzm/RcshsbWCqdV4AwrqZqlNL4O7MUcXGlbc8UecfNomF9mp+IvnpLTmx
 eKGYRgm+jZrmQ0ClplDsnJEqjxcxJ3Kyvw+9oxCoU9lggtjHlOnmPBVzAL0C5Y2ya6Ck
 C2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0UO6p2NGpn6/x+RK1bJoMUDg+U4e7UPzCJT+tP40PaA=;
 b=ixeOQGhzUGcYzs9j+ceHJYsTcp073hGGyOX6/UcQ705vTC3VG+UWFxoJaMIpS1ADbE
 k8k8nNQpppV3m2YGNb1LSDUkFTwowN7ceDeGXDCuOpjnCkyez7vyTH0n0/GaKtaijZkD
 H535cYgEeFKq4Gz0obt6CaaFuAYTcpowDXplocCp9WvDrbQ+G0NP27ck6P2VOUmQFEAC
 QzvWySM5Bso9IaO5/zeHbh4ryyjcXrlm1U5efQvF2MeQOk/E5bt86Q0nBbXjlnJZyOpd
 0tCPfbRthzl7nG/+Dd+xGr805gCxIab4EX08GY7+4Ow1dioBeLaLldSKaF4XQqcwfI8t
 kDyg==
X-Gm-Message-State: APjAAAULQvrfmisC7//Yhyqn73gcBT4fQSZ+WJvQyxhlOs/YbXOpusY1
 cNTBQuV+2gKE7PjbOwgoCqOhQQ==
X-Google-Smtp-Source: APXvYqzCwOlwTFCDqqaeLiT8HaxVqritfgZVZbXUj48aOqAe46yNkgcCzFHUbw7WVsspKUXNijl9Ug==
X-Received: by 2002:adf:fe07:: with SMTP id n7mr134383wrr.7.1558963327475;
 Mon, 27 May 2019 06:22:07 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l12sm7019836wmj.22.2019.05.27.06.22.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:22:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 06/10] arm64: dts: meson-gxbb-vega-s95: add HDMI nodes
Date: Mon, 27 May 2019 15:21:56 +0200
Message-Id: <20190527132200.17377-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527132200.17377-1-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062209_351423_3B3AAAF1 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add HDMI nodes to support graphics on Vega S95

Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 760730d4e87b..6738b2aac9a0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -73,6 +73,17 @@
 		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>,
@@ -108,6 +119,18 @@
 	};
 };
 
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
