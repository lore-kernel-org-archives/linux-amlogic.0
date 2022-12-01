Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD900C43217
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Dec 2022 09:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Cs9ZhblCC3MgRelf3K83NYuqWOEeaXuf4iyrN5H0Xc=; b=QxiXFPoaq+dfqq
	/D5tlIFuwkfZMvzrjI8FaT+FC7JpeG/bIKF9sNeGBBAFV1eG7Q9QlezNcB4I37FRp34mmc4jFPRft
	yHdzsh2XqOwKlY0ofGQF65gaCGV6G0h4moIT2hLAFTKD/mT25bi2D6x3u8XLNuCzUYsB+Z3wvTr3p
	0qLBsw9d2GoVuSI7o6Yk8yBS/vN41nzAyPq+7rddW9E+sMwt23nO9b6x2N7rlJNTPcixcDgzg3ODO
	DB+x49NhmsXLOSaTQNJd4//JQHjSc5s4SANhl+cTc/quKIEqJN2jRWrpF7Kc/kMU2z4Nk6rG0CpMz
	R2MsAt3pE9pYC8LWVWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fnJ-006Ja6-HH; Thu, 01 Dec 2022 09:23:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fle-006Iil-H8; Thu, 01 Dec 2022 09:22:07 +0000
Received: by mail-ej1-x633.google.com with SMTP id n20so2815522ejh.0;
        Thu, 01 Dec 2022 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emFoOM20hOM5X61XhU2Zz+3u4EcYFFGnLjIcqz3xjIc=;
        b=eEKedVMqKjYToTnqqxIEak73Wzz7rW0xVExwfxSdUKfxOp8vkH2NxTqrOtIoQLz4F8
         9exnW6NsirZrwSTRSfprHwDR5nwlpq0pDtbX1yq8dJmnSnKk/KwnLpBVOSkJTcxo147N
         WSyq6IUND9gaNMgFQUZqSGL7RikXSjj4WYPm9AtgEMeUD2wgnXFaZCLy2bwodcAmida4
         ZsaQTs/81oikt/C+1jx4caWjMSbKOOSdBMb3ToqVHQmwU5UbUaLeMMvlB2IlyaAGUTuF
         aaDD5i4nFWyynDYWo15p/tdbfOA0xQJush3cXN4PQMqmOX/dO+Am4L7aSZGKcga+SsZC
         EbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emFoOM20hOM5X61XhU2Zz+3u4EcYFFGnLjIcqz3xjIc=;
        b=wt13Edy8xF5UYn9Q3H7QNZJdkHUabtiGur6L+EV9+rQz92my7GbDoX9JrguLjA/Uzj
         /oTGgSnTilVUFCX9Tfj6u9Qdn1U6rUiPn4ztpBZD8LH+6Fld5yqpkRw03bmH2+TIj5fB
         cHKq5A/n8qbOS9uefxkQ6OPmNfCuGlxqzTB6i9FtkS+pLl7bQHPd8eB/f7zCoZnQMIVU
         dSbwH5s7+iuL/Lx9z5H3bWx40gUIgvAPfSUdW1mrazFP+3W4X8QoDbHYfaPoYBNgWN3k
         uKZj0jmp4ohePbJrvn3jGpULQXJGCZBb/6pO297i7pm83NGB0yoEHbc+56uhiY+iVBi5
         IUNw==
X-Gm-Message-State: ANoB5plN3F/jfHz/HhZm/O5oBqTil8f9SK05N2K7kO3/mA6KeBXufNK5
	+mR2LJntuFCI75RcIZIbcX8=
X-Google-Smtp-Source: AA0mqf4UyZ0O/AsgAmnpnzeo9TgNMV2FW3qhCZ7iet38KCkJzo/YLs9LD+vUUo9/Xdof/6/2W89Bdg==
X-Received: by 2002:a17:906:4f0b:b0:78d:aaf9:7b8c with SMTP id t11-20020a1709064f0b00b0078daaf97b8cmr56468241eju.229.1669886524515;
        Thu, 01 Dec 2022 01:22:04 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 01:22:04 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: italonicola@collabora.com,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 4/7] arm64: dts: Add DT node for the VIPNano-QI on the A311D
Date: Thu,  1 Dec 2022 10:21:25 +0100
Message-Id: <20221201092131.62867-5-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
References: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_012206_619108_02DF706A 
X-CRM114-Status: GOOD (  10.08  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This "NPU" is very similar to the Vivante GPUs and Etnaviv works well
with it with just a few small changes.

v2: Add reference to RESET_NNA (Neil)
v3: Fix indentation (Neil)

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     | 11 +++++++++++
 .../boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 45947c1031c4..61c8461df614 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/power/meson-g12a-power.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -2484,4 +2485,14 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	npu: npu@ff100000 {
+		compatible = "vivante,gc";
+		reg = <0x0 0xff100000 0x0 0x20000>;
+		interrupts = <0 147 4>;
+		clocks = <&clkc CLKID_NNA_CORE_CLK>,
+			 <&clkc CLKID_NNA_AXI_CLK>;
+		clock-names = "core", "bus";
+		resets = <&reset RESET_NNA>;
+		power-domains = <&pwrc PWRC_G12A_NNA_ID>;
+	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 124a80901084..73f3d87dcefd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -15,6 +15,10 @@ / {
 	compatible = "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
 };
 
+&npu {
+	status = "okay";
+};
+
 /*
  * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
  * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
