Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F46C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F8E661445
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F8E661445
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CL7RljfXTVc8lW1Il+wdCOchK7CQRDqrnjdJHKbY/Lg=; b=OZ5wzVBxPwbkEUd9POuYBrwto
	EPibUhEcKXS8XstPK5FAjyo50KbXkSklO5NZqsplGdXvG8/R/Zo/HGFU9XNYO4jQzknyghLUz2myu
	VfyNfkMDFRtiNe3cjbn9/hBindT/jlxctbYG2/JIy+4vBmGZWUNFOTyYIaTC68SRBmmKGbdjcqiTy
	sBHDGQSJHj5hfO8hYf/SCOGMID06eOxSLPVUsKiR0+dlTmZgTlsSIhc5qf/igZrOiFWXUU7kklByv
	faWnfY3BjO51ihyt4NW0xK2qFcmYXqo7rl+pKbetIZyVuzK7IMRIXIj8SLEp+xeD3LjCS3qw9AJia
	ZF89ez30w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2qG-005QUI-Et; Thu, 29 Apr 2021 09:20:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2qD-005QTS-8V
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 09:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=emtycNn+wWCzpWR3wOPRX/lfC7/b7fgfW6hulP1Fj7Y=; b=1lkpxHH+/Uj3NeVZTrcongWsTv
 Zfz2rMbkksNmOBvQZRO96mx49aWKAji6b0v9QzS9sv5aV+SqXQVDq/E1MtAvyTEtpVS0vfGQeorBP
 L4rzowmJkTHIe5RGbJSd1DUKcJVTfls8noaykjMM4OLsgVRWMHP2xi6wKp0aJaRzsxCF4q4rGD2o6
 dqd5+PnkzK27ytOiDgk9vFux3mRZTrBdzlDmBwDYBHIQsDkDbk7KZbk00Mmug2qO+mTieCcuIkVM2
 hRae40gbdrsgMxTf2DBxJTN54q99pRdrDjMl5TeeToqvpVfoksPiU68zpg8L7JLcP1U9pmx3PgnSz
 aKm0rlag==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2qA-000WJn-RV
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 09:20:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n84so8215068wma.0
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=emtycNn+wWCzpWR3wOPRX/lfC7/b7fgfW6hulP1Fj7Y=;
 b=e+xfgr7nxfd1QlWEWsqxjy1GUZPA7ol9k+mWo0/8JLNUhvS0J4jmiBTTLfDxEradFq
 CIsxtz0S7SxSbc0qvNJyclrHPRSJoKUWSX82ziobYfkzic6lu1CJwOvrwXFy1JEn8DG6
 riIHtBrWT3/TJecwwZsUF56rWIPkKRAY06iNxlRjDM/cu5dyjOWlOXfHXVAyDbGyQDDU
 itrhfxwLXaAoAWzkdiS3cbP8Y6BhMOdJEwkBTLUBAtmwHaqrL0RQJugTwhjrSpkof4O9
 xsK5HjjySgkp+4Ki7kNyWs2+LPU8iM0GG1ZtoYg5PByLRn/upr8gWhOPaG5M+zOwEh6p
 //nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=emtycNn+wWCzpWR3wOPRX/lfC7/b7fgfW6hulP1Fj7Y=;
 b=g6DXBrG8hBXO5CpmlFIiJ/BEEDOL4aGY46DoA2fk7is1VTsiI0OaoJHY1lFUz8cjxb
 E2yjMvdyxFD67sjN25xoA+bVHC0XZbrBXg+3S/GPLvjuAh7n1ukQ3KHNJ6HyCTCU2wS/
 yo47E3+qT1bWT6pkw8XK5I7wRJxpltGpRKjRnDGmx8Sw8iETFOnTbvcIOuBoVWon+xqC
 XNufF6cbfxYTvbDElq3kyjFd+NA/uC3o3Efdg0eyS8Z8gRegI6V7i3qG3+I0OZU/QBCK
 UEZcE5pGAwW2VfKBJEIFDXDFGG8uYB/J5c6ZLIpLz4Gzeo6D4jgBdw4iSn7BP2dJyDSD
 dNAA==
X-Gm-Message-State: AOAM532B0KwL6AV5DZhU9110WYDZ3prRsGqAUkpgeE2dUo6Ez/HFj/13
 j6euVsXdT6J4cYyUZ2UAr1PovVVdzlgjqqLF
X-Google-Smtp-Source: ABdhPJz5ekuOvwFtm5X+ti48U3iGu1NlkQkbznQFO3DSiirw/PRy6N7TyqP6K1tEDIiQl8WB7C7+sQ==
X-Received: by 2002:a1c:1bca:: with SMTP id b193mr2500141wmb.28.1619688008970; 
 Thu, 29 Apr 2021 02:20:08 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:c304:4b2b:4a79:1da9?
 ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id f6sm3835949wrt.19.2021.04.29.02.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 02:20:08 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: axg-audio: do not print error on defer
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210429090516.61085-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ea42fa60-77cb-179b-ae2b-18b230383578@baylibre.com>
Date: Thu, 29 Apr 2021 11:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210429090516.61085-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_022010_920975_375ECC59 
X-CRM114-Status: GOOD (  17.78  )
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

On 29/04/2021 11:05, Jerome Brunet wrote:
> Do not print an error if we are just waiting for the reset controller to
> come up.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 7c8d02164443..5e501eff0840 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1811,7 +1811,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  
>  	ret = device_reset(dev);
>  	if (ret) {
> -		dev_err(dev, "failed to reset device\n");
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to reset device\n");
>  		return ret;
>  	}
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
