Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CFCC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYLqUg67l+nU1tl3lYeyInMeSd4Zqh7uvuF4XDKh8sw=; b=xUsNEPTWYAAz4jJ5kICQ/gkYio
	HXPwODM4s0qNHAQqtnxe5OcnFKtTTEqtcdoRlylcv+lZRPl5rO6+LZd1Y17ahTAXO4/6iGMTebJ9H
	BMkI6/G/vYX3IJXTS6pXEpgFvq07FbPLAFxBVNz1xaoujA2DUnXITe2B/3musbWB7i1TubeRO9432
	YiiWlHMZOcGyVybCkxGipzwQD1NhoAS8qssvwDfmdKivZivvNpF4lUwZWLgcxWFDE1vKDqPGAt40h
	x9718JfrOkmcU2O7k/hf/A29PgFbPXlZxSLQps6/b59TJRije4+aCqFQIWudtxe46tdj3f0ybsz2N
	XIRNyPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsut-005WHu-11;
	Thu, 13 Apr 2023 09:06:55 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsup-005WFQ-1s;
	Thu, 13 Apr 2023 09:06:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ud9so35473650ejc.7;
        Thu, 13 Apr 2023 02:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681376807; x=1683968807;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZJ1jMcWj/e+ilDQKZ9bfvzxyk2884OkiD2zDnsE4N4=;
        b=WcBZg4QcwJIC8s4SMGYh9KK0Gg1J2IAG8VfKFgfjAJbbozCa+xlCuhTCeAEM7lfjw1
         31GAnJ0JxJuQ84AKzAOGs7xZX4bi+l2fcML3zpLnZ3IF07hOCB6Xx8QXbbdgHR8yZFz8
         yDzpAqJS96HYFpWipQr38uw4A8WtWn03YnLhbqG52vQV5oc/qc82x+kwx30YnhDIS8lV
         E5AZmyxT2gsk+diwhH9hDuUAMD3oRjcVF/usFhO+CUZLMKzukx1y2BNf00CjOhPYtkzS
         eKqh71smeginzTwaSs84AA3w+wW9kTHWUiXxpRtlOgghFbf3ZmbA27f6SB0m9MBIZ64J
         Szpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681376807; x=1683968807;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZJ1jMcWj/e+ilDQKZ9bfvzxyk2884OkiD2zDnsE4N4=;
        b=NviNMtp9hFRtBqtY7SG/f4BxuOY4YQADehPt8KlIe3XCjJrDdnuE+zo8ufWQ1kkbLL
         R7HJAtFJ4iimAeh/rxgPRcqMljwNBTI0HNCeYQCZts9ggUbM6QLiH68wxOq7obk+POeC
         kjwEuAtayw2gcNgCXA7KyxMMVyw9sAws8/A6eVQgcWhTS1bRa7u2aF41L/vN9CPzdam5
         2IWsWSgHyvmLjPJ0CrmNOr74YimAoEkhx8HKQQa8Rcn/K3VSCYzYBNYk92Nmucbl8PMy
         bYlqR/B+uYG3hFBi/0e7OyUusAN0Y7Z5UeuMfJv9UsJ71pB80WAhiULg2YvdjW6Y2bWw
         yr4Q==
X-Gm-Message-State: AAQBX9e9MBgygKXHveEB4JYT8z+qeqx9p69/uU68QB4aWc5pT45HICd/
	zDyLiwSo/iV616SEeHxI33g=
X-Google-Smtp-Source: AKy350Y75jl/2HbEZkAqua0OH3KdsRDgyPUTmSBpee5hkzSLOamRcPd/6j7Z7zzVXMmCfx7OGQVVew==
X-Received: by 2002:a17:907:3112:b0:933:3b2e:6016 with SMTP id wl18-20020a170907311200b009333b2e6016mr1750790ejb.7.1681376806789;
        Thu, 13 Apr 2023 02:06:46 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090638ca00b0094a44867e0asm676166ejd.52.2023.04.13.02.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:06:46 -0700 (PDT)
Date: Thu, 13 Apr 2023 11:06:44 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] pwm: meson: change clk/pwm gate from mask to bit
Message-ID: <ZDfGJM24xZbfSur5@orome>
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com>
 <f7291bab-eb51-3f2d-4eb4-78f6330242ef@gmail.com>
 <CAFBinCDs=EQo8-HSSbaprfJB+93sz+Ng1H=MX3hBG_00PTko3g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCDs=EQo8-HSSbaprfJB+93sz+Ng1H=MX3hBG_00PTko3g@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020651_619053_720217A3 
