Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3F3CD11C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoRpDXLDk7rU3mKqOYqVS4IdKb8YHlPDrgR3qP5ri3I=; b=c3VaETi5QqMAC/
	HbYatTFbtiJzmG3Q6xnYEMY75xnqNtpaMlPaJol4me+ha8mi5LgFAhJFqSfwZh8158NtZWbfchL8v
	Cq+mpStUCM3WVHrYWKn9BjZ+EELsIc/RWHP75hdP1WwuvwQhyDIx+c8LMykqK+eCsa+/Q7cSMQ5mn
	l2vyfYOoQ8yF97fiJGz4uk2kV23i+0FK/XsthctLyPXWJQCNnbRdR6wu5FBRkn7T7yRHgH9TS0ZGr
	+jNMib8xJ00qTNf2dXYMtVGHXXauQZCoL67XlDFVEl9EbYnBnfS7k2lTOwsY75TbQGHmWh/xKWyOy
	01XMoqNVpuO2ldBHKgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruU8j-000000067Lp-0xZ6;
	Wed, 10 Apr 2024 09:21:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruU8e-000000067IQ-43Tn
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 09:21:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-41634598125so29443535e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2024 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712740863; x=1713345663; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=OUZ8sj/QyEa+cNbVJTvPrBz5RGRP8IPnLWYdgXsAut4=;
        b=Uvxi+TpnpXQDb9fC8516MqEXx8kROGneoBb0cS0tELMs9SV7CAQuvwl13LmwSZTrhq
         aR+7VX7IX0Vsl0sB4ITmZotl2gk1gUTQkGesbaqAkv8Z9g40gxgudwGnMzLDG4VU81FC
         Bvtp/wKNetKMIQb2iSh48GiNGZUCEubvkJN8YhAgaaMObU+2gh695fIVkbZEq1Ux1ZtQ
         dS5Qcw1quTrIUPni5wt1sxROFSuZAmd02GrqUK4fmBFmVjeUzxCt5VWI3KvWV6ezXO0P
         ZVqG3VtECxr4a0f1kIGJJ/vdLVFtM+vZyndqUtNYjZgrhPgpix0G+gKwYD0LPYdUowgq
         EicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740863; x=1713345663;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUZ8sj/QyEa+cNbVJTvPrBz5RGRP8IPnLWYdgXsAut4=;
        b=EbrL6OC+TjlRuj/ZEN2P4erd1NScwQTyYUexcUpK6X1BbqTIYJafqmo2Tc7bSn0mPN
         WcU1FDP0XiNmDS5yvwdgD5g/Rv9tVNnVsvrcatpQEv2GsMdEkPqy44fXM4qOH3Zzowgn
         D7F9rGDq/po9SheanTh8eHMLck76wHz5jdsUhh174HcRpWzSd9yO95uZbI9HdTsf/rso
         ul6oS9kPHhRXWEVoTHf9/8YUxllYeBKlWApjZ+JkLuHp/yqC0xEenP11m8NOuVb3XbY5
         JUvuaczutXnrdEH4UGZ2KU4m/D2DUQuHCI5mk8xpjKMQ0c7kmYl8mPA3M2oxETIuw4/o
         hSCw==
X-Forwarded-Encrypted: i=1; AJvYcCWp8dJ6GfROGPuElkHHMAHm5lc/SvmdNtOstemXVu80cgT/mNmE5ZHM+9DhRD0wvTiZlRGpTE3cEGStpDe15Lc2m7hLGRl7r6G/i1zdDXHNL4w=
X-Gm-Message-State: AOJu0YyQIBJlZPmEcZV/c4nFF116tFvupeWxzUAr8XuuSm69AwK48TJf
	Ob5rKdSXNnUw2T7czCZf469tw/272bHCSS6nR03alCcP5L/AWQSUADvaqj3aJr4=
X-Google-Smtp-Source: AGHT+IHz7uEirOiTQ6nUGo5cn1c95MQa2CNHbq/vvNf0n1UrWoBuifyOgUpJWz1pEK/x5Eg2R4xW8w==
X-Received: by 2002:a05:600c:35ce:b0:416:afb2:1df1 with SMTP id r14-20020a05600c35ce00b00416afb21df1mr1507548wmq.7.1712740863156;
        Wed, 10 Apr 2024 02:21:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:49de:129e:d25e:c803])
        by smtp.gmail.com with ESMTPSA id he12-20020a05600c540c00b0041562a58b75sm1650891wmb.13.2024.04.10.02.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:21:02 -0700 (PDT)
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
 <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
 <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
 <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
 <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
 <20240408-numerator-escargot-a642507a598e@spud>
 <20240409-shallow-voice-c84ed791bc7d@spud>
 <dde59dd2ef4da81528e31f65844e0b3f.sboyd@kernel.org>
 <b9ee67f1a6d782e6b6ee9e273bc8c6fa5bc1813b.camel@pengutronix.de>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, Jan
 Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael  Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's
 code to separate module
Date: Wed, 10 Apr 2024 11:17:14 +0200
In-reply-to: <b9ee67f1a6d782e6b6ee9e273bc8c6fa5bc1813b.camel@pengutronix.de>
Message-ID: <1jedbdpo8x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_022105_178789_3BDBB586 
X-CRM114-Status: GOOD (  26.88  )
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


On Wed 10 Apr 2024 at 10:56, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Di, 2024-04-09 at 19:27 -0700, Stephen Boyd wrote:
>> Quoting Conor Dooley (2024-04-09 05:05:37)
>> > On Mon, Apr 08, 2024 at 06:05:51PM +0100, Conor Dooley wrote:
>> > 
>> > > > > Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
>> > > > > starfive-jh7110 drivers are examples of this.
>> > > > > 
>> > > > > > The auxiliary device creation function can also be in the
>> > > > > > drivers/reset/ directory so that the clk driver calls some function
>> > > > > > to create and register the device.
>> > > > > 
>> > > > > I'm undecided about this, do you think mpfs_reset_controller_register()
>> > > > > and jh7110_reset_controller_register() should rather live with the
>> > > > > reset aux drivers in drivers/reset/ ?
>> > > > 
>> > > > Yes, and also mpfs_reset_read() and friends. We should pass the base
>> > > > iomem pointer and parent device to mpfs_reset_adev_alloc() instead and
>> > > > then move all that code into drivers/reset with some header file
>> > > > exported function to call. That way the clk driver hands over the data
>> > > > without having to implement half the implementation.
>> > > 
>> > > I'll todo list that :)
>> > 
>> > Something like the below?
>> > 
>> > -- >8 --
>> > From a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 Mon Sep 17 00:00:00 2001
>> > From: Conor Dooley <conor.dooley@microchip.com>
>> > Date: Tue, 9 Apr 2024 11:54:34 +0100
>> > Subject: [PATCH] clock, reset: microchip: move all mpfs reset code to the
>> >  reset subsystem
>> > 
>> > <insert something here>
>> > 
>> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> 
>> Looks pretty good.
>
> Yes, that does look convincing.

Thanks a lot for the example Conor !

When it comes to Amlogic, I think the bits of reset instanciated by
clock drivers could probably share (part of) the code of the existing
amlogic reset driver. Some have toggle only, no level, but it is mostly
the same.

I'll try to have a look at it

>
> regards
> Philipp


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
