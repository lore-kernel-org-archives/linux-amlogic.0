Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B1EC28CBC
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 14:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DBC208D5
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 14:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hvn+pitR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DBC208D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oEhXg4tR93JTIatoF4XV8Ab9BcGRPVnnwT1w4w7cSYg=; b=Hvn+pitRMli1tT
	To2iT041qVOon1k/WZNDK8xCZQN6Fonl3Ko82wHluk4Fxnc4oNtxGwixmT4BGREjb2dR/704TXpFJ
	ILVlT/CCh75jpzRD6HUeVsjUWBOrIYDdv7BxZoPbQIueo+6srZXdpyPJHkRx3cOkSppDs7CoGchIU
	JHOGMNsKr/cGtyLrvzs5lId45TzqVNSfaihJ57UlF7RRzQEjVEhP7w1Pkre7efA4Y4/eng0AGTsn4
	1rYHHjy1G6z35lp59GMMSvVPa1cxl/kGjyGJWPHsacQBKZ1maTaeBYgK4vrBq/Q3JvTf56Or7ewFM
	iHIGN+GohT7toIQ755vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWLRd-0001uW-GU; Wed, 06 May 2020 14:54:45 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWLRa-0001tM-KY
 for linux-amlogic@lists.infradead.org; Wed, 06 May 2020 14:54:43 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jWLRW-0004Ds-LE; Wed, 06 May 2020 16:54:38 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jWLRW-0003Y2-7b; Wed, 06 May 2020 16:54:38 +0200
Message-ID: <05e51534c3d6284f555fd262b666c94d12cbd010.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: meson: add gxl internal dac reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Date: Wed, 06 May 2020 16:54:38 +0200
In-Reply-To: <1jy2q5f9zc.fsf@starbuckisacylon.baylibre.com>
References: <20200122092526.2436421-1-jbrunet@baylibre.com>
 <6f661498f58c6a519095d0657413f4b89d3ef21e.camel@pengutronix.de>
 <1jimi2tqsn.fsf@starbuckisacylon.baylibre.com>
 <1jy2q5f9zc.fsf@starbuckisacylon.baylibre.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_075442_674382_9FF40CAF 
X-CRM114-Status: GOOD (  16.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Wed, 2020-05-06 at 15:50 +0200, Jerome Brunet wrote:
> On Tue 14 Apr 2020 at 10:28, Jerome Brunet <jbrunet@baylibre.com> wrote:
> 
> > On Thu 23 Jan 2020 at 11:13, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> > 
> > > On Wed, 2020-01-22 at 10:25 +0100, Jerome Brunet wrote:
> > > > Add the reset line of the internal DAC found on the amlogic gxl SoC family
> > > > 
> > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > > ---
> > > >  include/dt-bindings/reset/amlogic,meson-gxbb-reset.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
> > > > index ea5058618863..883bfd3bcbad 100644
> > > > --- a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
> > > > +++ b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
> > > > @@ -69,7 +69,7 @@
> > > >  #define RESET_SYS_CPU_L2		58
> > > >  #define RESET_SYS_CPU_P			59
> > > >  #define RESET_SYS_CPU_MBIST		60
> > > > -/*					61	*/
> > > > +#define RESET_ACODEC			61
> > > >  /*					62	*/
> > > >  /*					63	*/
> > > >  /*	RESET2					*/
> > > 
> > > Thank you, applied to reset/next.
> > 
> > Hi Philip,
> > 
> > It seems reset/next has not made it to v5.7-rc1
> > 
> > Would it be possible to provide an immutable branch with this change, or
> > maybe let Kevin apply this change through the amlogic tree ?
> > 
> > It would allow us to progress on some DT changes during this new cycle.
> > 
> > Thanks
> > Jerome
> 
> Hi Philip, how can we move forward on this ?

Sorry for the delay, I have missed the last window. I've now created an
immutable branch:

  git://git.pengutronix.de/pza/linux.git reset/meson-gxl-dac

which I will be included in the next reset pull request.

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
