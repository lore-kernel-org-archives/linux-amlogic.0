Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDE4C27C75
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CnTjHUorIceD61g/Eg84HjS2Y+ru1ioMhBFIRDU+0H4=; b=EiAEuQUf8wiundYs4T4oIUI+GI
	SRQ2rb2D8KOK9mlZnKv+eHakX1bkV4OFL1v3mheQlTG2M3ZeAuUK8KImyc9yQNF3QvHPsk1eYLuXU
	O+kLjAYjIIjV+OMEEC99t0gq90eHhzc+zjH9tcerLPY7Htp3ye7tJPH7GA0NyzTTv4AE8BxK/9IgB
	oWaX9r0Xn0wUeNkI2EAOj0pAhmAluWF9cYX/pZV4u2QE+pqEDzzJEF/LDkPXuvOdnqDFdAT2P+sBI
	dw09Rb7DSSDXwO6BwVvPxEYJi5xhwvAV9P9bmUFP+VKjPz/yeOI6iH3HOMbExT+kESUsjCfgZOMzt
	fAxd+SmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI2oy-000000026bM-2H94;
	Fri, 14 Jun 2024 09:02:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI2ov-000000026Zv-0BxD
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:02:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a6f253a06caso239429766b.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718355723; x=1718960523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4GkufYcYiROPgUdoe4VOWKumgL9VxD9lLUKtk5IkCI0=;
        b=3fw6oBfbTuMV9IBfMgTZnr2FaaNL2B7WkS0KNI0BHiL1ogIygS1mog3C5If1CXjSsI
         XFwjs2n27jnd44CaWxiTqCOaFiws8FJxR+hlzms9ZxhDeTUnuXV8KcKbPdy6ZQhjC3N/
         Qu/UiCVsy6VUjii0xGD5TymK/+Pebmx0uCJQ2MBtXkfEir6ZQb1Dt0cNm11fRU2fqrXS
         GoAFaaerQeckqhI8bMncUfYHvvjjeM/2KS/rR3CS2Pt1c/W5J0TElX8YtDKj5hrefGAs
         KZOmvxIaat0KtaDkT/rJBIvczS5vrqMfqgqgsN3btw7KlyN9ywCGnadlwT4VdPE3/8Hy
         CYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718355723; x=1718960523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GkufYcYiROPgUdoe4VOWKumgL9VxD9lLUKtk5IkCI0=;
        b=ApYmRT1lJ1/wXfW+SelOlVfiyFSAKGZalSflcuxmLIMp1OL+7taykr2J1JXSEfV1gk
         kC2+MvoFGVxp89kW0xlWpcWs5fbbjE7QXD/FLPyyCknaCE1h3W6qHKEurvSNSPsLCDih
         5NZPq6JTDGid4xHc5EQSJ8iHmJGNMY+jhTmcaDC5UKqTwKRG/EYoqtbs6RzKucsC/AYT
         MYc7mGOoEsNFsdGsYGRhvNmHzF9/pff3n2bMmmC4225N7NJ+QYkora6H9BVNt1EqiJ65
         yhVzQ2PhAgwWdJE8Q/kf2d42/HC8Jp35owp/H1uxCd4TTqpQKUCegtNyS1xW7C3ZorFn
         SG8A==
X-Forwarded-Encrypted: i=1; AJvYcCU6xM3DYEV8ijVspacl9VZ2LJUtMYWwfOrRhfPSHoj0fEluCblMX/GUpdhqDbfejO/mIKbAXFHnmSr5+GTH6ArTonzofPXCqmfN/7I2VLVgEJs=
X-Gm-Message-State: AOJu0YwQ5S+M6KUPa8Hp/HbwmYITcAKvkX9MY5Juz8RWBThMDMXVQ5MG
	gUTVxgIXI0AP7pKMXrbcnRTRBUrHbVo46GzLWheHSoemCQc1B1oH6Sk1DMtisd0=
X-Google-Smtp-Source: AGHT+IEgu+SEeuiOCn/D1qY0pc7gkYG3Zs7Fw5IldGNciNZjurJw8DVlWWCmF1sWH2Oat7hbi2sUlQ==
X-Received: by 2002:a17:906:c34b:b0:a6f:14b8:a017 with SMTP id a640c23a62f3a-a6f60de601emr158636966b.74.1718355723412;
        Fri, 14 Jun 2024 02:02:03 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ed0d7csm161412166b.115.2024.06.14.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:02:02 -0700 (PDT)
Date: Fri, 14 Jun 2024 11:02:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, kelvin.zhang@amlogic.com, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
Message-ID: <agnl6gfipf3fyykdssnml6eibc2x7kva4nf7hpajiimoaavge4@lvajpt6tiszh>
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
 <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
 <1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
 <tnwdnwiruoty5yd42bmkupgg6hjxib5lblhqcyouoyx5y3zvnq@2d7cnrei24m4>
 <1jbk44htqr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jbk44htqr.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_020205_206428_7C741E52 
X-CRM114-Status: GOOD (  11.24  )
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
Content-Type: multipart/mixed; boundary="===============4810215609054257569=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4810215609054257569==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oz7u3unvpzgczlnj"
Content-Disposition: inline


--oz7u3unvpzgczlnj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Jer=F4me,

On Fri, Jun 14, 2024 at 09:24:28AM +0200, Jerome Brunet wrote:
> My point here is also that devm_add_action_or_reset() can only fail on
> memory allocation, like (devm_)kzalloc. Looking around the kernel, we
> tend to not add messages for that and just return the error code,
> presumably because those same 'out of memory' messages would proliferate
> everywhere.

I took your first message in this thread as opportunity to resend a
patch improving the situation here. See

	https://lore.kernel.org/lkml/3d1e308d45cddf67749522ca42d83f5b4f0b9634.1718=
311756.git.u.kleine-koenig@baylibre.com/

Best regards
Uwe

--oz7u3unvpzgczlnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZsBwUACgkQj4D7WH0S
/k4l2wf6AmvkZU5HnDzh5pUZtIQAnaTIqw7xQlIVCPO0cdSS6agRG3SUyEETcbGu
RoXED/lTCL16XBBJ6XVo8OEV1Genk9lIi11g6w/Ep5EsQSAgpZ/Vl2JgGvXLLJrF
/p5HKP8VYBRpzUE8ss+9f8UI/1F39qwR3dUB6S6beBqq/2/dmTGmZehn281lvw0o
a4eAdl4PTFmwdw2XnVbDiAEZsyapV/iUXPqDd4t0Op4MoW9fuAWkNSvPk9BqOp1x
THfg5npVz7yjG/DS9LmUrVzb3O/ZFwRmHSpCixFoC5JQ0lEHtGanX07YF4V9trME
pvtXzMcajGQH936vjemB8MN7Z4Dnaw==
=Hk1f
-----END PGP SIGNATURE-----

--oz7u3unvpzgczlnj--


--===============4810215609054257569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4810215609054257569==--

