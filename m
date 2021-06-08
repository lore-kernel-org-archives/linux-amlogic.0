Return-Path: <SRS0=JVYJ=LC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDD9C47082
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 16:38:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0F06127A
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 16:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0F06127A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CPYiX4adD5zXKQjmhm5yVmVcd8MCmTliFnzXfvtWVyc=; b=jI5N4YZtkhFWVY3q4PJDC6ZUjZ
	4fOCEc8X9UXxnAToLpJk4T+qCa6b7RZjYQAd2g2kvHl5/uEZrJK6zCiVtMcqQJtOuG9Yqji7747P1
	RPaS/0TOuGCSoy6QVBVg31sSLR1D85AK+8/to3XULBXWcYdwjaigpqZRlyAiMtlXQq5bl8enyC1aF
	dReuEOjcyuIwC+U3PEnc7IOHKeeZ+9zIISbz7ClvzaBILqS/ryk33/W91h1JDSbob9QuW2QJOH/ld
	0IjA55RTMage0r2rITgH1LCtvcO56cEUBmvdsmnfkAaJ1AD3l7Hgkn+3w5LMMlrowldtlAZ9l9KQx
	7gmnKQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqekS-009YeZ-6w; Tue, 08 Jun 2021 16:38:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqekN-009Yd8-2F
 for linux-amlogic@lists.infradead.org; Tue, 08 Jun 2021 16:38:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 k5-20020a05600c1c85b02901affeec3ef8so2455085wms.0
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Jun 2021 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5MiCsohSNbpQZL8LRnsIqyOkEhi0sWxny4ybtnjXo/E=;
 b=j8B7zQBgKLIQyikIY1/IF32okfKCFjEQds5pepMlL5rcW2XnrTauKFiBbDlL5FwPXM
 bQRHrWvRjH51ABQ25SXfD0Gg0MGtGjAQ1G4bHDhhIlrsDxLlEw3NzzWehetg9vHRN/AV
 DHigod3Pta56OQ6/AbI/Y/8EJAu6u1SaBhOekvAUwjIa5SlsWU9aE7/QqoaRXwtAzbOx
 P5DGITV/6utrwIpHBM7y0nC2il2hn9tNu7fQAJw4JaxAZLM6sI9xMX8DOLVXklASexlo
 R0e3yEEj2aYjDPXkINe3UEDLHsvy+QhBnKdgxJHlwzZnxzItq3cQ25jXAlfjKPqQB5pz
 nGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5MiCsohSNbpQZL8LRnsIqyOkEhi0sWxny4ybtnjXo/E=;
 b=TYlQ/Erh4tPKNkwsVy+GGQDXGMXErP+UaosClS8tlvwEqTneYqFwiJC8SKNFJpqPFv
 JkwB8QNrpkFCjTCMNgmxDtSHQm3305SoIlcluVfyniVa0H/AqJ4c0/Ee1mWeyXid18Ow
 16jp4cdB9wmYyX2CERfVUAW4yUn1xKCKFUDfpzCsBeM0xrzMMGew6PF2ZMRTV3LnsmmQ
 CBb2vGgQRG5wVd07b5qpv3YBgmtVyG+KLwGGs2TkT6dwqqqhZo7731AMWmXdvOhpIf/Q
 MXHhvm/Wwl08EqzCZSwQ5nAeKFzCjSyfu3l0FyXIudhTauJB4fBZ2v/WXtSMrPxLbr7b
 99Bw==
X-Gm-Message-State: AOAM5335zbKGsC4sDAJ83Oqc1675aL+Y4/4+av/ofGhs4Orb4gAT5TpX
 4ZD+qehlHtYggWxxgtGtCB1e5w==
X-Google-Smtp-Source: ABdhPJw08Bscg886RgtJ5ecEZCdZhnXdY9Z/AxEb4VZaj+H+QJBzHoV/oO8BmNN7T9SaGmZrlPizuA==
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr23433400wmn.132.1623170312142; 
 Tue, 08 Jun 2021 09:38:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d35c:a474:f6ef:ed8b?
 ([2a01:e0a:90c:e290:d35c:a474:f6ef:ed8b])
 by smtp.gmail.com with ESMTPSA id a1sm23275526wrg.92.2021.06.08.09.38.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 09:38:31 -0700 (PDT)
Subject: Re: [PATCH RESEND] arm64: meson: select COMMON_CLK
To: Jerome Brunet <jbrunet@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20210429083823.59546-1-jbrunet@baylibre.com>
 <162008674673.40672.14279142646066453043.b4-ty@baylibre.com>
 <CAMuHMdVhrMNzuXkD9BQxPaiwS41bsOyJU_kwGYwk5ftto-AGBQ@mail.gmail.com>
 <1jczsw1fnj.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <7e70f485-1114-223a-e7cc-386795049e4c@baylibre.com>
Date: Tue, 8 Jun 2021 18:38:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1jczsw1fnj.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_093836_815915_31606DF0 
X-CRM114-Status: GOOD (  19.67  )
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

Hi,

On 08/06/2021 18:32, Jerome Brunet wrote:
> 
> On Tue 08 Jun 2021 at 11:52, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
>> Hi Jerome,
>>
>> On Tue, May 4, 2021 at 2:06 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>> On Thu, 29 Apr 2021 10:38:23 +0200, Jerome Brunet wrote:
>>>> This fix the recent removal of clock drivers selection.
>>>> While it is not necessary to select the clock drivers themselves, we need
>>>> to select a proper implementation of the clock API, which for the meson, is
>>>> CCF
>>>
>>> Applied, thanks!
>>>
>>> [1/1] arm64: meson: select COMMON_CLK
>>>       commit: aea7a80ad5effd48f44a7a08c3903168be038a43
>>>
>>> Best regards,
>>> --
>>> Kevin Hilman <khilman@baylibre.com>
>>
>> Why is this needed, and why would this make any difference?
>> COMMON_CLK is always enabled on arm64, as the main ARM64 symbol in
>> arch/arm64/Kconfig selects it.
> 
> Ah indeed. Shortly after commit ba66a25536dd was merged I remember I had
> problem with COMMON_CLK (or any other clock implementation) being
> selected. TBH, I don't remember it exactly ...
> 
> For sure this was a mistake.
> Neil, can you still drop it and do you need a revert ?
I can't drop it, it has already been merged.

Please send a revert and I'll push it for 5.14-rc fixes.

Neil

> 
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
