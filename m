Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E3DC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 14:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlHCFnZPbbsxQe+O6iOUzt/gj6ddTzK8QsKfJnKcNJk=; b=kEoq4YfNr/ce5V
	rrWmJk4pKDWpT41b9qVJVmKktGYvQVu5qsGaSb8Jk1NfD03dt7vmdUYAP8vIf84ahJy2OQuCbvS0E
	8vN8e6QGqgqUtK0C20GJ/0tmY2CiMtMfnlsPaG+kYrTUUvwR3XE71g8IFQQqgdmcTaX5sWWfwRvwA
	Zfdq5TyVDDLxFE6UzMO7NHg7ygTmLOg9WZozhvI0xynHA189bEDQ/AP58S9x2auC70z69Fe84qa/w
	3qiViM8p3ltTon9DZVkgCNHL+OAkrQzV7fsoF0Jtfm7SgVTBvUM/kS13nuZTZReHL+bsHVTM5+bfJ
	bh2lVEG+z2r5U7644yJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnYE-00BE7p-2n;
	Mon, 27 Mar 2023 14:10:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgnY9-00BE5b-2u
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 14:10:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so5407061wms.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Mar 2023 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679926214;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVlIe/RgdhwWumjRHCwBYuMjJV3egIYQrdrj1qprP/0=;
        b=MfGvpI6CNgREzd3FpwD44ac3g0urXBQcIr/jfzJgvkLVOrj5OY8LvP2WYnjW2Xd6ql
         y4lR0WO8eFmfoumUCMf8+itWPii9nUo2Bd8f7k2lQph5CqvxmA6ndj2aw2W9+9P2BuRV
         jeA/LEz2R+4QURvHaajRhx/sb8LbscGdvo1AU6C2pHrDgay4GgCFw0yDPiTgTmAkzX9+
         ZZIwaLbntgdqMJVHWuRwjSdBb4QdlQxGwK2fqwaVhvkZlbhMrvY24L2gvuhf52sU5aTM
         S/BTcl5tUvkNWfDqAH/LUBgNrKGKXJZS/Aqf3C9phy4mTj4qdppnXdjNMrTme2OuRvTO
         iYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926214;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVlIe/RgdhwWumjRHCwBYuMjJV3egIYQrdrj1qprP/0=;
        b=XP9U2a0rYwtIeK5El62zbbUcXOgsdsiZwbGgHsyguFu5ngIoIzt+XOzFOmdU0W8m63
         0aphCY8604HaPavdHluySLa8u1YqykpxtVFXJdVXC2MlZz6C8Pk3EBc8zYzmbo6UdUxz
         lVhqJaN2J+h1wz9PId2nMLsyx5xjA6aU/cdlln+CHTcT5rI5/qEeu1PFwvYp4yPAor08
         TtD763LFS8Y/UvvE4MERsF5R3jMCw/DUJ7PqrrBbHIzMWS0NVLHLzy87esDOhZf/6nfO
         BFueoDFUque0oyUovMV3XTheDnyhDEhQJL8cDK9JGOeAfg87ux4DyGqeLY/3JH2cWC7o
         3dZQ==
X-Gm-Message-State: AO0yUKX5Cgxaso9VDDyTUgwQEWe+lNb/vsJwQKor9eVXmR8KgaAvPhVy
	kaiJiohIn/Eqd96myvEaTgVByA==
X-Google-Smtp-Source: AK7set/aY05hvbiA8KMzWBPj0eKSUapzbpCUsTazqbkJwnY7zYE8nWiRLrnNjGBX/wUBUVVHowIx3Q==
X-Received: by 2002:a05:600c:3642:b0:3e2:1d1e:78d6 with SMTP id y2-20020a05600c364200b003e21d1e78d6mr9400422wmq.7.1679926213866;
        Mon, 27 Mar 2023 07:10:13 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m5-20020a7bce05000000b003edff838723sm13886159wmc.3.2023.03.27.07.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 07:10:13 -0700 (PDT)
