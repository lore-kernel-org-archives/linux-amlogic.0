Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3D2C3064D
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ClVHVN7PEbXUjetty/l7y/DeL1JGKmg7SmoT5d/mwk=; b=SuKUYVzfLy74DSpUCa9FAzpaio
	d2ST/PSKfGL1V1BRVi3JeGcE6VOt+HwGKajs/svuBEXyClcT3lMklwEyq3cUL53zd8eHG3JX1aomC
	l0j3yxZFtWEPdK9iON0YB3UYL5bPL7xITzDzvCYQASe72LBoKv+xfdqtD0//DD7jopjaH3PhRH2gq
	tLFfVU8fVHV9xdbHqzDfL0/7vnVkBdcC7SbD0Jgi8SkwIxRPsSDZG0Y8h/u8D8PgoHoGdL/NadeUB
	Nuc64v8BSOSPFDchZrEXtEFR2a9dMrZZMZO5PwZqxojCYUT1imgCkIfTxlNwoHe9PSe1/SkP3uRVB
	Y+0J2Ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7Uw-00000003FdF-0jJt;
	Tue, 25 Jun 2024 14:50:18 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7Ut-00000003Fc8-0Qrc
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 14:50:17 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a727d9dd367so61295266b.3
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327012; x=1719931812; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jWqxo3mchFiP1MenyU8LEUTbrCGM0e3VDgqj6/yFdZw=;
        b=dSDrQsgY4snOqixsqXDmUvkWGxeydjii8/jVYKpfRgE5TjQx9nDOSbT4zJAEl+P5pD
         0osuOGQfQYrjOYDWrotpRuYK9EGjkFTokDzYm4m7Jiut2LxAM5RlL8jrM88j1aN7ht03
         RmCIS8/fNmQ5xHmfNSdDMZRSf6r8nMwFCIVtOoT9sCJVz8LqD41vdOTAQMFhuy9yz/Hw
         cz1EKVurjZhYZXIJqZAwadH+lglXQVW7JLipO8PhzT+1D9N7013nFW2lw976Mr/Ril0q
         /EZc/Dv0c+LE/15OLJrK3qJuv0Onw7A//iji/rb2tfhwgYxKiC49K32LKPEYSYU5JaXI
         YqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327012; x=1719931812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWqxo3mchFiP1MenyU8LEUTbrCGM0e3VDgqj6/yFdZw=;
        b=UJSDcMlXrCEKz9yehWxtzirj9wgQGnuTGr6yczDPxHseR7GCGA79yCEFsJhRJw2/eB
         JmjRo9hHk42YOp4T7Ur452Q8myFumwJpV4TSJr7eBpwN5bb6cDNdesUplasSGkwKOquG
         +PxBUAdFBHpGvSAFxqyYcp/6icNw3k/dspdQOIskTq96kfE3BodRRdd6FOGcGA16LZlB
         na74N+0wxZp7sVA2dT4+1sSkDEoywhoqp7RF2GWfmneikuwYco8ks8nVPNq1VhnpFtR3
         y2kp4wN2Uh/lXU6+5MgyQVaoYN13/ii3iDBW2j0ApFU78qAaBCw5EVUCjFGM0Wl3+a8u
         RzAA==
X-Forwarded-Encrypted: i=1; AJvYcCUpwDDItEDjyPY/S8u/ZgLGysGouAjcjez3g4kzW8GcLYGGwLQd9V2NBAkWAqxnOtXu1PwaedIcAryLfyEqHHJrRR+dqkYhTBdicLqDEgj80W4=
X-Gm-Message-State: AOJu0Yxo2jqprahpadzI3ZedfcDz7sOgkkB2hlx+7nozAzpbzhSBEubJ
	eScC2lTwu13fyWsNSY4zTsJIx5jLZq+sP13YEAnvYjpqhoiy/VfAtscslbkHGvA=
