Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E9DC433E3
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 15:42:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2322A206D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 15:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BFRMWgb4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s8CpAaxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2322A206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E4eh82q+xsb3n6GXf+atFtwaG9A5sSuaWr79OcZKm+Y=; b=BFRMWgb4EU7k9cPoNI7wDA/GB
	R5FUFtm64laTqP5XITjOCpwcoQlyEeblBiPtiU2DNNI49R+cARh8YH7o2gXFo/KoqVkARDXaxtHzx
	IBxxScRxaeG4zEv5V3gUKXUExBAbIHt0qoTi29E7s1FviM61vcS/OFTjnX1kp2WRmzW1krkHLBvZd
	6Wm8QBRG0IEALAYkgB9N7G5x1oYocE8JEHayI0984XT2Mtlc3bI0EkNffHZgIkQsyx8eaZjz4T6sr
	vrPEEXFcUaOK5RXxSFBb773AhZPTQx5Be3Zx9RvzofJJa0rE+sd+pq9wEcU5Hb/kHBzMAk1wGqz86
	qAWpfvdrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydMK-0004IP-UC; Thu, 23 Jul 2020 15:42:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydMF-0004GW-UX
 for linux-amlogic@lists.infradead.org; Thu, 23 Jul 2020 15:42:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id r4so2656732wrx.9
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Jul 2020 08:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8EPyVItM8ZZ0b5yJkExGLRAIa3DRsEHrOMp/ZeC/fBg=;
 b=s8CpAaxLSu+jhZqz2tG73lTQE1pjCERnCtZPOYHIu0txj7/kI5W8PqLhj77t0qyk2J
 BOLdgnW8exRY5UOXdGbJy3IW5V6pF/FEvE1uLUuNcDERJ8ba80R2eceZ4rcuP0bmQKdG
 B2kRSkkQkrlTy9niJzVxxnkIWW/NnQB7SKnU3NuiFmX0pGl4A/z34Kq8nN3BkCkisomB
 0RxqD67kf5RUDgfM1VKwMYls8slQXLvYW0kVbWcCPzNHJwCuYvZjHsFniJvHccQfIQUp
 kZbFRAvJrq7lyeGGSgqkAx3hp3XCVPutOjS2kAlBOQ4jFE75enXHsDRxGMUBUFb9dwYs
 Pt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8EPyVItM8ZZ0b5yJkExGLRAIa3DRsEHrOMp/ZeC/fBg=;
 b=ApGXoSi78Dj1y2qf/vateVfB7ip/P+VVE6Dx441bIHzNyDOUAlAfcKONzozQu9Sii/
 +apwlagRMcF4jKjAjeyyRz5+aiIs3lDSiCoCne9oMZVuGOzos8LnOu8nNJItHR4XzdrX
 Qp+1R7h2IIT2XwPRRoIh7f14vPuWjyjx/ZRfVrtPWDQZqotKegIgEpPXYTKTL49QFK7y
 Hm8vszEnKs2cRPTkdXmHMCHgyBJZsV9LdTtU9z0D0qDhFUx7pqhIWDXFDgiGEhLergVi
 JrBVjMuBMgpqyiR3DBr9XbKrj1ezD6DoANs2tFvJXe0XVF7GAq3sCFY1i9JNJsY4DvSg
 jA+Q==
X-Gm-Message-State: AOAM533wMLa0YvdWK8AX5qHXdbQsL2ZOukTHRWGZ4Ezu+pF1fi3UOKwE
 Yh+ilPBjzI8mI3LfEYENPQ1zMQ==
X-Google-Smtp-Source: ABdhPJz6gBqpHHhdqrbEBtx5C/N3UZAGuNQI60/f5V28ugA59ONqfSI+uqVvXwBQ3d9r9vBDp4aDFg==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr4401478wru.22.1595518926092;
 Thu, 23 Jul 2020 08:42:06 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d?
 ([2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d])
 by smtp.gmail.com with ESMTPSA id y11sm4576994wrs.80.2020.07.23.08.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 08:42:05 -0700 (PDT)
Subject: Re: Reset controller on the Amlogic SoC board.
To: Anand Moon <linux.amoon@gmail.com>
References: <CANAwSgTMu_VSgZPtX1a3weJnp-qUve8Q1qYiTEB6Tkn2rL-+Rw@mail.gmail.com>
 <e695300d-4974-2c75-d227-eb74de60c8a7@baylibre.com>
 <CANAwSgQ3=Dup203+hRcC4eqOuSmearrDPKGe-ce-2+wUGmo8_Q@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <05221f68-aa15-2e8d-b002-3e41071c64f0@baylibre.com>
