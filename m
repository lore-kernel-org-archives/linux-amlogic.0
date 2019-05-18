Return-Path: <SRS0=s/lC=TS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F621C072A4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 May 2019 05:19:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E611520833
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 May 2019 05:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EQW5KbTW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="F1zfWMdR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E611520833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vgoVeS5WGUQTeNJ4zfjASFEndyojk2AgvUtRCmqxE7E=; b=EQW5KbTWWOuvz/
	O6gC9lzFFNALF9RBL1WqzF3yFHL2nguIAkJF2nHYsRf6XHQtT9hjEdzZNST3pKHJOtZvhBwIcr6lf
	LR7PlXxgg9PUccpSBxH1reMOMTd38XI6IgBt1JYlGXKoCyeAYRPE760UlNJ85UGgFNgro9kklCUOe
	TyBZhhstNgohG49FbE1dCOy9Pivg8aZdppp48HipK+ptByB50Pl/eVHOYkCnrPVbgAc1u64rk1LcG
	CgoLCK6SWBgoELyJfnOdRcxZlTSYJh0oG6LG5O1iGPerShJUU8Fsy6Vd2sf26SaqnfnY4+xFmiF6+
	ZAPB5cKlC0h94KD85a+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRrkF-0002GX-UK; Sat, 18 May 2019 05:18:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRrk7-0002Aa-SP
 for linux-amlogic@lists.infradead.org; Sat, 18 May 2019 05:18:49 +0000
Received: by mail-wr1-x442.google.com with SMTP id r4so9048457wro.10
 for <linux-amlogic@lists.infradead.org>; Fri, 17 May 2019 22:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=FdTczlBBVa9u+WV7Y3o/VG0d13GnIMDeCYtn2Nanml4=;
 b=F1zfWMdRgS6aonOqLALhrSo+SyB4+e0YJqXqynv/i3/qPBQf/XXDnhPbqBKxYRQZiz
 S8ujokRw+sZ8gpEG0r/sqzCtbRLMEWbnAOWCRP/YvIVR8rdMH22YtSsZB8HGQFmDrbGd
 MjKCAMONJPBnABOtf9XTXbB8QyJCzD30yc9wGBT2syOFI9Mx/wVMlR/kl72NNslvQkc0
 z7onZq/tS9DFecIgbdFccvdkDKg7l1PIdSXBqMCmCG2+rsAvFL+aRCsJhrjAZYjG9zth
 JrCM8prGC6/8wXVYk1+UHv2GKpnyZpJtx8vJdZ1t8xKyJKWKz0goQ2ksTil2qJsXAKAM
 AU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=FdTczlBBVa9u+WV7Y3o/VG0d13GnIMDeCYtn2Nanml4=;
 b=VyebKvi1k83Cq3nPj1QRbcEfLfBXQGGS7UVOwVfk0b6VBbTFyWF+Tci/UFzZ79Jgnu
 MTDmS2U+UUxwfOSRF4m0RFGSZKVQAah9pdHhQo1x3Pg9kIoIHmZAGrlFajcbI/lh8vFt
 tGyOB9/0IdrjK1mezPDo4ruIcPX3PTaQoi3xU1x8zUWylwOXn6A5d99CBEmivbV5HMIm
 xJErEr/NsKl79s3gNFDa4Xi1ausREiCmhal6rR8j/ri0MFsSkka40DvYrGNBgNScNrGT
 yVySMH5gHVB8qZW35kO4orGOBpjJjFzlHXXXqWpt2VjvkRyaJSh9vATSYcTEZN5Op3jP
 5euA==
X-Gm-Message-State: APjAAAVFMUb6idS2edXWt/vTYj8PLDlX4MWjNIag2UpC4/ZhFtB/Jywo
 /oiW9lvc7DisxeJzsYTEkQ6Wwg==
X-Google-Smtp-Source: APXvYqyKs/VAHBOML+lvp5PP0kJwVtEuyjECXDM+qa9/C+RbEsVzF763x/DTJy2CzXp5JXcWVGKPwQ==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr11753300wrt.197.1558156725277; 
 Fri, 17 May 2019 22:18:45 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id r3sm9672144wrn.5.2019.05.17.22.18.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 22:18:44 -0700 (PDT)
Message-ID: <5cdf95b4.1c69fb81.808ef.7543@mx.google.com>
Date: Fri, 17 May 2019 22:18:44 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: mainline
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.1-12505-g0ef0fd351550
Subject: mainline/master boot bisection: v5.1-12505-g0ef0fd351550 on
 meson-g12a-x96-max
To: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
 mgalka@collabora.com, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
 matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com,
 Jerome Brunet <jbrunet@baylibre.com>
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_221847_980030_7399D13F 
X-CRM114-Status: UNSURE (   7.35  )
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

mainline/master boot bisection: v5.1-12505-g0ef0fd351550 on meson-g12a-x96-max

Summary:
  Start:      0ef0fd351550 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
  Details:    https://kernelci.org/boot/id/5cdf275859b514bb847a3628
  Plain log:  https://storage.kernelci.org//mainline/master/v5.1-12505-g0ef0fd351550/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.txt
  HTML log:   https://storage.kernelci.org//mainline/master/v5.1-12505-g0ef0fd351550/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.html
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
  Config:     defconfig+CONFIG_RANDOMIZE_BASE=y
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
# bad: [0ef0fd351550130129bbdb77362488befd7b69d2] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
git bisect bad 0ef0fd351550130129bbdb77362488befd7b69d2
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
