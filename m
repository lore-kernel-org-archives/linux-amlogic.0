Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2181C77B7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzgRylG9+I56RTFSi2xF8zyZ2UoZoGd1oib97Vc5egI=; b=f8ZCZkqSD1wSKv
	VqOgax3Iv9g7fXYSSIko999qGyGc2Z4/rvvmJlApD/zg7/lLz1ZYbGf+1qEio1plkIonQsZBcDG4C
	80UDU/DocOPMjvdhWDrQrAbVEpWLVBHFwmQnuBJiFE3t/Qh7+kSEtTm4NiDIhBm2PKZfoelGUNh06
	Q2Br5KUFW0wOsXzKGV78BGdqS75Ym6u8UEb6lMVCtXHVNA3ysavyaUvKaE4K9dH771lLnPetycpWJ
	Kqk4xyzIpBO8N4j72sLMMRSWBUcSN2jEPJLmOknxsGXTVJqu2pTxot29js4UvP8t+7zLSDDRFIRJ/
	rMojQNy+6WZZUZ4TzWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkzv-006NyF-26;
	Wed, 10 May 2023 14:40:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkzs-006Nwx-35
	for linux-amlogic@lists.infradead.org;
	Wed, 10 May 2023 14:40:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4318B64997;
	Wed, 10 May 2023 14:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0AEC433EF;
	Wed, 10 May 2023 14:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1683729647;
	bh=l0swc7JlU+7f4U4KKRw7MUsJgF6zUJmkTgBPzNMU+Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JOYpzRBgv2y1ULEluQn0ilTpwc/OAJb6Nj/l5UqvOQxb70CGdeF87O3fRRQ8thyWK
	 R9QLbECwTkWN0tpw1maWliuGcEceQEG8JpyVeMUCKng4Fbwe/Q2jRakWmzfZr4vU4t
	 70JS1PP5TGkwhNUA56YzEIuIsS4c6n4kHc3N9wsA=
Date: Wed, 10 May 2023 23:40:41 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc: linux-amlogic@lists.infradead.org, stable@vger.kernel.org,
	Xingyu Chen <xingyu.chen@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson-axg: add missing GPIOA_18 gpio group
Message-ID: <2023051035-oink-wasp-c894@gregkh>
References: <20230510141934.112994-1-martin@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510141934.112994-1-martin@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_074053_077260_B3E5FBF6 
X-CRM114-Status: GOOD (  16.12  )
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

On Wed, May 10, 2023 at 04:19:34PM +0200, Martin Hundeb=F8ll wrote:
> Without this, the gpio cannot be explicitly mux'ed to its gpio function.
> =

> Fixes: 83c566806a68a ("pinctrl: meson-axg: Add new pinctrl driver for Mes=
on AXG SoC")
> Signed-off-by: Martin Hundeb=F8ll <martin@geanix.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-axg.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/=
meson/pinctrl-meson-axg.c
> index 7bfecdfba177..d249a035c2b9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -400,6 +400,7 @@ static struct meson_pmx_group meson_axg_periphs_group=
s[] =3D {
>  	GPIO_GROUP(GPIOA_15),
>  	GPIO_GROUP(GPIOA_16),
>  	GPIO_GROUP(GPIOA_17),
> +	GPIO_GROUP(GPIOA_18),
>  	GPIO_GROUP(GPIOA_19),
>  	GPIO_GROUP(GPIOA_20),
>  =

> -- =

> 2.34.1
> =


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
