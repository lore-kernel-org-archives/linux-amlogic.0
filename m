Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E5AC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+hGXQlrN1QOTF5YwzFuj/Ftld22IqRKSfrV5Fjxj/g=; b=AvAtPw3UvNwyO2
	Znot9MZiy/hvHgzFbk8GLGFibR5xNXYU0cJ0e2/zggHzdgVIvk6YqWNGJfilo3/EymZZXeCYxgdWy
	l/MPgBVqkHxSCeIfiIBGBv8uxdltioYCWMbGYZkxUC/RG6ocBNWQtYEkpe8Wv3pCXLPcDK+cDtdgz
	alsG9ZxDX6EvUNvtdzdA7iPXTr86Na3gxZLR8PHITE9tUmoJSK6cHWomOa8t/LC6z8CNybzHD+vbs
	UjtXXQVBNorMmmblVj7Q+s/js0p2e8LtGOEBeyEnRRCXOJV7aXKyWJ3xh9eQZ64jTMO2O6L6LU3Qy
	M/AB5tW0U2/ks2bQPWCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwqba-00B4Ao-Eh; Mon, 13 Dec 2021 19:03:22 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwqbH-00B44R-MB; Mon, 13 Dec 2021 19:03:05 +0000
Received: by mail-ed1-x535.google.com with SMTP id r25so54916521edq.7;
 Mon, 13 Dec 2021 11:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LeN3kbi55XVQRg6vbM+PWPeSllCrgBWLk7uQ5eieCqg=;
 b=APcOG85AMzDYSGEB1dcrV+EUsa5duzreFvCy0d6ooQ8V8oJ9of9hksV0Ws7pj4bkeY
 p9tBGtPU+burvEAicFUYzMErHgKrxF/5fNywrqsUoJEULYcS5YmPtC+c5DcFQGLot1+C
 LZyoXDlA7Ek1q6oATQbBuPb2Qtjo03g/nOVjHi/4+NgmHMIA5S9C7yM2S6h0IonYFgvO
 wMSmbD8hpFbhZc7cRyJE+ck4xmFd8HcDeRgIBrFhofBHv8eTb48ehsROtN1gdRd2Bbx3
 MHIUgBd837+IP56Y+R389tjuObyrUHKm6V2Me+dAmL8ZRV+OY8J72MnOY15VWnNxAI2U
 vL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LeN3kbi55XVQRg6vbM+PWPeSllCrgBWLk7uQ5eieCqg=;
 b=cHAkAuyaMqaXZPpRBBV1t2/ht+vN/lOAU/7TcsM/ZJj2nlm03WtwnSc9pYUvBNPZRA
 Gx7dy4hg4OP8PzsDRM6DWPPwlbtq07oDiR5qKPjp18UImLdg7TlfhNMsfCFhgK+zZ0tJ
 qfbKQwZBJgqPeeskvhjlFW0Td+UPbCNElF/k0VrtgCHjV9LnOrA+AHNUfisKEF7e+oQO
 t0zzF5R9elK+FJGY8LaBIHWK1ncMuJKVb1pCiSpIVkkkzNnRHy5BH17krhxLQVTpUgWS
 fg8yCMUoexNc5fty0GvCuX4jrvz59IP0rtB8y7Gb1T5xNAVLzK+z2fe6Cvps4rrxC+3S
 7/lQ==
X-Gm-Message-State: AOAM531lZAe3mzIf0iChWYjcI+fjkaJWhDd9ic0z20pKmgklFGRFdhQE
 etKZUJ7PAypROj6MNyDu7X9rI+g5apGnNAatJRw=
X-Google-Smtp-Source: ABdhPJwPfMU/ScF1cDvqpPXDKs7AbSF/i2iWIwCjFaiQeSQYEowfwZ0JqRB1+ZY7awkN+Ma1J7SJj+8/6b0FSOD9Q7Y=
X-Received: by 2002:a50:f189:: with SMTP id x9mr808222edl.95.1639422181187;
 Mon, 13 Dec 2021 11:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20211213070330.3351505-1-rong.chen@amlogic.com>
 <2021121319503910358221@amlogic.com>
 <1j7dc83acm.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j7dc83acm.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 13 Dec 2021 20:02:50 +0100
Message-ID: <CAFBinCApJoC11S=weDwmVFAQNQHDfiBNSuO21KO=2+rsc4cJJw@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson: initial ocr available by default value
To: Jerome Brunet <jbrunet@baylibre.com>,
 "rong.chen@amlogic.com" <rong.chen@amlogic.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, "--to=1131046452" <--to=1131046452@qq.com>,
 45581586 <45581586@qq.com>, linux-mmc <linux-mmc@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_110303_787724_ED71D4FC 
X-CRM114-Status: GOOD (  11.51  )
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

On Mon, Dec 13, 2021 at 2:25 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 13 Dec 2021 at 19:50, "rong.chen@amlogic.com" <rong.chen@amlogic.com> wrote:
>
> > Hello,
> > If 3.3V always-on power source for vmmc is supplied by hardware boards fixed, don't need regulator in software, so  .dts unnecessary the link between regulator
> > and MMC controller vmmc/vqmmc.
>
> Controllable or not, your vmmc/vqmmc regulators should be described in
> DT.
I agree with Jerome. Here are the two reasons why I think that it's
best to describe these regulators in device-tree:
- device-tree is there to describe the hardware. It's especially
useful for non-discoverable information (USB and PCI IDs are
discoverable examples), for example: voltage supply of an MMC
controller, UART IRQ line, ...
- reviewing board.dts would be a lot harder if we rely on defaults
(defaults which cannot be described in a device-tree schema). For
meson-g12a-radxa-zero.dts this means we could omit the vmmc/vqmmc
regulators for the SD card slot but we need them for the eMMC (because
vqmmc is fixed at 1.8V).


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
