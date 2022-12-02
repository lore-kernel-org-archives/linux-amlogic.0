Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4994AC47088
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Cs9ZhblCC3MgRelf3K83NYuqWOEeaXuf4iyrN5H0Xc=; b=WXuYHzLtHkB2LY
	vcmoBFcwjAJ+unEMyZ1LP+9FP9VqwKY7l0YnyyFK2bC38ltH7YwPNLzlOP1e1TDgKT0pcfXvo8J92
	YOUp2tfF4LrL6XgOPWBkfvo9nVA9DahP/esgxdHz9iwwD9+JHAqpkg6Z8E1biSweY+lhD+d7zcHyR
	nUn/cO5+DMvldFvPCPMxNryV+1eu63YVZRBrfzrf2mJ4ZRoGQWczYtHUv4Q6/Zz4iOGw872hu2jRZ
	korjg7Hjfra/ZzR5Vh5re7yXLiIdQWr2WaFad8vAf78PMZ0DY+TqzzUn8DLVQcgdDA8TEi2tgGRmb
	5xZLzT25t41CE+49b9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14bo-00G6k6-Es; Fri, 02 Dec 2022 11:53:36 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14aw-00G6HY-Kd; Fri, 02 Dec 2022 11:52:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id d20so6244113edn.0;
        Fri, 02 Dec 2022 03:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emFoOM20hOM5X61XhU2Zz+3u4EcYFFGnLjIcqz3xjIc=;
        b=qGbxd30K3aoUCNRV3nAecE6ozZ6k5GHFTNjZ5lhz+nyIpwhHjEZJfCB8u43XI0hp1u
         zbB8Tob8DUgVVO8rRxdGFIOqh3jMy2eK7U+XhSBFf+9rEUbDnrs1qUBP0nC5Gvc2iknW
         ZKUgSSJrvtsFh/Yd+PGy012+1gt4J20IbV859+eln+HHAZ5JAiB30wBSxQXz2J+oKHhR
         nv06iSAIyqgwx0kgnRHP8g+jnjJiAmMotHkQIJfI0xCgVs7n4vXx4QHICBYoRM7cbsOj
         kSV64zlK5zrdMd6/mDfTKl5uoQbbNzN86Aab3UiFezv+24LDB3G0mDpfCj04F4+pbruV
         uJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emFoOM20hOM5X61XhU2Zz+3u4EcYFFGnLjIcqz3xjIc=;
        b=o41o+uLOCmx3J8fMMdKZ2NsG2iBePi81TUvNXGrI8MV6Rknff+J/Xv7YT85ZelUiGL
         hLzG9aqz7zU1OsKThMkueiqmSZjMr3G/8gnTHB+rZ3mRJsHwstpgcoiikSbcclazTSw+
         821YLMqzEjKpvmL1Qey3qTgqBLtQVJYwhWJpCj5KW7VdRAd38ntlK4iVDYjtc9Xq27Ms
         1r7/nKlAjdKD6TPYtNn/xrLeUgI2aNpiBN0u+FJNsyQFdlEafL+X+0M+gpCJzwZs3aTP
         tn/I5G2QhXl/+/WW6E172PzeDOYKqdcMkBrvk5SoEDLVAqW0MU7YXvuFhRwtIUzbWrd3
         SwJA==
X-Gm-Message-State: ANoB5pmREiLFHmc8HPaw/vEcMGDwnIvkhhht6vzrW8UNwQfjntGHON78
	FgC/X7irQ4ZG9bKaXsW8Nls=
X-Google-Smtp-Source: AA0mqf5V6uCq7x3xqjBW+9xhSr7fmB9ifJ0yaL8Q+0LV5jIiurfuIcPejyhfPVb44rvShzNrrmpCag==
X-Received: by 2002:aa7:da01:0:b0:46b:9f6e:4005 with SMTP id r1-20020aa7da01000000b0046b9f6e4005mr12419198eds.203.1669981960977;
        Fri, 02 Dec 2022 03:52:40 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id ha7-20020a170906a88700b007c0bb571da5sm1206762ejb.41.2022.12.02.03.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:52:40 -0800 (PST)
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
Subject: [PATCH v6 4/8] arm64: dts: Add DT node for the VIPNano-QI on the A311D
Date: Fri,  2 Dec 2022 12:52:16 +0100
Message-Id: <20221202115223.39051-5-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_035242_693591_94471B75 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
