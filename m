Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51268C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Cs9ZhblCC3MgRelf3K83NYuqWOEeaXuf4iyrN5H0Xc=; b=pHtCHkVbythj4G
	rG25+U6D9+iziROGAD/QyTaR9+41Rbcaf6Vp5sK7+7ZahQ6LEL93ko0w6y86lN3trL1x3bGWycy+s
	5ARz7w0Lx9yhO6DumkCDVupl8ZKwQ3ip5j1DpW2w3ZjMimNAi2qLmLcM17SII3R20HON2Yt4QH6zn
	wPhv7VrDqTX5nUe/6XbIwVVnYbKCq0kd0+hQjmHyWoa1VJX02VziwmwuIk5Qj/HHJhge2Z1zvIlRV
	OsX3h2C6VcKTR5pxU6ehYPMA5Pf5N2ezU+D1zAKv7fibFXEreFGMKfLylPvALUib4yuzsliYkkIQ8
	tlUn0mqsm3PQirXwIhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwMH-007YQm-3j; Tue, 29 Nov 2022 08:52:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozwKo-007Xka-0G; Tue, 29 Nov 2022 08:51:23 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gu23so13842628ejb.10;
        Tue, 29 Nov 2022 00:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emFoOM20hOM5X61XhU2Zz+3u4EcYFFGnLjIcqz3xjIc=;
        b=nhKapcQ66LsxA85JQdzV2oZbWTII+lECh4PRQcH4mDiqEm4ojDHv7H95e1Yu9UhPbu
         qgXFEJe5IBj9/8AlpNKHmA92xYsyC4SZqZLvK6OLaPMuyeq4lmmUx9S6AraqRskOLIc0
         sqDRTVS1XH6eQTpbbz2NXSWwHn2MgMncpfuDlJlmwa1XYivMD6NL9zGnWYa6ijPckc7c
         c2mkdLJpg7sVYVQgFSS+T86beZvtahhhakiO/RCC/l6JEGECGPLz+RSYnW7Oegj286j8
         zPENNFHaBXDfvD0DIMp2vnBNikzzZAbi0CqXctM2F2ra4pGsxVa61JCC589gAilD2WC6
         ju6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emFoOM20hOM5X61XhU2Zz+3u4EcYFFGnLjIcqz3xjIc=;
        b=deq/afvqaKLavGoEc3RZYTpLdjq5Yybg4/456jOw/iaxQxcdD8gKAKLZAFDHWaLt+E
         CURR2vixs5q+cIyATckCjDzCU/4gIVCREZ4Kwvi5WvJvPDbJMYn3EbGY1Y98VPqtf9bA
         qlG8Zpd61TtjWcKdJhmpiGrD+qck3oNl2eoD+N5HGwH9+gOYWD8Yz8af0K7PUELlA1i/
         QR03kF1zINlvbE5rqb++CPsFnNSELHqUZj+4NWfozC3611ddI8pM0aT/ZnIIbityFDcq
         zlC1gD/hB1b7ni7QY1pXpu5SH/yf5PHfh420uhmJOewjTyS3DPyOSaEtHr5Tzt63N+KZ
         kLGA==
X-Gm-Message-State: ANoB5pk3HxwnMfw6PeaWRY8fEP6wASXCqZf2oIlK0j4zgN3RONtpf8f0
	LA196BlzaO/g1Q9G+8U/L14=
X-Google-Smtp-Source: AA0mqf6g0V291RCuJE/6a7lckAJbDgRfo/msdIC8flyucHI+AJKI3XL0ggAyX2RdNHUyh2wH0hgteQ==
X-Received: by 2002:a17:906:ca18:b0:781:c97c:84d1 with SMTP id jt24-20020a170906ca1800b00781c97c84d1mr46678807ejb.147.1669711878319;
        Tue, 29 Nov 2022 00:51:18 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id kz1-20020a17090777c100b0078de26f66b9sm5873219ejc.114.2022.11.29.00.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 00:51:17 -0800 (PST)
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
Subject: [PATCH v3 4/5] arm64: dts: Add DT node for the VIPNano-QI on the A311D
Date: Tue, 29 Nov 2022 09:50:44 +0100
Message-Id: <20221129085047.49813-5-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
References: <20221129085047.49813-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_005122_107493_5DA30D11 
X-CRM114-Status: GOOD (  10.39  )
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
