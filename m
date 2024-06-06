Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DCCC27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUl5X/BtwbD1pilclbIBOFXih+1y4By3C774RXUGO+4=; b=Ohh2gjdPIrC+Dt
	Yl4LEb4d3l1Lq0umeDqZbB480HpUg6j1/a0uN+Q7QvxTbpYAe0DMsRCArmn4FRnYJxATSJl3n5fvP
	1AJuscQVh3h4BwKAxule52uflARjyFG6I/MZsuAgy6yvSlAR3Nidx8P6WdvuMdmIxSOtbzIOMaYPK
	PWAhGYN1hJfDa3kVpRUNylUMDPWqSvwXdRvFdooV6clXtR5buVZ92rJO7DS1rTgHUNdDAXzd85joH
	oc/azQQp51Lgck3dyye6NCnHWfbgjgIPfR12/r4/vAtD566D1du5fHGKTvfRtJSa+Tt60CZXNkJPA
	3/mAA7RqkjMXyv1LB9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nO-00000008uQC-4BWE;
	Thu, 06 Jun 2024 08:48:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nD-00000008uFV-3ag8
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42148c0cb1aso8526715e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663698; x=1718268498; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6OHHCCXmw/6bmz1M3IfcTnLr1KRtx4diLLcV5lamp0=;
        b=uHZvxkg6lIXTSREYKLlUscQmpelx7V9FRMd9Rg4xckrkNOSUyrJBT0dQrBWjQ45b/5
         vmM2xgf4aQ24kDQPN3bGbYT7ndFKF97RKHZ+fpXKhGzYqSBqdALacsGdvMp5eooNHWvW
         Kt7gEKMUikMhI1LeYAXhxBWeIMvzIT6e4t9umY933Wb2hTDWSCVwp15XVJKXNREVZJE5
         G84P8UrDT5Lt3plOp/mY/uHsUxOl/EI2sV98AmyW1kuD7TL9TnxdLRmiJq/oMeFecNle
         pQiXKnT8CRx9BJI/caD6JvSD+vJtKFyTl9yMZqbAH7qC4YaAQR6Cv5/N9EeTvRu5LkT4
         4ZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663698; x=1718268498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6OHHCCXmw/6bmz1M3IfcTnLr1KRtx4diLLcV5lamp0=;
        b=SvNf9MTr25fFk7s73F4gEbuLHegUDb+plEX+1e6r53N+l0E3ApeypeGKxISSeifZeX
         FGJdro1TNiDNThvvID/dBHCe4QILSqYEPmBhkSyEav7K9VWNMvBpM6trdUnbqmhmyCUR
         Pq9ZOcv7yhEpUkFHvfMmv2gwtTRDRfp3LVSjYF7Gn4N8UqeY5e6SJbbyra1FcW35Kap/
         yQEZA8cbZwYoO0vYFbMIyIsPpPwhvn8GgbPjIpcWvA/Qjr8SifdHTez7ln3kf7oh1+9N
         0NHPk+UlGIZ0kHshukMz4GnB8m7puMGJ+d6PYwPbD/4VHJdYPKcZ7NGLB2QjXbKVT2ln
         uFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVso7cUg4zNETDsP/CCiXhU/YS9yqx1R3pMK0rlXczjex17Xg8N8ilbvnL77uzVQmwXu14uQcZbXZJX+FO0ys1euRUZR1sYm6m5QKE1FPAV224=
X-Gm-Message-State: AOJu0YwvNQ/rkDZ55GaRFfCI/TVRL87aKJyePuxM7KfTZ4GhGko2Ao5o
	8LtoiGmFDIRz/qzExvglKrVYqLBCO09GYC2BOe+/0geQYM6KYu0+shmI+OXW5V0=
X-Google-Smtp-Source: AGHT+IH+f9N41jKu7yGAWRjAEjcoye90s8RyP3e82L51Lfe+HhWRkITUaejtLiPLrCN/vvA0R4rDKA==
X-Received: by 2002:a05:600c:19c9:b0:421:52ce:6878 with SMTP id 5b1f17b1804b1-4215632d091mr41108525e9.29.1717663697734;
        Thu, 06 Jun 2024 01:48:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:09 +0200