X-CRM114-Status: GOOD (  17.39  )
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
Content-Type: multipart/mixed; boundary="===============3573018602837243755=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3573018602837243755==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NHBS40KK0p/++cKO"
Content-Disposition: inline


--NHBS40KK0p/++cKO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 12, 2023 at 10:47:05PM +0200, Martin Blumenstingl wrote:
> Hi Heiner,
>=20
> On Wed, Apr 12, 2023 at 9:23=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail=
=2Ecom> wrote:
> >
> > Change single-bit values from mask to bit. This facilitates
> > CCF initialization for the clock gate in a follow-up patch.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> #
> meson8b-odroidc1, sm1-x96-air
>=20
> [...]
> >  #define REG_MISC_AB            0x8
> > -#define MISC_B_CLK_EN          BIT(23)
> > -#define MISC_A_CLK_EN          BIT(15)
> > +#define MISC_B_CLK_EN          23
> > +#define MISC_A_CLK_EN          15
> >  #define MISC_CLK_DIV_MASK      0x7f
> >  #define MISC_B_CLK_DIV_SHIFT   16
> >  #define MISC_A_CLK_DIV_SHIFT   8
> >  #define MISC_B_CLK_SEL_SHIFT   6
> >  #define MISC_A_CLK_SEL_SHIFT   4
> >  #define MISC_CLK_SEL_MASK      0x3
> > -#define MISC_B_EN              BIT(1)
> > -#define MISC_A_EN              BIT(0)
> > +#define MISC_B_EN              1
> > +#define MISC_A_EN              0
> Personally I'm fine with this change but it's not how I would have done i=
t:
> - I would have kept the BIT() macro for MISC_{A,B}_EN
> - then I would have renamed MISC_{A,}_CLK_EN to
> MISC_{A,B}_CLK_EN_SHIFT (to be consistent with _SHIFT of the mux and
> divider) and drop the BIT() macro there (like you did)
>=20
> This is possibly/likely personal preference, so my suggestion is to
> wait for some more feedback.

It looks like these aren't used outside the meson_pwm_per_channel_data
array, so why bother with a #define (and any potential inconsistencies)
in the first place?

Thierry

--NHBS40KK0p/++cKO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQ3xiQACgkQ3SOs138+
s6Fb3RAAwid6cv5PHAgfTDQ9OSpBYIyf2UGxtdf1g6jyu1dqxitvH3iIKMnUsmL/
RwRqKg4wQWGw8fqfmiKR8i36M485cL/Vobo3pbxbzPIA8vfs1HoBinaRbJC0YHMe
TQGOi/tn9gA1EJpCx7k/q5rTGaKq0/tVK9QfOYgDbWUJ1CU0u0lROuotXWgYbo14
4+ED775iMkM/XBBmORdi16mv5DUmzXBoG3YerAPTLHkQKNVE2M09kmuD51iOe3sm
HJ/LfqePuxw1ZSx7AqQ5zaeWURhX+CXxT1oK6Ps1pGpGFDVs3FKqZfmubGc4abVi
7p4eWQzDe27HK4alVbHpbmbT/D8QNfXmdIECYH4TI9xcjE7fkcLuOBVX5tg4MV+s
8j7gJCTjHBXNWaBfb58SgrgOzk4/6ZQ5oGSeCkaMmmRe6RUgjyrMODyxk4liUsKr
4qWVr6WdzvhU4RFwLcA7Qw8bcf5gsMtBQscS5u6CxbJvl14DxdEH12yfBoDywys2
j4v/Z5HLOP82VaKitHNCkmVkxihUbpXNFBAAMBhFm+h6ASypTdTcjTi74AS/9xyi
yyAgRFoMMUDtbk/Plon/U+yz4o1DcG5VmxC28b6Le+9ywxMuR0y/yPpwN72GnsHn
pMJgdxcb4JwEDuGqLS0n6lUspqD3Cu1EJYk4HDbA41f5fuHd1Hg=
=w+FE
-----END PGP SIGNATURE-----

--NHBS40KK0p/++cKO--


--===============3573018602837243755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3573018602837243755==--

