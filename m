Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52712C352AB
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 06:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249ED20863
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 06:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjPgVHuh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 249ED20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lrbym/2aVHnYHdzaTDthxZ8y/cOq+wgMtqjtezFCHTM=; b=XjPgVHuhlQOeD1invZWAbNdTP
	YU3iP39vq0q+OYIJxx1OG8ZNsiLrGlAs8HGqOKKh8kghp5IurrgDbiF5fJWpR7DdQXOnGn7Pg3Jey
	lRRAlxa2KVVE/XOeLqDhJYWadMae6ibZ6ENBOVM3Du7Wot+tO1TRcfs5CON29IGtZDem3tMImCm0n
	ij+fqsCfmUQtjjmpyWA8RE/wj5IgbpdixNZJuERpDXab3jeCEzxVAZ1SnxpeyT0iYcp8R1DE/eP1w
	ZEMBKZH7AQMLnRM7p9QLK1wMxyELhCSI711FEYInIIwR/tfH7vft4j66fn5Jq7q+yWsgqRPZeO0B+
	CTXQ5FPyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDjRE-0007GP-Lb; Fri, 27 Sep 2019 06:09:08 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDjQk-000778-8N; Fri, 27 Sep 2019 06:08:42 +0000
Received: from [10.28.19.114] (10.28.19.114) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 27 Sep
 2019 14:08:34 +0800
Subject: Re: [PATCH 1/2] dt-bindings: clock: meson: add A1 clock controller
 bindings
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
References: <1569411888-98116-1-git-send-email-jian.hu@amlogic.com>
 <1569411888-98116-2-git-send-email-jian.hu@amlogic.com>
 <1j4l10motk.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <d9b23872-3d6f-ddb0-d44b-174fb2984232@amlogic.com>
Date: Fri, 27 Sep 2019 14:08:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <1j4l10motk.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.19.114]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_230838_295918_E3C3B513 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: Rob Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi, Jerome

Thank you for review.

On 2019/9/25 22:29, Jerome Brunet wrote:
> On Wed 25 Sep 2019 at 19:44, Jian Hu <jian.hu@amlogic.com> wrote:
> 
> In addition to the comment expressed by Stephen on patch 2
> 
got it.
>> Add the documentation to support Amlogic A1 clock driver,
>> and add A1 clock controller bindings.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>> ---
>>   .../devicetree/bindings/clock/amlogic,a1-clkc.yaml |  65 +++++++++++++
>>   include/dt-bindings/clock/a1-clkc.h                | 102 +++++++++++++++++++++
>>   2 files changed, 167 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>   create mode 100644 include/dt-bindings/clock/a1-clkc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>> new file mode 100644
>> index 0000000..f012eb2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>> @@ -0,0 +1,65 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>> + */
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Amlogic Meson A1 Clock Control Unit Device Tree Bindings
>> +
>> +maintainers:
>> +  - Neil Armstrong <narmstrong@baylibre.com>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jian Hu <jian.hu@jian.hu.com>
>> +
>> +properties:
>> +  compatible:
>> +    - enum:
>> +        - amlogic,a1-clkc
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 3
>> +    items:
>> +      - description: peripheral registers
>> +      - description: cpu registers
>> +      - description: pll registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: peripheral
>> +      - const: pll
>> +      - const: cpu
>> +
>> +  clocks:
>> +    maxItems: 1
>> +    items:
>> +      - description: Input Oscillator (usually at 24MHz)
>> +
>> +  clock-names:
>> +    maxItems: 1
>> +    items:
>> +      - const: xtal
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +  - "#clock-cells"
>> +
>> +examples:
>> +  - |
>> +    clkc: clock-controller {
>> +        compatible = "amlogic,a1-clkc";
>> +        reg = <0x0 0xfe000800 0x0 0x100>,
>> +              <0x0 0xfe007c00 0x0 0x21c>,
>> +              <0x0 0xfd000080 0x0 0x20>;
>> +        reg-names = "peripheral", "pll", "cpu";
> 
> I'm sorry but I don't agree with this. You are trying to regroup several
> controllers into one with this, and it is not OK
> 
> By the looks of it there are 3 different controllers, including one you
> did not implement in the driver.
> 
Yes, In A1, the clock registers include three regions.

I agree with your opinion. I will implement the two clock drivers of 
peripheral and plls first in PATCH V2. And CPU clock driver will be sent 
after the patches are merged.

>> +        clocks = <&xtal;
>> +        clock-names = "xtal";
>> +        #clock-cells = <1>;
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
