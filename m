Return-Path: <SRS0=DBdr=XJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E34FC4CEC9
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2019 17:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 519E42054F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Sep 2019 17:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjzkF57r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="uyP7JgLJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 519E42054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8OCAXUtRRdGkhowEYEr2Inn418dKa7sBn1do+Z1qbc=; b=mjzkF57rvYO37N
	5tdgE8Boa6g2jNhcEeXpIBhjF/9tfNGDhyp5Zx4urMC9MQzxz2fLE9WzmxiVA2eNQH8tWHU3VYvrA
	4g7E/YonzTkA7FMjjKKp9WnctHtZ3jcA+ywnzTaRPn925viBSbhazedg8LNtjBHf0n4eGTmQur0hn
	g4GDQonMtopuyNCCA7GLtyVjd2RqAALTK1UoTfl+GK4uJXAnoP0ZFMGV3d19W5Pt4lbl0cLBZRP9H
	UBL3UiRq/ZFpeHsi5yhD+APjiaI0DT2wcwHT/fY8te5VWawTUc/czMfiu2OgCqqpuK7uA2/VZyEVI
	4DzayDP6hKhD0G2zVlrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9BoI-00040j-Ac; Sat, 14 Sep 2019 17:26:10 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9BoE-00040O-FI
 for linux-amlogic@lists.infradead.org; Sat, 14 Sep 2019 17:26:08 +0000
Received: by mail-oi1-x243.google.com with SMTP id v16so5162962oiv.13
 for <linux-amlogic@lists.infradead.org>; Sat, 14 Sep 2019 10:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEU3Vq66btO8h2McFVIKj0tMUw48c9orqQSFYLNd9xs=;
 b=uyP7JgLJbfgbS/le3OMX+P7UhfZu8a1VCacW8LH8gP3q3S1NGpnfPARIFu718sIU6b
 wfQ1iOdUr0UA339aEZxtoFXKdFMMlO8hp9cbKgA45ID5I1QLTbuFsM5BEgZ6LKKRNFee
 ZYJvFULQ/LpVMj0EKjYBluGsCUMSq80yx9gZDXHCV1WUyHwFU0bVyiYU6t0+2p5jrYLZ
 Jw5hYZUhl/DNyHn+nu06L46uROmyQnd/lCTemND9ZZcNdXq8U21Q0IUjwzmn0hKriuVQ
 /6zQQzE9m4vYips0OnN/6celpDSKa8mB6mnOgTVlLIqNKFTKTTsmgiYekS1MR0B/cbXO
 2ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEU3Vq66btO8h2McFVIKj0tMUw48c9orqQSFYLNd9xs=;
 b=D4UhBpDNYW2PEkBP4AyFRJwUzeJCwilWNcaSXSpplWqQOzL4qEwzdwYAspbwMCx1eH
 IXf+c2qZDZifJZJG5uFLBfj7Eh9QshfZ10yU4y8FrcRzUbpqjb/PZzSl2o6W3/kvdxPy
 oS+7Y2/MJvJ2ljjkxXiy2IX7LMiUsi/VFFR/3l1I2yVu5yo9AQk+WV285obb59zzJ/tI
 WBlGtGK3FOV5YkQbB2Ix1FGU4341F224TcAB3He3/YLTY5wnyd8eNQPjybRN+eUYG+Lw
 J4QkslJhpKCn/6Unoe8OXCAhArOPXGjDbXaxQJBaxv2b+nK+KJjjdBTdJu6i/Gd84SZK
 SItA==
X-Gm-Message-State: APjAAAXS52WV+MhjFHgsxyOalW3hpVTBdbXjPhYHK5qmjLkUjcrLXGP3
 IzYw2w6IVRI6o43QPTtNjl5bCAFyg5+FF1oQ4sQ=
X-Google-Smtp-Source: APXvYqzK0H5zUEdOzFIVK0V/x5t+2bTHmhGy3LA9aWyubA2MqZwc0kNEBhr/iQI79VOk1dnfCQ/Ksfi3qexx6c788bc=
X-Received: by 2002:aca:3ad6:: with SMTP id h205mr6489381oia.129.1568481963863; 
 Sat, 14 Sep 2019 10:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <1cc32a18-464d-5531-7a1c-084390e2ecb1@gmx.net>
 <CACRpkdY=Jema8LmeF_k47gQsdxTHPi5sVCYM3ihe47=bw6K4cQ@mail.gmail.com>
In-Reply-To: <CACRpkdY=Jema8LmeF_k47gQsdxTHPi5sVCYM3ihe47=bw6K4cQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Sep 2019 19:25:52 +0200
Message-ID: <CAFBinCDom6OHuUxVxQxLNX+ykgSaNEEZnqw03-NUvvxAVvUN9A@mail.gmail.com>
Subject: Re: [BUG] wrong pinning definition or uart_c in pinctrl-meson-gxbb.c
To: Linus Walleij <linus.walleij@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190914_102606_545135_C801DCC7 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Otto Meier <gf435@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Thu, Sep 12, 2019 at 11:21 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Sep 10, 2019 at 5:01 PM Otto Meier <gf435@gmx.net> wrote:
>
> > Hi i tried to use the uart_C of the the odroid-c2.
> >
> > I enabled it in the dts file. During boot it crashed when the
> > the sdcard slot is addressed.
> >
> > After long search in the net i found this:
> >
> > https://forum.odroid.com/viewtopic.php?f=139&t=25371&p=194370&hilit=uart_C#p177856
> >
> > After changing the pin definitions accordingly erverything works.
> > Uart_c is functioning and sdcard ist working.
> >
> >
> > Fixes: 6db0f3a8a04e46 ("pinctrl: amlogic: gxbb: add more UART pins")
> > Signed-off-by: Otto Meiergf435@gmx.net
>
> Looks like a simple fix to me, Martin could you take a look?
this looks fine to me based on the description on the Odroid forums so:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
