Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B469DC32771
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F1ED2077B
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i/VYXNkq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F1ED2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMBAZL7MnmHOuMA9K5QKqKGXbAc+pN3zZQXMOQtLhv8=; b=i/VYXNkqKMy/Si
	aitSx0bBj36+kDGIkgCxmapkFXfZXFiP8aX9EZJxFnOTR8JLon4jQrvywoQExscKbZ/QEHkvML7of
	H4RsRhxkZKpMWkjOORWHi+3Fq6Sp91e8HMtoUxfNxg0D7FQqYF3K9XEKh6QmgnF3CgLZyUD9uHGbl
	hyFOEsaJKAxKCf5WzifUABf1Bg1eOrVDttefsj2ynJD779xjTkR/SiuMyme22Spbx637a9VW/TKp6
	1H1+KknIlMIQekPUivWAfWfgZ87OBoqrbIJiMbhGnspFNLF9OI71oCNaWRq1pQSx8ImzDkJEQYwyl
	uKw0OPmVsQsl5sw1ZF7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipWPU-0003Z2-02; Thu, 09 Jan 2020 11:55:32 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipWPQ-0003Xu-7b; Thu, 09 Jan 2020 11:55:30 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 9 Jan
 2020 19:55:50 +0800
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
 <1578537045-23260-2-git-send-email-hanjie.lin@amlogic.com>
 <f69e38e8-4f31-3297-9f21-9ceb5be27f6e@baylibre.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <5f89de05-857e-ac05-b67d-e3ab51ee5363@amlogic.com>
Date: Thu, 9 Jan 2020 19:55:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <f69e38e8-4f31-3297-9f21-9ceb5be27f6e@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_035528_269950_D43A26A4 
X-CRM114-Status: GOOD (  10.63  )
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



On 2020/1/9 17:21, Neil Armstrong wrote:
> On 09/01/2020 03:30, Hanjie Lin wrote:
>> Add the Amlogic A1 Family USB2 PHY Bindings
>>
>> It supports Host mode only.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 56 ++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>> new file mode 100644
>> index 00000000..dd2e3a6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2019 Amlogic, Inc
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-a1-usb2-phy.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Amlogic A1 USB2 PHY
>> +
>> +maintainers:
>> +  - Yue Wang <yue.wang@amlogic.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,meson-a1-usb2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xtal_usb_phy
>> +
>> +  resets:
>> +    maxItems: 1
> 
> Please use reset-names like the g12a bindings.
> 
> Neil
> 

Ok, Neil

I will revert reset-names change to keep consistence with G12A in next version.

Thanks,
Hanjie

>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  power-domains:
>> +     maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - "#phy-cells"
>> +  - power-domains
>> +
>> +examples:
>> +  - |
>> +    usb2_phy1: phy@40000 {
>> +      status = "okay";
>> +      compatible = "amlogic,a1-usb2-phy";
>> +      clocks = <&clkc_periphs 2>;
>> +      clock-names = "xtal_usb_phy";
>> +      reg = <0x0 0x40000 0x0 0x2000>;
>> +      resets = <&reset RESET_USBPHY>;
>> +      #phy-cells = <0>;
>> +      power-domains = <&pwrc PWRC_USB_ID>;
>> +    };
>>
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
