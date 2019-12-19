Return-Path: <SRS0=7hc/=2J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E269AC43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Dec 2019 08:38:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B396924650
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Dec 2019 08:38:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PreMIsF8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B396924650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5/lXR1/uGwBZq1DTsN+VLMmjh+V7mcohZkZeaNDiJQ=; b=PreMIsF8HaK4Fy
	7L3rrPZ4joeVubAO8yKbbY59j8wHzp7dLPm4LUhebhGv2PpTgJaeTCzNRhTZahiJwQhbTu/jRatw1
	6p/whWi6oIq73ZVgt3BLmFu7Dfbok82Iqyi7qALB5YKL/bdUnwHnJAmteb2C7lcpv6X0AxVp3KNqB
	7H0i3SHmy3Q9cOuSa2jnJWX6J/wpz/h6J8TJ28TQyCADo3CVKmgVTWZ8A1VsQJbzSfWPV+3qYEHD4
	TvsNBzMv6/ojelKCZAkTHTeTZmOWgRclQBzTf8YCBR+DSn1iNK7YNf/JILD/QZ2GNqyz4Q+vXFZVp
	xtRS3VfaeRkj+SMwkg+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihrJw-0006d7-1G; Thu, 19 Dec 2019 08:38:08 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihrJt-0006bv-9l; Thu, 19 Dec 2019 08:38:06 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 19 Dec
 2019 16:38:33 +0800
Subject: Re: [PATCH v2 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <1576636944-196192-1-git-send-email-hanjie.lin@amlogic.com>
 <1576636944-196192-3-git-send-email-hanjie.lin@amlogic.com>
 <daa67976-e2ad-e114-b5fd-87eb5ae00eeb@baylibre.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <c159449b-f266-2b90-fd1b-fc8988bef9e6@amlogic.com>
Date: Thu, 19 Dec 2019 16:38:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <daa67976-e2ad-e114-b5fd-87eb5ae00eeb@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_003805_340561_B5AFEF29 
X-CRM114-Status: GOOD (  14.64  )
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



On 2019/12/18 21:13, Neil Armstrong wrote:
> Hi,
> 
> On 18/12/2019 03:42, Hanjie Lin wrote:
>> The Amlogic A1 SoC Family embeds 1 USB Controllers:
>>  - a DWC3 IP configured as Host for USB2 and USB3
>>
>> A glue connects the controllers to the USB2 PHY of A1 SoC.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  | 32 ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>> index 4efb77b..9740027 100644
>> --- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>> +++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
>> @@ -9,6 +9,8 @@ title: Amlogic Meson G12A DWC3 USB SoC Controller Glue
>>  
>>  maintainers:
>>    - Neil Armstrong <narmstrong@baylibre.com>
>> +  - Hanjie Lin <hanjie.lin@amlogic.com>
>> +  - Yue Wang <yue.wang@amlogic.com>
>>  
>>  description: |
>>    The Amlogic G12A embeds a DWC3 USB IP Core configured for USB2 and USB3
>> @@ -22,10 +24,14 @@ description: |
>>    The DWC3 Glue controls the PHY routing and power, an interrupt line is
>>    connected to the Glue to serve as OTG ID change detection.
>>  
>> +  The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
>> +  host-only mode.
>> +
>>  properties:
>>    compatible:
>>      enum:
>>        - amlogic,meson-g12a-usb-ctrl
>> +      - amlogic,meson-a1-usb-ctrl
>>  
>>    ranges: true
>>  
>> @@ -124,4 +130,30 @@ examples:
>>                snps,quirk-frame-length-adjustment;
>>            };
>>      };
>> +  - |
>> +    usb: usb@ffe09000 {
>> +          status = "okay";
>> +          compatible = "amlogic,meson-a1-usb-ctrl";
>> +          reg = <0x0 0xffe09000 0x0 0xa0>;
>> +          #address-cells = <2>;
>> +          #size-cells = <2>;
>> +          ranges;
>>  
>> +          clocks = <&clkc_periphs CLKID_USB_CTRL>,
>> +           <&clkc_periphs CLKID_USB_BUS>,
>> +           <&clkc_periphs CLKID_XTAL_USB_PHY>,
>> +           <&clkc_periphs CLKID_XTAL_USB_CTRL>;
>> +          clock-names = "usb_ctrl", "usb_bus", "xtal_usb_phy", "xtal_usb_ctrl";
>> +          resets = <&reset RESET_USBCTRL>;
>> +          phys = <&usb2_phy0>;
>> +          phy-names = "usb2-phy0";
>> +
>> +          dwc3: usb@ff400000 {
>> +                  compatible = "snps,dwc3";
>> +                  reg = <0x0 0xff400000 0x0 0x100000>;
>> +                  interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
>> +                  dr_mode = "host";
>> +                  snps,dis_u2_susphy_quirk;
>> +                  snps,quirk-frame-length-adjustment = <0x20>;
>> +          };
>> +  };
>>
> 
> I doubt this passed the dt_binding_check !
> 
> 
> Please add the clock-names only for amlogic,meson-a1-usb-ctrl,
> set the phys maxItems to 1 for amlogic,meson-a1-usb-ctrl,
> and set dr_mode as host in the example or make it required only
> for amlogic,meson-g12a-usb-ctrl.
> 
> Neil
> 
> .
> 

Hi Neil,

It does report errors by dt_binding_check, I will check the list again.

Thanks

Hanjie.lin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
