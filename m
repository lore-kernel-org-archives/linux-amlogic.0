Return-Path: <SRS0=VV3g=SE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFCEC10F00
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2019 19:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF69F2075E
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2019 19:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QQKvxxOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF69F2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPSbgR0BaUsQDon/EIsLY+AUevAS0/6qA+PyG6Sn6RE=; b=QQKvxxOuFlnAyx
	D6Y4sRGTC3aWv/zs0diDAk8CwIastp2tHe5Fw5gbBT7ZLILelFHw3IEzjhT1Y1fdiY4Jr8VKyb7tx
	Ybhi7hDIsRLJc7kBewgyx7FChY+6Mj1/5aZjkc+adwhvBuihROuwn6zIWYn+cVwXKNz+nxUGREd2E
	hdKxNAeqYHxW83e6BqkL3I0aa5fmm5gn9PIlYEGHYkuXumU1uhDMdJOE+8930eoq9TyyH8VXqvJSg
	lQfpGwp6e721k1dH+r6xBx/ZhFqCnwyRol948NpdDphrnhsZMjzTQVrSS+hYjsvjAiHXmioCorRvL
	I8qbSgb57Ap3jjkDSq3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBPVy-0001Jy-Cz; Tue, 02 Apr 2019 19:56:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBPVo-00019J-Ii
 for linux-amlogic@lists.infradead.org; Tue, 02 Apr 2019 19:56:02 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hBPVj-0001u8-BA; Tue, 02 Apr 2019 21:55:55 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hBPVi-0000q0-Cx; Tue, 02 Apr 2019 21:55:54 +0200
Date: Tue, 2 Apr 2019 21:55:54 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/2] pwm: meson: consider 128 a valid pre-divider
Message-ID: <20190402195554.5efbtjr6bswoigzt@pengutronix.de>
References: <20190401181817.11999-1-martin.blumenstingl@googlemail.com>
 <20190401181817.11999-2-martin.blumenstingl@googlemail.com>
 <20190401183847.7xhlgff63cvlzz2h@pengutronix.de>
 <CAFBinCDac9189=+UVLPLqdmJsJvudys_L0GE=Zf0FRkOWsruuw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDac9189=+UVLPLqdmJsJvudys_L0GE=Zf0FRkOWsruuw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_125600_777401_0EF139C5 
X-CRM114-Status: GOOD (  18.32  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 bichao.zheng@amlogic.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 02, 2019 at 09:22:55PM +0200, Martin Blumenstingl wrote:
> Hello Uwe,
> =

> On Mon, Apr 1, 2019 at 8:38 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > Hello Martin,
> >
> > On Mon, Apr 01, 2019 at 08:18:16PM +0200, Martin Blumenstingl wrote:
> > > diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> > > index f6e738ad7bd9..4b708c1fcb1d 100644
> > > --- a/drivers/pwm/pwm-meson.c
> > > +++ b/drivers/pwm/pwm-meson.c
> > > @@ -188,7 +188,7 @@ static int meson_pwm_calc(struct meson_pwm *meson,
> > >       do_div(fin_ps, fin_freq);
> > >
> > >       /* Calc pre_div with the period */
> > > -     for (pre_div =3D 0; pre_div < MISC_CLK_DIV_MASK; pre_div++) {
> > > +     for (pre_div =3D 0; pre_div <=3D MISC_CLK_DIV_MASK; pre_div++) {
> > >               cnt =3D DIV_ROUND_CLOSEST_ULL((u64)period * 1000,
> > >                                           fin_ps * (pre_div + 1));
> > >               dev_dbg(meson->chip.dev, "fin_ps=3D%llu pre_div=3D%u cn=
t=3D%u\n",
> >
> > You could even calculate pre_div without the loop.
> >
> > Something like:
> >
> >         u64 pre_div =3D (u64)period * rate;
> >         do_div_round_up(pre_div, NSEC_PER_SEC * 0xffff);
> >         pre_div--;
> >
> > (I didn't check rounding and maybe its off by one and ...) This would
> > also get rid of the strange 1000 that is currently used in the
> > calculation without a real benefit (unless I missed something).
> personally I prefer using this simple patch applied first as it is
> easy to review and (due to the Fixes tag) may get backported to stable
> kernels.
> I'm not saying I don't like your suggestion, I propose to postpone
> implementing this cleanup. I need to have a closer look at the
> calculation because three values are derived from the input clock rate
> (pre_div, cnt, duty_cnt) and I don't want to mess up the cases that
> are already working as of today.
> =

> Please let me know what you think.

That's also ok for me. In this case take my

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
