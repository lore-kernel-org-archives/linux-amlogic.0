Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699E4C83F13
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Aug 2023 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/wk0PCERYTkNMJYClI5O9KQerI8VBBpiNq6MMh/Nfc=; b=XFQDuzF2S8yBWk
	6j/xR2hrGcyE0rEl3AcwnyleYZnYGKSfZqwWA4irTzLnV9zaLSWt8FAu8j8BQpDfCqry0RQi30aTU
	KCR3UhKw8S71cMDgdwhr4XJJkOoWaY0Nmhm2ySSO0KAZ5tK4U5U3E0tk5qoib40GDrjoYb7Wao20T
	8UshrL+8xlYCub1Nu7T6Vzdbk01ZdJSZ1Nwda8grc45unHDtw+pxhBRw2+Hnxyin08eZVZPFla7pk
	0RjNCln9StCRIs4ZRp2fSh9OcGM/cQtbB89+2zimjchtMom7At87aFanVme3ORIp7xZ0zSfqzXsdI
	eoiZ3CBX0rCeuHm2wcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJBe-008HKW-0L;
	Sun, 27 Aug 2023 17:04:30 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaJBZ-008HJ6-1n;
	Sun, 27 Aug 2023 17:04:27 +0000
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so37623481fa.0;
        Sun, 27 Aug 2023 10:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693155863; x=1693760663;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ERbGcMk6gfakm9DN1/j10oG7dRsa1/HJVwOkOQiUYg=;
        b=LRYEv+4B+ZUrY3Lym3JXHcFGb60uMz4HS58wfE7IZ/6dtIBbrUee0kQ6U5ED7f9Xhm
         7+Wqz9ttn1Q3sCUj2WRNneWrAWZ7d8N/f0sFQzrtj0gFoeLhnfTFno4JE3eejp9C03R5
         W9cH6PqqmpF13qDQn50n1xl0s0lYbFhZRagcC70hagK79To5qZgplz/mlf41JeTPGHZx
         LHoL01zctnNBeRco0JjMYTE7MzCZhTTH4pZp4TbDGnCYXzWaQHkfCQanLr8kjzUzwZHj
         JqfXjOcy6kyqTE9LVeZy+7YHHIjfvRSYdVlr6ADOUEZueZA0c7ZAs/F+Guhg24U4QbWE
         PczQ==
X-Gm-Message-State: AOJu0YxfPmpxcWuKUIAq1kzvS6t9XbYRixbn83dj0DLVs51Jb7ypL24n
	WJZ7wOMo+i0rM64I8ZIQ2h4=
X-Google-Smtp-Source: AGHT+IEF7d/5kTVF5MtR4cRbcAp149+5664NC2TYLcGNDPGf3jUEZ1dBbrgI5e/SqbeFgnAyHK3sug==
X-Received: by 2002:a2e:9bd8:0:b0:2b1:c1ae:73e3 with SMTP id w24-20020a2e9bd8000000b002b1c1ae73e3mr17253046ljj.15.1693155862987;
        Sun, 27 Aug 2023 10:04:22 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id a1-20020a17090640c100b0099bcf9c2ec6sm3589439ejk.75.2023.08.27.10.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 10:04:22 -0700 (PDT)
Message-ID: <70b3ba82-0920-4613-9480-919a3df6833c@linux.com>
Date: Sun, 27 Aug 2023 18:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 0/4] Add S4 SoC PLLs and Peripheral clock
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230822082750.27633-1-yu.tu@amlogic.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20230822082750.27633-1-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_100425_594733_23AAFFFE 
X-CRM114-Status: GOOD (  12.19  )
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

On 22-08-2023 09:27, Yu Tu wrote:
> 1. Add S4 SoC PLLs and Peripheral clock controller dt-bindings.
> 2. Add PLLs and Peripheral clock controller driver for S4 SOC.
> 
> 
> Yu Tu (4):
>    dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
>    dt-bindings: clock: document Amlogic S4 SoC peripherals clock
>      controller
>    clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
>    clk: meson: S4: add support for Amlogic S4 SoC peripheral clock
>      controller
> 
> V9 -> V10:
> 1. Change the relevant S4 CLK patch based on Neil's recently modified
> patch.
> 2. Change patch 0003/0004 clocks comment, format and clock flags suggested
> by Jerome.
> 
> V8 -> V9: Add patch 0001/0002 dt-bindings tag. Suggested by Krzysztof.
> V7 -> V8:
> 1. Change patch 0001/0002 dt-bindings title description, remove "meson".
> Suggested by Dmitry, Neil.
> 2. Change patch 0003/0004 clocks comment, format and clock flags suggested by
> Dmitry, Neil, Jerome.
> 
> V6 -> V7: Change send patch series as well change format and clock flags
> suggested by Jerome. Change dt-bindings suggested by Krzysztof.
> V5 -> V6: Change send patch series, as well change format and clock flags.
> V4 -> V5: change format and clock flags and adjust the patch series
> as suggested by Jerome.
> V3 -> V4: change format and clock flags.
> V2 -> V3: Use two clock controller.
> V1 -> V2: Change format as discussed in the email.
> 
> Link:https://lore.kernel.org/linux-amlogic/20230517070215.28463-1-yu.tu@amlogic.com/
> 
>   .../clock/amlogic,s4-peripherals-clkc.yaml    |   96 +
>   .../bindings/clock/amlogic,s4-pll-clkc.yaml   |   49 +
>   drivers/clk/meson/Kconfig                     |   23 +
>   drivers/clk/meson/Makefile                    |    2 +
>   drivers/clk/meson/s4-peripherals.c            | 3787 +++++++++++++++++
>   drivers/clk/meson/s4-peripherals.h            |   57 +
>   drivers/clk/meson/s4-pll.c                    |  867 ++++
>   drivers/clk/meson/s4-pll.h                    |   38 +
>   .../clock/amlogic,s4-peripherals-clkc.h       |  236 +
>   .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |   43 +
>   10 files changed, 5198 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>   create mode 100644 drivers/clk/meson/s4-peripherals.c
>   create mode 100644 drivers/clk/meson/s4-peripherals.h
>   create mode 100644 drivers/clk/meson/s4-pll.c
>   create mode 100644 drivers/clk/meson/s4-pll.h
>   create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>   create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> 
> base-commit: bd0f6c57c2b324b6f92ccfe13a8005ff829287b8
How similar is T7 and S4 regarding the clocks?
Can S4 clock driver be used by T7 without modifications?

Thanks
Lucas

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
