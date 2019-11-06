Return-Path: <SRS0=HwYM=Y6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC571C5DF63
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A54A2075C
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Nov 2019 19:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5PnSv/p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="k3l2bcgE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A54A2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUHaij0VZ5tNnuCRV0doTAoK2h5NwejmxBmPuDiRohQ=; b=a5PnSv/paXZK+o
	H4P427x7nbHpDi4qVV19wpMKQnQndlh7NaVf2sRv4hqUUpuIgQ4EPGnTQs7j079QmniWAIN1M6REr
	Vf91qLxvF0Xh//B3jZM3Lt63iao9CD+r5CY8cvo27yT2h6xqEkn2DcEV4yNOlqF6G9cunphPKNIQd
	8ywXKb8MhFxrwDA7ZboJODXryIngPxgy4vRzPwgTTkVXKZSZeKJFE8MFfybHnF3RQ+zaPc2tiUpe6
	8uANP9FJjXU6YpeHhv9q7UY+lWqbRfC+97uQJ4eBuVki4ULLNNLFa0f6KlIzZWIDu1K16M8VuD8CV
	ZDYXxQnJz3+0/3ZawYyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSQke-0000ar-2h; Wed, 06 Nov 2019 19:13:56 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSQka-0000ZR-KP
 for linux-amlogic@lists.infradead.org; Wed, 06 Nov 2019 19:13:53 +0000
Received: by mail-wm1-x343.google.com with SMTP id t26so4815770wmi.4
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2019 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=imOl6s7WJtDyzdyKMjRfhQfqUS+7pQQOdxq1MLkDHB4=;
 b=k3l2bcgEB5zMkimsxKUQaGYW3GYIvbfgMggqg/xIB3b2muNxpyx9iikRkTO+F6RLxJ
 LUcr0uc5iBHAdfUSBBpKXUBMm9+BEmHlNt67rEhtZUQ5h3XKC1Df7udpm6b2psNg/3ti
 QKUPBecJaHFBH0QXl864EcYvb05hFLadvo3uAkDvtofUjF22SMDjeq9bLPD5vZahtJV4
 LWwhQgi5HUdjCcDO7F6rtbI3y9EWiRqYxlTn7T9eOQKAY68SqHn8KpWXWsCn/Ci7RAjI
 ohClif+oPgof1ms9CpXvfBI3zmZgajDQe2KxSwgkq59Lv5E4MKwDLfqub5cteAA6suid
 jbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=imOl6s7WJtDyzdyKMjRfhQfqUS+7pQQOdxq1MLkDHB4=;
 b=oZB2gkjhvDeS1U43SLZdvBFxBW0C5aLPaH9zE0zplyuMxS4qggSwxgh+BGOZR2w7kC
 DOA0JOV5x7DZ6/YRtR4V9oj9T46a5ZppdXRsnoXWUkmjn0oGE8dnROL/+Re4YHFx1r84
 yLpf7LtYqG8NDASGP9bGDNzR2Sgoc/GcQcYdFpium3s8kj/9zXNAzkGJ8SCur0j2v0Tt
 hCPjdRoNPS/Bla5cCcwY0yfClT3GWqWkzIQ8kw6XYpyB5wCShAJKzYdn3cpbgJA3xsSi
 ZEbOg5xALzKCb2aIqXTnjPejTeqFO0D9eG/Yis8tpCVqfD+DuEEhKGoYFY5w3Gz+Euv0
 2HzQ==
X-Gm-Message-State: APjAAAXOs29qrsUGFlmwvceBb2OQu0I5MChwRF0f3HsPucPL4awGgV7W
 Li3aERYxhlvsO3MUSG6rLSPjVg==
X-Google-Smtp-Source: APXvYqxofhZf6+9Ut84ichRu3J3mOUD9QKq9fRKGXAHOm5aOY3zxs0m2DqEz4oxZsC8/9oJnOIgeQg==
X-Received: by 2002:a1c:f602:: with SMTP id w2mr3859157wmc.83.1573067627615;
 Wed, 06 Nov 2019 11:13:47 -0800 (PST)
Received: from localhost (amontpellier-652-1-71-119.w109-210.abo.wanadoo.fr.
 [109.210.54.119])
 by smtp.gmail.com with ESMTPSA id h140sm4515466wme.22.2019.11.06.11.13.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Nov 2019 11:13:46 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: amlogic: meson-gx-socinfo: Fix S905D3 ID for VIM3L
In-Reply-To: <7d8e80b5-0b37-691a-3375-6a37cc774a95@baylibre.com>
References: <1571646004-21269-1-git-send-email-christianshewitt@gmail.com>
 <7d8e80b5-0b37-691a-3375-6a37cc774a95@baylibre.com>
Date: Wed, 06 Nov 2019 20:13:45 +0100
Message-ID: <7hy2ws6cnq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_111352_671966_BC469ACA 
X-CRM114-Status: GOOD (  11.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 21/10/2019 10:20, Christian Hewitt wrote:
>> Chip on the board is S905D3 not S905X3:
>> 
>> [    0.098998] soc soc0: Amlogic Meson SM1 (S905D3) Revision 2b:c (b0:2) Detected
>> 
>> Change from v1: use 0xf0 mask instead of 0xf2 as advised by Neil Armstrong.
>> 
>> Fixes: 1d7c541b8a5b ("soc: amlogic: meson-gx-socinfo: Add S905X3 ID for VIM3L")
>> 
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>  drivers/soc/amlogic/meson-gx-socinfo.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
>> index 87ed558..01fc0d2 100644
>> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
>> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
>> @@ -69,7 +69,7 @@ static const struct meson_gx_package_id {
>>  	{ "S922X", 0x29, 0x40, 0xf0 },
>>  	{ "A311D", 0x29, 0x10, 0xf0 },
>>  	{ "S905X3", 0x2b, 0x5, 0xf },
>> -	{ "S905X3", 0x2b, 0xb0, 0xf2 },
>> +	{ "S905D3", 0x2b, 0xb0, 0xf0 },
>>  	{ "A113L", 0x2c, 0x0, 0xf8 },
>>  };
>>  
>> 
>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.5,

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
