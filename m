Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31797C25B47
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Oct 2023 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uqrj5Vy91d0NpBfgWpZGcnQVhc6jsaimUHXDRaUDc0=; b=rOKzmmB/r0vhPP
	1SQ98a3dDw5X9LvR3WoiKUW7+AcXfTBABVVak13Kat6A39aKnYA+qp3lZiLhKPppWK/QE6A9d3NY0
	6jvePt7be/Gh4tW2VFrOdWO+/odV2MFujkupkAxiQ8vEPpZvqmLjhIQQ6vKU9C8nVzvMQlIPb/6dx
	4XBGFexFm0hBZin7lCcPyjV6TH3dJ9Nz6ckcYKzdkeOY3/bKONjy7hanurda5FpqWnl0bAdyLWlMB
	mxpRVgLV7aAEXCt2ORqoNdR6oUzYZE0pmukFb3BDe0iVsmEGTuA6/Mn3Vx60Y13rzL8gxygTg844R
	DQo09PlEOzChrsdWeLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdy3-00CP8R-1X;
	Wed, 25 Oct 2023 13:30:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvdxz-00CP7a-1O
	for linux-amlogic@lists.infradead.org;
	Wed, 25 Oct 2023 13:30:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40859c466efso34089145e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Oct 2023 06:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698240633; x=1698845433; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qc3B3MR651658a+IS4oxOuyfK9TAfTIo7Wzkmg44LJo=;
        b=00jb4YdLika8lU9eFhnemATxfqSOw/S4Wo8CyVTixHIs82ZR0S37VP5njHi3y3nX+J
         e0zMi1hZLxdCzxOYXECzmXyXIKytkzKewg89ircu55umTTxLSyY3jE44PuwaT7+SeeoD
         lYwA/bre5bH7LmE0gaiEQVMrSBAO4nZaWcL2ebzwqpGnuFdzN4j1nyCtN23+85A5+98P
         VyQLA+kFOQc1WAB87CFQLijZXiT1wFiUwQiBdWuVJw/VXWz9zHtcOdd/WgvjAJEnOIJK
         gLDjxXzeCOjb33P0jLcl3cYmcwVJU7Dj6pGv20PyBWg7xQm41IIe9SAtPpoJMJrX1Ijr
         mSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698240633; x=1698845433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc3B3MR651658a+IS4oxOuyfK9TAfTIo7Wzkmg44LJo=;
        b=feVJGu0cRKISy2UgBQRy+loPYeef0HWMnIuZbOUE2d8aU1vEKsavtGvWECVEfPwOnu
         vg/H9OjSwBrrUYtKwYljf97asaPLapo9XO2P5e2rURgF++9YEU7lZCQGVnT8c3WNNWaT
         pO/aUBRdi4ok9ZRMNtfhTvaI/AYELkPyA5c6ExJqk1aeWSttOSyX0wxGBK5OIu2xVUqg
         UvByBRGsUZ4r5izIk6ymUVjPt4eJnA7jyJpW6waN84kex+dPGMyW8BhhBw8VMedrFbKy
         pWD9TkWhQm9Axw+yQr2KKOUT18bciR/PI1VFLvQDCWIw4GccI1Wku1cimJE+u5HAVsnC
         amFg==
X-Gm-Message-State: AOJu0YxPkddZph0LbgPVgO9JXx+eW8rJA64BpLJ8CQ573maPUctQ1u5a
	Oj/s6MGqIU1YETFGiKEAYfIRyQ==
X-Google-Smtp-Source: AGHT+IFu+w3osoX+yY1js+KvkKlRPdJPihfR6ey606N4UPL18NXlj4qIi9my+j9HZFy0hyRjvR8aKA==
X-Received: by 2002:a05:600c:1910:b0:401:b2c7:34a8 with SMTP id j16-20020a05600c191000b00401b2c734a8mr11982343wmq.7.1698240632431;
        Wed, 25 Oct 2023 06:30:32 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id j15-20020a05600c1c0f00b003fefb94ccc9sm14797439wms.11.2023.10.25.06.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 06:30:31 -0700 (PDT)
Date: Wed, 25 Oct 2023 15:30:30 +0200
From: Corentin LABBE <clabbe@baylibre.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 05/42] crypto: amlogic-gxl-core - Convert to platform
 remove callback returning void
Message-ID: <ZTkYdqL6Vb07cCjo@Red>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
 <20231020075521.2121571-49-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020075521.2121571-49-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_063035_683856_420873B6 
X-CRM114-Status: GOOD (  24.78  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Le Fri, Oct 20, 2023 at 09:55:27AM +0200, Uwe Kleine-K=F6nig a =E9crit :
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> =

> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> =

> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/crypto/amlogic/amlogic-gxl-core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/a=
mlogic/amlogic-gxl-core.c
> index da6dfe0f9ac3..f54ab0d0b1e8 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -299,7 +299,7 @@ static int meson_crypto_probe(struct platform_device =
*pdev)
>  	return err;
>  }
>  =

> -static int meson_crypto_remove(struct platform_device *pdev)
> +static void meson_crypto_remove(struct platform_device *pdev)
>  {
>  	struct meson_dev *mc =3D platform_get_drvdata(pdev);
>  =

> @@ -312,7 +312,6 @@ static int meson_crypto_remove(struct platform_device=
 *pdev)
>  	meson_free_chanlist(mc, MAXFLOW - 1);
>  =

>  	clk_disable_unprepare(mc->busclk);
> -	return 0;
>  }
>  =

>  static const struct of_device_id meson_crypto_of_match_table[] =3D {
> @@ -323,7 +322,7 @@ MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
>  =

>  static struct platform_driver meson_crypto_driver =3D {
>  	.probe		 =3D meson_crypto_probe,
> -	.remove		 =3D meson_crypto_remove,
> +	.remove_new	 =3D meson_crypto_remove,
>  	.driver		 =3D {
>  		.name		   =3D "gxl-crypto",
>  		.of_match_table	=3D meson_crypto_of_match_table,
> -- =

> 2.42.0
> =


Acked-by: Corentin Labbe <clabbe@baylibre.com>

Thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
