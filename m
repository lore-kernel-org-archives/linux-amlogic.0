Return-Path: <SRS0=QOxW=ZR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A468C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 07:52:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CDDF2071A
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Nov 2019 07:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSzfyFji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CDDF2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ObjXEgtqQZYp6bQF+epGKWWaw/hj0ls1yXvUo2VXac=; b=cSzfyFjiesZun+
	YJ2hxuyEz5YqthciA0LYsgptR1mkmfle6qPc/khegFZZRqMWrOg7UpzJZ315SqOXzIwnupBXhNkBh
	DiuJ7F9ARyNChdVywEcZIUv0UsutZtGJlzI2rUrA6D3wg1QyG3Ll0Da3waSc0zDqsXyn/PEq/epiF
	yOpNFOETaEBF9Nnosy9oZFgzn4LAnEtAsL3R0kpa7RKb4f77UZ1Iff5w9l6p615zyltVQYuayktKM
	XD/OJEn0U489/wEbCr1ILqIEE7Um9kdJyJUrK+eYcEgcbjgBuWQCYG/hXyghvyoHbbtcaW+882bGu
	ZQszpdg0I15PHC3VCnYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ9AH-0008WN-0L; Mon, 25 Nov 2019 07:52:09 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ9AC-0008VA-Kz; Mon, 25 Nov 2019 07:52:07 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 25 Nov
 2019 15:52:19 +0800
Subject: Re: [PATCH 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <1574405757-76184-3-git-send-email-hanjie.lin@amlogic.com>
 <462c13a6-a2ea-44c7-d43d-46ac82d43bf7@baylibre.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <5357b6c2-e10b-71a3-1e1b-2b641cf5e2df@amlogic.com>
Date: Mon, 25 Nov 2019 15:52:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <462c13a6-a2ea-44c7-d43d-46ac82d43bf7@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_235204_704999_982084D1 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: devicetree@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liang Yang <liang.yang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jian Hu <jian.hu@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/11/22 16:52, Neil Armstrong wrote:
> Hi,
> 
> 
> On 22/11/2019 07:55, Hanjie Lin wrote:
>> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>>  - a DWC3 IP configured as Host for USB2 and USB3
>>
>> A glue connects the controllers to the USB2 PHY of A1 SoC.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../devicetree/bindings/usb/amlogic,dwc3.txt       | 53 ++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> index 6ffb09b..63dc60b 100644
>> --- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
>> @@ -128,3 +128,56 @@ Example device nodes:
>>  				snps,quirk-frame-length-adjustment;
>>  			};
>>  	};
>> +
>> +Amlogic Meson A1 DWC3 USB SoC Controller Glue
>> +
>> +The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
>> +host-only mode.
>> +
>> +Required properties:
>> +- compatible:	Should be "amlogic,meson-a1-usb-ctrl"
>> +- clocks:       The clocks needed by the usb controller
>> +- clock-names:  Should contain the name of the clocks: "usb_ctrl", "usb_bus",
>> +                "xtal_usb_phy", "xtal_usb_ctrl"
>> +- resets:	a handle for the shared "USB" reset line
>> +- reg:		The base address and length of the registers
>> +- phys: 	handle to used PHYs on the system
>> +	- a <0> phandle can be used if a PHY is not used
>> +- phy-names:	names of the used PHYs on the system :
>> +	- "usb2-phy0" for USB2 PHY if USBHOST port is used
>> +
>> +Required child nodes:
>> +
>> +A child node must exist to represent the core DWC3 IP block. The name of
>> +the node is not important. The content of the node is defined in dwc3.txt.
>> +
>> +PHY documentation is provided in the following places:
>> +- Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>> +
>> +Example device nodes:
>> +	usb: usb@ffe09000 {
>> +			status = "okay";
>> +			compatible = "amlogic,meson-a1-usb-ctrl";
>> +			reg = <0x0 0xffe09000 0x0 0xa0>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>> +			clocks = <&clkc_periphs CLKID_USB_CTRL>,
>> +				 <&clkc_periphs CLKID_USB_BUS>,
>> +				 <&clkc_periphs CLKID_XTAL_USB_PHY>,
>> +				 <&clkc_periphs CLKID_XTAL_USB_CTRL>;
>> +			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
>> +			resets = <&reset RESET_USBCTRL>;
>> +			phys = <&usb2_phy0>;
>> +			phy-names = "usb2-phy0";
>> +
>> +			dwc3: usb@ff400000 {
>> +					compatible = "snps,dwc3";
>> +					reg = <0x0 0xff400000 0x0 0x100000>;
>> +					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>> +					dr_mode = "host";
>> +					snps,dis_u2_susphy_quirk;
>> +					snps,quirk-frame-length-adjustment = <0x20>;
>> +			};
>> +	};
>>
> 
> This seems very similar to the g12a bindings, seems you could update the yaml g12a bindings
> with specific clocks and required for amlogic,meson-a1-usb-ctrl.
> 
> Neil
> 
> .
> 

Hi Neil
Thanks for the comment.

1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
   A1 has one usb2-phy0 phy and only support host mode.
   
2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
   G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
   G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
   G12A glue driver has a hard coding support phys while A1 only supports host mode.
   	enum {
		USB2_HOST_PHY = 0,
		USB2_OTG_PHY,
		USB3_HOST_PHY,
		PHY_COUNT,
		};
   G12A glue driver only supports one clock while A1 needs four clocks.
   G12A and A1 phy drivers have different register configurations since hardware differences.
   
3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
   driver for A1 SoCs, so also dedicated dt-bindings.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
