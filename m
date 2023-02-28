Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787C4C64EC7
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Feb 2023 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YhpwPTs9qwqagi5uHSNLHiS6txqiSwS/vaE3EKTCmw0=; b=1YX9Zj5RjTQKxM
	lTlQhZcDbT4j/HahPgASmUDfuv8YPfD16O/xNMeJKhZF0tVyLNJhVQbSmntUa0IA1tH3fc1zKg649
	QV2DyNpnuhC3aIdzKQGXLqJWTEIeUjCwBVwO9hLymW5g7v5corbOdLOgVP+sXAO4ICnfQUDi6CfWz
	e0hNXzKAhH9sRYfUtgQGF5lLo3ug8of4NhmSheSNWPz1G0IlNZIKD1ySNqKuuEOvYFhXWRfg2wTKR
	UEOeeEKDK1tJ/pZWlwKI91fFVoRnsrIjmCVx18m0YOEuOrxz8fw99j/vQ6X8Llcdd0yQ/nSztDB/2
	nKRXHg18/9fWIQ5K8YKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX39R-00DnPB-Vi; Tue, 28 Feb 2023 16:48:30 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX39M-00DnMp-Jp; Tue, 28 Feb 2023 16:48:28 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 58CE42003F3;
	Tue, 28 Feb 2023 17:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1677602894;
	bh=3JArV0HUT7IJjD46+A+es5XJHR5CflUHBr88Pe3TFW8=;
	h=Date:To:Cc:From:Subject:From;
	b=bzssfdAVpK1Skxw0AgoaafXZW0UrpTquq6+7zI4zOwLj3JbGqNTVWPlbw1bqCUFUq
	 Eo4s3b2NwHZ+UclXw8E6gF5a8dIz7cIkxDlSc5cKofXuj3mLnTKR87N9Z4Uht6imMX
	 TY4GjN7Lq7zoq/pn19jvmB77eNYTh6g7SX8M2ZMO1YeRKVCH5b4KU5AOkZzEiji2hE
	 q6fi6rpUxZfN1rpDL6yPr+78Tg2ZGvPeRSOuvHOUI4DseqJJMSX3JB6j1YFzNioRLI
	 CXHUfL55D6HJjZ3AL/JEB7pOPeMHDC4EkHgWrFkPp6R+9i/+MVJA2iHZwvRDNuxzXN
	 sL94BQ8rdP8gw==
Message-ID: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
Date: Tue, 28 Feb 2023 17:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: AML <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 Chris Healy <healych@amazon.com>, Will Deacon <will@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Pierre-Hugues Husson <phh@phh.me>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Conflict between video-lut and pmu on meson-g12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_084825_130767_38FA8F4D 
X-CRM114-Status: UNSURE (   9.55  )
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

Hello everyone,

Running 6.2.0-rc8 on a S905X2 board, I note the following error
in the kernel log:

[    1.059175] meson-g12-ddr-pmu ff638000.pmu: can't request region for resource [mem 0xff638000-0xff6380ff]
[    1.068647] meson-g12-ddr-pmu: probe of ff638000.pmu failed with error -16

Relevant DT node from decompiled DTB:
(arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi + arch/arm64/boot/dts/amlogic/meson-g12a.dtsi)

	pmu@ff638000 {
		reg = <0x0 0xff638000 0x0 0x100 0x0 0xff638c00 0x0 0x100>;
		interrupts = <0x0 0x34 0x1>;
		compatible = "amlogic,g12a-ddr-pmu";
	};

However, according to /proc/iomem
ff638048-ff63805b : ff638048.video-lut video-lut@48

Corresponding DT node:
(arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi)

	video-lut@48 {
		compatible = "amlogic,canvas";
		reg = <0x0 0x48 0x0 0x14>;
		phandle = <0x22>;
	};

(with a base of 0xff600000 + 0x38000 = 0xff638000)

Unless I'm mistaken, ff638000-0xff6380ff and ff638048-ff63805b
cannot co-exist?

