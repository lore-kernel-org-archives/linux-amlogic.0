Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21A4C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Feb 2023 05:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCMBjwE0PcJ9SnpqUKN10ucIJ3OhHM1xnOjgaY+Mpz4=; b=DamLF2jhQKuF8j
	fdntAZtsNU4s58XlZEwHqAjrrgf0cGvX1BKJC0Ez3E6/IyXEWdWhHmkd/jX5PQQidvhuPwFklMc8d
	9RYMZ+5XpnuN/UhzOtUFn1bNKKr4clUYrwcTbUy7S+mrB4C3l6Ggt7+2L/3YV8Eo9K7tSRrDnKPvY
	AVcwh1wX0UmvZ+jUjwwysD5wlD+kQ4Ul20IYOZ2dG94RiPWNmIT7sRDyQiVw76+6pCgQcP3OSFhSs
	pEDCk4jX9IZ6hZiO6eDkpaY24wOCSxLB29AQk7MrGtm37IaBM83hMFQYACl39rRmqAGoc/S9xIw+I
	Quz0Rpsb/yMIsESyA9rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTyen-0033D4-0I; Mon, 20 Feb 2023 05:24:09 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTyeb-0033BH-6W; Mon, 20 Feb 2023 05:23:59 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pTxzv-00DEh7-1u; Mon, 20 Feb 2023 12:41:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 20 Feb 2023 12:41:55 +0800
Date: Mon, 20 Feb 2023 12:41:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 4/5] hwrng: meson: use struct hw_random priv data
Message-ID: <Y/L6E+7SmLha7Bp8@gondor.apana.org.au>
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
 <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4dafc70f-be7f-bfdc-8845-bd97b27d1c4c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_212357_249194_342A4413 
X-CRM114-Status: GOOD (  16.68  )
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

On Sat, Feb 18, 2023 at 09:58:07PM +0100, Heiner Kallweit wrote:
> Use the priv data member of struct hwrng to make the iomem base address
> available in meson_rng_read(). This allows for removing struct
> meson_rng_data completely in the next step.
> __force is used to silence sparse warnings.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/char/hw_random/meson-rng.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
> index a4eb8e35f..bf7a6e594 100644
> --- a/drivers/char/hw_random/meson-rng.c
> +++ b/drivers/char/hw_random/meson-rng.c
> @@ -17,16 +17,14 @@
>  #define RNG_DATA 0x00
>  
>  struct meson_rng_data {
> -	void __iomem *base;
>  	struct hwrng rng;
>  };

This is too ugly for words.  If you're trying to save memory we
should instead get rid of rng.priv and convert the drivers that
user it over to this model of embedding struct hwrng inside the
driver struct.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
