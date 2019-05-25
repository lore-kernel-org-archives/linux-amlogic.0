Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39005C07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:48:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C84C20862
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:48:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIkD8Lx2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernelci-org.20150623.gappssmtp.com header.i=@kernelci-org.20150623.gappssmtp.com header.b="hn+A+m/6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C84C20862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4u8r0nXWc1/vyBzQLMW8v/doh/QnuEE7idZBm/H3+Ns=; b=SIkD8Lx291IPEk
	Kc6JdQEqyeKGit1fWEXKI94t0De+7pLp1xyEMSZGtefhJgD/oWJG6xI8Xy+FCv1XHyKy5cVSweHrK
	+chKWNidgwpqz5bXqQyQXXu9WUXBW7E5/jALzhhG7Kmzd7BwVANRju/pDvmVuNrKI/q1ZFhFAzsiL
	QO2CiBdV62/KIJLnDYFardrgpOa2DiOLlzRtU+w8wyYX1qgU7uo0cp8pe/WUPd4jjLAavGfqILKBC
	jH7yC72ALMFr5q+NXAVLr7ulqkfVF4c/0n33DLhnAMogb8cgN85dZyIdkp6+vDH3fhs/6O+10u8uY
	3sEW4JSTa7dZSXLrhbcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbib-0003d6-G5; Sat, 25 May 2019 18:48:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbiS-0003V1-Rf
 for linux-amlogic@lists.infradead.org; Sat, 25 May 2019 18:48:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id z23so8048277wma.4
 for <linux-amlogic@lists.infradead.org>; Sat, 25 May 2019 11:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernelci-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:content-transfer-encoding:subject:to
 :from:cc; bh=ySFaYHIgJnSSeFFCY31CR/SnL7eO3yPDG4N0jJWAz44=;
 b=hn+A+m/6tEtfN0K+o2BfWU9V1gwMDgf0Z3i9yjjZhMtYesszuOniQIwt/8aSgdFxgf
 uTf8/Qv7Il9UbIhlksNn7oZ3PBhglwqygNl2Hnd9L9YQHc8vEZn0G/i/ZilDhEzFmpvA
 i/6s6uP4KW5rqOtc2WtjoDzkSNVhdF2CwpACXd5VXAX5RKxfW0WMkxJsAvW10rvJ6YgL
 5dWox4XGijSWySaIT9IAPA8nJz6JPZpAxKId+n6++pbhdNhQIUv/jt1yj5ClcEg8C2ib
 BBagIOUVp7ihHbpg826e+BX4yo4Im9Y770pUpziPBGd7gMXsc/6hJGtWRmfZPlWwfxvZ
 uxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version
 :content-transfer-encoding:subject:to:from:cc;
 bh=ySFaYHIgJnSSeFFCY31CR/SnL7eO3yPDG4N0jJWAz44=;
 b=U6XrMZWiWFOhnywynkF3CNSTr3RYYoFbxMdu54XmOhMshiEP7B9QzdTq80xmNgyZ7U
 mvkOIfLrp9J8yiH9vywvEUnkxOu9odokYmk5fmBAc298UfE+hz5VNNlSQEYXMravQtYc
 ssSPdtRrkbUJDkzMrGGJgiFhm6tu6BvKlkoZtQ+qPDsgnns7KpaW3l9R+glDSwwpTr4y
 5AROUszr6W9vW8163llLrkuij5F7kex/RpvqPbsMr5XBHpvuHvhimOoJPjjarUdMNalD
 53evjFUXYruyRjvDGACMnRY9CV5t7Mt3c/XuqHdxiWxMIYsgBxR9+s7ClUS3L1rRzR6c
 W16g==
X-Gm-Message-State: APjAAAUxz3UZTV25cjnEGk45j6yMJOV6SRYDkWJh0fdUavtvjp4W7I13
 ad12l4rLcI/kJjGbZJZYiFOpzr+MQdM=
X-Google-Smtp-Source: APXvYqzjP0tOHFRy29TMsL/iuwZ1L+rKIFnyv5RQt10o6h2pyJqGaVT5UoZYKZWb6ixHNTXoxp7NuQ==
X-Received: by 2002:a1c:7a0a:: with SMTP id v10mr4304867wmc.57.1558810103202; 
 Sat, 25 May 2019 11:48:23 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
 by smtp.gmail.com with ESMTPSA id s11sm3040359wro.17.2019.05.25.11.48.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 11:48:22 -0700 (PDT)
