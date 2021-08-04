Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDDEC4338F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 14:00:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C0960F43
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 14:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13C0960F43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ezsGhnN3DZDa+yQWaVDNrF8cNHXZ0NatMSlQGmeqBG4=; b=esTi5pXtR9dQM6
	1oHkmEsPGSJG+gChZjzWM1caURs0gcvlmhauo9q2YlN7IGvhTDNpfJ/v41XpkgPqY+C3SBnIpiNn5
	trvqHE56grXLjCo7G+Eld/6tdsyFPwNHdh6+pBP639wMb78RQa5920wQcWnQdndY/HDgqE7gxKqah
	JWS81PJUz6LbR/fJcFo9N9PI7EuSz808gflt/ozr1IMklIVCKS3DXgrqkmONmyJBCmLaKTqhVoiiF
	ovs1oVvTRwd9WzjFuSPXLfx3B5IVltCzatuoVUIcPQa5RetI931TbjQpAtth7M8MfxmeyNWZaIjw8
	VDRnyu+jHaQRxBvKAe9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBHRx-006G8H-Pq; Wed, 04 Aug 2021 14:00:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBHRj-006G3x-HV; Wed, 04 Aug 2021 14:00:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id b11so2389952wrx.6;
 Wed, 04 Aug 2021 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=UQh0XuwEqlgV75Ps3B/F3ylifl0qiT4/8PBf3CQWjYw=;
 b=eOyvHSKNYGyaO+vNyt8TYAy1znDJI8bWYgVrTFZz5Bh49tY0KEY5Vic1ZUjMTCQ6Yl
 UI31ZFXG4+EiUC3ZBUz8GiMzvh8S1gGc+zUG/ytz21FqPFlmcYtaLyyxR/M0KN/pmzzo
 rM5gOufWNkQvVvbbpKWbLqJygPdhOE9jxfriqlmd0j2OzS2+TmgAM9eYLVZz04EnCiku
 OpqN3IitHJxMHd3XBRR6n9h2M0vrDdfe8YhC7GyyDQkVC+/U7JlkXVzfkurVPwfPHnoV
 sAEvF+dCFHI/LLkvDOr0dejQSrPCGh9uEy10GzfLbWywyPBRPsVReY5ogQoIaBehq0iC
 8UjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UQh0XuwEqlgV75Ps3B/F3ylifl0qiT4/8PBf3CQWjYw=;
 b=AtxZi2mItbRD+iGQw4EEYMGNtCOLWp2D4PUGYFs85yPjM6oae3FuUm5QmLU1B/SKnY
 ra7K5P55oLHKYPrNugAeywgbAPlBTQ/rhJEUx7ASHCjx3em54xPUsoCw5u8lqPVCQ3d/
 9WN5cGKulFmCQ0MLSTxvsgKWMqx7avu8IAu76jcOsU2hNgKruqZ8vdIPM6jVHZ2nwntj
 I2EAfNVRR+i1WY1OfaFI57EJbXg58GYoOIexN/bE8nQfCxYEW8ii2A/VY4JZSNBST5w+
 tFxnouU9xBYx1EUui4Yk7U/ojo6C+nBwJVzai7EXkEZr72sdae1l6pzXvja85ms6lDWJ
 32YQ==
X-Gm-Message-State: AOAM5304c24pWmbmWauycGrXOAQYFX9XVKVOtks2eFlphs/CN1Z2eiEg
 Qxwmox/e8DtpE9/wv9YxnPQ=
X-Google-Smtp-Source: ABdhPJzllF+zFHrspGUKzLn3qA7J6fHTwUA8j7nohSTy8ysuKuNFdqGA5vH04F7Jcz/A/DMK8TJUFA==
X-Received: by 2002:a5d:6904:: with SMTP id t4mr28597192wru.187.1628085633684; 
 Wed, 04 Aug 2021 07:00:33 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id k1sm2812902wrz.61.2021.08.04.07.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:00:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: add audio playback to nexbox-a1
Date: Wed,  4 Aug 2021 14:00:29 +0000
Message-Id: <20210804140029.4445-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_070035_636746_4A84453D 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index dfa7a37a1281..236c0a144142 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -10,6 +10,7 @@
 /dts-v1/;
 
 #include "meson-gxm.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "nexbox,a1", "amlogic,s912", "amlogic,meson-gxm";
@@ -24,6 +25,13 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
@@ -75,6 +83,59 @@
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "NEXBOX-A1";
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
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link-4 {
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
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
 };
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
