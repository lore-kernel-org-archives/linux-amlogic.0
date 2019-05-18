Return-Path: <SRS0=s/lC=TS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42F3C04AAF
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 May 2019 07:32:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72530216FD
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 May 2019 07:32:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YEEaeKTl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="LCHDHE9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72530216FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UI43KKMn5yGMq9ewE4WY0Itr7oWsB0rVg/AvCrZvSB0=; b=YEEaeKTlLLAo5i
	3Q/i6yBNcESx3ZjANpYCtnN/xAjyU2eVf/hvD2jUa7jeXXp+AcsDUI5hNAvsnyYIFQWCIpIxqu9vB
	ylx5uhOABZNVhqR6yp/0VHrLdvSN0WBtd78EHrJBPUsx34nM4dkvAXdVVLcOONq43Epizz4vcvdR5
	4XYLw7kg2JHuzvVGde9SIhj9xD/IY63RlDIsn9c2oHls1ZlpdDT1ie07TEuAEsHdZXxJuS6nTFtGp
	8T+Qw50/OS+/yA2dhhPuI5mAGLXF29fNGLguLk3FaemuPqMs4bGvD90vA4CmsDUhPMFno1J2xz4rJ
	YsfN4BrjXbtvj4+G+uJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRtpq-0002nT-Jd; Sat, 18 May 2019 07:32:50 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRtpm-0002m5-Je
 for linux-amlogic@lists.infradead.org; Sat, 18 May 2019 07:32:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id i3so8800444wml.4
 for <linux-amlogic@lists.infradead.org>; Sat, 18 May 2019 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=F7rW9WR+hkCVM8z35uvk7p1boAzUi+cOuWV+wfxrZHg=;
 b=LCHDHE9Gb2lzCFWTyFebacpMQftGQo+veVRAK9HIA5heN6aUKqGXbkTiqAYCvHWF6w
 CesFpgTq8tzMOUNw034xpKljI5L34idjQvfSJdY9DODpq/S7qtWviNQeaRwYIlWf1mNC
 8hLghlWeRjJXbv4Ct0ev5fu/IgSNKMrNpBLsLn2amNBA/U8GYyyhK95rMiZHnGmtXJWW
 LOoIpej/L5DpTsL7dhgj2nwfpZ0yXv/QC04EJaIaYTPftJS4+ImI3rI5zNobLLwhR8Z5
 iGZeIMz2mv/iDovAuhasxRcRWphwIPNJF1hZIg11niQsp94uEjZ1zclQDk2Svxwahn3K
 GmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=F7rW9WR+hkCVM8z35uvk7p1boAzUi+cOuWV+wfxrZHg=;
 b=Jt7lInVxrjPExfcNVg/vXhr4UoCMwdyzNWc4m7P3tMbG3M6XL+V/I34gapKqye8Pvi
 uvUIdUDXdKo0TSh+3moW0cXLf/KdK4hOMBLWUaRF9hAP2hT8a1JqAfZimwOTmzaF2ZFt
 QB5LZraKyDyoISYrRZlDH5OO2IL9pP33MDr3vrjan14/LrViuwnTIPRQZIEmWppJG8z2
 z475NoIEySkCU0SF8mAsCWVrl7008o3IrLiZMYHXqIu8CkhKX+wXikzoljUw6tihV+4e
 B6poU9o7BpE4dr4r2XdMPGg/0jOKbCPVe0rEUEiFMs24iFglP7UTnUC1CNBcTDIGHxZT
 KHOA==
X-Gm-Message-State: APjAAAU6f4sDll3BNzK6W+vFOYn73EDMpxyiHANjyHJWBr5D0BJNV05K
 EteSLSO44MtTIishaA76vjZPRQ==
X-Google-Smtp-Source: APXvYqwzOs9zWoOynUSNBQBi9WKTk4BqTL3+X4aIZAQv2sWvAzSx6S0uTZK4di0cFT5VaCDV/Pu3Yg==
X-Received: by 2002:a1c:3d87:: with SMTP id k129mr8365984wma.21.1558164761492; 
 Sat, 18 May 2019 00:32:41 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id c131sm11669555wma.31.2019.05.18.00.32.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 00:32:40 -0700 (PDT)
Message-ID: <5cdfb518.1c69fb81.7d28c.30a0@mx.google.com>
Date: Sat, 18 May 2019 00:32:40 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: mainline
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.1-12511-g72cf0b07418a
Subject: mainline/master boot bisection: v5.1-12511-g72cf0b07418a on
 meson-g12a-x96-max
To: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
 mgalka@collabora.com, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
 matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com,
 Jerome Brunet <jbrunet@baylibre.com>
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190518_003246_790144_E8E0F515 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

mainline/master boot bisection: v5.1-12511-g72cf0b07418a on meson-g12a-x96-max

Summary:
  Start:      72cf0b07418a Merge tag 'sound-fix-5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
  Details:    https://kernelci.org/boot/id/5cdf4cc359b514ce467a362a
  Plain log:  https://storage.kernelci.org//mainline/master/v5.1-12511-g72cf0b07418a/arm64/defconfig/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.txt
  HTML log:   https://storage.kernelci.org//mainline/master/v5.1-12511-g72cf0b07418a/arm64/defconfig/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.html
  Result:     11a7bea17c9e arm64: dts: meson: g12a: add pinctrl support controllers

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       mainline
  URL:        git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  Branch:     master
  Target:     meson-g12a-x96-max
  CPU arch:   arm64
  Lab:        lab-baylibre
  Compiler:   gcc-8
  Config:     defconfig
  Test suite: boot

