Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F28C00307
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 05:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C502070C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 05:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqTqvLge"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C502070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ftr8cq9zPr+esT9+mzyQeuQO6fE9aFlJF5rdE2ZrPYk=; b=JqTqvLgeuasnLi
	oOf5Q3Ejds5Or//bTkSiv9AIfI0h2SkiwO9TJZxcFf9Gg7qOgHYEgDXjickYCbPW4PXDTRCQ1aGni
	xdh3RwVH9ctHdUWD8z5466ZXkIof7hRVBPfMkI8GqGpq/N9sPeia/Cao9xUTVnQivokW0EcvBa+c5
	a8ohpRFdb3YxeuKnnPFYzB/Ew/hfTeWk1vrm3pfOYtsOcle34I7upZf8D6PDLq1sWqoXfa4NPoVCb
	5bXT36CJCyKGwnaoQ+1Axg4PRY7XBiHNohCXO36tvKJRew0aVEfq/Z85rhn0AUUJRaAmLkkAekwTO
	hHqz14vdh+egmMSa4sdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i67GY-0004NS-5G; Fri, 06 Sep 2019 05:58:38 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i67GQ-0004IF-Of; Fri, 06 Sep 2019 05:58:32 +0000
Received: from [10.18.29.226] (10.18.29.226) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 6 Sep
 2019 13:59:06 +0800
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
From: Jianxin Pan <jianxin.pan@amlogic.com>
Message-ID: <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com>
Date: Fri, 6 Sep 2019 13:59:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.18.29.226]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_225830_807229_A3FC3879 
X-CRM114-Status: GOOD (  16.77  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Tao Zeng <tao.zeng@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

Thanks for the review, we really appreciate your time.
Please see my comments below.

On 2019/9/6 4:15, Martin Blumenstingl wrote:
> Hi Jianxin,
> 
> (it's great to see that you and your team are upstreaming this early)
> 
> On Thu, Sep 5, 2019 at 9:08 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
> [...]
>> +       memory@0 {
>> +               device_type = "memory";
>> +               reg = <0x0 0x0 0x0 0x8000000>;
>> +               /*linux,usable-memory = <0x0 0x0 0x0 0x8000000>;*/
> why do we need that comment here (I don't understand it - why doesn't
> the "reg" property cover this)?
> I replaced "linux,usable-memory" with reg, but forgot to remove this comment line. 
I will remove this line in the next version. Thank you.
>> +       };
>> +};
>> +
>> +&uart_AO_B {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> new file mode 100644
>> index 00000000..4d476ac
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +       compatible = "amlogic,a1";
>> +
>> +       interrupt-parent = <&gic>;
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       cpus {
>> +               #address-cells = <0x2>;
>> +               #size-cells = <0x0>;
> only now I notice that all our other .dtsi also use hex values
> (instead of decimal as just a few lines above) here
> do you know if there is a particular reason for this?
> 
I just copied from the previous series, and didn't notice the difference before.> [...]
>> +               uart_AO_B: serial@fe002000 {
>> +                       compatible = "amlogic,meson-gx-uart",
>> +                                    "amlogic,meson-ao-uart";
>> +                                    reg = <0x0 0xfe002000 0x0 0x18>;
> the indentation of the "reg" property is off here
OK, I will fix it.
> 
> also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
> aren't there any busses defined in the A1 SoC implementation or are
> were you planning to add them later?
>Unlike previous series,there is no Cortex-M3 AO CPU in A1, and there is no AO/EE power domain.
Most of the registers are on the apb_32b bus.  aobus, cbus and periphs are not used in A1.
> 
> Martin
> 
> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