Subject: [PATCH 02/12] arm64: dts: amlogic: move ao_pinctrl into aobus
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-2-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12903;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tl3H+UTcHVmPxt9zBws9MAHMOmP/ihRvaabSVS/9m/s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfKtjTh/6E7KMQquhZx7uNekZ5DQr5QRH9o7BLD
 r0EezK2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3ygAKCRB33NvayMhJ0b9tD/
 0fN6N7nyG9gvaI7iirKChzsj1lg5p/BEKaQXnl5QXXAklJ4Ad8d6N/dIitOIKQebgr+QZlAmOK6O1U
 yt8gRv6QaIu/IobE/Ay+3ZwDGo74hCPALHihKMeHMkxpu3oZYliBrD3o9Y0KVyid8MAmtvNphwCorA
 n79aUDM07CxugvSLRQSjMOqO3WMyD2C4FLxnDkSU7kBhI5MDeEtWYAf76WvT517YnCWfknLxBIcZtj
 NKWtS0Vm0CrjeugQYlxjyj2DfCIaXLWJApjpv3iC+iecg2L939Sjk7xZunkqdGeFohidsG9T+yn110
 zLagKPxCMFSDE70R8yZwTWztndqrB5bsFTEHBZ9gXFES+3bl+I+mp7cuYTfp9dEfIeOad6a0u/16NV
 fUOsI5kgUvNks4rDWcMwHagR4Dg+tXjbUT6ei2IYmLyVO2Uv0EcbaQ+ML+J1+xRnrTv1y5IiQoerOz
 TTjNdEKoDQ4D3lRp5yvubRvAxgJTtv1WivsCMx0/DCRutwguwTO+PQMYSbuFbIJOn8nA1n8m00sMeK
 1uCkrWPsrKC+56clITaGR7dRKdGcbSbjlzVnbv531F/wxfX60ZPNzAEIN+ju+LA81Kwh6zpojDtwQL
 6FKOa2DQmmhdM+Mm8pLcHFtwhwY4m0odlUj+DRzJXzGhZ0ocE7anNzgs3R7A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014819_976843_CB3E7A1F 
X-CRM114-Status: UNSURE (   9.71  )
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

The AO pinctrl was mis-described as beeing part of AO rti sysctrl, move it
it into aobus like it's also done in GX SoCs, and remove the now invalid
'#address-cells', '#size-cells' & 'ranges from the sys-ctrl@0 node.

