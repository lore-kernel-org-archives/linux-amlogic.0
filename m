Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DA6C282E1
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 01:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0658720863
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 01:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bOXs82BM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="I0Go90WH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0658720863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YFTisnkT86IaMaNtNG3+YBVK0ke24iibA0JHyb3rcFo=; b=bOXs82BMrWe0QV
	Wx1TNZunA7gxtwTX27r180YQbNpHNZIkEIaDYrX+M3Vk4wX7UncaNDzi/rihLZetjwlkSr7rPF8Rl
	ObV64zRlr/2++MbXLYbOm/7j466Jhc/6dIAnPtLllWzxjZcdulMiycm3M/3XNch/jNNjiRkXCa6Zo
	8hcFbnNVcO74te5i1Y22cokpxuSifpSgT3A8y1o/jDiBkH1W8ey8R1wmlP9wYwrhbyIF7j4DY6EWp
	jWRVNgA29o/ORxm3UbUjyGla5nJ0rjNMhj+KZPDNNubtP9IfMqBPbM07iDkOK6MRBAeyjUZWL2/JK
	bkYFJsAkhEF8vaPYQs6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUL2j-0008W6-RB; Sat, 25 May 2019 01:00:13 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUL2g-0008VC-Mt
 for linux-amlogic@lists.infradead.org; Sat, 25 May 2019 01:00:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id w9so4644243wmi.0
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 18:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=mOz/uzoZ8Qq/01C38MyE2pll+zK9QQHgk5S4tOoKkeM=;
 b=I0Go90WH2ayMMN403h5jEjNJssF9yIo9WmYHlS85dA3rNDOu6qzN4V5iBjqwwGq3HS
 jead8J+QAD2i06izMX5BXqXKHoJAu1mM5XcNsFmxHKUsFvABKIAiL4dPumEsjKLJbqMh
 XGvj+hN8LzZevfr98yQ8tV9LaX2pY5Y9fGjtEVoFDs6w78hu32wTH5TfjLc6B3+AUph5
 TXkFxkRam/AE8KCZ23Ru7Q37hbrDu12SYZn3jGW5nevPOg2ip9Tp1F1YF7537fw1A5CM
 wpv5KQSD50MFYOUJ86n1v+Ek1HaBsvdOLbHURsaGX+TwRzuNofuBo1WNzj9ykbdCB1L+
 ebCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=mOz/uzoZ8Qq/01C38MyE2pll+zK9QQHgk5S4tOoKkeM=;
 b=O9N+/sPQSpex1mDZMuAzX9TbkU50dZxW5rvMJepWQvbFf7g7jCsiQY4sm7abNRCbka
 iwHRQQJF5cRXdTZ+bib+xR1DpIKkmAPJzIUdPYvhOfyFrxh+QVGgC6puVkI6EOGMPcd7
 nuoozTJuVvJRm0d6KdlmPavV/l5cw8j3KczY4cebUqjCKC1+JiKp/bpjxjWljKBS5y+t
 l0pfsvneh2LJnSKQHorVfas95GeFFY9bAQW4pp3Mwe8VvOBzAuPwOBi8BkyHVIxXuN9y
 b48dIr1+O7jddSIRyPyOWP/zNdIDH68orBq3243gRpubT6TZQVrT8sVb9lz4kBlyhee6
 4/9Q==
X-Gm-Message-State: APjAAAV1PijvFTP6A73ze9W8DF2777YWtEYfeXQtnID1umQ3sZTUoPGV
 66bPeDZ4poR6XT5PFBfd+TGE2A==
X-Google-Smtp-Source: APXvYqz+d5B1uhbeZFmzCKr8tLpKRfnQnchVdM5lugUMtvpcsjrJqEChi+nfW/oijKLRaXuyKzf0EQ==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr1572416wml.160.1558746006753; 
 Fri, 24 May 2019 18:00:06 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id h14sm3343469wrt.11.2019.05.24.18.00.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 18:00:06 -0700 (PDT)
Message-ID: <5ce89396.1c69fb81.16e3d.2c5c@mx.google.com>
Date: Fri, 24 May 2019 18:00:06 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: clk
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: clk-next
X-Kernelci-Kernel: v5.2-rc1-4-gf191a146bcee
Subject: clk/clk-next boot bisection: v5.2-rc1-4-gf191a146bcee on
 meson-g12a-x96-max
To: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
 mgalka@collabora.com, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
 matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com,
 Jerome Brunet <jbrunet@baylibre.com>
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_180010_744600_24B4262C 
X-CRM114-Status: UNSURE (   7.12  )
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

clk/clk-next boot bisection: v5.2-rc1-4-gf191a146bcee on meson-g12a-x96-max

Summary:
  Start:      f191a146bcee Merge branch 'clk-fixes' into clk-next
  Details:    https://kernelci.org/boot/id/5ce8391259b514c80a7a362c
  Plain log:  https://storage.kernelci.org//clk/clk-next/v5.2-rc1-4-gf191a146bcee/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.txt
  HTML log:   https://storage.kernelci.org//clk/clk-next/v5.2-rc1-4-gf191a146bcee/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.html
  Result:     11a7bea17c9e arm64: dts: meson: g12a: add pinctrl support controllers

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       clk
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
  Branch:     clk-next
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
# good: [62e59c4e69b3cdbad67e3c2d49e4df4cfe1679e3] clk: Remove io.h from clk-provider.h
git bisect good 62e59c4e69b3cdbad67e3c2d49e4df4cfe1679e3
# bad: [f191a146bcee3dfd62a501432d22a55ef67858b4] Merge branch 'clk-fixes' into clk-next
git bisect bad f191a146bcee3dfd62a501432d22a55ef67858b4
# good: [e7a1414f9dc3498c4c35b9ca266d539e8bccab53] Merge tag 'media/v5.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect good e7a1414f9dc3498c4c35b9ca266d539e8bccab53
# good: [cccd559e98c05b669bdc37b01802f920cff1d6dd] Merge tag 'fbdev-v5.2' of git://github.com/bzolnier/linux
git bisect good cccd559e98c05b669bdc37b01802f920cff1d6dd
# good: [a455eda33faafcaac1effb31d682765b14ef868c] Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/git/evalenti/linux-soc-thermal
git bisect good a455eda33faafcaac1effb31d682765b14ef868c
# bad: [e8a1d70117116c8d96c266f0b99e931717670eaf] Merge tag 'armsoc-dt' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad e8a1d70117116c8d96c266f0b99e931717670eaf
# bad: [64f32d9d30063149eb10d7be3a23b5e1f44247c8] Merge tag 'renesas-arm64-dt2-for-v5.2' of https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas into arm/dt
git bisect bad 64f32d9d30063149eb10d7be3a23b5e1f44247c8
# bad: [da9a4c3d32eb699db68dd8f3e633ec035879d818] Merge tag 'omap-for-v5.2/dt-ti-sysc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/dt
git bisect bad da9a4c3d32eb699db68dd8f3e633ec035879d818
# bad: [bbf7499dc033831ae91125a88a062910cdc62cf2] Merge tag 'aspeed-5.2-devicetree' of git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed into arm/dt
git bisect bad bbf7499dc033831ae91125a88a062910cdc62cf2
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
