Return-Path: <SRS0=bxQo=AM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757C9C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 07:47:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241BC20722
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 07:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rbXU99u6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="miOFTvrH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241BC20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zdVIpXjL0JZow5TF1yXfGuXLphO/ZLGbpN4ivFIjEiE=; b=rbXU99u6pBheZ2rh0h21Ry6jK
	iNHfFW+A74u7mlq+YShzlfpTuW7OIToVC80O8GaEc2R/qPx8kBuhxvkNHU7dhQ1k94ZGMNPqP2Cuj
	TBqQ5PRNCziJGsbbkr2qhx4j1cAs9e3n58YkMKvNFurlTssJNcuNlzR/SUO7fbJmXwHFU2LlbCuiO
	L7vzEFm/2KHXX2H/vXBztyTEsjfHnJbgq1+UmFidc8wayxaM/9EgL5zC6Iw4EXDeLz6XpdcfPmU7U
	dknr6x6wjid33+7Y69gQ1Gg6Cgs27SwbKRUMnuqjcUTEqXmUuTCdd2+FQXWNGotxTwiPOv0NGpGSq
	/PZbudiLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqXSl-00017X-Mu; Wed, 01 Jul 2020 07:47:23 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqXSh-000147-A4
 for linux-amlogic@lists.infradead.org; Wed, 01 Jul 2020 07:47:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id 17so22133364wmo.1
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2020 00:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fTgFQkNbLaklFrEVl/czEBBi6HiquwhCbwbUflvcUw4=;
 b=miOFTvrHemp2Py2YdCWAViTIkFSUFWv6cpZFF3x9pb80opR1x3K56U60lK75av1I3c
 V8lr4MTCBRoU0ULgdrpnX7NO3WsATUjdIyk4DGsS20bSWqM+dYNvgjQZMXz2IEeb0yDB
 2G8Y9e8XDRCavyZkjRr6dwAVZnKns6u8h9lcbZXjGV62MHiLW21b/B2+5wqepUbD+GC3
 wxZPdIb2dTATuSA+6VTWwc6F84JbpUanTs64iXGuTlvLKBB9pYkdkrrpWThf2jjkNF9z
 BUTqPoVkHpnv341USkT4cyKprHHfi+aX8YoKJpVpv2rJEmLov7c4IAr6AKBKavYGBh6r
 bTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fTgFQkNbLaklFrEVl/czEBBi6HiquwhCbwbUflvcUw4=;
 b=andd330D2GOI+41GKOejgv2ZSh5RoDws5JXhwRYUwQjFlg85psLjP5hN/wzMvqhqMy
 Z6QF/xyUWZYs3s96l6EOsWUw/LzXHRUdoPHHtj7WSaKYXxVcO1NDyppofDreB4YlVjTy
 Rf4pr02uRbZiipzLa3M1mW9viHzHUUiulOXkI+QddaclOY2ae2/SV4w5tp/DyguWA31O
 is0D6DppI08WasUnONNWHW565RFHJ8PMlNUUnjspnPG0I7+HG8E2Ao0Sn2zkR0QkZCRF
 MA6DVncsl31efgkpqGn/tcJj0YZyeGJ7jZiW3cyuT9lahaJ+QHojgKeepmB5Ey8ButU7
 Q+Mw==
X-Gm-Message-State: AOAM530D4qSP7mleAS73pEdWeWLhXD63pjz9SarpRHHhzR72+M5ian9H
 5Cctmh6+pWqBckBJ9fzzk2F+Pi8NGtW8GQ==
X-Google-Smtp-Source: ABdhPJzspFn46BB8479a2n+pTPejAOm6bs1PgVH7gA9pfvhVyiamW3z4bWX9BHX0buHhkXVnveWvHg==
X-Received: by 2002:a1c:e143:: with SMTP id y64mr25047109wmg.90.1593589636564; 
 Wed, 01 Jul 2020 00:47:16 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:7023:727a:c688:cf9b?
 ([2a01:e35:2ec0:82b0:7023:727a:c688:cf9b])
 by smtp.gmail.com with ESMTPSA id n16sm6223609wrq.39.2020.07.01.00.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 00:47:14 -0700 (PDT)
Subject: Re: Power-up/reset code for Mali-T820 in Amlogic S912
To: Jian-Hong Pan <jian-hong@endlessm.com>
References: <CAPpJ_edjh-31dPixzvZU+mzvKfOB_g58eJ29EWak+1Ru-A83zw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <cbc065b5-35f8-c6ba-561a-396a80838702@baylibre.com>
Date: Wed, 1 Jul 2020 09:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAPpJ_edjh-31dPixzvZU+mzvKfOB_g58eJ29EWak+1Ru-A83zw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_034719_480552_D1DB48AA 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: linux-amlogic@lists.infradead.org,
 Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

You can find the code I adapted to panfrost at [1].

I'm not sure it's the right code at all since we are awaiting for a reply from
Amlogic to help us fixup the power-up.

Is suspect the internal mali-t820 power management HW to be broken, so the
internal soft reset doesn't work. But Amlogic did other tricks in their kbase
I was unable to port on panfrost.

[1] https://gitlab.freedesktop.org/tomeu/linux/-/commit/7ddb208352d4a8387e14e0744dbb48ed8ee48d0c

Neil

On 01/07/2020 09:28, Jian-Hong Pan wrote:
> Hi Neil,
> 
> Thanks for your information on IRC #Panfrost for Mali-T820 [1]
> mentioned in the ticket [2]
> If I understand correctly, that means there is still no power-up/reset
> code for Mali-T820 in mainline kernel yet, right?
> Is there any patch worked in progress for it?  If there is the patch,
> we are willing to help to test!
> 
> [1]: https://freenode.irclog.whitequark.org/panfrost/2020-06-29#27374880
> [2]: https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143
> 
> Thanks,
> Jian-Hong Pan
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
