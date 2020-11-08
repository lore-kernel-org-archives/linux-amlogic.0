Return-Path: <SRS0=B07/=EO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886C4C4741F
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 13:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACC2222244
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Nov 2020 13:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W4vAzvAF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7O5RXI+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACC2222244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bd9mGQhbNy/llV7G6RKQgONtG7Usb3HdH0HjK/SU/Ww=; b=W4vAzvAFr9tvLVa2OSWLsqXuI
	8DdaoycCVYDGkfDS1JLGhAcdERxYEBLvUTSrTWrNkoti/Sgc2ChWs96NxDnJ6me4wG363z7VEzLMo
	qJqfqOvK3Y5sZtdt2LfvIS3sCXu1uB3lr0hDj1eJcXC02XXxwNahSyD9b76oJxPOwNcDgPKvhpdle
	ROtVWBVAmM4zg9DCpZOwkpICUpWM8mep0beWH7MtvO1RS/UpFZGiErzLF7tKCNK6pF4XbQ2y8zGCa
	gFjd4xrr8aA0LuTV/txydnLx1v/9BKvLpu/U3NhjU+o6bCLbacHT2lFcuirU0csVnwhzk0LIRKs02
	EYHRBs/5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbkWW-0006n4-FK; Sun, 08 Nov 2020 13:14:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbkWU-0006mZ-LB; Sun, 08 Nov 2020 13:14:23 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48823206ED;
 Sun,  8 Nov 2020 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604841256;
 bh=ACYX+dzqwM+pqodv+7eTSQQ2v0JAOW2m9T80x7FTPzM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L7O5RXI+yzbk9LJKFBokN0v+ZLqHuE7BSPzd/SEoYkJL2mr6e+0/xOPHnkYQo25O3
 /UDhFntFg3btGKPdbvIgZ7uts47RwM5PImyTFkgAyYN0xww3jegvoMHNo684oXWm0N
 S8mMTnROEGw5L21GeHKLPP2Lh0iAleDFd7FcqgyY=
Date: Sun, 8 Nov 2020 08:14:15 -0500
From: Sasha Levin <sashal@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH AUTOSEL 5.9 02/35] arm64: dts: meson-axg: add USB nodes
Message-ID: <20201108131415.GO2092@sasha-vm>
References: <20201103011840.182814-1-sashal@kernel.org>
 <20201103011840.182814-2-sashal@kernel.org>
 <d3ef0d93-a95b-2109-ef6b-3d70ce3b9cc3@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3ef0d93-a95b-2109-ef6b-3d70ce3b9cc3@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_081422_900995_4810A589 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Nov 03, 2020 at 09:55:45AM +0100, Neil Armstrong wrote:
>On 03/11/2020 02:18, Sasha Levin wrote:
>> From: Neil Armstrong <narmstrong@baylibre.com>
>>
>> [ Upstream commit 1b208bab34dc3f4ef8f408105017d4a7b72b2a2f ]
>>
>> This adds the USB Glue node, with the USB2 & USB3 controllers along the single
>> USB2 PHY node.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 50 ++++++++++++++++++++++
>>  1 file changed, 50 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> index b9efc8469265d..fae48efae83e9 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
>> @@ -171,6 +171,46 @@ soc {
>>  		#size-cells = <2>;
>>  		ranges;
>>
>> +		usb: usb@ffe09080 {
>> +			compatible = "amlogic,meson-axg-usb-ctrl";
>> +			reg = <0x0 0xffe09080 0x0 0x20>;
>> +			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1_DDR_BRIDGE>;
>> +			clock-names = "usb_ctrl", "ddr";
>> +			resets = <&reset RESET_USB_OTG>;
>> +
>> +			dr_mode = "otg";
>> +
>> +			phys = <&usb2_phy1>;
>> +			phy-names = "usb2-phy1";
>> +
>> +			dwc2: usb@ff400000 {
>> +				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
>> +				reg = <0x0 0xff400000 0x0 0x40000>;
>> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&clkc CLKID_USB1>;
>> +				clock-names = "otg";
>> +				phys = <&usb2_phy1>;
>> +				dr_mode = "peripheral";
>> +				g-rx-fifo-size = <192>;
>> +				g-np-tx-fifo-size = <128>;
>> +				g-tx-fifo-size = <128 128 16 16 16>;
>> +			};
>> +
>> +			dwc3: usb@ff500000 {
>> +				compatible = "snps,dwc3";
>> +				reg = <0x0 0xff500000 0x0 0x100000>;
>> +				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
>> +				dr_mode = "host";
>> +				maximum-speed = "high-speed";
>> +				snps,dis_u2_susphy_quirk;
>> +			};
>> +		};
>> +
>>  		ethmac: ethernet@ff3f0000 {
>>  			compatible = "amlogic,meson-axg-dwmac",
>>  				     "snps,dwmac-3.70a",
>> @@ -1734,6 +1774,16 @@ sd_emmc_c: mmc@7000 {
>>  				clock-names = "core", "clkin0", "clkin1";
>>  				resets = <&reset RESET_SD_EMMC_C>;
>>  			};
>> +
>> +			usb2_phy1: phy@9020 {
>> +				compatible = "amlogic,meson-gxl-usb2-phy";
>> +				#phy-cells = <0>;
>> +				reg = <0x0 0x9020 0x0 0x20>;
>> +				clocks = <&clkc CLKID_USB>;
>> +				clock-names = "phy";
>> +				resets = <&reset RESET_USB_OTG>;
>> +				reset-names = "phy";
>> +			};
>>  		};
>>
>>  		sram: sram@fffc0000 {
>>
>
>Hi Sasha,
>
>This needs also support in the dwc3-meson-g12a driver, you can drop it from backport.

Dropped, thanks!

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
