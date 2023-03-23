Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61FCC74A5B
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 16:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HHKYX7Au3TvHEzZ1g+zi9Nh4Roc1Y0OjWsvCn+uU22k=; b=rHUxNpfV65Arwa
	a4E14q8iJXS/Q+iCOvvGnOmUFETw8Fs2n7IhE6Bi7iYmjsJwJ3nvHq88sL4xhwtiloijRGtyKsUc2
	k6oN1jVyVp8a7SAEkBY0k2CGLIyXCy6155R+4JEqbFstbG94flf1JEWAwBFzKCowO/pJqUYtm6Pw0
	8iNBIHIIWCgIUXxpqN735pdcA0A/FHHLnoJRouEQc4RtHygcnrD2wtlCnGzrBrMhIuWLPSZITkgSN
	IpNyp4Gd6wHqonBtEdDnC5VedyKELkoqsGcvJGGC9M25UuybyLmX7vNQF99OgLX1kvsTzhQRD3Piu
	IW7vA6/PpG+7jZkGycZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNYm-002RPp-1m;
	Thu, 23 Mar 2023 16:13:04 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfNYj-002ROn-00
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 16:13:02 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id A01772003EE;
	Thu, 23 Mar 2023 17:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1679587977;
	bh=VLbG9fspOvy+PMSSjyeE3WSRARPLcBD2sCiLoRTjfuI=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=J5Ms9EZv2Lr46UnjK7DNOeOgxhdvBdO7HFol5c4L/w1J/jc43tbAxs22kkPSSzjv/
	 hRx9G/RnbNXIMlLeEzJQkJegxc6C/qfajWPB+PszzTnURz+rfZeISYTVMlz4hI0fmk
	 i4MaKjrvU9SacNBmTbT2tceBNFt+E4A+AifT+tWDqLW35IPatPatgEBW/LPQ0XgzXQ
	 cGE3kY2FlrlDDWebIUGBiXQqUlDRP5Nm6t6GTrPrXbKZngduKgh5XAuah1J8V6UYjW
	 yVi/05vA4aq2KkNc/w9XdyLaZp8C8EiuE244aWp7DJZdalthMXMeeHDAjhf1Jn0Jci
	 D7OVDmKEWJcPg==
Message-ID: <3f4a7735-5327-df75-79ac-66209dbffa37@free.fr>
Date: Thu, 23 Mar 2023 17:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>,
 AML <linux-amlogic@lists.infradead.org>
Cc: Chris Healy <healych@amazon.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Pierre-Hugues Husson <phh@phh.me>,
 Rob Herring <robh+dt@kernel.org>
References: <cbfd45e3-310b-db40-d52b-daf79ce8743d@free.fr>
 <CAFBinCAdTHuN+AZKm0Yt=Gv0KgMtRruAHDgcF0qrLTZpki3JRQ@mail.gmail.com>
 <CAFBinCBb_5KChqD6wqj_MFxEH_hxL_U3nnA=+1AR8dhdQQVCzw@mail.gmail.com>
 <c3b9c231-10ef-ef69-c702-9e1052b8e704@free.fr>
 <471489bc-8683-f1ba-3f5c-5a8bf299446a@free.fr>
 <CAFBinCBD38gcR+foUUm6JBOfdpzW1Q3g3nFowxoWG1LGSc31kQ@mail.gmail.com>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH] arm64: dts: meson-g12-common: specify full DMC range
In-Reply-To: <CAFBinCBD38gcR+foUUm6JBOfdpzW1Q3g3nFowxoWG1LGSc31kQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_091301_183129_9FD528ED 
X-CRM114-Status: UNSURE (   8.24  )
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
DRAM Memory Controller (DMC) register area spans ff638000-ff63a000.

According to DeviceTree Specification - Release v0.4-rc1:
simple-bus nodes do not require reg property.

Fixes: 1499218c80c9 ("arm64: dts: move common G12A & G12B modes to meson-g12-common.dtsi")
Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 534178eaaf373..a5653ab1f0b43 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1577,10 +1577,9 @@ usb2_phy0: phy@36000 {
 
 			dmc: bus@38000 {
 				compatible = "simple-bus";
-				reg = <0x0 0x38000 0x0 0x400>;
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges = <0x0 0x0 0x0 0x38000 0x0 0x400>;
+				ranges = <0x0 0x0 0x0 0x38000 0x0 0x2000>;
 
 				canvas: video-lut@48 {
 					compatible = "amlogic,canvas";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
