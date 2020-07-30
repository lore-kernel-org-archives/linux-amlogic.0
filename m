Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F85DC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 18:53:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C7BF20809
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 18:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NJrZWIFl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iWJFJd+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C7BF20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OxqEhZ5D7CZfbcyMBvGEpgc42QKTl0wrE7K0JUE0Ke4=; b=NJrZWIFlJmdWpaLmuz5G51W1p
	n9e+34UuzD2a1Ltbhcud/WYqjuxm8hiSuOkEr3BE9kQq6z82Wb/3YCXiK0eKSQSsiMHp38K2Z7kZ6
	67A2tSQeUCZjL045f3//DN7fDpKlXMgqSa45ArnK1nHppq2tOYQ69my/u280sInM4w/HHMd0U3P++
	/Uzacr2HspUUuGWZo9EOUvY0lvrXHm1QiJ/6TEiNsVgsU7RF8Fgl6FTjiyqhYLKguVQTw3f9XMwe+
	PqKr7T4X1BGbNI5+67jF5p2Xuk24vjFfNC8hNQ+x2VC0FAVYwQKPy2eg5XddQpSqYm+EsDAFWNqGh
	FU5A59k3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Dfg-000326-VU; Thu, 30 Jul 2020 18:52:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Dfe-00031a-Pa
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 18:52:51 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0543B20809;
 Thu, 30 Jul 2020 18:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596135169;
 bh=p9oPba0mvh+97oJckDtVD2Q3rUl/khvzbYhc/m/Wsrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWJFJd+rtMgYBOsBvF27NSJHWipQKLgElYBHEU6AO+7oj00vU85cw458+CwQ6nU2E
 7v8IfL/PsQpLmnkvm9Ke+QNRay67GMHHbxadMWcf2pLfAWcrWb3KP3vZUHRA0MDJpu
 fxKyeiy8R/Aj0WUCwc8NOfu9xVuAJ4BleP0rV7l8=
Date: Thu, 30 Jul 2020 19:52:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
Message-ID: <20200730185229.GH5055@sirena.org.uk>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
 <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
X-Cookie: Alex Haley was adopted!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_145250_990951_B6BD55A6 
X-CRM114-Status: GOOD (  23.93  )
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
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, zhangn1985@outlook.com,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============7968469144384812229=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7968469144384812229==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wj9ZLJVQDRFjGSdK"
Content-Disposition: inline


--wj9ZLJVQDRFjGSdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2020 at 11:06:23AM -0500, Pierre-Louis Bossart wrote:
> On 7/30/20 4:04 AM, Jerome Brunet wrote:
> > On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
> > > On 7/29/20 10:46 AM, Jerome Brunet wrote:

> > > > The flag previously allowed card drivers to disable a stream direction on
> > > > a link (whether or not such feature is deemed useful).

Right, and I can see a use case for this if someone has a board that
for some reason didn't physically connect one of the directions for some
reason - perhaps they were running out of pins or something.  It's not
clear if anyone's actually doing that though.

> > > > Forcing the flags to be aligned with DAI caps just make the information
> > > > the flag carry redundant with DAI caps, breaking a few cards along the way.

> > > > This change drops the added error conditions and restore the initial flag
> > > > semantics.

I'm not 100% clear, have we actually found cases where the flags are
used or is this something found through inspection and review?

> >   * It worked for every user of DPCM so a far.

> Not completely true, when Morimoto-san added snd_soc_dai_stream_valid() it
> exposed tons of cases where the information on direction was not provided in
> a reliable at the DAI level. I will assert that we are still finding out
> cases with broken DAI configurations, and as a result we will also find
> broken dailink configurations. Your picture of DPCM as a perfectly
> functional system that I broke is a distortion of reality.

> The reality is that we have to work in steps, first make sure all DAIs are
> properly described, then work on the dailinks and optimize at a later point.
> we will need warnings to find out what the problem cases are, and move
> slowly.

This was all triggered by Morimoto-san's changes like you say.  DPCM has
quite a lot of problems in general, here IIRC the issues were that we
had multiple different ways of doing similar things which it wasn't
quite clear if people were even using.  The intention with the warnings
was to remove them one way or another, they're mainly intended to flush
out actual active usage of the flags as opposed to redundant usage of
them which could be confused/broken.

This could definitely have been clearer in the changelogs though.

--wj9ZLJVQDRFjGSdK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8jFuwACgkQJNaLcl1U
h9AhwQf/eNX0synxDEgjT7FmPWLDHvEYP9WwcQyfMCzHdEvV8d3Iiq/P+C6GW13d
ehcDWOK1wzrqJjMyjh8jp+04kuRwwsL+YHnRD2FqYm1ajOp3ADdT3+ekGQXG5rZ4
KG99yZALADgpmbl6VOluas2lkeiWIjO3nZEFJypz0VJKtEyxCiXzzPbA81wgsyr4
pu0Q1XmfbUpAsLCeGlrjdENOLdW0Kfb0fjXcEy8ks0NHUfbAOj2JEr5uYTjPLZTt
8OH9bbhLUIhwGirTdF5piPsHbYq8ybFWDvKQ37qjqK0L7Nec0UdaTIqlroiOs1Xo
fFI19TW9/zN4P9cxHXwEC07WllXelA==
=Icbr
-----END PGP SIGNATURE-----

--wj9ZLJVQDRFjGSdK--


--===============7968469144384812229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7968469144384812229==--

