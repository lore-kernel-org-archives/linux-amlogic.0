Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1980FC43603
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 18:06:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E472D206DB
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 18:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQ/ADGBE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="HtyNtbPN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E472D206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQnVcKFklPR2lE7O8/4YU0DjTGe3ANS38SaH5ea22j0=; b=BQ/ADGBE3hZTrr
	NTqwcw3rlXdeM/eAzHCONdS8uA9yplRgsHUAPLXh04u3UCMTcC8j6kaN06+dtxI/cuMAatnnPGcwN
	kLRtLbdPHYS2us043LLlhgAOerpDTuHX34OtIKnhEXQXOfvmezbPyei/ob2DbXpVZKyFzYB5T3PBw
	0RNUQ5oSKTfbN95CP32rBddcOHQRublgONTBby+H87idVy0ApJNZH+gkYEtVJ89mdR6klEvhbJ59G
	RbLQNlUxbzH53Zqi6wRnJGLXRZCzNe+KYh1c9jHbO18CYxkKP/a3r7oiXhI+NDgYot2Bg7b1siQHC
	3BaCVhE3pyV+Zx9xpemg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie0wk-0003vG-H0; Sun, 08 Dec 2019 18:06:18 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie0wE-0003JX-LW; Sun, 08 Dec 2019 18:05:49 +0000
Received: by mail-wr1-x443.google.com with SMTP id d16so13428874wre.10;
 Sun, 08 Dec 2019 10:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t0XKcjck8Slbhi+L1r11b0VN49r+cr19/9Vv0kqVx+o=;
 b=HtyNtbPN7Ttbygqr0BrZZ9yArlU2yvhY7/YuojoZyM2ftyokwrnpg3pFtsTCDqoWU5
 xP9B0pVsToNNHY9+yVx8D6NM1XyyE0/WlJA4aWYTxZ0i477Y4jgFUGxi/8m17nGQ5djt
 gvhvPyCIas3P82Q/L4u9N4dxcxNU4lRxXz3mPlDLLkQnUQwmkp2obGIC1rrfFbS8aKu1
 P3Nz50kKbKiHuJlvX9BKTCJDH2yYK2JSN2tjLSXNs6He4vXsKoz8IldyuDHTAGZ0cqr5
 V9HK+0oHAL7keu0LNd7y1HnXw/Bnxd2bwYwrSvw7JqfM5jrqjjqLCPNnileR+IQ/tsQF
 aOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t0XKcjck8Slbhi+L1r11b0VN49r+cr19/9Vv0kqVx+o=;
 b=qdK+Q/vimU7qQiGVftfXdR4SxGX1971/7JyX1NucfBqvgKdQqFkBpAExstxp87lYKn
 BvoCnaS2Gt1oM2QESx/sqG3O7HpTC8dwk/4TRdoO0CRutd6+td+hkdhG2FO4K8RQ8/Z0
 lqDlqDS0kW0yLT91cYra9uw+1Gaf9CKLQ83d2EA+h+8X1nVm3ZzLJDz4LQASEI7Dqog/
 1/0QfipJzQ6WVCsqsHHXPhlkVG1hD49PE8RBw6vtFgsojEDEnkWwoxq0iS4Sy1v3A3Lq
 ch16UP4yT7E6ub6UZ4mX1E/KP6qXS1H3lzhxVPxuWlH9TGwnhmTWvnJSPR12N5F5MdY4
 imLw==
X-Gm-Message-State: APjAAAUFmTar9IfO7la+S7//fq+Yh4jdMb43U0KrNl6pYfDJ/C4GyuQf
 Wz0oeLmaDCNd61fdR9p4usyWiX50
X-Google-Smtp-Source: APXvYqyToRxC7RZxSQuc4P+1emXKkW61mgRhwMHankrbHkqOII7xGvEXJVr1E7GLcxhl3+MwE0Tkow==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr9143995wrv.368.1575828344729; 
 Sun, 08 Dec 2019 10:05:44 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id a64sm11797687wmc.18.2019.12.08.10.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 10:05:44 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 jbrunet@baylibre.com
Subject: [PATCH 3/3] ARM: dts: meson8b: add the DDR clock controller
Date: Sun,  8 Dec 2019 19:05:25 +0100
Message-Id: <20191208180525.1076152-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208180525.1076152-1-martin.blumenstingl@googlemail.com>
References: <20191208180525.1076152-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_100546_704341_9A78A286 
X-CRM114-Status: GOOD (  10.73  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DDR clock controller and pass it's DDR_CLKID_DDR_PLL to the main
(HHI) clock controller as "ddr_clk". The "ddr_clk" is used as one of the
inputs for the audio clock muxes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 1934666ff60f..8ac8bdfaf58f 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -4,6 +4,7 @@
  * Author: Carlo Caione <carlo@endlessm.com>
  */
 
+#include <dt-bindings/clock/meson8-ddr-clkc.h>
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8b-gpio.h>
 #include <dt-bindings/reset/amlogic,meson8b-reset.h>
@@ -172,6 +173,14 @@ mmcbus: bus@c8000000 {
 		#size-cells = <1>;
 		ranges = <0x0 0xc8000000 0x8000>;
 
+		ddr_clkc: clock-controller@400 {
+			compatible = "amlogic,meson8b-ddr-clkc";
+			reg = <0x400 0x20>;
+			clocks = <&xtal>;
+			clock-names = "xtal";
+			#clock-cells = <1>;
+		};
+
 		dmcbus: bus@6000 {
 			compatible = "simple-bus";
 			reg = <0x6000 0x400>;
@@ -434,8 +443,8 @@ &gpio_intc {
 &hhi {
 	clkc: clock-controller {
 		compatible = "amlogic,meson8-clkc";
-		clocks = <&xtal>;
-		clock-names = "xtal";
+		clocks = <&xtal>, <&ddr_clkc DDR_CLKID_DDR_PLL>;
+		clock-names = "xtal", "ddr_pll";
 		#clock-cells = <1>;
 		#reset-cells = <1>;
 	};
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
