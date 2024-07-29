Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30EBC3DA61
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=++3j2xyVpDJTFRtWr6BjlYiDPnNEvNIDw9ELrh4Q0ck=; b=ha7yaDKlstWq05
	uciClb479c5kKOHqkAgUz7N5IDyDcuDf3oVj7IYxVqrXRjIwpFFgdfAXe9dn1oI9LtETcRmNN1nLP
	UztLKEdsOEeZP0MJ+pQOUoJSdRwt7zjbFYOFo4SFEr94qK4pBFuIJvlezneYd+TYBgtwgxmbgV31k
	4+zRBUrd1qZvkl+wbpkx2WaQWtt2NKRduHrl4O8gEj/P3gPS2DoGIEpq2uVX4tk3ab91IJHs/R2L2
	c67fNk39vBHmAIUYgiJk9Nhr6CYH155XDKG+aWQGF/qSuULmKKwL5+0XAqKrZjLZ9G3oeDOkZhld+
	YvYQ2CvkmuiJRIbquOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSki-0000000BvSu-49jC;
	Mon, 29 Jul 2024 15:57:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSkH-0000000BvP2-0h93
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jul 2024 15:57:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3686b285969so1413253f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2024 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722268627; x=1722873427; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQJQXLHnlv/DKOapoxTHZwq5P+QBGMyJlUyNZAowiSs=;
        b=Ca5ht2+bqM77iNaNmNXzI3/izW0dUAneuHj8Vo9ftWwYA2WydcEsqN3UGYF4xW6UBx
         /e3gcFETlgO3CgV9OVu3oWZzm+fvwY19CzewQySWMB6tcmTQ54P2QvlBvzv2y/gbKt3l
         AdkSMRfq2g2htfJWe09TGhVhklWULMgQZoD8NVm1xXj73CYnhh7Fx8bZLpYW5yrhvxAm
         kV8HSoBugHllWahMwSLqnFK91NZVfKWANTbid3h04LF2VRwPtpKrRBfCcxyWhRS4AGoC
         biGC9PALaBvejkV2VZ0f+fKdmNAUXpMlMW6vqxJZG4K1ZdHw+XgbFsa5FM/YrwyAvhoJ
         pRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268627; x=1722873427;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQJQXLHnlv/DKOapoxTHZwq5P+QBGMyJlUyNZAowiSs=;
        b=tVdNMaIl1RuPyInQRocJgeC5t4I9jQAxNeqfbvndxF/BTN5kbKcE6u6S447DXVk4QY
         l8c8DqeEunAyFHKIIFTzEoQW+6MFDPCf+FGxsD3dmfvukG0OkpWSc4GUdAOZFKzhEgYU
         a7bQOpYGzgs2tD6faikHTx2xwhLceiNXDMHWzzoWcuDU39eMXNBSkkiCoixa4auqWYup
         7l6/XCTexk/GpGFhKLyqRl8IAmOSSbY/MRAzIozDkFY0evjcYC6BXi3MZjuzEcki7EEV
         mtKQulQpU5zoRmGwp+PueJA4yA2jsfKl/99E6spVF5c90MpcANLIJbTciXQrlgY2RBIp
         ZM+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXF8/SdSlAodhnTxp+dwwZNcxVGdyMC4BJdKRHFBeHMY6MugfMn4THLxc+4ayffz+WEMDIjX0g4ygKVqsg0i/idCVBOVHPBTQ8pDaQXKXsR4dQ=
X-Gm-Message-State: AOJu0YzEfoxRls4vGOZ+pz0OqpeACF1q+1MdXkuXsh65a8xwNcBL5mQW
	Yj/1ojKsMXWAiiXoIXd85i8h3y1Gdep9yZw+g0Tg+Wc9UMo+0yzVenxzLa2Ha6M=
X-Google-Smtp-Source: AGHT+IEBBx5LsAEMyoM6oe7rtQrWY0rnpjUL/ghKQBCG5QRwkixQ4Ro9RCrukrZIHEiRAWSLTz45yw==
X-Received: by 2002:a5d:6347:0:b0:35f:10ac:ea50 with SMTP id ffacd0b85a97d-36b5cefc0afmr5637864f8f.37.1722268626835;
        Mon, 29 Jul 2024 08:57:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b3687003dsm12532306f8f.115.2024.07.29.08.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:57:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, linux-rt-users@vger.kernel.org
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk> (Mark
	Brown's message of "Mon, 29 Jul 2024 16:28:56 +0100")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
	<1j5xsow839.fsf@starbuckisacylon.baylibre.com>
	<7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
Date: Mon, 29 Jul 2024 17:57:05 +0200
Message-ID: <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_085709_210504_84E61D0E 
X-CRM114-Status: GOOD (  17.36  )
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

On Mon 29 Jul 2024 at 16:28, Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jul 29, 2024 at 05:06:50PM +0200, Jerome Brunet wrote:
>> On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:
>
>> > I don't recall this coming up much TBH.  It may be that people just set
>> > raw spinlocks when they need it, or that there's not many people using
>> > relevant devices with RT kernels.
>
>> I have not been playing much with RT TBH, but AFAIK, with RT irq
>> handlers are threaded unless IRQF_NO_THREAD is set. In this case,
>> something preemptible in the handler should not be a problem.
>
>> The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
>> unclear here.
>
> Yeah, it's definitely likely to happen all the time for people using RT
> with relevant devices.  I'm not sure I have a good sense of if it's
> likely to be a nasty surprise to switch raw spinlocks on by default when
> it's currently controllable, I'd expect it'll generally be fine but it's
> possibly a bit rude to any users that don't use interrupts...

Indeed it is bit radical.

My concern with this patch is that, IIUC, the handler should be
threaded under RT and there should be no problem with the spinlock API.

Adding the RT folks to try to get a better understanding, they should
have been CCed anyway.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