Breaking commit found:

-------------------------------------------------------------------------------
commit 11a7bea17c9e0a36daab934d83e15a760f402147
Author: Jerome Brunet <jbrunet@baylibre.com>
Date:   Mon Mar 18 10:58:45 2019 +0100

    arm64: dts: meson: g12a: add pinctrl support controllers
    
    Add the peripheral and always-on pinctrl controllers to the g12a soc.
    
    Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
    Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
    Signed-off-by: Kevin Hilman <khilman@baylibre.com>

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index abfa167751af..5e07e4ca3f4b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -104,6 +104,29 @@
 				#address-cells = <2>;
 				#size-cells = <2>;
 				ranges = <0x0 0x0 0x0 0x34400 0x0 0x400>;
+
+				periphs_pinctrl: pinctrl@40 {
+					compatible = "amlogic,meson-g12a-periphs-pinctrl";
+					#address-cells = <2>;
+					#size-cells = <2>;
+					ranges;
+
+					gpio: bank@40 {
+						reg = <0x0 0x40  0x0 0x4c>,
+						      <0x0 0xe8  0x0 0x18>,
+						      <0x0 0x120 0x0 0x18>,
+						      <0x0 0x2c0 0x0 0x40>,
+						      <0x0 0x340 0x0 0x1c>;
+						reg-names = "gpio",
+							    "pull",
+							    "pull-enable",
+							    "mux",
+							    "ds";
+						gpio-controller;
+						#gpio-cells = <2>;
+						gpio-ranges = <&periphs_pinctrl 0 0 86>;
+					};
+				};
 			};
 
 			hiu: bus@3c000 {
@@ -150,6 +173,25 @@
 					clocks = <&xtal>, <&clkc CLKID_CLK81>;
 					clock-names = "xtal", "mpeg-clk";
 				};
+
+				ao_pinctrl: pinctrl@14 {
+					compatible = "amlogic,meson-g12a-aobus-pinctrl";
+					#address-cells = <2>;
+					#size-cells = <2>;
+					ranges;
+
+					gpio_ao: bank@14 {
+						reg = <0x0 0x14 0x0 0x8>,
+						      <0x0 0x1c 0x0 0x8>,
+						      <0x0 0x24 0x0 0x14>;
+						reg-names = "mux",
+							    "ds",
+							    "gpio";
+						gpio-controller;
+						#gpio-cells = <2>;
+						gpio-ranges = <&ao_pinctrl 0 0 15>;
+					};
+				};
 			};
 
 			sec_AO: ao-secure@140 {
-------------------------------------------------------------------------------


Git bisection log:

-------------------------------------------------------------------------------
git bisect start
# good: [a455eda33faafcaac1effb31d682765b14ef868c] Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal
git bisect good a455eda33faafcaac1effb31d682765b14ef868c
# bad: [72cf0b07418a9c8349aa9137194b1ccba6e54a9d] Merge tag 'sound-fix-5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect bad 72cf0b07418a9c8349aa9137194b1ccba6e54a9d
# bad: [89f4f128ea535acaabf7d5bddc30ddda0fb7a70a] Merge tag 'imx-dt64-5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/dt
git bisect bad 89f4f128ea535acaabf7d5bddc30ddda0fb7a70a
# bad: [f5d6e8c077915c84d8b544bc02e3df2f0910c193] Merge tag 'sunxi-dt-for-5.2' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into arm/dt
git bisect bad f5d6e8c077915c84d8b544bc02e3df2f0910c193
# bad: [6d918e09331e63593b7827ea1a718f0da03b7fb0] Merge tag 'omap-for-v5.2/dt-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/dt
git bisect bad 6d918e09331e63593b7827ea1a718f0da03b7fb0
# bad: [2fe743c27f064d637df7f989333c153f8d4b0e65] Merge tag 'renesas-arm64-dt-for-v5.2' of https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas into arm/dt
git bisect bad 2fe743c27f064d637df7f989333c153f8d4b0e65
# bad: [f6f9683c5aedff214433fa130e67a79f08a47fdb] Merge tag 'v5.2-rockchip-dts32-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/dt
git bisect bad f6f9683c5aedff214433fa130e67a79f08a47fdb
# bad: [e2cffeb398f4830b004774444809ee256b9bc653] arm64: dts: meson-g12a: Add CMA reserved memory
git bisect bad e2cffeb398f4830b004774444809ee256b9bc653
# bad: [11a7bea17c9e0a36daab934d83e15a760f402147] arm64: dts: meson: g12a: add pinctrl support controllers
git bisect bad 11a7bea17c9e0a36daab934d83e15a760f402147
# good: [7e09092aee006b21d830b99f8498b5640b8711f6] arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED
git bisect good 7e09092aee006b21d830b99f8498b5640b8711f6
# good: [965c827ac37e71f76d3ac55c75ac08909f2a4eed] arm64: dts: meson: g12a: add efuse
git bisect good 965c827ac37e71f76d3ac55c75ac08909f2a4eed
# good: [b019f4a4199f865b054262ff78f606ca70f7b981] arm64: dts: meson: g12a: Add AO Clock + Reset Controller support
git bisect good b019f4a4199f865b054262ff78f606ca70f7b981
# first bad commit: [11a7bea17c9e0a36daab934d83e15a760f402147] arm64: dts: meson: g12a: add pinctrl support controllers
-------------------------------------------------------------------------------

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
