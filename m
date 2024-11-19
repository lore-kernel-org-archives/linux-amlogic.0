Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AFBD44167
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Nov 2024 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQz2XGhA7Ky1JUcbsjXdnKpddnnD8+B9nkF1qwusUKk=; b=TupT2m/AKR57SVpUfcnR9TEGIm
	x5GL7jsazgOcwJfIR5OE+n9+p0EusrinAU7RHS3nm9DoF3rDnfNhioIWyyEThajw08ucGGFLPpg7m
	8jMK23h+Lf309fnlbHF9BHygp07gsMYKpo/08uK/PPmFN57sG8h6mgMWfWQxHMnses6s0ynO6wGUp
	sUE2olhmP+88HrB+Aw5EQU01lN3/D2zXUuSX0mXwOCsBpiK0y+B70H0tvjlsNlylFnyUcvYM0pSlx
	dG3UqhYQ5ib4IZow4ygqEuSGXJROUq/039mh/pOUvzO79yEgz2t2+YZwD8l/qn0/UnWhc99BfH0RX
	MAxVUXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ2O-0000000CqE5-3Kkr;
	Tue, 19 Nov 2024 15:21:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQ0i-0000000Cplk-1q5w
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Nov 2024 15:19:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so9843925e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 19 Nov 2024 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732029562; x=1732634362; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MYjRt6aAXmLduNc3M0AhX6eJNrQcUOwMqW4r+1xGqhM=;
        b=Dmn0IYfjoZDZRpSgskYZ19Wm4s2Lenfnxq0i2f/KcvObIPywxME5CCEC/IK32ZN/VN
         6R4Y9Sp4APxHTRKmFdr3HjS9UzHm9FzLRMsrIwqU3jwY6XkC5O/SirTP2gzQQYOvfYLz
         pmAdQaxJjvSyV8l5yB8bRoh0g0zNaFTWKUkwNnAJo51ynQD1WbamssfsxbY4pwQXg+W+
         DzfSy0hxvbXjWKaSy0cfHLbPMVbyYwIJH/IGwTjXswZvWACOGgCBox4FLHH5VcU8d9Kz
         HbaBRndc2Vl58PbxT477HZf1isv1ez9DtVSfoMWYZlNFflQCjn7xh/wx4ELR4UsthgAS
         r8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732029562; x=1732634362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYjRt6aAXmLduNc3M0AhX6eJNrQcUOwMqW4r+1xGqhM=;
        b=OuTPjAqoXoFr62J0QLT/soiv3xPUyog0RwiBbXlReXQPwdUhP+ErvVwq2vwqaoGFCK
         IYEBHVBbF8plVfA6RPfpc8CROjSYDsywmmZglwJ2ADfdAI7uLwIhvUI7nVT6ZzkCdAMJ
         v0JMeMQ1d/3/86JMcXP3Kao+m5eFQ89o/IBVO0gOQEThn1qfxJiANyPh2+ky1Ae8L80J
         VHwHJH3YHhH2SAnXK4nb/LihcDQtG7zpVOyDLFXZDCgW59OTGsIEY+WxqHe4B5B+fX4J
         7ptZpIaoe/ueePUDeB9wTcG2/ddJmn2J08TFtJNhYr6zwpS26mN+W3pi98A+BlvZmUx2
         q6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUSwCUGKiDfyXgMMIjqw2E+hlirhF1pro3rteCPq2Wm1ytuGWS+1BLUhlJWUqKlknQBb18J1UBi9MC8T0Ft@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+nAkWm5nAat20SzUBhi9zZmTeASNIY/0/p0vVYLvAioME1e7U
	XKisOv6L6UtjPCTpTv0CC/cNYkgOZ0xJh7gJHFDstbhjQwI8Qx4wT6XLF+pnDVM=
X-Google-Smtp-Source: AGHT+IE06JOv6iPIXo45XJ7NZ7v2VX2jdRE9SZJkOfZPKGcIoNUYJ/Eqqb17OBd17sK6rS+MKmE8PQ==
X-Received: by 2002:a05:600c:1f0b:b0:431:44f6:566f with SMTP id 5b1f17b1804b1-432df72a4f1mr147121875e9.13.1732029562335;
        Tue, 19 Nov 2024 07:19:22 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab789fasm201173905e9.18.2024.11.19.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 07:19:21 -0800 (PST)
Date: Tue, 19 Nov 2024 16:19:20 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
Message-ID: <fbafp4qvf7xq7ob7pdtrps2bgk7n5azcysq4jpqhwxtxxhyt5g@kq763dnqkk7m>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
 <20241016152553.2321992-3-gnstark@salutedevices.com>
 <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
 <f08513c8-56d6-4551-8ac6-84641c134552@salutedevices.com>
 <l5xvdndysdvtil472it6ylthcfam5jp7lh3son45mezq7dh2yk@3yj557k2o5k5>
 <ed5cdef1-aaa7-4ff3-a427-87eae4c90f18@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <ed5cdef1-aaa7-4ff3-a427-87eae4c90f18@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_071924_476827_6A4A1962 
X-CRM114-Status: GOOD (  29.96  )
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
Content-Type: multipart/mixed; boundary="===============4719275718657471416=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4719275718657471416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ujldv2oqf45x6kez"
Content-Disposition: inline


--ujldv2oqf45x6kez
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
MIME-Version: 1.0

Hello George,

