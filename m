Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED326C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:01:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D5B20883
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgN9OIDP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D5B20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zx2lC72HHeangDuH7lxJe239HagXamjJD3ZRYDyI3AM=; b=lgN9OIDPaCdzUZ
	2+gH4+JVYHkq297lp53jKWnfXG2c7cDWZTS2Q5LtWjYKWUSU6HfWpE6g4FMnSMxrIJKs21N6MZokm
	1siLtKT1hflfJsvcRzz32hqrXMxxnOREEIL8GgJQxwDKxJegtUV1F2hC/JH1RtXJzC1oBgQqf4X3Q
	anMUdQwFqxN6RJdqhrcC1zDfXfuIn5JyZ7aAv2IHT6MZf7Klsypz6ObKYrEaad81sfZw2QrNF6M0K
	CqWbr24aqLHO7xlBgzaSrGbOb88eZuDxctznszPEap4DhURGt9zfhsuXDb/Eraum8iPJ2sOTa4GkC
	FR90zFrHDpRDoUyZgqMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVJvf-00005m-Rx; Mon, 27 May 2019 18:00:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVJvX-0008Ks-Qd
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 18:00:53 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hVJvU-0005Dw-Cj; Mon, 27 May 2019 20:00:48 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hVJvT-0008G3-Vv; Mon, 27 May 2019 20:00:47 +0200
Date: Mon, 27 May 2019 20:00:47 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 04/14] pwm: meson: change MISC_CLK_SEL_WIDTH to
 MISC_CLK_SEL_MASK
Message-ID: <20190527180047.nfsjfqs22coyqmvp@pengutronix.de>
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-5-martin.blumenstingl@googlemail.com>
 <3b61897a-267b-fd6e-181b-a8c7e47918fb@baylibre.com>
 <CAFBinCDXNy4=6U2gsh6vK6WEtJKAdfDGPMrpPJthbp5Rru1hbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDXNy4=6U2gsh6vK6WEtJKAdfDGPMrpPJthbp5Rru1hbg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110052_015882_815BA254 
X-CRM114-Status: GOOD (  15.65  )
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
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 07:46:43PM +0200, Martin Blumenstingl wrote:
> Hi Neil,
> =

> On Mon, May 27, 2019 at 2:26 PM Neil Armstrong <narmstrong@baylibre.com> =
wrote:
> >
> > On 25/05/2019 20:11, Martin Blumenstingl wrote:
> > > MISC_CLK_SEL_WIDTH is only used in one place where it's converted into
> > > a bit-mask. Rename and change the macro to be a bit-mask so that
> > > conversion is not needed anymore. No functional changes intended.
> > >
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.co=
m>
> > > ---
> > >  drivers/pwm/pwm-meson.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> > > index c62a3ac924d0..84b28ba0f903 100644
> > > --- a/drivers/pwm/pwm-meson.c
> > > +++ b/drivers/pwm/pwm-meson.c
> > > @@ -33,7 +33,7 @@
> > >  #define MISC_A_CLK_DIV_SHIFT 8
> > >  #define MISC_B_CLK_SEL_SHIFT 6
> > >  #define MISC_A_CLK_SEL_SHIFT 4
> > > -#define MISC_CLK_SEL_WIDTH   2
> > > +#define MISC_CLK_SEL_MASK    0x3
> >
> > NIT I would have used GENMASK here
> that was my initial idea but I decided against it.
> the variant I came up with was: #define MISC_CLK_SEL_MASK    GENMASK(1, 0)
> =

> however, the actual offset is either 4 or 6 (depending on the PWM channel)
> and I felt that duplicating the macro would just make it more complicated
> so instead I chose to be consistent with MISC_CLK_DIV_MASK

An option would be:

	#define MISC_CLK_SEL_MASK(hwid)		GENMASK(1 + 4 * (hwid), 0 + 4 * (hwid))

(Note I didn't check a manual to the 4 above is probably wrong.)

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
