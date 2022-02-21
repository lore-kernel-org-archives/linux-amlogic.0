Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5901C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 22:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkzcoUpWNJoSVIs0+HTVeELlqUC2BySwvgqqSDcu9C8=; b=kVXcEgoV0xTyJB
	+EgBJ1uHbOxHw+BdFkFDgUyv0b5k+vDXEUpgfABh+2O/RAix1uwoliNLtnW/QRMBOjKg8QLqpXdU9
	Q9yxJxZhlVx9J/M1urS5OQnvPggKYZQxsfAxbSVBs1n/ZY5UPTpmNzimglq9yjTwrziTwPrOqCHWA
	UmtwtNzauV5ffxPQIwP4bp9iBIwLPch/5Y4F/CeUNtxBNgkVPeGpi+j1EhKt/I7/I6qSblmdX7Fry
	GtQgEfE/c+BbNslXDDYLCmS7sR/uelrhLofiMU5l1pAF81+vNxbzQ/5lYiDK2QenmZ68crXOdLxHn
	8jyfP3A+mL1Vhp65qqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMGtO-007LKI-0Z; Mon, 21 Feb 2022 22:10:50 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMGt8-007LHS-Ar; Mon, 21 Feb 2022 22:10:39 +0000
Received: by mail-io1-xd33.google.com with SMTP id m185so17724965iof.10;
 Mon, 21 Feb 2022 14:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z+rAJszSEvmqBNoUmCp25Rx7tCIKTIKIJ/vzygiTiNU=;
 b=S7pZm6u3CUoSRWhIevbFJ7iuyoYizjOdMSrxZ8r5RYDp1p/T4i4IpM0PCpfmdSAVcL
 UspswO6GnBhtK4pnq1X6wszMSj9Qbsyo1bmUaKtW5ECHW+tAFw/cx98GWGBDlrl/ZEbm
 /us86SMszml4cBbd63fB8JUK3oLLh+VA4qLagehggzFdAXcivvtO6gvP7v9QqVDieBJk
 PqYhMZFivFCM10K4TFHmmcpRLeSofD39RY1xNLxwjRSoXzkpHbiwh2Zd0HQ3keaph3qb
 DrH064wnjRX3k7hlMa9QPxwj4aVFWmTjvbcD6ssLzl1xv9zmUa4ADZ4sR37IKZwuF4HQ
 no2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z+rAJszSEvmqBNoUmCp25Rx7tCIKTIKIJ/vzygiTiNU=;
 b=lKXprlRYr6nS9PCaffHmIznWU56NeNKXHbvETxn+TrwnqdHSq29ad8cklGnAAIuRGu
 rvkW5h9pN3vuQk0JPAGR7ok4Tm9wPHvOCFZ5L4aapJyvqKNlqPyE4B6gwUEq2jDLd4lY
 U4BYYUeoBh3dF+boda/Eavm/z5vnBCkW72NPnAit4hdnm7bzRGGX4bCfBBvv3UFGdvYF
 PU8wXqEPCfBoCyhOxIkJ7dc2MKOlKe3TtNxjdrrAR4ksOFWKpSjPX8EFNuIYxG1maYBa
 J6mIQ+zBHdakyuBmxUBw3ZbdXc/yA6oEeXI+8CHYFMnO4IDUhFRdzyPxBjkcPVeL1dW8
 tA2g==
X-Gm-Message-State: AOAM5339pam5polHhuFF7dpbBnqiTkUy/GbQ0Q7iSad5zsCl6HXHlotW
 YTEgm8mtPaQcfBLu3R1yCwtS+qKhBrq8hqt657A=
X-Google-Smtp-Source: ABdhPJxtX6h0gkfIJdOs/LpUaxa9CUaWdh6MY9eyTlILX66v8ZCa3R/8q03D8mwPRfzvvOim7xMhQagxBJ4rkaaFK7U=
X-Received: by 2002:a02:a1ca:0:b0:314:c448:2a4e with SMTP id
 o10-20020a02a1ca000000b00314c4482a4emr10360369jah.186.1645481432583; Mon, 21
 Feb 2022 14:10:32 -0800 (PST)
MIME-Version: 1.0
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
In-Reply-To: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 21 Feb 2022 23:10:21 +0100
Message-ID: <CANiq72ko6=dYBvbRc5T7Qq_2mxRtq1NpvcV_saMbTDfz0PK1aw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda <ojeda@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_141034_403359_E4EBD6A6 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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

On Mon, Feb 21, 2022 at 9:19 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> v2:
> - (re-)add Andreas' SoB to two patches

But those were also developed by you too, right? i.e. it should have a
Co-developed-by too, otherwise it looks like you only handled the
patch:

```
Example of a patch submitted by the From: author::

        <changelog>

        Co-developed-by: First Co-Author <first@coauthor.example.org>
        Signed-off-by: First Co-Author <first@coauthor.example.org>
        Co-developed-by: Second Co-Author <second@coauthor.example.org>
        Signed-off-by: Second Co-Author <second@coauthor.example.org>
        Signed-off-by: From Author <from@author.example.org>
```

Cheers,
Miguel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