On Tue, Nov 19, 2024 at 03:51:34PM +0300, George Stark wrote:
> On 11/7/24 11:41, Uwe Kleine-K=F6nig wrote:
> > On Wed, Nov 06, 2024 at 04:54:41PM +0300, George Stark wrote:
> > > On 11/4/24 12:32, Uwe Kleine-K=F6nig wrote:
> > > > > @@ -68,6 +72,8 @@ static struct meson_pwm_channel_data {
> > > > >    	u8		clk_div_shift;
> > > > >    	u8		clk_en_shift;
> > > > >    	u32		pwm_en_mask;
> > > > > +	u32		const_en_mask;
> > > > > +	u32		inv_en_mask;
> > > > >    } meson_pwm_per_channel_data[MESON_NUM_PWMS] =3D {
> > > > >    	{
> > > > >    		.reg_offset	=3D REG_PWM_A,
> > > > > @@ -75,6 +81,8 @@ static struct meson_pwm_channel_data {
> > > > >    		.clk_div_shift	=3D MISC_A_CLK_DIV_SHIFT,
> > > > >    		.clk_en_shift	=3D MISC_A_CLK_EN_SHIFT,
> > > > >    		.pwm_en_mask	=3D MISC_A_EN,
> > > > > +		.const_en_mask	=3D MISC_A_CONSTANT_EN,
> > > > > +		.inv_en_mask	=3D MISC_A_INVERT_EN,
> > > > >    	},
> > > > >    	{
> > > > >    		.reg_offset	=3D REG_PWM_B,
> > > > > @@ -82,6 +90,8 @@ static struct meson_pwm_channel_data {
> > > > >    		.clk_div_shift	=3D MISC_B_CLK_DIV_SHIFT,
> > > > >    		.clk_en_shift	=3D MISC_B_CLK_EN_SHIFT,
> > > > >    		.pwm_en_mask	=3D MISC_B_EN,
> > > > > +		.const_en_mask	=3D MISC_B_CONSTANT_EN,
> > > > > +		.inv_en_mask	=3D MISC_B_INVERT_EN,
> > > > >    	}
> > > > >    };
>=20
> ...
>=20
> > > > Personally I'd prefer:
> > > >=20
> > > > 	value &=3D ~MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> > > > 	if (meson->data->has_constant && channel->constant)
> > > > 		value |=3D MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> > > >=20
> > > > even though your variant only mentions the mask once. While it has =
this
> > > > repetition, it's clear what happens without having to know what
> > > > meson_pwm_assign_bit() does. Maybe that's subjective?
> > >=20
> > > Actually I also don't like meson_pwm_assign_bit() too match and I'm
> > > surprised there's no something like this in the kernel already.
> > > I again objdumped versions meson_pwm_assign_bit() vs double mask repe=
tition.
> > > Unconditional bit clearing takes only a single instruction:
> > >=20
> > > // value &=3D ~channel_data->const_en_mask;
> > > 9ac:	0a250040 	bic	w0, w2, w5
> > >=20
> > > So in the current series I could drop meson_pwm_assign_bit() and use:
> > >=20
> > > value &=3D ~channel_data->const_en_mask;
> > > if (meson->data->has_constant && channel->constant)
> > > 	value |=3D channel_data->const_en_mask;
> > >=20
> > > If it's decided now or later to drop meson_pwm_channel_data then
> > > w\o meson_pwm_assign_bit() future patch will be line-to-line change.
> > >=20
> > > What you think?
> >=20
> > Sounds sensible.
>=20
> While changing the patch to drop meson_pwm_assign_bit() one thing
> concerned me on the approach:
>=20
> value &=3D ~channel_data->const_en_mask;
> if (meson->data->has_constant && channel->constant)
> 	value |=3D channel_data->const_en_mask;
>=20
> that we reset bit in the value var even if that bit is not supported on
> the current SoC. I checked several datasheets for old SoCs and those bits
> are marked as unused (not even reserved) and I've never seen those
> bits set. Still I'd offer to use precise condition for changing those bit.
> I'll send v3 let's discuss it again if you think I bother too much.

Usually writing zeros to unused bits is a safe procedure. If the
hardware we're talking to is a newer variant of the supported stuff, the
hardware engineer did something wrong if keeping the read bits or
writing them as zero is incompatible. So either way is fine for me.

Best regards
Uwe

--ujldv2oqf45x6kez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmc8rGsACgkQj4D7WH0S
/k5YUQgAunaABIHOeGpv6VDiLMddmRGSo4/uW0SrIyOgXPRNNIk5scQlObQuTijW
wAVLCBr/SS9SIuZvbqo8S7ok6kT9RtcO5SWWGRbSH5CUohyzVQeeDTRPk6DbleDv
Gb56WH4WFWiHzBpQnI49ianH/8ypmo05vHQpP5lUsO2Rnxc4uvkqrLpA3+Lf0brv
ogVDUbMmSSxGMIwm2Kj0oH7FvDLt9aoTcDAaa7DYsgDBt86jyabBVGcnsGX/AOhM
y5/3Z0eZd41DltgEZGO16RJ8IcEb57DaYcU1sxCewdmsW/4qTLZPVqrZd+jzx2A3
84D2FEaM6yRQ5pNFZo8uAY30Db9L4Q==
=lMnI
-----END PGP SIGNATURE-----

--ujldv2oqf45x6kez--


--===============4719275718657471416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4719275718657471416==--