X-Google-Smtp-Source: AGHT+IEwnwBd/P6t2ddwhrLb8bvz6kYx+1hLSg0mmfREs2jeseCHj5DRkS89BkTTTiW651tXR4AAuQ==
X-Received: by 2002:a17:906:70d6:b0:a6f:e8ee:9e3c with SMTP id a640c23a62f3a-a7242c39107mr509610266b.22.1719327012436;
        Tue, 25 Jun 2024 07:50:12 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:aab0:97bd:4d50:ddf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7120187c22sm373994466b.110.2024.06.25.07.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:50:12 -0700 (PDT)
Date: Tue, 25 Jun 2024 16:50:10 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
Message-ID: <coriionza2db7jqz23bcig3zwufktgdbfakixcrlllxrqkomcj@zle67mswm346>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
 <1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
 <tnwdnwiruoty5yd42bmkupgg6hjxib5lblhqcyouoyx5y3zvnq@2d7cnrei24m4>
 <1jbk44htqr.fsf@starbuckisacylon.baylibre.com>
 <948ba34a-1e05-45c4-8ba7-66c72bdb6fa5@amlogic.com>
 <6bzysc3jwugo3epcxsef7uupk536prsc3phlf3m64n3jjwpxus@2uigg44uotuh>
 <9b457c30-6093-437b-b9af-44c3a768020f@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <9b457c30-6093-437b-b9af-44c3a768020f@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075015_298602_F52F80A9 
X-CRM114-Status: GOOD (  22.66  )
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
Content-Type: multipart/mixed; boundary="===============4402072474069848769=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4402072474069848769==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="be37srvqrjutjyvd"
Content-Disposition: inline


--be37srvqrjutjyvd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Kelvin,

On Tue, Jun 25, 2024 at 05:33:22PM +0800, Kelvin Zhang wrote:
> On 2024/6/17 22:11, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jun 17, 2024 at 04:44:13PM +0800, Junyi Zhao wrote:
> > > > > So yes, please use dev_err_probe() also to handle
> > > > > devm_add_action_or_reset().
> > > > My point here is also that devm_add_action_or_reset() can only fail=
 on
> > > > memory allocation, like (devm_)kzalloc. Looking around the kernel, =
we
> > > > tend to not add messages for that and just return the error code,
> > > > presumably because those same 'out of memory' messages would prolif=
erate
> > > > everywhere.
> > > Hi Uwe, I didnt get the clear point.
> > > So, if we need "return ret" directly? or keep "dev_err_probe()" to pr=
int?
> > Please keep the dev_err_probe(). There is a problem with that approach
> > (as Jerome pointed out), but that is about to be addressed in driver
> > core code.

FTR, this is done in
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/comm=
it/?h=3Ddriver-core-next&id=3D2f3cfd2f4b7cf3026fe6b9b2a5320cc18f4c184e

> For this patchset, is there anything that needs improvement?

It's on my (not particularily short) todo list to review this patch. I'm
aware there are several people waiting for that one. I intend to work on
this one later this week.

Best regards
Uwe

--be37srvqrjutjyvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZ62R8ACgkQj4D7WH0S
/k5S+Qf/SNvnQBfAaVksxx8eIEYT2jY0QUITMY+QWmZsieNi/glkSoIaiy+VWXyg
Pzfhjo4Z+GwYudqoI7gq/mzllhM1I4H2O4poOEw6YXjZxjdAbq2FfBdljtlOzHIn
W1uQnE6r0UYEPpfMQH4GIZ1VrxhluhAzz7dPcn7Ja71Tqj34pCP7Z2zFI6vXlJHa
AHEx28lK05wnnWMYqBElrZsEe0Jqj0KfrL9Dc87NNzvA/MAdqqe9MUIt6/8V59D1
VRpFgVhCGXve2l+TtRvB5gpkRAJ4DaBV9WNxoph8+9Tis+IB5efxsCFXrDR/ym5f
Xxco7/DhoBatXM8sLd8EYHf73vxhmQ==
=87Qb
-----END PGP SIGNATURE-----

--be37srvqrjutjyvd--


--===============4402072474069848769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4402072474069848769==--

