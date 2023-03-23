Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8627AC74A5B
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI1bYWAyrnDQtD1rPWWIBZDs5VSbqQ0Fgo7O1JIyitM=; b=dgBC6avKqH7bxZ
	kGOABWByPSMaE4l+75Hvo6efbsy+/EY34lR/eWnRAL74HjOvgOgerSYQF/KPsK+BYocZK17/wFIPx
	CiWxkKOzPFy+CDrKWd3m26dIX+KVAe7x/MMl1rabiMqwb5LgnZOzoz2EKynkZ0q1GouoeHt/8/hVj
	BS+chk+4mda0UFzgK6zCI+8Cmj+GazMDBBYbyPqG3OKJBkoaLESNbXezJM2KRGMSJYdYyZvkudCf6
	U+J3U5U4DzpCcM/UeXjbN6jyCmohdTsjVsxzkVCCgZ9L9Pl/sH9gB+zwSwMu4haHL5Ew2kXKfwFMv
	ksnctIcRXOeIp7RF2teQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNjb-002Sdb-14;
	Thu, 23 Mar 2023 16:24:15 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNjY-002Sci-20
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 16:24:14 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1D9012003C1;
	Thu, 23 Mar 2023 17:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1679588649;
	bh=6mXGzygDBqKuGJYsASMicZwqodF1kiYi0RZKwbblDqs=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Sy71snXjjo3wNCqjs+rse95Rokcqy4NdE94KSmMlYRORepoSZeZADy3bNUtAGF+uV
	 1pgMvt4dJsiBtmoAfDWAUa2M6OuehxZ32IGxRX1QKnZiwRF/EeY7lE3+kRtHHTri/P
	 J+DGP6WQnhDr4MH81kIjkSwxgxxUYCXXRcwb7VdG10Bj6DEwjNN9V/+bMX5TfHLzc3
	 AqqLD14DGbm32dM9OM8meNfzQK3+gO2ADcWE8wLXEiw8myblbnhhg12UdNovOmHKRD
	 opztyoILnW0m0Djk+EWx8h7ns7i0urP0i7f5GYYbiFSyEXKCxwwdDZ6BNg6aFRKdtD
	 KKzazsBD3SXBQ==
Message-ID: <a81a1ebd-2621-ded1-855d-bd91d923436b@free.fr>
Date: Thu, 23 Mar 2023 17:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH] perf/amlogic: resolve conflict between canvas & pmu
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>,
 AML <linux-amlogic@lists.infradead.org>
Cc: Chris Healy <healych@amazon.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Pierre-Hugues Husson <phh@phh.me>
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
 <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
 <c3b9c231-10ef-ef69-c702-9e1052b8e704@free.fr>
 <471489bc-8683-f1ba-3f5c-5a8bf299446a@free.fr>
 <CAFBinCBD38gcR+foUUm6JBOfdpzW1Q3g3nFowxoWG1LGSc31kQ@mail.gmail.com>
 <3f4a7735-5327-df75-79ac-66209dbffa37@free.fr>
In-Reply-To: <3f4a7735-5327-df75-79ac-66209dbffa37@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_092412_795975_6D9393AE 
X-CRM114-Status: UNSURE (   8.36  )
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

According to S905X2 Datasheet - Revision 07:

DMC_MON area spans 0xff638080-0xff6380c0
DDR_PLL area spans 0xff638c00-0xff638c34

Round DDR_PLL area size up to 0x40

Fixes: 90cf8e21016f ("arm64: dts: meson: Add DDR PMU node")
Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 12 ++++++------
 drivers/perf/amlogic/meson_g12_ddr_pmu.c          | 34 +++++++++++++++++-----------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index a5653ab1f0b43..1aab65bb5f578 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1585,6 +1585,12 @@ canvas: video-lut@48 {
 					compatible = "amlogic,canvas";
 					reg = <0x0 0x48 0x0 0x14>;
 				};
+
+				pmu: pmu@80 {
+					reg = <0x0 0x80 0x0 0x40>,
+					      <0x0 0xc00 0x0 0x40>;
+					interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
+				};
 			};
 
 			usb2_phy1: phy@3a000 {
@@ -1710,12 +1716,6 @@ internal_ephy: ethernet-phy@8 {
 			};
 		};
 
-		pmu: pmu@ff638000 {
-			reg = <0x0 0xff638000 0x0 0x100>,
-			      <0x0 0xff638c00 0x0 0x100>;
-			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
-		};
-
 		aobus: bus@ff800000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xff800000 0x0 0x100000>;
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
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
