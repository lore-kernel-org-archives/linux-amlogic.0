Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAD1C47423
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E8B7206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7cWc9JZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUAtA80U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E8B7206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FBTSPx8eXa/Zui0fUoLE/JF7S+VMQpqFafQBuuMRjM=; b=X7cWc9JZ9KOUKj4GlsRpCesZ80
	s44PTPy/dIQqoHHQJJLJQ527it8gCZPAsPsDp+p1jIQUwtiuobh63l8vThR6HLHTc5mRt4ZCl4636
	vprlptCQP6nDF0wUUuuFBoV4KfxkaN/DCKIbaL5DneCkC82Q52DG7YcAN+gS19p42GRrOyvdCucEc
	cWAMa4O4mSTWAjYeaY2xQUOgdfWgQzPGxq5eqPNhXARUe19uenM7wqIC7bonGu4Mk0NFU75IelHH1
	qVHVntTlj3oD+6T/9BROnuANzkg5qzNVLagg5E8MSG5/9t6dPg/e9dME/MyAmSlMteGoZI9wIXa1n
	skTSOjiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM6R-0001R7-45; Fri, 02 Oct 2020 14:32:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6B-0001JW-LE; Fri, 02 Oct 2020 14:31:52 +0000
Received: by mail-wr1-x444.google.com with SMTP id g4so2072957wrs.5;
 Fri, 02 Oct 2020 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d988cBXnFVQ/GWsV54ibiM2GROtIFfDIzMG48hK8mIw=;
 b=EUAtA80UQvGNQ1xuv489KMoHytHnOyynUzzXh4vFWyfNE6vryCNvSPb6JE38dse+ty
 Owh/rlSQHrpE0vJycQQ+QDzCO8fG1uONM6imaKPYv63KmwBDNIhatYiEPGNNAIU3jZGz
 i1TeJ0r/WW/kDo8ChFo19yQ7MSTbS3FnKkBfXh4hFobaaI3ZL/93eODs3bWXCRbTrxLK
 HAxfnu3O9NzWEwp9yaGiyRcmzC2ZAvpwUCGGnnmygy/otUm7UntLxRroQ+tAENGsmvli
 oMzZKouaZzWTGXn8LJAAb6dbMEDMe8Z56rWOCdcWk8NFzZHM9JLTgDist40BLDjKIXlV
 cnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d988cBXnFVQ/GWsV54ibiM2GROtIFfDIzMG48hK8mIw=;
 b=IcWGLK5oOpt8A1WDSyCaz5LBJesOMXbLhiy6REU5/IK6ye5m9TyjAMHbSfkxTYR1Fl
 urAmt8jAllE38TpM4kt6EUfTz5pffeuqQDk6PQ7VFBBwPQxTh3ZX+bFP8SY9pFXPu41v
 VhPC+LsewUp2ReScXuLzmFsHT3JQLgzfosX2ANLXN8/9dOon3f1ffyrPMXXSsRCoe+Vd
 xHqzBpnMLyZUXTdlHmZF8YeVnqjADlJiafhwqPmUM2bAj3f6thcOo2kfP0MYo6g0D554
 kgmd07FuTNgcw83LM+GyxUCjZC9rBwF270goXMipfulcJckr8sm/i1fjyDY3Ui/MxLdr
 81Mg==
X-Gm-Message-State: AOAM532v8KVBAgVElrK5G3v9Xs6aIR955r9ABDZiAtTCzOy6V6JAuzJ1
 oQ4vvAftnrC3Kt6VB1Lf8iM=
X-Google-Smtp-Source: ABdhPJzZyEF2XAzBOv8Q+l28V5KehUzLh6WUUtuevsVRxVzF68N3vnbNHOGFmHT4k6vXTbyc1hxBCQ==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr3672712wrm.392.1601649110552; 
 Fri, 02 Oct 2020 07:31:50 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:31:50 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] arm64: dts: meson: add audio playback to khadas-vim2
Date: Fri,  2 Oct 2020 14:31:33 +0000
Message-Id: <20201002143141.14870-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103151_739954_C066E402 
X-CRM114-Status: GOOD (  14.27  )
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
