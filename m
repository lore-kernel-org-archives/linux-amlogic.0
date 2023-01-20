Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF4EC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 02:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6qFaQorV7mFsBBMlYXfhHUxGeeWGKFxCpdzNTJVSgc=; b=ZL9a2ppqaEm588
	Xryg5CXMw2tasZzW//t9FiQgoCTeWKYOOBwPP9tX0bbojehNCCY2kK1pJcbYVNhitccu3DqrhifX3
	ivU2M0eZN2Qiy8DVbBvCL+E5cqfA5A8yeqTObtes0/P75tzmZFqGkpw0C34ka8xrXEA/ifHslYx4I
	WyVU4FyzHiWM7uFSsxMzbi/G1a49v6LBYA0ghCzmVRnAs4yJNNLNCGa98YCkiSUwKtMce6W1cR4H4
	vSIdx0wrOPwyYxd0YpcdynBo6tpMBqatsbHu+A92mEnLZVDwMQnoRJ4VXZCJ0fTv/47QnScEDAakY
	vLqHlGyLo8kXKRiWiD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhC0-0084UW-Hk; Fri, 20 Jan 2023 02:31:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIhBn-0084Re-VJ; Fri, 20 Jan 2023 02:31:37 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 20 Jan
 2023 10:31:33 +0800
Message-ID: <d8e91e45-19a1-eedb-4b74-5df49b35ca0a@amlogic.com>
Date: Fri, 20 Jan 2023 10:31:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V6 0/3] Add S4 SoC PLL and Peripheral clock controller
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
	<qi.duan@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <1jilh2ydns.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jilh2ydns.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_183136_056597_62F55004 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On 2023/1/19 19:18, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> 1. Add S4 SoC PLL and Peripheral clock controller dt-bindings.
>> 2. Add PLL and Peripheral clock controller driver for S4 SOC.
>>
>> Yu Tu (3):
>>    dt-bindings: clock: document Amlogic S4 SoC PLL & peripheral clock
>>      controller
>>    clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>>    clk: meson: s4: add support for Amlogic S4 SoC peripheral clock
>>      controller
> 
> You are adding 2 controller driver with this series.
> Making 2 driver patches on clk/ is good. Please do the same for the bindings
> 
okay.I will change the next edition as you suggest.

Please check Krzysztof's opinion. Do you agree? Thank you!

>>
>> V5 -> V6: Change send patch series, as well change format and clock flags.
>> V4 -> V5: change format and clock flags and adjust the patch series as suggested
>> by Jerome.
>> V3 -> V4: change format and clock flags.
>> V2 -> V3: Use two clock controller.
>> V1 -> V2: Change format as discussed in the email.
>>
>> Link:https://lore.kernel.org/all/20221123021346.18136-1-yu.tu@amlogic.com/
>>
>>   .../clock/amlogic,s4-peripherals-clkc.yaml    |  104 +
>>   .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   50 +
>>   MAINTAINERS                                   |    1 +
>>   drivers/clk/meson/Kconfig                     |   25 +
>>   drivers/clk/meson/Makefile                    |    2 +
>>   drivers/clk/meson/s4-peripherals.c            | 3874 +++++++++++++++++
>>   drivers/clk/meson/s4-peripherals.h            |  218 +
>>   drivers/clk/meson/s4-pll.c                    |  875 ++++
>>   drivers/clk/meson/s4-pll.h                    |   88 +
>>   .../clock/amlogic,s4-peripherals-clkc.h       |  131 +
>>   .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   30 +
>>   11 files changed, 5398 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>   create mode 100644 drivers/clk/meson/s4-peripherals.c
>>   create mode 100644 drivers/clk/meson/s4-peripherals.h
>>   create mode 100644 drivers/clk/meson/s4-pll.c
>>   create mode 100644 drivers/clk/meson/s4-pll.h
>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>
>>
>> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
