Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FCBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttbs/3FHu839ZvuoMaq8VCFvsiwxXb06DJQi9g3CSK8=; b=kyIA+SagA00wHb
	MMt9wYCOoJPmmsZULDyZe6EZSS6N/K4GKjeuNoOExj8YGgFwRVGmkhlivJdXEKO8zgACfvmalvghc
	IfQLmvMpaDQwstnOvBx9lUY897l6tME0xp2BIbEGuXQaSbl4dDFyHqNpWdcmh2f6RDcCWIq9Xv3/L
	xQVtMg9ar+0WuVBuGr/iKZztTcIkXUcEkjquqb9nTx1tsUa4eX1g2R8eDP3RcxkBt+rXG97GCe9oS
	AhQN2/hRL7K59RcXPx+yDj9fw/fy+7mtOse+xQS2NirvBFOrSLqFMGDMuOTFDiw8/mlJ8BcA2X8W0
	DRXLIsl9sISuzE9ncbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PFd-00EV0V-Oz; Mon, 17 Jan 2022 10:28:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PFZ-00EUyC-0m
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 10:28:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so20634619wmb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 02:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=HPlcOIwPiHdF2GzGInPdztm1hEXfamwYAz5jOisR7B4=;
 b=B3MPv1p7KcUw8vOr958Ka8geKwfgGHzHLjXFZBEx7lRkp+WGRVTOb++BwJ0MS2FvdY
 v8Lo7RwGN0qr6Nz/aSPSgGt8aaVpCkY1BD2WXw0VOCk6YlAbkQN8Ya26MiDjMFIldukx
 04FxgdSSWV34AZoRRtAwPRRQzhjXTrKATqBXqnSC5DNiMGIS3f+pe3iI1d+lDWvViiji
 2pxZqAaMUPLVuS+LnImi81GrNlNIBpMjSbmnu4Q2N2ph+c0ysx+3Lz6avUQNRTA2t9+G
 Mk+hNkzSputjTIeCZ7ZLa6Ke92vm0GR5cmCBrjTinpxinDHZoGEhAYajyYo1E+tOZrT+
 ELRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=HPlcOIwPiHdF2GzGInPdztm1hEXfamwYAz5jOisR7B4=;
 b=1qZGAJHzLHy+nJYea91CxvKEt02RSSljlqyNEnIayRuprB+5cut6E2i4rMvIhBg1YV
 k4RuBuz2NcmYXhpCuuwlADmA61Ccr8FJikRIWSFolvhmlBlYb09jzMaTGInBjfGCyB/F
 nzJIDqy5Dvg+PjSYC6sLIhIyWe5y2kiiRgS3tcCNDI4OFFcOftbVHjfsXfrfRlpXdb+G
 rNMVsISmEjkRB8xnLWURdul+5SBwK/xsOP3TnnyUX6oNdsqtDvwOi9txzfI3L9dAW9kf
 2AqrSR2o+kDMYOF0O4lVAaWV1VJaRQLY2El1nFoFeQ7slXjii/f98crt+28pcVsRnODW
 yPag==
X-Gm-Message-State: AOAM533+KUtZ8cBLVQEsRO6Fu7phEss+A6ssOiJmsnTNLwT8HS2QhV29
 pRmYT3s1z+iYtV8FWO+apPzInw==
X-Google-Smtp-Source: ABdhPJwdo4Q92+inj1pjAnhMyHAJauMkteo51PsuY2RxyrKAVIBFuB9gYIoDwZ7DTPKAQ9a20bn1vQ==
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr13937530wrp.419.1642415311735; 
 Mon, 17 Jan 2022 02:28:31 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id f5sm13928698wri.52.2022.01.17.02.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 02:28:31 -0800 (PST)
References: <20220115093557.30498-1-alexander.stein@mailbox.org>
 <1jilulav4u.fsf@starbuckisacylon.baylibre.com> <4732096.GXAFRqVoOG@kongar>
 <1jfspnpoxh.fsf@starbuckisacylon.baylibre.com>
 <0a51873b-429f-5905-5bf2-9406f578223b@baylibre.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Alexander Stein
 <alexander.stein@mailbox.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-axg: add missing reset-names
 property
Date: Mon, 17 Jan 2022 11:08:43 +0100
In-reply-to: <0a51873b-429f-5905-5bf2-9406f578223b@baylibre.com>
Message-ID: <1j35lmmzap.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_022833_118802_9D2F9627 
X-CRM114-Status: GOOD (  27.77  )
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


On Mon 17 Jan 2022 at 10:49, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> On 16/01/2022 18:30, Jerome Brunet wrote:
>> 
>> On Sun 16 Jan 2022 at 10:49, Alexander Stein <alexander.stein@mailbox.org> wrote:
>> 
>>> Am Samstag, 15. Januar 2022, 16:04:10 CET schrieb Jerome Brunet:
>>>>
>>>> On Sat 15 Jan 2022 at 10:35, Alexander Stein <alexander.stein@mailbox.org> 
>>> wrote:
>>>>
>>>>> Bindings amlogic,axg-fifo.txt mandates that reset-names is a required
>>>>> property. Add it.
>>>>
>>>> Binginds *mandates* ?? the bindings you are adding mandates that, not the
>>>> previous doc, nor the driver.
>>>
>>> Well, under required properties 'reset-names' is listed as well as 'arb' is 
>>> required, only 'rst' is optional.
>> 
>> I think there is a misunderstanding then.
>> The arb reset is required, the "reset-names" is not - as long as there
>> is single reset.
>
> To be fair, it's not explicit in the .txt bindings at all:
>
- resets: list of reset phandle, one for each entry reset-names.
> -- reset-names: should contain the following:
> -  * "arb" : memory ARB line (required)
> -  * "rst" : dedicated device reset line (optional)

That was fairly usual way to describe clocks and reset with txt files
but I agree it could have been interpreted the other way around

>
> Anyway, this should be solved, it's pretty common to have reset-names mandatory even
> for a single reset if a second one is optional.

Binding should not decribe what's common but how the binding is supposed to be
used. Fact is the usage was defined by the first and only user which is linux
driver.

This driver does not care if the arb name is present or not. Mandating
something which is unused makes no sense.

If we want to be precise, then it just cares it is the first reset is
the arb one (and yes, this constraint is not described either).

The reason for that is simple, there was no 'rst' line on
first version of the IP, and it was 'fairly usual' to not have
'reset-names' when there is a single reset.

If you think the 'arb' name should be made mandatory, that's fine by
me but one should be able to rely on the name so the driver should be
updated to use it.

>
>> 
>>> So when creating the .yaml accordingly this leads to warnings this patch is 
>>> about to fix.
>>>
>>>> Modifying drivers and DT to accomodate made-up bindings requirement is
>>>> disturbing.
>>>>
>>>> The bindings should not require that because the driver does not, as it
>>>> stands. The driver requires the arb reset to be provided, not the name.
>>>> Please fix the bindings.
>>>
>>> Nothing is made up. When creating the .yaml file I took the .txt documentation 
>>> for granted. How should I know the bindings documentation is apparently wrong?
>>>
>>> When using your older bindings conversion [1] I'm fine with dropping this one.
>>>
>>> Best regards,
>>> Alexander
>>>
>>> [1] https://patchwork.kernel.org/project/linux-amlogic/list/?
>>> series=246453&state=%2A&archive=both
>> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
