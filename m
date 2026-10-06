Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C3CA5FFE
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2026 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cvlZSkiC+SSg1Wd1WuwHClXJDSsbgkhdQRQ7w4aqJCE=; b=ZnBJ/6xgat4DeU
	6aesOXhNqM/YIC3vFV3EFa0W4mXBndClsW7wdj3x8Hn3oNkO6df/i6kEyqicX4Y3Qx9qgR1E+KgbS
	4S/hO8TfnqrAqSafLaVcsHkOS4CN5tiij1H6IQOZkMpYnszTtxjPW/xGgczklKEx7Ryzz/DfTfwxs
	wbN1XZf/M+roKijUn7Qz+JWg+ewybcXya/6U0zl0AiPqSC9au67gjt0KrygUcxPEb2q5RsiBSOpQz
	hPJlM1tsRLCCS2zoergYgX36vhOXerex7wrOtLNsrLmPIUoGYrNnbU0WcgfYM1k/FYmddPbT7bDD9
	DdGj2LqKN7V5HFD0/hBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE89X-000000019lS-08nm;
	Tue, 06 Oct 2026 16:36:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE89P-000000019jg-2lfL;
	Tue, 06 Oct 2026 16:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51CC442DD3;
	Tue,  6 Oct 2026 16:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ABA5C4AF60;
	Tue,  6 Oct 2026 16:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791304583;
	bh=LQrc2B3YMS2iQmU2qvlySzjFJS7bU5KYVQEza0sBw8U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=kFzD2MnSEsLw6MuVetUwjcTO4oKLsK4klSuQXj05PcQb8CTszj3C2FwITKhqCKPNa
	 ghBBvmG8zigjQjRg9/kJFM4Az6LC3TqeN5rqTkVyXXJoSvQXenoy4QKylSdlCuKRS3
	 tEU5j13357GIF6E88lq4YeLsqWlGvQOOro4ELGYq+uburAZknA3jUf3xgnp0j1Ftps
	 v+PvMqn9iTJNmfy+JzTff9ukAipueCFQrui0b3bS4ReakU8FcW0Qq7Bp/nzKXqsPlk
	 tAnzH1DuVO4gygyv4hwmwbM9zt2XO6SDT1a+ww04oUSzV+iQmCISOK2D89fl6kahpK
	 4D1g0DnE6iE2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087A5CA5FFE;
	Tue,  6 Oct 2026 16:36:23 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Tue, 06 Oct 2026 19:36:17 +0300
Subject: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan
 tachometer
MIME-Version: 1.0
Message-Id: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
X-B4-Tracking: v=1; b=H4sIAIAjxWoC/3XMQQrCMBCF4auUWTuShLEVV95DukjixAxIKkkJS
 sndjd27/B+8b4PCWbjAZdggc5UiS+phDgP4aNODUe69wSgzaqVGjJ4w2ISr9RGJlNfuPJFVBP3
 yyhzkvXO3uXeUsi75s+tV/9Y/UNWokXjy7INydHJXsfX4rDC31r7ydyCepQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=oCCjURBullL5W0mILbeZieiLJNm1TbubemMG4u+TG88=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFlHlRstbGxiiph3/Kw9cOHIVRn/f54PGueqNV7/VGX0o
 ujmBvHjHaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAiGvGMDHt0Tl09MkWVr2l9
 VML6MxfLNk7eVLPNWqb0y6d36hor/EoYGWapOG2dFPZ41g6Tq7tfbTsaNbsgXWrrqVl/Dot84/r
 Nkc4CAA==
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The fan connector routes the fan's tachometer output to GPIOX_7, but
the fan node does not describe it. pwm-fan therefore registers no
fan1_input, and the fan speed cannot be read.

Describe the line as the fan's interrupt, and mux the pin as a GPIO
input without bias: R109 on the board pulls the line up to VDDAO_3V3
(schematic rev1.0, sheet 31).

Tested on ODROID-HC4: fan1_input reads 0 with the fan stopped and
rises with the duty cycle, to about 4200 rpm at full speed.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Changes in v2:
- Mux GPIOX_7 as a GPIO input without bias (Neil).
- Link to v1: https://lore.kernel.org/r/20261006-hc4-fan-tach-v1-1-4e7cecf0b45b@iav.lv
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 5f15c2299509..64602aff1d81 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -21,6 +21,10 @@ fan0: pwm-fan {
 		#cooling-cells = <2>;
 		cooling-levels = <0 120 170 220>;
 		pwms = <&pwm_cd 1 40000 0>;
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <IRQID_GPIOX_7 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&fan_tach_pins>;
+		pinctrl-names = "default";
 	};
 
 	leds {
@@ -114,6 +118,17 @@ &pcie {
 	reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
 };
 
+&periphs_pinctrl {
+	fan_tach_pins: fan-tach {
+		mux {
+			groups = "GPIOX_7";
+			function = "gpio_periphs";
+			bias-disable;
+			output-disable;
+		};
+	};
+};
+
 &pwm_cd {
 	status = "okay";
 	pinctrl-names = "default";

---
base-commit: b44e2be772f866985cafdf90355285069ea68495
change-id: 20261006-hc4-fan-tach-440c1b874a04

Best regards,
-- 
Igor Velkov <iav@iav.lv>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
