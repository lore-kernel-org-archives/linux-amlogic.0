Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D7ABC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:40:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B839320717
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tB27swna";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jzbjCI1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B839320717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eSm7iw/y1UyaKdmCHKrA8mKHC9ZZ8enakoHZOp948Yc=; b=tB27swnapWDifyq7v9TksoY8Y
	BPZ4noHMdBqPhciLGHfCMLoyh7/71Oo8q27y55VMahw6YznuE8H4E+74OnNfEc3oNwXcm1hZkqTQh
	uLQ+EOLSd7+oHoVXR3JL/zteFGk22GMy2CKhKvdUGSka1caNuqGERfWrH49agauBYVE+F3vJ3Im1x
	Fgex0yUN9M4aiHd+CSp5KNySv0eS8u8aJE4TVGQC6D53wJXhAau/1BUDarlcU8fqXzmGMt4uaKsv1
	WdTeYra/3u/hTNorMrVTCUx6UDirm84qlTmyynXMs/5scKdcKcbWrs1wDaWWjIXyhHcSzJL1Hvnfh
	Fa3ts6Gwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiLK-0003Kz-90; Fri, 25 Sep 2020 07:40:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiLG-0003J3-TA
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 07:40:31 +0000
Received: by mail-wr1-x441.google.com with SMTP id k15so2405196wrn.10
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6lPeOd/Ub1nG1i/cR1TdJmMYcRgIgs526aqjuBgL0fs=;
 b=jzbjCI1PKanXRjM4YXO2U+lcqZBZWuA+V0nnM+omyYv1GPGi9zqv688+XfX3IUxiWO
 9MucJ323nmpgs47hvkFBsF+QqYyoIhr9Y9PbJcTFqHpt7JouK0wIFd6+xTARoNaeKMEv
 5IUaJgXi+7RJj8CF5tLAwUuyUSYBOeYfXkFGCmHcKwbO1cdGKs3MdqKaDSZoCFTBovt5
 0NWe/3t+kdokKi+K+CAYA5eZ6FPlJ4W1d+Jh6yDfHzxU3ySixnL1ag9VkGXmET7Yw5uF
 ynvZT6qxFlM62cH1huRe0onOMnN3chkSt97GuPGgq2yKzZhsRHihIZCVx/loq/exunZ8
 Jcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6lPeOd/Ub1nG1i/cR1TdJmMYcRgIgs526aqjuBgL0fs=;
 b=sJJCmO4qUKwnIC7a/b75p5EC09WiEQStn1O3I69efNiWexBBaLp+ul7MMkjTRnEoBF
 Il1iHr6G5zaEN9NfXJfiZSybAbrxpR5awHD9db6K/EaY1ognW5ZG0FM6hzDEAhO8qth8
 Q3NsLJqgOGA15B6bWAwSKtpKphyb4fausgKw7xKTzWphEFpXsKHEOtnK0nDRDOQdP+VT
 VgXfA8HFL+w6bO2ymJ07T4KpREh7r0Ii7dayq5ccLC36ey1IPRmaRqh6nalak2XeyE2p
 d+SWD0YcCkCuUU3G4a5gt99dyU/j1t37D4iXKHe4/R3QmvSETjGC0gOW+t/tSAqRUNc8
 Pj0Q==
X-Gm-Message-State: AOAM5336FJXwdIdua5rIuPTUj4858QwhjEqd0Q/Rl0XkMJmnKHsg5IEi
 1A+pnCCumt01mHRleWBbRxYZjQ==
X-Google-Smtp-Source: ABdhPJyRo+9HG3GB9orSVmv1XpiTErhNcdHt9eiu9XSe4JbAYg1KR+rFdTZXP7MMPqkRPxSOexXI8Q==
X-Received: by 2002:a5d:4744:: with SMTP id o4mr2964358wrs.130.1601019629764; 
 Fri, 25 Sep 2020 00:40:29 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:28ac:1772:9398:891a?
 ([2a01:e35:2ec0:82b0:28ac:1772:9398:891a])
 by smtp.gmail.com with ESMTPSA id d6sm1886974wrq.67.2020.09.25.00.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 00:40:29 -0700 (PDT)
Subject: Re: [PATCH 4/8] arm64: dts: meson: remove fixed memory size for
 Khadas VIM3/VIM3L meson-khadas-vim3
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Artem Lapkin <email2tema@gmail.com>, robh+dt@kernel.org
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-5-art@khadas.com>
 <CAFBinCBtGqDgPH0VhW2awPzYSVFN++HNCA5=L6VVMRW64=AY9A@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <3aa15c85-5dec-52df-c97f-67d45572d5be@baylibre.com>
Date: Fri, 25 Sep 2020 09:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBtGqDgPH0VhW2awPzYSVFN++HNCA5=L6VVMRW64=AY9A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_034030_980068_F68FB904 
X-CRM114-Status: GOOD (  18.46  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 25/09/2020 09:37, Martin Blumenstingl wrote:
> Hi Artem,
> 
> On Fri, Sep 25, 2020 at 5:31 AM Artem Lapkin <email2tema@gmail.com> wrote:
>>
>> no need force setup memory size!
>> VIM3 boards have 2Gb and 4Gb variants
>> memory size will be automatically defined
>>
>> mainline uboot works properly in any case
>> but old vendor uboot works not properly for 4Gb variants
> can you be more specific with what "does not work properly"? is Linux
> then only able to use 2GB or is there any other problem?
> 
> overall this sounds like a bug in the vendor u-boot to me
> I don't see that we have any other Amlogic .dts which needs this hack,
> so I'd like to hear the feedback from the device-tree maintainers (for
> example Rob) as well

AFAIK the vendor u-boot updates the memory correctly, what it doesn't is adding
the reserved memory zones.

Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
