Return-Path: <SRS0=R8f+=PG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419D0C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 10:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADE360FC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Oct 2021 10:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CADE360FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTXRgOhPCaaQakzMHayPAAHHsrsvkk167X4jWzg54a0=; b=Sx0aAYw5tuStLh
	yrK51iLq5iPcS3PkJncZzPdvMY5p2X8OUtTTz2TXklE1bUpEXX6ul4OfgD5f94mBzWCGi2Te51Vp7
	7xBsB5zUhTXdx5sf+KhIRPEx43o3kj51yTAqoqX1pibUBdntG+b3Y0KqgQhxi2cakAJz5odyujzrB
	eBMOWBWei5jyDIA2DbaJLVEMyvzjPrAtmXk+BWLklMvigeeW8bFcmta5QcxJPe/dKhfUGDIr/iopF
	RBD+4OPltZtZ3I2/ALdJbsi1Jg1wTF9sLEHdr/cHYTp9W25FFdoDiOZ3VQ6RyRL/Dc6eNoOh+9EJS
	oloeilhLDuHbbaRj7phg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcQFm-00F8w6-CP; Mon, 18 Oct 2021 10:52:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPlW-00Eyh1-8o
 for linux-amlogic@lists.infradead.org; Mon, 18 Oct 2021 10:21:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so9829338wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Oct 2021 03:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=7GC/r7oF7FaZ4vYYtjlckZsfjl97Nd102niiiNEyke0=;
 b=OghATFW5VHSslzpfS5gkkA3/wlUiyyp1eis6npEz+q00Ysaim+UMA3aq/59CpBm3sw
 xsgz5lLt1yZ90HXx0+Zb99O7Dj6PQlMsZYE7CuH0bJAL8QmybrshSuijhh9Vnzl9izgC
 xioP+eojPe9F21OJuHl8mpZfK19IRHt0psbKuq8q38MZOGSfEnwIp0/d0duLLLhWFrjC
 XlhQZwF1kEsxPUuFiEtQIa6aLHq0fc8mnMtBBwFPqL6Bh0YUrIiPT2VeL9tgAVz8Aqg6
 nE/phqoMR4WvNkv+U7wd4GP3cEApRXz3D4JcS5QYxcy+pSqUXvBEI20CCcuSkwMo/9ed
 GYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=7GC/r7oF7FaZ4vYYtjlckZsfjl97Nd102niiiNEyke0=;
 b=MVVdnEerHVZ35jZE86+tUI9M+5HzZtr38RN0+FCoEVbno/nVD0ik2qTD8YZRdsoHpw
 MDjGsZwZaYVNLlPiBEH/WnkSIJKmguJEbUZuwt/dazUG7FPkD5NqcZ0ip8Be8MEqi+3K
 /mcPbKlNjatpngx8UTWbh2a4DqJ/2xGkfl4Jgg+8svxShgVcP6fxTB61neWf4GN8gUKL
 pWkHFoAYeh33WtHwcFWEi/kC+hwFYKVGrHjZuU+Fm7VC8PTa2Xe/ATb8IDIKnWLdb3yf
 ZtKJ/AHfPcc3ZhXwGTbk/KuFnBzZyiRUpm5QfJsVQ/Y/C+qmi3GePudRkikO/AURbb3J
 Wy/A==
X-Gm-Message-State: AOAM531pS3iXujQ87FoDSBjr3erCuqPXR+CI9vIvvAIPJWFFJ4a2pdKI
 bB1p5+o8E1m0v/ytJHbaRorseg==
X-Google-Smtp-Source: ABdhPJxggso4popQo8nuVeqxw6FVBixaoIjtOeSS511+JxQ97xNYgGJ/yoNLOwTLoxJL3J3keWTBZg==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr42793789wmh.137.1634552468356; 
 Mon, 18 Oct 2021 03:21:08 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m15sm12311398wmq.0.2021.10.18.03.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:21:08 -0700 (PDT)
References: <20211017160028.23318-1-christianshewitt@gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Matthias Reichl <hias@horus.com>
Subject: Re: [PATCH] ASoC: meson: implement driver_name for snd_soc_card in
 meson-card-utils
Date: Mon, 18 Oct 2021 12:20:03 +0200
In-reply-to: <20211017160028.23318-1-christianshewitt@gmail.com>
Message-ID: <1j1r4ivdkc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_032110_362047_99EDD61E 
X-CRM114-Status: GOOD (  14.96  )
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


On Sun 17 Oct 2021 at 16:00, Christian Hewitt <christianshewitt@gmail.com> wrote:

> Implement driver_name to provide an alternative to card_name for userspace
> configuration of Amlogic audio cards.
>
> Suggested-by: Matthias Reichl <hias@horus.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> The meson AIU/AXG drivers currently require alsa confs based on the board
> model name which is unique to each board. This is very flexible for audio
> use-cases, but not very maintainable for distros with a single use-case
> that need to support a large number of different Amlogic boards. Using a
> driver name to match the card conf instead of card/model name reduces the
> number of confs needed in the LibreELEC (Kodi) distro from 41 to 2.
>
>  sound/soc/meson/meson-card-utils.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index 415cc0046e4b..29b0174f4b5c 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -302,6 +302,7 @@ int meson_card_probe(struct platform_device *pdev)
>  
>  	priv->card.owner = THIS_MODULE;
>  	priv->card.dev = dev;
> +	priv->card.driver_name = dev->driver->name;
>  	priv->match_data = data;

I was preparing something similar to help with alsa-ucm so

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>  
>  	ret = snd_soc_of_parse_card_name(&priv->card, "model");


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
