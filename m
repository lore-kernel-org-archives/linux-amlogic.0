Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D48C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F125820870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rrlUgmoo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZRG5TAzo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yoa2l5HT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F125820870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v7usN/jMFJLCM4h5vXxNMwSZRJGJGixo7pemaLFegHk=; b=rrlUgmooec+OKC
	dY7+O9UodQmBM1cnSUVTC8dwY+OyQ9vBIyxLmdNBKjTV35VLH8vP8T4ski1HPxmsK1Dq0NWBP4mwu
	WoURvYuWKYbMA4JztvSVGqnQn98IdqxmfgTxxCMitKIj5LEEi3JzKE0YFqeXHyA87dki31n2F567E
	H58ay77uteenjHUuSxdblTIEdL96dd+wkyi3y3IWBCV2KrqF9g1NhC2ngAEqF+GkIv72XhIDdBP8j
	D76GhznzkdjtvORWzpQVD9JtdycR0m9WK9IjQSa/iPn1k4ThvcNCa127WajqMfWgw3fc4VSlmxt1c
	F4R5NPYLMTyMexSlUxeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MNu-0003zm-0M; Mon, 25 Mar 2019 09:59:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MNJ-0002f6-9y
 for linux-amlogic@bombadil.infradead.org; Mon, 25 Mar 2019 09:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjUvDw4gOuiKbCS9+L4oee/43lzsOILkxD3UaEvPcUw=; b=ZRG5TAzoe7yrEcr0uAp8K0LI/X
 1GpnGWIoh0Y/UC5rttf3fzwsTB5S0knIYw7ZIaWlPG8tb44KpOwUbJ88jqK5gD1IFLAuaM9rJMgee
 jzhjkFnhgJ60dbE7EXQ+EcZZpLid70fDZ1PUIGb/Bi2iuAuCVQS2UgHzztMPYm5z/cu3LNRH3HHbh
 esOybVZkzFcYLsA3wlKcYm+S6/PKiEmSgzKGiwq5oL6CBr/652CtynsT7ETcX+k3r90YephuaDwQk
 e0TU25Ao1xdI03NBGHKssboVXnPlPKE4YToG2oaVSby4PPKOGlYReBTyEx2t7gahlsGt0ruRmL8rP
 5Gqh8nsg==;
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8M9G-0007p4-Jw
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:44:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id a188so8226425wmf.3
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=sjUvDw4gOuiKbCS9+L4oee/43lzsOILkxD3UaEvPcUw=;
 b=yoa2l5HTCJDO4Qd6U5rUO2b4WmP82IkULUq78oxV7j/Ax1s1hLAsn8c1aJ570M4LLC
 N05lcoIrTthH4x6l9yXaX3y8KcXf/H5LGSmkAppOeqM6d0RxPt/axfNLiGF7Vsa/TgIC
 5/bKzMF+gYcPKSITZqN4iauYfCWOvsEadumgTNxXuh8cCWpPB3TOufiia3tnHEZ8S0PP
 6sPftosrlPemduitr4nVbZIR6RTahp4w0I3DE/Z2oQ5C2/77UsmrlsPg2ggjlp0eNPYX
 emd6NH9e0Guu9+ePoTOI2kpmNWrzlv18QalAijZKo9Kamt8v9o8Wqzc7mR3bSXJ+R7OL
 BDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=sjUvDw4gOuiKbCS9+L4oee/43lzsOILkxD3UaEvPcUw=;
 b=S44+03fijob4X5JDav6+jdzQftWzdcxdDQLmY9fB2qahhfUKTXpVO4ZYqWVf8jqudQ
 1pu8RfBXJFn8/oA0SOCbwMjAMfrF9wpRMHJPuc8vtQrxH6gdOc1/Rxpq/fvknd11/VBM
 KxEwWWp6es90IqOsBixQqPzAFPxg9ptoW3dr2TodGHmsr8GMfxdq7wlQnqdbTM7IUSu/
 BmEHzfJjhWgOuCNQvbHwkayqHQCF1wBZAz3XlESq8MVKAbCH+HqSWGkozDCpFdhTAjj9
 uqK+njXwUSWKPXuWt15mXX1mq0H92p8gfECdXwEWJbe665LOiBLGJ++ueNdbPsOK66y2
 a8yg==
X-Gm-Message-State: APjAAAVOrQab/04QzqQd4sGPOwo0oS0LU7Qz8qwXggD96acmb6vAgKIP
 4TXIvohQMZUAADmWC1ZU9Qvo8g==
X-Google-Smtp-Source: APXvYqxgrEbmaJqb5t5YUHDJ+RSVQ8fPlX7fZ6D13OQumRAB3s5mmhRsLE0YzZ9FidXQfGQOu7FCeg==
X-Received: by 2002:a1c:480b:: with SMTP id v11mr9792761wma.25.1553507043298; 
 Mon, 25 Mar 2019 02:44:03 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 h9sm3591056wmb.5.2019.03.25.02.44.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 25 Mar 2019 02:44:02 -0700 (PDT)
Message-ID: <283b286671a65160ac8ae08b1e1889bc029db363.camel@baylibre.com>
Subject: Re: [PATCH 0/2] pinctrl: meson: add g12a drive strength support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Go=C5=82aszewski=2C?= Bartosz
 <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Date: Mon, 25 Mar 2019 10:44:00 +0100
In-Reply-To: <20190314163725.7918-1-jbrunet@baylibre.com>
References: <20190314163725.7918-1-jbrunet@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_094406_735587_74F89CBC 
X-CRM114-Status: GOOD (  28.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 Guillaume La Roque <glaroque@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-03-14 at 17:37 +0100, Jerome Brunet wrote:
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
> 
> Now the slightly annoying part :(
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> 
> 1) Rounding down the value, we could be requesting a 0mA drive strength.
>    That would look weird.
> 2) Rounding up, we can't distinguish between 2.5mA and 3mA
> 
> To solve this issue in this in this v1, we chose to document that, on Amlogic,
> drive-strength is expressed in uA instead of mA.
> It works well and there is no impact on the other platforms but I'm not sure this
> is really OK with the DT rules ?
> 
> Linus, if this is not OK with you, here are 2 other options we are
> considering. We would be very interested to get your opinion on the matter:
> 
> 1) instead the generic 'drive-strength' property, we could add an amlogic
> specific property, 'amlogic,drive-strength'. It would be expressed in uA
> and parsed in amlogic specific code.
> I think this option is kind of overkill. Expressing drive strength in uA is
> not really amlogic specific so it does not make much sense, but it would
> work ...
> 
> 2) Add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.

Hi Linus,

I know it has only been 10 days and you must be busy but I was wondering if we
could get your view on the issue above ?

Since the vast majority of SoC functions need a drive strength setting, DT
patches are somehow blocked until we decide which binding to use for it.

Sorry for this early ping.
Jerome


> 
> Cheers
> Jerome
> 
> Guillaume La Roque (2):
>   dt-bindings: pinctrl: meson: Add drive-strength property
>   pinctrl: meson: add support of drive-strength
> 
>  .../bindings/pinctrl/meson,pinctrl.txt        |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 166 +++++++++++++-----
>  drivers/pinctrl/meson/pinctrl-meson.h         |  20 ++-
>  4 files changed, 165 insertions(+), 60 deletions(-)
> 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
