Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045FFC54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 10:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1CdSS7bZiFIVpqL3Ktnza2UGpFLghf2hYCD5wByZljM=; b=kdcdiHRMKMHSLF
	f+l6CkeULUHkfE6AmBZiY/Oq3MBzkwp5Oe9bn0489q0ptpdsuIivhJtoLO/zMSUefDCQ+bNOSjaNc
	Gt71RV4ZpcN/gCVCOTLZjmGCsQAy57kxOMp6WGOnRAJYytZ1xG8PIFuV/DP3i1rIFSRZStsXNTzhU
	hLcOIfIu6yFgXTsQ2Fdynb1TPDLn27fdOFwsSaJqjonyJ8mAfztdObK/1oAz0B5NGopi24glWjbBP
	IMIsvhuyc5us2J3bj1Vvao5M9n5rDTObiiRckf1YOOWjslO2YuiG8aWax+6oFUf4uwGrWPaoYtRiM
	DxHBmYx1ujq1bonxk2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmATy-00000008CVP-0G72;
	Mon, 18 Mar 2024 10:44:42 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmATu-00000008CTb-0rsr
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Mar 2024 10:44:39 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-513d717269fso4090987e87.0
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2024 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710758676; x=1711363476; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=KCGPrCwTOITqjTnhSele0x2XpulUBe47CHNWCd7XesU=;
        b=Uu5vfr1P9IvE08CbuxWcpTCzVx5yb6ICXJh1EQI09BSFOJvrw5QFYbNbNdJDomHqDq
         54w33YxELWz8VZKy6fJU8wTPdtPnztsRKixDNlW++6AQfD7mlQYnwcWclPHyaljACDSU
         i1WXJXM6k46h0DCVq9Yh2l/9c03HIlATOXO9m6XrVKDrBThY6FZmz45Rjv7AglRdjIk3
         I2pPfv2WTpJKNOLHVBsS6RCVKA+SEJXLZ9qPGlStDzwIwIeLvSwPon9SxxAtN/a1xgZm
         55wjntqnhhZ8pjZmAK91wAH0BwwROISUnR3Xi4j52wF5MFqcCYmTxqPfQvth9huRcj7x
         wxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758676; x=1711363476;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCGPrCwTOITqjTnhSele0x2XpulUBe47CHNWCd7XesU=;
        b=GhlVX+OeKEOW+i4O3k19hEGqDVHEj0hquKsCKH9eC5plTIDZwS9zULNxCjbKch/RHj
         /ef9hHtzf0J8ppLEbNVYfBWsfp/vFizTtZ/pIjg6bKR33QoYLSF0P4UMU2+MJX1jYHlG
         m2COMPFXLoizhQ/4Sm2ZB9doQuWR+xBRI1wKWvdLAmfwkdq1zwGTxuBF+a9LFPvLhpkH
         rVhmX4wCinvBqstytCY9WOf/vgB8i/RI5CHdtuZbRPKs2P5ErHXSaiCXs4HTo0Qcg72I
         iAgAGHdWVf1y2g1LSooy6naXKO3I4OVCRiUx2yqv8Os5u1FeQAeivTg0seRR8CBz2AJI
         dcbw==
X-Forwarded-Encrypted: i=1; AJvYcCUyTw6KNmdoR3OG4P955iQhc6PsrDJUrsbvYbFH7hDnpWm52+SppFNoiCstWhzovgfNUHuaoEMB5/0e/fsQmtPlSiH9UyMr72XxRHaJzFp3vo8=
X-Gm-Message-State: AOJu0YxxN/kBxgTIS6TpGR/lRk7lf5cJzcnlv325YGdUI4N+th0Axhhv
	HzMyfwon3wWy62LZEmKCSjKDMgqDjkBKNCmMyzZqK6LIfrluvjIqN+JwDz7ifr4=
X-Google-Smtp-Source: AGHT+IHrBhAsRVSFIOS45FQu5E9/DGiPnUOBufbspQxtJ2p2r6r0OzKNwEix9BKbpaZlbyfnUT+a6Q==
X-Received: by 2002:ac2:494f:0:b0:513:c963:895e with SMTP id o15-20020ac2494f000000b00513c963895emr7169639lfi.42.1710758676166;
        Mon, 18 Mar 2024 03:44:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e4d5:78c0:18b:ad85])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b00413ea26f942sm17214532wmq.14.2024.03.18.03.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:44:35 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
 <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
 <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav  Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1
 SoC family
Date: Mon, 18 Mar 2024 11:42:20 +0100
In-reply-to: <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
Message-ID: <1ja5mvhl9o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034438_300232_EFBFE906 
X-CRM114-Status: GOOD (  12.80  )
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


On Sun 17 Mar 2024 at 18:19, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 3/15/24 16:33, Mark Brown wrote:
>> On Fri, Mar 15, 2024 at 02:21:45AM +0300, Jan Dakinevich wrote:
>> 
>>>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>> -	.reg_bits	= 32,
>>> -	.val_bits	= 32,
>>> -	.reg_stride	= 4,
>>> +	.reg_bits		= 32,
>>> +	.val_bits		= 32,
>>> +	.reg_stride		= 4,
>>> +	.max_register		= TOACODEC_CTRL0,
>>> +	.max_register_is_0	= true,
>> 
>> If the maximum register is 0 how does the regmap have a stride?
>
> reg_stride inherited from existing code. Apparently, it was meaningless
> even before my modifications (the hardware has single register
> regardless of max_register declaration) and it should be dropped. But,
> is it okay to remove it in the same commit?

Yes it has a single register, for now. Still the stride is 4.
And assuming the mmio region passed from DT is correct, I'm not sure the
hunk is useful at all.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