Message-ID: <5ce98df6.1c69fb81.d2103.feb3@mx.google.com>
Date: Sat, 25 May 2019 11:48:22 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Report-Type: bisect
X-Kernelci-Tree: mainline
X-Kernelci-Lab-Name: lab-baylibre
X-Kernelci-Branch: master
X-Kernelci-Kernel: v5.2-rc1-369-g2409207a73cc
Subject: mainline/master boot bisection: v5.2-rc1-369-g2409207a73cc on
 meson-g12a-x96-max
To: tomeu.vizoso@collabora.com, guillaume.tucker@collabora.com,
 mgalka@collabora.com, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org,
 matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com,
 Jerome Brunet <jbrunet@baylibre.com>
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_114825_029427_54E4F7CD 
X-CRM114-Status: UNSURE (   6.89  )
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

mainline/master boot bisection: v5.2-rc1-369-g2409207a73cc on meson-g12a-x96-max

Summary:
  Start:      2409207a73cc Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
  Details:    https://kernelci.org/boot/id/5ce8b16e59b514388a7a362a
  Plain log:  https://storage.kernelci.org//mainline/master/v5.2-rc1-369-g2409207a73cc/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.txt
  HTML log:   https://storage.kernelci.org//mainline/master/v5.2-rc1-369-g2409207a73cc/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.html
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
# bad: [2409207a73cc8e4aff75ceccf6fe5c3ce4d391bc] Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
git bisect bad 2409207a73cc8e4aff75ceccf6fe5c3ce4d391bc
# bad: [311f71281ff4b24f86a39c60c959f485c68a6d36] Merge tag 'for-5.2/dm-changes-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
git bisect bad 311f71281ff4b24f86a39c60c959f485c68a6d36
# bad: [be058ba65d9e43f40d31d9b16b99627f0a20de1b] Merge tag 'imx-dt-5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/dt
git bisect bad be058ba65d9e43f40d31d9b16b99627f0a20de1b
# bad: [7996313656b83ba516a1546d51f08f1a0fab4e06] Merge tag 'omap-for-v5.2/dt-am3-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into arm/dt
git bisect bad 7996313656b83ba516a1546d51f08f1a0fab4e06
# bad: [2140eaf2f46faf2627ec030d7cabf2dda2cb546b] Merge tag 'stm32-dt-for-v5.2-1' of git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32 into arm/dt
git bisect bad 2140eaf2f46faf2627ec030d7cabf2dda2cb546b
# bad: [1a88083b9349b8310b25d9a9a96802ee4447e6b9] Merge tag 'v5.2-rockchip-dts64-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/dt
git bisect bad 1a88083b9349b8310b25d9a9a96802ee4447e6b9
# bad: [1c93235a6d92deaab38bbb1cfc764b0757331ebb] Merge tag 'amlogic-dt' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic into arm/dt
git bisect bad 1c93235a6d92deaab38bbb1cfc764b0757331ebb
# bad: [ff4f8b6cab5885ebc2c6b21fd058db8544e2eebb] arm64: dts: meson: g12a: Add UART A, B & C nodes and pins
git bisect bad ff4f8b6cab5885ebc2c6b21fd058db8544e2eebb
# good: [965c827ac37e71f76d3ac55c75ac08909f2a4eed] arm64: dts: meson: g12a: add efuse
git bisect good 965c827ac37e71f76d3ac55c75ac08909f2a4eed
# bad: [11a7bea17c9e0a36daab934d83e15a760f402147] arm64: dts: meson: g12a: add pinctrl support controllers
git bisect bad 11a7bea17c9e0a36daab934d83e15a760f402147
# good: [b019f4a4199f865b054262ff78f606ca70f7b981] arm64: dts: meson: g12a: Add AO Clock + Reset Controller support
git bisect good b019f4a4199f865b054262ff78f606ca70f7b981
# first bad commit: [11a7bea17c9e0a36daab934d83e15a760f402147] arm64: dts: meson: g12a: add pinctrl support controllers
-------------------------------------------------------------------------------

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
