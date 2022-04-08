Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C447C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Apr 2022 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tv6/bqzusgodkOOIR1tx05nQayNAcRcQiGDfu4Ix79c=; b=GMiaCKniFNxwQT
	SxGR+OIcxROu7dB1sVBKTiZUBdAvmmt8z5yljgsXkDCa/LRucUV9lcHCrR366SreeHhUlbw9X3i2p
	DdxEu3b6mnGGkxUBN+WJ6oWbguV+1j+mzUq7g3ezC5PZZFSBLxw8SCmGVNZ2zax21pYs/7aKJyfPD
	Obe9Nko/SjZawjxmBikdrbGhDvlxOmcEsY37tdgcdv48PkQDUWcEru7VtC/Gso/CeiJtTYdMcJMSf
	laveLrtiIxbqGgl/oCPZuuM6/jbaCAxWKEqtZWpqKCKuGQioxvmebfsoXBF7DOn+yz2KZAzYshSu0
	j0Zptn+6aQTB1IRYs+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncivo-00FUhU-KG; Fri, 08 Apr 2022 07:21:20 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncivM-00FUVh-Qb; Fri, 08 Apr 2022 07:20:54 +0000
Received: from [10.98.9.35] (10.98.9.35) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 8 Apr
 2022 15:20:49 +0800
Message-ID: <bb567acf-e009-8dad-1022-9b39a6506912@amlogic.com>
Date: Fri, 8 Apr 2022 15:17:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V4] arm64: dts: add support for S4 based Amlogic AQ222
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
CC: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220106112214.6987-1-xianwei.zhao@amlogic.com>
 <CAL_JsqJs=zLegXz_oDqYFebJReCSnbHPWcPDD6rFv9SpSMmjAQ@mail.gmail.com>
From: xianwei.zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAL_JsqJs=zLegXz_oDqYFebJReCSnbHPWcPDD6rFv9SpSMmjAQ@mail.gmail.com>
X-Originating-IP: [10.98.9.35]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_002052_904569_9D2DE17B 
X-CRM114-Status: GOOD (  15.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob,
	Thanks for your advice.

On 2022/4/8 04:53, Rob Herring wrote:
> 
> On Thu, Jan 6, 2022 at 5:22 AM Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>
>> Add basic support for the Amlogic S4 based Amlogic AQ222 board:
>> which describe components as follows: CPU, GIC, IRQ, Timer, UART.
>> It's capable of booting up into the serial console.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>> V3 -> V4: cleaned up coding style.
>> V2 -> V3: add of dts board  compatible family.
>> V1 -> V2: cleaned up coding style, modify CPU affinity of timer interrups,
>>            and modify GIC reg defintions.
>> ---
>>   arch/arm64/boot/dts/amlogic/Makefile          |  1 +
>>   .../dts/amlogic/meson-s4-s805x2-aq222.dts     | 30 ++++++
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 99 +++++++++++++++++++
>>   3 files changed, 130 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index 5148cd9e5146..faea74a45994 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -57,3 +57,4 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> new file mode 100644
>> index 000000000000..a942d7e06d6e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "meson-s4.dtsi"
>> +
>> +/ {
>> +       model = "Amlogic Meson S4 AQ222 Development Board";
>> +       compatible = "amlogic,aq222", "amlogic,s4";
>> +       interrupt-parent = <&gic>;
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       aliases {
>> +               serial0 = &uart_B;
>> +       };
>> +
>> +       memory@00000000 {
>> +               device_type = "memory";
>> +               reg = <0x0 0x0 0x0 0x40000000>;
>> +       };
>> +
>> +};
>> +
>> +&uart_B {
>> +       status = "okay";
>> +};
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> new file mode 100644
>> index 000000000000..bf9ae1e1016b
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -0,0 +1,99 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +       cpus {
>> +               #address-cells = <2>;
>> +               #size-cells = <0>;
>> +
>> +               cpu0: cpu@0 {
>> +                       device_type = "cpu";
>> +                       compatible = "arm,cortex-a35","arm,armv8";
> 
> I see this is already applied, but 'arm,armv8' is only valid for s/w
> models. Please send a fix.
I will fix it later.
> 
> Rob
> 
> .
Thanks!

Best regards,

Xianwei Zhao

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