This fixes:
sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 427 +++++++++++-----------
 1 file changed, 212 insertions(+), 215 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index b058ed78faf0..138fb18c6480 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1741,9 +1741,6 @@ rti: sys-ctrl@0 {
 				compatible = "amlogic,meson-gx-ao-sysctrl",
 					     "simple-mfd", "syscon";
 				reg = <0x0 0x0 0x0 0x100>;
-				#address-cells = <2>;
-				#size-cells = <2>;
-				ranges = <0x0 0x0 0x0 0x0 0x0 0x100>;
 
 				clkc_AO: clock-controller {
 					compatible = "amlogic,meson-g12a-aoclkc";
@@ -1752,278 +1749,278 @@ clkc_AO: clock-controller {
 					clocks = <&xtal>, <&clkc CLKID_CLK81>;
 					clock-names = "xtal", "mpeg-clk";
 				};
+			};
 
-				ao_pinctrl: pinctrl {
-					compatible = "amlogic,meson-g12a-aobus-pinctrl";
-					#address-cells = <2>;
-					#size-cells = <2>;
-					ranges;
+			ao_pinctrl: pinctrl@14 {
+				compatible = "amlogic,meson-g12a-aobus-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio_ao: bank@14 {
+					reg = <0x0 0x14 0x0 0x8>,
+					      <0x0 0x1c 0x0 0x8>,
+					      <0x0 0x24 0x0 0x14>;
+					reg-names = "mux",
+						    "ds",
+						    "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&ao_pinctrl 0 0 15>;
+				};
 
-					gpio_ao: bank@14 {
-						reg = <0x0 0x14 0x0 0x8>,
-						      <0x0 0x1c 0x0 0x8>,
-						      <0x0 0x24 0x0 0x14>;
-						reg-names = "mux",
-							    "ds",
-							    "gpio";
-						gpio-controller;
-						#gpio-cells = <2>;
-						gpio-ranges = <&ao_pinctrl 0 0 15>;
+				i2c_ao_sck_pins: i2c_ao_sck_pins {
+					mux {
+						groups = "i2c_ao_sck";
+						function = "i2c_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					i2c_ao_sck_pins: i2c_ao_sck_pins {
-						mux {
-							groups = "i2c_ao_sck";
-							function = "i2c_ao";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				i2c_ao_sda_pins: i2c_ao_sda {
+					mux {
+						groups = "i2c_ao_sda";
+						function = "i2c_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					i2c_ao_sda_pins: i2c_ao_sda {
-						mux {
-							groups = "i2c_ao_sda";
-							function = "i2c_ao";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				i2c_ao_sck_e_pins: i2c_ao_sck_e {
+					mux {
+						groups = "i2c_ao_sck_e";
+						function = "i2c_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					i2c_ao_sck_e_pins: i2c_ao_sck_e {
-						mux {
-							groups = "i2c_ao_sck_e";
-							function = "i2c_ao";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				i2c_ao_sda_e_pins: i2c_ao_sda_e {
+					mux {
+						groups = "i2c_ao_sda_e";
+						function = "i2c_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					i2c_ao_sda_e_pins: i2c_ao_sda_e {
-						mux {
-							groups = "i2c_ao_sda_e";
-							function = "i2c_ao";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
-					};
-
-					mclk0_ao_pins: mclk0-ao {
-						mux {
-							groups = "mclk0_ao";
-							function = "mclk0_ao";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				mclk0_ao_pins: mclk0-ao {
+					mux {
+						groups = "mclk0_ao";
+						function = "mclk0_ao";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					tdm_ao_b_din0_pins: tdm-ao-b-din0 {
-						mux {
-							groups = "tdm_ao_b_din0";
-							function = "tdm_ao_b";
-							bias-disable;
-						};
+				tdm_ao_b_din0_pins: tdm-ao-b-din0 {
+					mux {
+						groups = "tdm_ao_b_din0";
+						function = "tdm_ao_b";
+						bias-disable;
 					};
+				};
 
-					spdif_ao_out_pins: spdif-ao-out {
-						mux {
-							groups = "spdif_ao_out";
-							function = "spdif_ao_out";
-							drive-strength-microamp = <500>;
-							bias-disable;
-						};
+				spdif_ao_out_pins: spdif-ao-out {
+					mux {
+						groups = "spdif_ao_out";
+						function = "spdif_ao_out";
+						drive-strength-microamp = <500>;
+						bias-disable;
 					};
+				};
 
-					tdm_ao_b_din1_pins: tdm-ao-b-din1 {
-						mux {
-							groups = "tdm_ao_b_din1";
-							function = "tdm_ao_b";
-							bias-disable;
-						};
+				tdm_ao_b_din1_pins: tdm-ao-b-din1 {
+					mux {
+						groups = "tdm_ao_b_din1";
+						function = "tdm_ao_b";
+						bias-disable;
 					};
+				};
 
-					tdm_ao_b_din2_pins: tdm-ao-b-din2 {
-						mux {
-							groups = "tdm_ao_b_din2";
-							function = "tdm_ao_b";
-							bias-disable;
-						};
+				tdm_ao_b_din2_pins: tdm-ao-b-din2 {
+					mux {
+						groups = "tdm_ao_b_din2";
+						function = "tdm_ao_b";
+						bias-disable;
 					};
+				};
 
-					tdm_ao_b_dout0_pins: tdm-ao-b-dout0 {
-						mux {
-							groups = "tdm_ao_b_dout0";
-							function = "tdm_ao_b";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				tdm_ao_b_dout0_pins: tdm-ao-b-dout0 {
+					mux {
+						groups = "tdm_ao_b_dout0";
+						function = "tdm_ao_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					tdm_ao_b_dout1_pins: tdm-ao-b-dout1 {
-						mux {
-							groups = "tdm_ao_b_dout1";
-							function = "tdm_ao_b";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				tdm_ao_b_dout1_pins: tdm-ao-b-dout1 {
+					mux {
+						groups = "tdm_ao_b_dout1";
+						function = "tdm_ao_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					tdm_ao_b_dout2_pins: tdm-ao-b-dout2 {
-						mux {
-							groups = "tdm_ao_b_dout2";
-							function = "tdm_ao_b";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				tdm_ao_b_dout2_pins: tdm-ao-b-dout2 {
+					mux {
+						groups = "tdm_ao_b_dout2";
+						function = "tdm_ao_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					tdm_ao_b_fs_pins: tdm-ao-b-fs {
-						mux {
-							groups = "tdm_ao_b_fs";
-							function = "tdm_ao_b";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				tdm_ao_b_fs_pins: tdm-ao-b-fs {
+					mux {
+						groups = "tdm_ao_b_fs";
+						function = "tdm_ao_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					tdm_ao_b_sclk_pins: tdm-ao-b-sclk {
-						mux {
-							groups = "tdm_ao_b_sclk";
-							function = "tdm_ao_b";
-							bias-disable;
-							drive-strength-microamp = <3000>;
-						};
+				tdm_ao_b_sclk_pins: tdm-ao-b-sclk {
+					mux {
+						groups = "tdm_ao_b_sclk";
+						function = "tdm_ao_b";
+						bias-disable;
+						drive-strength-microamp = <3000>;
 					};
+				};
 
-					tdm_ao_b_slv_fs_pins: tdm-ao-b-slv-fs {
-						mux {
-							groups = "tdm_ao_b_slv_fs";
-							function = "tdm_ao_b";
-							bias-disable;
-						};
+				tdm_ao_b_slv_fs_pins: tdm-ao-b-slv-fs {
+					mux {
+						groups = "tdm_ao_b_slv_fs";
+						function = "tdm_ao_b";
+						bias-disable;
 					};
+				};
 
-					tdm_ao_b_slv_sclk_pins: tdm-ao-b-slv-sclk {
-						mux {
-							groups = "tdm_ao_b_slv_sclk";
-							function = "tdm_ao_b";
-							bias-disable;
-						};
+				tdm_ao_b_slv_sclk_pins: tdm-ao-b-slv-sclk {
+					mux {
+						groups = "tdm_ao_b_slv_sclk";
+						function = "tdm_ao_b";
+						bias-disable;
 					};
+				};
 
-					uart_ao_a_pins: uart-a-ao {
-						mux {
-							groups = "uart_ao_a_tx",
-								 "uart_ao_a_rx";
-							function = "uart_ao_a";
-							bias-disable;
-						};
+				uart_ao_a_pins: uart-a-ao {
+					mux {
+						groups = "uart_ao_a_tx",
+							 "uart_ao_a_rx";
+						function = "uart_ao_a";
+						bias-disable;
 					};
+				};
 
-					uart_ao_a_cts_rts_pins: uart-ao-a-cts-rts {
-						mux {
-							groups = "uart_ao_a_cts",
-								 "uart_ao_a_rts";
-							function = "uart_ao_a";
-							bias-disable;
-						};
+				uart_ao_a_cts_rts_pins: uart-ao-a-cts-rts {
+					mux {
+						groups = "uart_ao_a_cts",
+							 "uart_ao_a_rts";
+						function = "uart_ao_a";
+						bias-disable;
 					};
+				};
 
-					uart_ao_b_2_3_pins: uart-ao-b-2-3 {
-						mux {
-							groups = "uart_ao_b_tx_2",
-								 "uart_ao_b_rx_3";
-							function = "uart_ao_b";
-							bias-disable;
-						};
+				uart_ao_b_2_3_pins: uart-ao-b-2-3 {
+					mux {
+						groups = "uart_ao_b_tx_2",
+							 "uart_ao_b_rx_3";
+						function = "uart_ao_b";
+						bias-disable;
 					};
+				};
 
-					uart_ao_b_8_9_pins: uart-ao-b-8-9 {
-						mux {
-							groups = "uart_ao_b_tx_8",
-								 "uart_ao_b_rx_9";
-							function = "uart_ao_b";
-							bias-disable;
-						};
+				uart_ao_b_8_9_pins: uart-ao-b-8-9 {
+					mux {
+						groups = "uart_ao_b_tx_8",
+							 "uart_ao_b_rx_9";
+						function = "uart_ao_b";
+						bias-disable;
 					};
+				};
 
-					uart_ao_b_cts_rts_pins: uart-ao-b-cts-rts {
-						mux {
-							groups = "uart_ao_b_cts",
-								 "uart_ao_b_rts";
-							function = "uart_ao_b";
-							bias-disable;
-						};
+				uart_ao_b_cts_rts_pins: uart-ao-b-cts-rts {
+					mux {
+						groups = "uart_ao_b_cts",
+							 "uart_ao_b_rts";
+						function = "uart_ao_b";
+						bias-disable;
 					};
+				};
 
-					pwm_a_e_pins: pwm-a-e {
-						mux {
-							groups = "pwm_a_e";
-							function = "pwm_a_e";
-							bias-disable;
-						};
+				pwm_a_e_pins: pwm-a-e {
+					mux {
+						groups = "pwm_a_e";
+						function = "pwm_a_e";
+						bias-disable;
 					};
+				};
 
-					pwm_ao_a_pins: pwm-ao-a {
-						mux {
-							groups = "pwm_ao_a";
-							function = "pwm_ao_a";
-							bias-disable;
-						};
+				pwm_ao_a_pins: pwm-ao-a {
+					mux {
+						groups = "pwm_ao_a";
+						function = "pwm_ao_a";
+						bias-disable;
 					};
+				};
 
-					pwm_ao_b_pins: pwm-ao-b {
-						mux {
-							groups = "pwm_ao_b";
-							function = "pwm_ao_b";
-							bias-disable;
-						};
+				pwm_ao_b_pins: pwm-ao-b {
+					mux {
+						groups = "pwm_ao_b";
+						function = "pwm_ao_b";
+						bias-disable;
 					};
+				};
 
-					pwm_ao_c_4_pins: pwm-ao-c-4 {
-						mux {
-							groups = "pwm_ao_c_4";
-							function = "pwm_ao_c";
-							bias-disable;
-						};
+				pwm_ao_c_4_pins: pwm-ao-c-4 {
+					mux {
+						groups = "pwm_ao_c_4";
+						function = "pwm_ao_c";
+						bias-disable;
 					};
+				};
 
-					pwm_ao_c_6_pins: pwm-ao-c-6 {
-						mux {
-							groups = "pwm_ao_c_6";
-							function = "pwm_ao_c";
-							bias-disable;
-						};
+				pwm_ao_c_6_pins: pwm-ao-c-6 {
+					mux {
+						groups = "pwm_ao_c_6";
+						function = "pwm_ao_c";
+						bias-disable;
 					};
+				};
 
-					pwm_ao_d_5_pins: pwm-ao-d-5 {
-						mux {
-							groups = "pwm_ao_d_5";
-							function = "pwm_ao_d";
-							bias-disable;
-						};
+				pwm_ao_d_5_pins: pwm-ao-d-5 {
+					mux {
+						groups = "pwm_ao_d_5";
+						function = "pwm_ao_d";
+						bias-disable;
 					};
+				};
 
-					pwm_ao_d_10_pins: pwm-ao-d-10 {
-						mux {
-							groups = "pwm_ao_d_10";
-							function = "pwm_ao_d";
-							bias-disable;
-						};
+				pwm_ao_d_10_pins: pwm-ao-d-10 {
+					mux {
+						groups = "pwm_ao_d_10";
+						function = "pwm_ao_d";
+						bias-disable;
 					};
+				};
 
-					pwm_ao_d_e_pins: pwm-ao-d-e {
-						mux {
-							groups = "pwm_ao_d_e";
-							function = "pwm_ao_d";
-						};
+				pwm_ao_d_e_pins: pwm-ao-d-e {
+					mux {
+						groups = "pwm_ao_d_e";
+						function = "pwm_ao_d";
 					};
+				};
 
-					remote_input_ao_pins: remote-input-ao {
-						mux {
-							groups = "remote_ao_input";
-							function = "remote_ao_input";
-							bias-disable;
-						};
+				remote_input_ao_pins: remote-input-ao {
+					mux {
+						groups = "remote_ao_input";
+						function = "remote_ao_input";
+						bias-disable;
 					};
 				};
 			};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
