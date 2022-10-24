Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDA6ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Oct 2022 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FCFUovOdE3Zj3TLWo5eugke5Le3UlOZ6lOyCduMpzcE=; b=wS3mh614SdgkMN
	t2VanPfjmhUxBUFpiicmdlOjsE2i006l7jK91TEiSM9czT2uROxWsp1hndbVYzROqss7PH0QTCw11
	Op+pIlDDN74+fjyarirWGA6I/Cu1hod+QI+PI7k2urDFIzG/GHfLLpk4WqEKXq6oOxFAWjHqbf9qI
	XC1L6rRYNUk9wz6CaeBiEAsGR4LhxGIkTcNf9KOfm2728qQL3C4bEL9J0x0QKqb2r7onzH4Bsofat
	klzt6zfKx+GWmmK+zUt5ivtqwS3IPXo7+VbC5VFF1+9VTNrdYn62fhFw6ohFJk5SG1K1TcF8b6DmK
	A1MdzKcZVVwzzL1bhbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omziK-002Blg-Ig; Mon, 24 Oct 2022 15:50:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omzg0-002AoL-7B
	for linux-amlogic@lists.infradead.org; Mon, 24 Oct 2022 15:47:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id 13so6032179ejn.3
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Oct 2022 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k8cUhyF+iRbpVm7ZibvpxWN910TkG4qCMbi/DBVKQRg=;
        b=QCCxpZW74bpelD0cNFpuKewanqSBjPB7XKJWDhBUTh84B2UhnfiEX7GS+upegiuLBN
         GnCLEiGyh2+g1Kl3P0dDR8QNa8afxCSggYk5rMFobYArvjr6oqrzFOf9gS3aSWB4ZFda
         Xp17BhKgvbvZPef2NqX9p2f5t6HDGFD00BTLbhbHBUEGa05KY6EZmP42uKlWCESxSQDU
         2Kg9+7nk8CAJQD0XlnwOFeQBBR0e0NvmzklW0Yz6WsNRJ+5/iRgp2e+8v/YGH2Opus7Q
         DrQdCkgbinCnYan3+pBpZfZw1E5RRsY1RLLRy1yybVUMPQ1b+5k/ni9Kr73H8v8XF5nd
         2tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8cUhyF+iRbpVm7ZibvpxWN910TkG4qCMbi/DBVKQRg=;
        b=iBFQ6lcaegLl/QgUqX55Nawymu1ZHanGDpFEm2qmVg5kb1bKE0owRkyjJyvQpE88mX
         w/cZjGqxxgxUl+0zihky2OslDEDg+a+l1QG990pQ4Es+xSa2dIFdbXk6lgedPaxvFPsv
         LbIF8+OkvW1MGR7GkiEDfco0fsWFuvYJOH0sUG0rrI0Ikx4GO/oa7/Y2RvHoLaiVNR3v
         DVRJ3Q41D5J/hFCu7MhYNrqcikxNoAJSdrOFJ5bidx5JkSAK0+n0+WGxOqiIISaJcHPE
         s7Y4tgapsKd35TJmG3YlFPbA6x+fght1d08kx0cS/HYFXDIHmQq+iE0d+R6zryTAU8ox
         WLPw==
X-Gm-Message-State: ACrzQf0JLs6TrhIX4S0QSrnJEL+2n6bvETdrzsR681bCuVT7QhlqGQMs
	MZfp/PeI+oTvdrjcaJu6ppdzXW1G9F3mOLHVtDTciQ==
X-Google-Smtp-Source: AMsMyM6eSCRZlQsr3x3MX2LJ8U7dR/Lcp1uuiIC6p0cWOh1wq3htWWGbxETJTk6iSILIXgvjOp4IhCLlxGinAjrVdY0=
X-Received: by 2002:a17:907:5c2:b0:77e:def7:65d8 with SMTP id
 wg2-20020a17090705c200b0077edef765d8mr28634968ejb.487.1666626461004; Mon, 24
 Oct 2022 08:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <1ed8351c2cb4911fcda21b97f7a7b089e955c301.1666357434.git.mazziesaccount@gmail.com>
 <d1ed9ab7-6d67-fd93-6a77-86ea029eedc5@gmail.com>
In-Reply-To: <d1ed9ab7-6d67-fd93-6a77-86ea029eedc5@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 24 Oct 2022 17:47:29 +0200
Message-ID: <CAG3jFyvveGsO6VW1q8-aK1psabze5gAN=wCn16+Q4A_KH=WuvA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] gpu: drm: sii902x: Use devm_regulator_bulk_get_enable()
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_084744_310772_C4E983EC 
X-CRM114-Status: GOOD (  11.67  )
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

On Fri, 21 Oct 2022 at 15:24, Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> On 10/21/22 16:18, Matti Vaittinen wrote:
> > Simplify using devm_regulator_bulk_get_enable()
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
>
> Robert, I did slightly modify the return from probe when using the
> dev_err_probe(). I still decided to keep your RBT - please let me know
> if you disagree.

Not a problem. In fact, feel free to upgrade it to an acked-by, to
simplify merging this series.

Acked-by: Robert Foss <robert.foss@linaro.org>

>
> Eg, this:
> > -     if (ret < 0) {
> > -             dev_err_probe(dev, ret, "Failed to enable supplies");
> > -             return ret;
> > -     }
>
> was converted to:
>  >      if (ret < 0)
> > +             return dev_err_probe(dev, ret, "Failed to enable supplies");
>
> Yours
>         -- Matti
>
> --
> Matti Vaittinen
> Linux kernel developer at ROHM Semiconductors
> Oulu Finland
>
> ~~ When things go utterly wrong vim users can always type :help! ~~
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
