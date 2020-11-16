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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80CAC63697
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399D320684
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kEngum5y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyS4m4VP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399D320684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FBTSPx8eXa/Zui0fUoLE/JF7S+VMQpqFafQBuuMRjM=; b=kEngum5yYrw5qtew/hLWV86ejE
	DvYaKVCAx+tLHyd67vZLXaejJKQ3AoPKctMUbl/UCsVq9KW3x/RkKhiUKizfcWNHpfZ81UoHlwMeV
	rM+BBx1meQPN7nEbGGzoFU6qVj0jKlvWFwekO2xhH+B61cRmWHKRWqQgfhWfLjlaTG0KpqK89lG79
	+KYbCJaUOicGFsRXeHyA9rkzfiMsfAzCYu6UH9rXs+LoYU/Xw1s+vhKp1tcW+GlfzPBSKNxgEnAz7
	pjUNlpVt6Ln3oTlGGV5XBshbWxCznZJkW1yauCJbhG4SZ36qHswGE0r26ppHi820zfYa1o3dpAr3+
	wchtVX/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXtK-0001Ls-6J; Mon, 16 Nov 2020 06:21:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsY-00015Z-JV; Mon, 16 Nov 2020 06:20:44 +0000
Received: by mail-wr1-x443.google.com with SMTP id p1so17335256wrf.12;
 Sun, 15 Nov 2020 22:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d988cBXnFVQ/GWsV54ibiM2GROtIFfDIzMG48hK8mIw=;
 b=dyS4m4VPWFRukkjQ39dZz3y6F+S5CWL50MrRNVrAaPWuqOlbfdTc3MYw+ztts8F80W
 CwgUaFxC2F2ysgDeR+ZGn2cQZWSmARarf5CX5+wsdTvD/IyINLxYUncSIfMKZfWnPfz5
 jlHpAPgAth+zavg39MQt2dVx7vvdWY1S/NLel760g7ZkGeuSbUGk55KLDE8QfIkyBy6g
 5rTIek1jS1H4ALjv8OjWKcSfgA5SQdH40HgYdX3M22jqX5yVkBigFm3IQqGGlIyVuGzn
 wo4jTFfxdoqOID97txcb7sV6Vzp9kgkPt2Edb/r6eDANu34MJJHQag0JxfyJ6o+PYIQK
 mAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d988cBXnFVQ/GWsV54ibiM2GROtIFfDIzMG48hK8mIw=;
 b=BezAGa/njvaFJLL/nMyDPQIut+AcRNvsw8roztWy2dX+s/DAYKnaHHv9eZBt9TPQRK
 N8edFPIBGM2C99d2PNH+3QfH8XeZHLrNo2V4N5IAdzNir8EX/g+SGivtNMHVVA8KkYnT
 9591zWAAms64fi5U8Q5D8+AECKrxt8KwiV1VPJpaZN95BtZKJggAmgHJNIVq6m9b3nBc
 CT/C16K0Y6mtJ55Ed7BPXTWnwNsLBjE6722KCYOL2PponhOEuiwJqjtvXaGQLRS73HR7
 nmtJPcSgPzw2yrkO5xqn5+7W0zXK0HZQZpyKO6uA6vHPrBIC4YxCVkAcQBV2kY42vf2l
 3RUg==
X-Gm-Message-State: AOAM533iiKdK9jmRca/ikODVJXOjDYzDMKpwmx2zp6ytO8HOc5X5IhDi
 +7omkLSyeoql8Vl61jDYqCE=
X-Google-Smtp-Source: ABdhPJwRn41L6QLmNecPltMeJiSirI8tr63H8VRB4YLtWAHaygJz0KkkIcHVv3yZNHxsv2Ful0aR9Q==
X-Received: by 2002:a5d:514f:: with SMTP id u15mr16666218wrt.385.1605507641663; 
 Sun, 15 Nov 2020 22:20:41 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:41 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] arm64: dts: meson: add audio playback to khadas-vim2
Date: Mon, 16 Nov 2020 06:20:27 +0000
Message-Id: <20201116062031.11233-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116062031.11233-1-christianshewitt@gmail.com>
References: <20201116062031.11233-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012042_750053_76CAF47B 
X-CRM114-Status: GOOD (  14.51  )
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
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index bff8ec2c1c70..d4734220443c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -7,9 +7,9 @@
 
 /dts-v1/;
 
-#include <dt-bindings/input/input.h>
-
 #include "meson-gxm.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "khadas,vim2", "amlogic,s912", "amlogic,meson-gxm";
@@ -145,6 +145,45 @@
 		clock-frequency = <32768>;
 		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXM-KHADAS-VIM2";
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
@@ -154,7 +193,6 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
-
 &cpu_cooling_maps {
 	map0 {
 		cooling-device = <&gpio_fan THERMAL_NO_LIMIT 1>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