References: <20230321193014.26349-1-ddrokosov@sberdevices.ru>
 <20230321193014.26349-4-ddrokosov@sberdevices.ru>
 <1jmt3yo5r0.fsf@starbuckisacylon.baylibre.com>
 <20230327105115.ury3w4xpzhcpnqjg@CAB-WSD-L081021>
 <1jilemo1r9.fsf@starbuckisacylon.baylibre.com>
 <1f68ff4f-46ab-7d9e-fa57-bb94beb4c691@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Rokosov
 <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Date: Mon, 27 Mar 2023 15:59:02 +0200
In-reply-to: <1f68ff4f-46ab-7d9e-fa57-bb94beb4c691@linaro.org>
Message-ID: <1ja5zynv3v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_071018_181783_ABFF7722 
X-CRM114-Status: GOOD (  22.56  )
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


On Mon 27 Mar 2023 at 15:41, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 27/03/2023 13:39, Jerome Brunet wrote:
>> 
>> On Mon 27 Mar 2023 at 13:51, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>> 
>>> On Mon, Mar 27, 2023 at 11:51:21AM +0200, Jerome Brunet wrote:
>>>>
>>>> On Tue 21 Mar 2023 at 22:30, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:
>>>>
>>>>> Add the documentation for Amlogic A1 PLL and Amlogic A1 Peripherals
>>>>> clock drivers.
>>>>> Introduce Amlogic A1 PLL and Amlogic A1 Peripherals device tree
>>>>> bindings and include them to MAINTAINERS.
>>>>>
>>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>>> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>>>> ---
>>>>>  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++
>>>>>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |  59 +++++++++
>>>>>  MAINTAINERS                                   |   1 +
>>>>>  include/dt-bindings/clock/amlogic,a1-clkc.h   | 113 ++++++++++++++++++
>>>>>  .../dt-bindings/clock/amlogic,a1-pll-clkc.h   |  21 ++++
>>>>>  5 files changed, 267 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>>>>>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>>>>
>>>> There is two drivers (and 2 independent patches). There should be 2
>>>> bindings patches as well.
>>>>
>>>
>>> Before, in previous versions I had two versions, but it wasn't bisectable
>>> approach.
>> 
>> You are confusing bisectable and Rob's robot. Splitting patches is more
>> that likely to help bisect (and patches backport) - not the other way around.
>
> No, he did not confuse. Splitting patches makes the series
> non-bisectable which was visible in the past.
>
> What's more, there is no reason to have bindings patches split just
> because you split drivers. Bindings are independent of drivers - we
> write them for hardware description.

Patches should do one thing, my comment is a simple application of that.

There no reason to have a single patch provide the bindings for 2
independent pieces of HW, which those components are. If a dependency
has been set, it is one that should not be there.

They do provide inputs to one another, yes but remain independent pieces of
HW. They have a different address space and as a consequences, different
drivers

If we were being strict, it should even be seperate series.

>
>> 
>>> a1-clkc schema depends on a1-pll-clkc headers and vice versa.
>>> It means dt schemas checkers will show us failure if we split them into two
>>> patchsets.
>> 
>> Only because you are patches are not upstream yet ...
>> 
>>> I know, that we can use raw digits instead of CLKID names, but IMO it doesn't
>>> look like production schema and it requires one more patchset above the
>>> series with proper CLKID definitons usage and proper header including.
>>>
>>> BTW, there is an example of Rob's test bot failure found in the previous
>>> v10 patch series due to chicken or the egg problem.
>>> https://lore.kernel.org/all/167769997208.7087.5344356236212731922.robh@kernel.org/
>>>
>>> Please advise what's the best practice to resolve that..
>> 
>> Don't use the header in your example would solve the problem and
>> still be correct DT wise.
>> 
>> The examples are just examples, they are not required to actually
>> matches a real HW, as far as I know.
>
> Yes, that would work... or just keep them here.
>
>
> Best regards,
> Krzysztof
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
