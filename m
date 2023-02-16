Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA191C636CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yva5KVjKqcHCb55eqGG2xZjUyAPh1EyCFcpkocVtCek=; b=iy9gTaCMruoW15
	GPajulv3DJlP/Scu+/a+2Caj+vTN1YdUO7hz2bGMwijINLOHRs+zxCp4ps3alGxyk7z5tEML4RRNy
	cJPm2jOby6TC87fW6cdjlzTuFV74UzCSsbKF2qt8XdfUKgxNDNTp7GDxheDLZpWkkjKQGkdKjh7pg
	rl6ylWt6BMU/CcGQFJ1QBq04RImCzJ6rTdfbMid7G1qpYx3peh767XlKE1SBbxXe2Ui9HvMzSWj3A
	h/140Bbn+971RE0y0KSuUgL41jIU1WMlv9FxjLgGxvSpfdE8Ps7eJ8ostS0GJT/VMmchW8+UBreuv
	yTPDm5cj1ikgtT5JPszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaPt-009Cul-UT; Thu, 16 Feb 2023 09:19:01 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSaPi-009Cp7-4U
	for linux-amlogic@lists.infradead.org; Thu, 16 Feb 2023 09:18:51 +0000
Received: by mail-ej1-x636.google.com with SMTP id he33so3515821ejc.11
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Feb 2023 01:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ns1a+ziaB8qV7FyQY4+Sg+p/ozjebr/JvYh0uNJdX9o=;
        b=u/Lq1gVCJq3B7Gfy6sHmh4krfi2milAhoL6bOlH9pZ3zE0WgtGD8cmqwxElFqWrfIx
         ft3ohfCunwzcMvZ4xTt83sKdfn+HczozJ78KCjDmMd3F4niudCDVhfvs8kRLrtqWWYtd
         ysecBjmsMZ+5h6C1PzTdOPPyZgGitRhFr06TZbc0afULUcy1h7aHRywginrTKKTbRVST
         KX25neCOx45VG93ehWDh3NsoOzWONzpqFafC98CjUw3F2UL/zO1dYIU4+AIlnIceAsk5
         dgiQei1lglvBNZR1/ufp6jMXoeKw/JVRMMp0/UDuS4/YJNn0jtqmgwUgwN8TKZd8kD0V
         pjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns1a+ziaB8qV7FyQY4+Sg+p/ozjebr/JvYh0uNJdX9o=;
        b=g3C5PCQr2l8aReuAkAsGdRu+wbUWcIolSasCireAtm3zrRyXBHeejHfdmWA3/Zv8EX
         LTuhiUEGOmAXaP4Oy/EnvO5i6v5H0GZa4nLx7ir9ZOraiPNMm1gDabR8FskMTw/zppzw
         bXA5gAf6C0xxz0E6+T9CqOmreUyeI3KCOs4xqNqB7ktyWOgNOO5RPhgKpdQAdHCb2JYJ
         FEuHaVEOyuAG2S4Q0SFXazxGE8ujrXp7Fh5zyg/YIvW22FO7HT+vL+AO35JE2dTjLE+r
         J0LLaYgfO9TqDktrA9BWt9+7dGSMvOovxj1443QOTZPTcwKCNdDvcwXiW2Dwv1bbdsT9
         Eykw==
X-Gm-Message-State: AO0yUKWxAZmodGm2wmUJ8A7Fd0jjaiw0Dsplp2uOphzsWe05QsLcPUO3
	VOntrhsBkT/Btc+pIHsCxIVJkQ==
X-Google-Smtp-Source: AK7set82c1wAvrDeb+UgjwQtg0XXg8DkrihCvBsVMrF9Z23BPbCFbBNgEEveMlwyyH02uoUFmIbcAA==
X-Received: by 2002:a17:907:3c26:b0:8aa:9841:5e29 with SMTP id gh38-20020a1709073c2600b008aa98415e29mr5012129ejc.77.1676539125143;
        Thu, 16 Feb 2023 01:18:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090622cb00b008b1569b37edsm538241eja.214.2023.02.16.01.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 01:18:44 -0800 (PST)
Message-ID: <48b4a87a-c5e9-c3ec-2492-bb2afb495398@linaro.org>
Date: Thu, 16 Feb 2023 10:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 0/3] mmc: support setting card detect interrupt from
 drivers and use it in meson-gx
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
 <CAPDyKFroB-TULOeia4OyXBW6rWMs7e3_Fp4Uw878Q8Gt=TDfag@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPDyKFroB-TULOeia4OyXBW6rWMs7e3_Fp4Uw878Q8Gt=TDfag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_011850_217013_CC9CB3F5 
X-CRM114-Status: GOOD (  12.74  )
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

On 15/02/2023 13:48, Ulf Hansson wrote:
> On Tue, 14 Feb 2023 at 22:39, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> On certain platforms like Amlogic Meson gpiod_to_irq() isn't supported
>> due to the design of gpio / interrupt controller. Therefore provide an
>> option for drivers to pass the card detect interrupt number
>> (retrieved e.g. from device tree) to mmc core.
>>
>> v2:
>> - use another mechanism for passing and storing the cd interrupt
>> - add patch 2
>>
>> Heiner Kallweit (3):
>>   mmc: core: support setting card detect interrupt from drivers
>>   dt-bindings: mmc: meson-gx: support specifying cd interrupt
>>   mmc: meson-gx: support platform interrupt as card detect interrupt
>>
>>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml      |  2 +-
>>  drivers/mmc/core/slot-gpio.c                    | 17 ++++++++++++++++-
>>  drivers/mmc/host/meson-gx-mmc.c                 |  5 ++++-
>>  include/linux/mmc/slot-gpio.h                   |  1 +
>>  4 files changed, 22 insertions(+), 3 deletions(-)
>>
> 
> Applied for next, thanks!

A bit too fast. Binding is incorrect - suggests ABI break and makes
interrupts not described enough.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
