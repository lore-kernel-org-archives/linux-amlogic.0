Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F235C19F21
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unNfrmZoKKuoHTMS5Au5PqGoTuIRHdpQ6JOfHfwex0c=; b=GlqXp1ArVrmZ4Q
	RoACJtMkqHNaXvZ2IeuZGEeOVVcuOHg1rFQZdhaYP98b0I5PqITsbgs+CKDWdJdw118VHDw/xfTTM
	QVPTcOUDp3msX4hl0uTmtvaxeZXkgdBYuZyaWq2pJOBAegLBlBM0jU/JFhkvCun333B24tyF9+R/G
	VyVHyfR/rJGevFQzPxfUglgWiCVu8uXUjYWptXUSPfug0qOEIjbHkoXYqJokNvNFnwcM7ZoQZLryk
	IfNqbw02PZ8MMhWaCPp4gnbvhUeIXLwPOudPF9n4tywAKrhcKgiSWXSV360HpBaleo4z3AYvDxKy5
	SqtnIKdLMUw3C5L+WGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzNU-00625R-6V; Thu, 28 Jul 2022 09:00:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGzNF-0061vq-Kh
	for linux-amlogic@lists.infradead.org; Thu, 28 Jul 2022 09:00:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id i8so1311734wro.11
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Jul 2022 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=r0KkVkVfudOsZa8bt775hkQQT4bXWpl6svhyGVd6ieQ=;
        b=KA2+5rXbBP1kJXeW6hiBXH2pt90gqNXRRgOvI9OI4R4XpmjEaLf1UIiUGZyGlOxFHC
         ykYgfhTnrP+POspD23CY/8v9+X5DsIrqFYaRgocVqdCuB5PMK30TxTNWlnsBNrR8Fank
         ragjMrJgixERVOzTdYl1vzqJHh/eAYZtDZScJ/nKWzR1FObowBVnVPGrXruSlc/bjvqk
         BdHd48UjYmjvkbYL4wG52xrLfmK0zE+IupWNAU/TK4zqXTdUcv2OSQKwTjP8kCljGM11
         /FXwhX5sr/1imuYz7tqOErnW+wJY4f6z3OpQRPzEFDa229eSksGSQ2K87rJflO6gQNJi
         V56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=r0KkVkVfudOsZa8bt775hkQQT4bXWpl6svhyGVd6ieQ=;
        b=mhqmymp7EsJuKLwnhC/uX2drG0KrNtu75rO8X+S+II8FrfFkrl8EL4acMhz85HC9be
         eyPIMtvkP9vfpoIa2lV+KLcULzu2ZYR3hO8tglYwWo4vpqg0yz4wrGyvAwdl8lxyitfB
         dcaDOlBIwkIFiaIYeS0HyDcWQBQiMjBw/4Z70QdW88P16rVT37GKRqrdMlm+gxF6LWje
         JvMO/50xXczorZESPQXWp8D31VlMxbpGzrI6cjeJ34gNwdfpTb1LFqeuWvLn/OfyANo2
         E4TyQ/cLQsn2Gq8P1j0Kpc+dl2WwZkYRKwTURxDDEN6/arHTan4oIQBhOjtYMgmumzpt
         Oiew==
X-Gm-Message-State: AJIora+zXnE/BX67GbAWJTYAXfoH3VdTAQAAt+LveF27CS0MnQTVYbew
	neBOGlWp2ikNTL2IB8EnEj+ocA==
X-Google-Smtp-Source: AGRyM1vJ9qug6pEGy6DgN4WD7c36nLypVRFi2FQDF34WxBfiQss+w86zHbsxaCj2bnKZVMdA3qxhgw==
X-Received: by 2002:adf:ecc5:0:b0:21e:b73f:e33d with SMTP id s5-20020adfecc5000000b0021eb73fe33dmr6349761wro.223.1658998800870;
        Thu, 28 Jul 2022 02:00:00 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y14-20020adffa4e000000b0021eb309c97dsm398706wrr.25.2022.07.28.02.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 02:00:00 -0700 (PDT)
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
User-agent: mu4e 1.8.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yu Tu
 <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
Date: Thu, 28 Jul 2022 10:50:50 +0200
In-reply-to: <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
Message-ID: <1jv8rhfw8h.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_020005_690657_31E2C80A 
X-CRM114-Status: GOOD (  11.61  )
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


On Thu 28 Jul 2022 at 10:41, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 28/07/2022 07:42, Yu Tu wrote:
>> Add new clock controller compatible and dt-bindings header for the
>> Everything-Else domain of the S4 SoC.
>> 
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>
>
>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c1abc53f9e91..f872d0c0c253 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>  F:	drivers/clk/meson/
>>  F:	include/dt-bindings/clock/gxbb*
>>  F:	include/dt-bindings/clock/meson*
>> +F:	include/dt-bindings/clock/s4-clkc.h
>>  
>>  ARM/Amlogic Meson SoC Crypto Drivers
>>  M:	Corentin Labbe <clabbe@baylibre.com>
>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>> new file mode 100644
>> index 000000000000..b686c8877419
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/s4-clkc.h
>
> Filename with vendor prefix, so:
> amlogic,s4-clkc.h
>
>> @@ -0,0 +1,146 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>> + * Author: Yu Tu <yu.tu@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLOCK_S4_CLKC_H
>> +#define _DT_BINDINGS_CLOCK_S4_CLKC_H
>> +
>> +/*
>> + * CLKID index values
>> + */
>> +
>> +#define CLKID_FIXED_PLL			1
>> +#define CLKID_FCLK_DIV2			3
>> +#define CLKID_FCLK_DIV3			5
>> +#define CLKID_FCLK_DIV4			7
>> +#define CLKID_FCLK_DIV5			9
>> +#define CLKID_FCLK_DIV7			11
>
> Why these aren't continuous? IDs are expected to be incremented by 1.
>

All clocks have IDs, it is one big table in the driver, but we are not exposing them all.
For example, with composite 'mux / div / gate' assembly, we usually need
only the leaf.

Same has been done for the other AML controllers:
For ex:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/dt-bindings/clock/gxbb-clkc.h

>> +
>> +#endif /* _DT_BINDINGS_CLOCK_S4_CLKC_H */
>
>
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
