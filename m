Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D262FECE582
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKuR9uVsxZvC94YKWzZThEIGWIr+85sPfIl90kWOqLQ=; b=yi+JU6ZGq0QaPahKQx/CaWIah3
	NFQBBldRBg8Bp3hKaQMnKXkSOCoxZJoTILxSJJVXSpU9mydLSG7EIZuqWs9/woDhQiOGbvUQqD7rp
	JkFWSq3ixg7IQAD/rcYy02HesfAJgr0uXrkS1ZjdGpfJnehHI8fKgxRAkgbaBTSorDo2Sxm81ZYsZ
	gOnNnhKLDvEg0gxL18LCigVOd1KwcEj0WlhJ1clwQIE+jHnnDFNkBPwA4zpZe6GClAg6jteQnyfGi
	6pC1iIKgo+s4SOOFtt+0GqDGvMcBFj71DS+X2k8qMJVy+4Q9p9wwWtO2CmPwjd3gAXJ6+aEb4CZAv
	wjH6WMLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwy9-00000004yCE-0Zjn;
	Tue, 10 Sep 2024 09:15:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snvol-00000004iLf-1u8l
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 08:01:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so12168305e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725955302; x=1726560102; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/r6IUis8EJbLyFM6C8Q7kCm8hDOlngYXSkv1zgZDfBE=;
        b=PwljtQgfQHHKErNeWs70Rk/kVxz7vhxcrx4DBQsGlizreZXVihMAUvZSxIXbu3Lq7B
         pkxbzATcGXXHPyhDdo0kT/ZwuL9rOTEn+qBynIjJ8t0YXDRtQuqkgKO2OqRp4Hqs24xn
         /k0o7PJ3uLSWJgpY6BRqiJwbqBzwHr67bOGnuunZS1JyQ7TWsS0IbrnUwTvPe95YiRQ3
         /Wwh+3l+/j8uPMEkHp+0Z1EanuSdVjrYCYVBP0fci4EfWKH4sTVfn65E82x3N5sY5w2+
         DGpedBI8yzbwbxKmhzzG3IicWYxBuFC//yVu848/wnYGp04+0R6XY49EevvDNaWjObPL
         H0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725955302; x=1726560102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/r6IUis8EJbLyFM6C8Q7kCm8hDOlngYXSkv1zgZDfBE=;
        b=VV+aSFLzW5fqD52YYlDFiG2/bg/mE4YiVXxEfravknyJlPgocOO1Jp0YvOn0iMjI8q
         8ljUkvvgXoXEGbFxWyg9ZOKThSNIYMVQoqiKFBxEgmExJ/8yScRBYrb+u3l0ri63jTsQ
         LPThyuXRaZRMLoY8GDlAQJaJhvLMcTaXn1+reZ2SnaDEw99kxKHs548JWgDz5qg/xRhT
         vGnRcsj+u6xbwmBaZokwGmdLr6RCqRcXLu+miMqSue+XcMsMaCHNpx66PqhBGT8aMB6m
         OAsJyGVgeqK170cbOIIhc9V1GUH2XIQZN4K8g1XIUHBtFPzqzICXgu6VI/zKhDp3a5+g
         uDYg==
X-Forwarded-Encrypted: i=1; AJvYcCWsXXbaLWfMp8pDkxrvcWNB86f4blng2xE9dxpGTxDQZiIP7HHprtVaXCxTGvo1vquGyzA/PAtySg/SoSwt@lists.infradead.org
X-Gm-Message-State: AOJu0YzFfBJ5GWhke9E7tgQhgfBgS/fneH0TvxbHxcl5STs+zmtxJCam
	9yfHrKoMIT2DGMhVMV5sPxEiCqI5F27xQktjshdhelfM6wYKLSJ+HMU8kSIq7Ps=
X-Google-Smtp-Source: AGHT+IG+nXjNuOi1bG5OAXxiKvCxpS9SGnHKIVE3xSF72Xioz3RZFybD57LPt1sAtAgTE84B8jAhPg==
X-Received: by 2002:a05:600c:17d4:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-42cb16e7addmr53122225e9.12.1725955301542;
        Tue, 10 Sep 2024 01:01:41 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b2f4sm102922055e9.45.2024.09.10.01.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 01:01:41 -0700 (PDT)
Date: Tue, 10 Sep 2024 10:01:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: George Stark <gnstark@salutedevices.com>, 
	Rob Herring <robh@kernel.org>, conor+dt@kernel.org, krzk+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, hkallweit1@gmail.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com, 
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 PWM
Message-ID: <ak53ha3kltm24s45n5pczvibtltzocg33inpnro4bjeolu25re@33lae7y7qzvw>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <20240710234116.2370655-3-gnstark@salutedevices.com>
 <20240712125219.GA472311-robh@kernel.org>
 <55f73e79-2d21-48ba-8486-26ee168c7bc3@salutedevices.com>
 <20240725-excursion-waving-0e0ad54006d4@spud>
MIME-Version: 1.0
In-Reply-To: <20240725-excursion-waving-0e0ad54006d4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_010143_528288_A75D497E 
X-CRM114-Status: GOOD (  21.54  )
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
Content-Type: multipart/mixed; boundary="===============7757634869768818350=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7757634869768818350==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rkd4jonklnzz2ghs"
Content-Disposition: inline


--rkd4jonklnzz2ghs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 03:08:53PM +0100, Conor Dooley wrote:
> On Fri, Jul 12, 2024 at 06:12:26PM +0300, George Stark wrote:
> > Hello Rob, Conor
> >=20
> > On 7/12/24 15:52, Rob Herring wrote:
> > > On Thu, Jul 11, 2024 at 02:41:15AM +0300, George Stark wrote:
> > > > The chip has 3 dual-channel PWM modules PWM_AB, PWM_CD, PWM_EF.
> > > >=20
> > > > Signed-off-by: George Stark <gnstark@salutedevices.com>
> > > > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > >=20
> > > Missing ack from Conor. When you submit new versions, it is your
> > > responsibility to add tags.
> >=20
> > I had Conor's ack in my mind but his response was related to the
> > squashed patch (a1 compatible + power domains) and the current patch was
> > a bit different that's why I didn't dare to add the ack.
> >=20
> > Conor, do you mind if I resend this patch (and may be [PATCH v4 1/3])
> > with your ack?
>=20
> Ye, both are fine :+1:

I interpreted that as an ack for patches 1 and 2 and applied these to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E I guess that interpretation is fine, please tell me if not.

Best regards
Uwe

--rkd4jonklnzz2ghs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbf/OAACgkQj4D7WH0S
/k7u8wgAh+MoDvk6VmcbZhv3CNsVOKqhoT+xIzvJgiBbhHlANMT/TSxuBhwe7un+
YHK3prRMH8wJsJoD0CqAVKt7O34BIAQiG7uQxbJ8LLVIGTgCjIZGiOibvb9jc0q4
yzLjuXJGP3hkonekvncYTNgLM+U8FNP5t6ZjXR9BrB6a556c6Zx5go4JC0EE+wG7
BE2uNduWzkSzmvpUE78R+PftaDr9iCuPjIereXhlVXYXLxL6wrDZLxFRtyOD/bP4
AKX4Wuf2rq6TPy+5XfGFjSQtMVp0W/5hSTZYRS9v9af1dAPe213qY1DDCOL0rZp1
lwGevELL5nVRIgso7w0Dr9q5kj9/YA==
=kVzG
-----END PGP SIGNATURE-----

--rkd4jonklnzz2ghs--


--===============7757634869768818350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7757634869768818350==--