A simple solution might be to specify the "actual" base of
the register set, and count from 0 in the driver?


diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 534178eaaf373..cf37eecfba5b2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1712,7 +1712,7 @@ internal_ephy: ethernet-phy@8 {
 		};
 
 		pmu: pmu@ff638000 {
-			reg = <0x0 0xff638000 0x0 0x100>,
+			reg = <0x0 0xff638080 0x0 0x40>,
 			      <0x0 0xff638c00 0x0 0x100>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
 		};
diff --git a/drivers/perf/amlogic/meson_g12_ddr_pmu.c b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
index a78fdb15e26c2..8b643888d5036 100644
--- a/drivers/perf/amlogic/meson_g12_ddr_pmu.c
+++ b/drivers/perf/amlogic/meson_g12_ddr_pmu.c
@@ -21,23 +21,23 @@
 #define DMC_QOS_IRQ		BIT(30)
 
 /* DMC bandwidth monitor register address offset */
-#define DMC_MON_G12_CTRL0		(0x20  << 2)
-#define DMC_MON_G12_CTRL1		(0x21  << 2)
-#define DMC_MON_G12_CTRL2		(0x22  << 2)
-#define DMC_MON_G12_CTRL3		(0x23  << 2)
-#define DMC_MON_G12_CTRL4		(0x24  << 2)
-#define DMC_MON_G12_CTRL5		(0x25  << 2)
-#define DMC_MON_G12_CTRL6		(0x26  << 2)
-#define DMC_MON_G12_CTRL7		(0x27  << 2)
-#define DMC_MON_G12_CTRL8		(0x28  << 2)
-
-#define DMC_MON_G12_ALL_REQ_CNT		(0x29  << 2)
-#define DMC_MON_G12_ALL_GRANT_CNT	(0x2a  << 2)
-#define DMC_MON_G12_ONE_GRANT_CNT	(0x2b  << 2)
-#define DMC_MON_G12_SEC_GRANT_CNT	(0x2c  << 2)
-#define DMC_MON_G12_THD_GRANT_CNT	(0x2d  << 2)
-#define DMC_MON_G12_FOR_GRANT_CNT	(0x2e  << 2)
-#define DMC_MON_G12_TIMER		(0x2f  << 2)
+#define DMC_MON_G12_CTRL0		(0x0  << 2)
+#define DMC_MON_G12_CTRL1		(0x1  << 2)
+#define DMC_MON_G12_CTRL2		(0x2  << 2)
+#define DMC_MON_G12_CTRL3		(0x3  << 2)
+#define DMC_MON_G12_CTRL4		(0x4  << 2)
+#define DMC_MON_G12_CTRL5		(0x5  << 2)
+#define DMC_MON_G12_CTRL6		(0x6  << 2)
+#define DMC_MON_G12_CTRL7		(0x7  << 2)
+#define DMC_MON_G12_CTRL8		(0x8  << 2)
+
+#define DMC_MON_G12_ALL_REQ_CNT		(0x9  << 2)
+#define DMC_MON_G12_ALL_GRANT_CNT	(0xa  << 2)
+#define DMC_MON_G12_ONE_GRANT_CNT	(0xb  << 2)
+#define DMC_MON_G12_SEC_GRANT_CNT	(0xc  << 2)
+#define DMC_MON_G12_THD_GRANT_CNT	(0xd  << 2)
+#define DMC_MON_G12_FOR_GRANT_CNT	(0xe  << 2)
+#define DMC_MON_G12_TIMER		(0xf  << 2)
 
 /* Each bit represent a axi line */
 PMU_FORMAT_ATTR(event, "config:0-7");


With the above patch, /proc/iomem becomes:

ff638048-ff63805b : ff638048.video-lut video-lut@48
ff638080-ff6380bf : ff638080.pmu pmu@ff638000
ff638c00-ff638cff : ff638080.pmu pmu@ff638000

(I didn't test that the driver actually works.
I suppose one needs perf for that?)

Regards.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
