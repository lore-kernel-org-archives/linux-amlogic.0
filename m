Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59344D69112
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Nov 2024 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRf8l6mPS1zVxM4p9BWh3Oq5YsK3gUJSiuAEbDBXp/k=; b=Q9ejr4LtxsTXHI
	ytU2J9/TGxsxQ/aAy13cRfDtOP4qCPAnsapacFuJSBnuUssNtODrb/H6L1mbIG2lKE2FJ1jT4+Yc0
	CKfL76D5cNMghFyFW8YV1xoqkpcWPx6ik6fJekspkcVmIygUGCaIm9GJlGD1LcOMBpzjArKC6SleS
	HedgrYHskEaXjQmsN20aQRpG0eiXnerv388DrYyixtPAwNxM9+zMXGOJwt/ZVQVaEAqgVWhXiUCtj
	mXEVChNbF5VJBtGpVZszJUCh3j0RXgT5ch+k/4Vvd0K8wiL1vo+Ph1nTD0S6xsxkTX5lG57qw1WnB
	SrcGtzgbQGUs195wkvaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfgU-0000000Fmhk-420W;
	Thu, 28 Nov 2024 14:39:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGfgR-0000000Fmgz-3O5B
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Nov 2024 14:39:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-434a95095efso12088785e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Nov 2024 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732804794; x=1733409594; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9T03i0gzxNbf0agsZ7Lvsc1uFwXMAZb0xxRBoFTc9Q=;
        b=1XlqCKXgJ3AP6wHkL6LaDWGFSXFWFHTHogIIXblcxHSlvu61dQ1nzdbca9JLjBN+Lp
         bOr17WbqWACtheNnIWkHFk3+gg7Vl8i2QGY70EDRmfMvuhsGl2BKX+9Owee3juXJyiA6
         MQ/UWq928InOafj7C/gGp8Exc7t0E81HC96adASWJ/lHTrGq3nhNhjDSsNq+r2xYMp6H
         mzi3daKeFXXucAWeOmXKKnD824FyDK5fjIvpM592Wv92LbaeYCckDla7Fz0OWvqFdPEB
         vEZOQ1OImzGg9tRgolObKFzg0/3nP4KDUdZ/fYsKVwBaLzHICh3xYc9+36UMi5iIWuU0
         r4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732804794; x=1733409594;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9T03i0gzxNbf0agsZ7Lvsc1uFwXMAZb0xxRBoFTc9Q=;
        b=oNgbfEs6EAYd4GkpyS5BfPcNlmAMzIPxkwU+yoHQukljgiWKT7aci/O8EUdqC1JdiO
         Kbo8Rsjrlx27wrdA5zMS9ZnmDLL6Fqo4Oe1baXHj7fQ/9e9d+GpIC0dT6X3UGyLJbDDE
         tk+SMbM5erE5mlAUqfZ5SVNRgB/vgXsewrHdHgHNYPNJpuBylF64WEpDZKDHStbPJQ+j
         1Cu7PPCAAQZsCW2O0J6uWkSJFCkJZulRM4ksBTQ5YqsTRuNiquCMIm+oEFer6B+kVrxq
         33Ve7cQm46E5qstawtVNNwtuoXd+e1VQtuyY+puBl3SXZvxJ1Al5ZEu8Hm6Kh9QmSuN4
         NyQA==
X-Forwarded-Encrypted: i=1; AJvYcCUjJIma3Xo6O+h2fClYdzY8BUMvOQWTHkAOaonK6A5ngU9C++36h4Gm2g6oUPxfECcNoNVvdYONimmbOBkz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6CRPuPGSTC+0lQLDhnTqOw8pDn+oMPWQyh6deEmtKgCcNjhZA
	wa28P3eNDWftegje4jm+dcEndTNXS0vlJ38avfVqZNm1lt4fdob418TyyMxmbCw=
X-Gm-Gg: ASbGnctkw5Mma6B+JpUd4zLjOPgYuHe0invYKI5Kw0h7jKn14YqRokITHP2tm4mdJWA
	tST9T+9970nTosWSqdQbBt00qsga4NDGfLGxdeuuhxPKIvphfKidoyLo7uy4FtjyJwhOO4lPzWi
	gmavH/9vaqXc6UoE9EHb58rYhpBtcVupiS0XKe3KL8dFl581dOhfSgZmGDbibBrz6hgCnQ4N4+i
	6K6J9/IPSe88g4WwKsaNBt11E+EFgUWmt3RY4ERi4GSuwYAjQ==
X-Google-Smtp-Source: AGHT+IEfrnXry/a2J249x05WOVDUYdJwm8BHrIV6ctpYLw6UOC+tPaq9w6TaP7uwmtjWNU3Zv+M13w==
X-Received: by 2002:a05:600c:4fc9:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-434afba0023mr30871715e9.6.1732804794064;
        Thu, 28 Nov 2024 06:39:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:b89d:29e9:7047:2d6f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd802e0sm1792177f8f.105.2024.11.28.06.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:39:53 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>,  "Michael Turquette"
 <mturquette@baylibre.com>,  "Stephen Boyd" <sboyd@kernel.org>,  "Kevin
 Hilman" <khilman@baylibre.com>,  "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  "Mark Brown" <broonie@kernel.org>
Subject: Re: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
In-Reply-To: <306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 28 Nov 2024 15:11:56 +0100")
References: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
	<12f29978-c8ce-4bee-a447-dcd086eb936d@app.fastmail.com>
	<1ja5dk2y5l.fsf@starbuckisacylon.baylibre.com>
	<f8de4a2a-776f-4c10-b75e-e845bcc38dde@app.fastmail.com>
	<1j4j3r32ld.fsf@starbuckisacylon.baylibre.com>
	<306b0b30-5a32-4c7c-86b4-57d50e2307e8@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 28 Nov 2024 15:39:52 +0100
Message-ID: <1jy1131kxz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_063955_841975_D42C8ECC 
X-CRM114-Status: GOOD (  19.78  )
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

On Thu 28 Nov 2024 at 15:11, "Arnd Bergmann" <arnd@arndb.de> wrote:

>> All clk, pinctrl or regulator are used by other driver yes, this one as
>> well, sure.
>>
>> What special about this on is that it is an auxiliary bus driver.
>> It is directly instantiated by another driver. That's where
>> it differs. The axg-audio clock driver instantiate the auxiliary reset,
>> it does not use it, which is why it makes sense for it to select the
>> driver.
>
> Can you explain the logic behind this design? It seems that the
> entire problem here is the split into more drivers than it
> should be. It's common for clk drivers to also act as a
> reset driver, and my impression here is that you were trying
> too hard to split out the reset functionality into file
> in drivers/reset/ rather than to have it in drivers/clk/.
>
> Could you perhaps move the contents of
> drivers/reset/amlogic/reset-meson-aux.c into
> drivers/clk/meson/axg-audio.c, and change the exported
> symbol to a static function? This would still require
> a dependency on the exported meson_reset_toggle_ops,
> but that feels like a more natural interface here,
> since it's just a library module.

That's what we originally had. Reset implemented in clock.
I was specically asked to move the reset part in reset using
aux drivers.

https://lore.kernel.org/r/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org

Eventually that will happen for the rest of the reset implemented
under drivers/clk/meson.

It allows to make some code common between the platform reset
drivers and the aux ones. It also ease maintainance for both
Stephen and Philipp.

>
>      Arnd

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