Date: Thu, 23 Jul 2020 17:42:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgQ3=Dup203+hRcC4eqOuSmearrDPKGe-ce-2+wUGmo8_Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_114208_175872_F05C847D 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 23/07/2020 17:14, Anand Moon wrote:
> Hi Neil,
> 
> On Thu, 23 Jul 2020 at 18:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Hi Anand,
>>
>> On 23/07/2020 12:49, Anand Moon wrote:
>>> Hi Neil / Martin / Jerome / Kevin.
>>>
>>> I am a bit investigating the reset controller for the Amlogic SoC board.
>>> Each of thes reset controllers have different reset IP features.
>>> So we should map the reset controller to appropriate IP nodes
>>> in the DTS to make this work.
>>
>> Correct support is already done for Meson8/8b/GXL/GXBB/G12A/A1.
>>
>> Can you specify which features are missing ?
> 
> Yes, the reset controller is working fine.
> Currently we have only one reset controller _reset-controller@1004_
> 
> But what observation is that we could have different reset controller

Sorry I don't see any good reasons for that, it's a single reset controller
with multiple lines split over 8 registers.

You are free to do the work and submit the changes, but it will break the current
bindings and offer no changes or new features over the actual design.

Neil

> reset-controller@1004
> |--22  Sys_cpu_capb3
> |--21  Dos_capb3
> |--20  Mali_capb3
> |--19  Hdmitx_capb3
> |--18  Nand_capb3
> |--17  Capb3_decode
> |--16  Gic
> 
> reset-controller@1008
> |--14   Sd_emmc_c
> |--13   Sd_emmc_b
> |--12   Sd_emmc_a
> |--11   Ethernet
> |--02  USB_OTG
> 
> reset-controllet@4410
> |--8  Audio DAC
> |--6  AHB BRIDGE CNTL
> |--5  tvfe
> |--4  AIFIFO
> |--3  Sys_cpu_bvci
> |--2  EFUSE
> |--1  SYS CPU
> |--0  Ring oscillator
> 
> reset-controller@4414
> |--15  I2C_Master 1
> |--14  I2C_Master 2
> |--33  VENCL
> |--12  VDI6
> |--10  RTC
> |--9   VDAC
> 
> This is what I would like to make it work.
> 
> -Anand
> 
>>
>>>
>>> Following are the reset controller reg ip blocks as per the Datasheet
>>> Datasheet :- S805_Datasheet V0.8 20150126
>>> Datasheet :- S905X_Datasheet V0.3 20170314publicversion-Wesion
>>> On GXBB / GLX
>>> RESET_REGISTER   ----> 0xc11004404
>>> RESET1_REGISTER ----> 0xc11004408
>>> RESET2_REGISTER ----> 0xc1100440c
>>> RESET3_REGISTER ----> 0xc11004410
>>> RESET4_REGISTER ----> 0xc11004414
>>> RESET5_REGISTER ----> 0xc1100441c
>>> RESET6_REGISTER ----> 0xc11004420
>>>
>>> DataSheet - S922X_Public_Datasheet_V0.2-Hardkernel.pdf
>>> G12B / S905X3
>>> RESET0_REGISTER ---> 0xFFD01004
>>> RESET1_REGISTER ---> 0xFFD01008
>>> RESET2_REGISTER ---> 0xFFD0100C
>>> RESET3_REGISTER ---> 0xFFD01010
>>> RESET4_REGISTER ---> 0xFFD01014
>>> RESET5_REGISTER ---> 0xFFD0101c
>>> RESET7_REGISTER ---> 0xFFD01020
>>>
>>> Each of the reset controllers have some different bit fields,
>>> For that we need to have reset binding macros accordingly.
>>
>> It's a documentation issue, the register layout is the same from Meson8
>> to G12A.
>>
>> Neil
>>
>>>
>>> Please share your thoughts and If you have some inputs or
>>> another approach please let me know.
>>> I just want your feedback before preparing
>>> and submitting some patches.
>>>
>>> Sorry my English is a bit poor to express hope you
>>> will understand what changes I am proposing.
>>>
>>> -Anand
>>>
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
