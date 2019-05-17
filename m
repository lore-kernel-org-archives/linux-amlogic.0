Return-Path: <SRS0=JomC=TR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4706C04AB4
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2019 12:57:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 960862087B
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2019 12:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kuA770PL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="wE/Ymg2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 960862087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TtzMSIg4/KRa93gGHf7nfOzk/fmhzIB7Pu6PNLJljG0=; b=kuA770PLeCVpxl
	TCfYiICTuZziJDqaSVP276CXA7GbRXCbKXAFY3JTJaNd+cZc1WkxwK3a+oZctOFdj3HUT3+/qGm7n
	Xg6MxUE3B6Fa/XORpepG7zBjAdpRUQnV6OjwcAOnBV5XL/Jl7Dd3Pc7o1V6/p7tifV+nxqkpsfLG8
	f0RTBsNgAOj/wvNfL9s4o3jlD0tFIPOK//yapCPL9N0ROn7lyVDG+nK0ChDkppcUr0Ouf5mwBlXhn
	uAMt6mRDYH83kAAfHXmtIE8NEYeMAECnLa+UtOCYEZO2eL3eDWgPTr0SU5MPQw+L7XHKLLq7TwLc9
	rCys0ctqeBICLdFVNQYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRcQO-0002dz-Uy; Fri, 17 May 2019 12:57:24 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRcQG-0002Wz-Eq
 for linux-amlogic@lists.infradead.org; Fri, 17 May 2019 12:57:18 +0000
Received: by mail-wm1-x342.google.com with SMTP id x64so6850099wmb.5
 for <linux-amlogic@lists.infradead.org>; Fri, 17 May 2019 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=HKfyiyGfXU9AJ72KPmZHXimSLWU7pditklJYTaZHlIE=;
 b=wE/Ymg2vvkRy+sIyqYSV3Lf6nhRTVMrZ6Rna0Zu51RGb1YO+zMVEjRRM1pneicE/ge
 qyHB4B4ssqCu6dNQZ5oFRXaDZ2+hzFilwmPa+x6dBEJo+GQ9Orel7u68hUYpOEzaqhzK
 6cuJqoWZ+iKjBoazBPbXT08bquET5gkuazuqJaA49vPoSNosIuWr/mfdogUZHpqs8c+s
 5mukGPmMUuEOtOLqxczGkED/i7sQy8GnaYJSezJbQmZkP7yrYUQ2HlgSI3hah9ar9iEF
 zKnTmcK3kDoslovRx7KYilLCRQ0nU/6n5BBpuBM/hibtnGt5OryzQc5iQqByFrln46z5
 cSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=HKfyiyGfXU9AJ72KPmZHXimSLWU7pditklJYTaZHlIE=;
 b=NLOCd9DVCgpzyeNLdtbTJhN0WW8YEhWFwUa6p4UEKI8Gn+4H/ytuo20kChNE6pDqyK
 rcmSfEuSDiiDb93PpiBUE3SUN7dmzQzrtaUPqs/EuRz1LW44f8CfMN8Dka598OOydlpf
 OFRzP6eobTw0pKO7l1cdf4k3ueC15mw4iE4Gg8lF2noRgh/Pk3+rcrZXAk4qtbi3yYSt
 OKCZr39MHvaktzwD8G6Ml3qJRK+klLl5wOg4zPUbNOwm70lyORYw8p25EjxepO3Zwvke
 //eyZFPuKWr0iAN6jz7e8kBwqc9LVyPDbSvOmnTTvBzYtZCzlgodZMw+UeiR3UiA7orf
 1HqA==
X-Gm-Message-State: APjAAAWmmrPrdzgDb2Hn49NH5UnANNSIPN6tbRlUNc0bNONRvuqG/SLL
 qXFQru8l9ai+6SVYPa6ykH8e8isdN/Gr4Q==
X-Google-Smtp-Source: APXvYqzDaav67ZbIWvC82E0RKgZY08Z323wi9RZ26Bg8AW+Sb3QFy+h84OI8KkljMqbqPaa3x4qJmw==
X-Received: by 2002:a1c:c8:: with SMTP id 191mr2046884wma.6.1558097834493;
 Fri, 17 May 2019 05:57:14 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id o6sm14824232wrh.55.2019.05.17.05.57.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 05:57:13 -0700 (PDT)
Message-ID: <5cdeafa9.1c69fb81.10168.6580@mx.google.com>
Date: Fri, 17 May 2019 05:57:13 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: mainline
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.1-12115-g01be377c6221
Subject: mainline/master boot bisection: v5.1-12115-g01be377c6221 on
 meson-g12a-x96-max
To: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
 mgalka@collabora.com, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
 matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com,
 Jerome Brunet <jbrunet@baylibre.com>
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_055716_507644_94B61636 
X-CRM114-Status: UNSURE (   7.92  )
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

mainline/master boot bisection: v5.1-12115-g01be377c6221 on meson-g12a-x96-max

Summary:
  Start:      01be377c6221 Merge tag 'media/v5.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
  Details:    https://kernelci.org/boot/id/5cde30f059b514110f7a3636
  Plain log:  https://storage.kernelci.org//mainline/master/v5.1-12115-g01be377c6221/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.txt
  HTML log:   https://storage.kernelci.org//mainline/master/v5.1-12115-g01be377c6221/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.html
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
# bad: [01be377c62210a8d8fef35be906f9349591bb7cd] Merge tag 'media/v5.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect bad 01be377c62210a8d8fef35be906f9349591bb7cd
# bad: [b45da609a02460c6a34c395f03f891f1fb2a021a] Merge tag 'imx-bindings-5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/dt
git bisect bad b45da609a02460c6a34c395f03f891f1fb2a021a
# bad: [a41332dd5e2ac56b0b6eb0959d8828bfe0d6a4ad] Merge tag 'socfpga_dts_updates_for_v5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into arm/dt
git bisect bad a41332dd5e2ac56b0b6eb0959d8828bfe0d6a4ad
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
