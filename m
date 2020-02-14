Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5C6C2BA83
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:22:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CDA22187F
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:22:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZcrsFA4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CDA22187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jfhNSgdIyfvNvFbNRG6kBODap4MrloORgFzmjN/EDe4=; b=sZcrsFA4ovKixUuS4rfRtnDwl
	HoQSAOmhuub67MD2vmM+wJRbbAECCUCxwOY5bCHEKZS85mVYB6CqgXbg0UTDhFbGJNxQ7DPs4vfHc
	vJac0RYEZnxymqJ01Bb1tW1Hm8MEt+WGXQ4UESwMXdBki6OkrgBcn5920PIuwCUvgFUa5UtKXFluQ
	GqW+UyHnBNagXxSCW2RT0KuQY28aY19wJUYAw0ufvwYcUx9yq1WLGyYnk1fi1OD8JCm9qrZGuiucx
	PgS8gM4mBta6d8gU5ibkTU3+KwgMRwWHuGZM1+xL3uhp1ZidGIjOF4Wi0S7ApvjLqsV/I8QQPc4+D
	f/9xi70zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2avB-0001kq-W3; Fri, 14 Feb 2020 13:22:17 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2av9-0001kK-2R
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 13:22:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70E61FB;
 Fri, 14 Feb 2020 05:22:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ABF23F68F;
 Fri, 14 Feb 2020 05:22:13 -0800 (PST)
Date: Fri, 14 Feb 2020 13:22:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/9] ASoC: meson: aiu: add hdmi codec control support
Message-ID: <20200214132211.GK4827@sirena.org.uk>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-6-jbrunet@baylibre.com>
 <20200213182157.GJ4333@sirena.org.uk>
 <1j36bdfgx1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j36bdfgx1.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_052215_159498_278EDAA8 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4524833111636167758=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4524833111636167758==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QxIEt88oQPsT6QmF"
Content-Disposition: inline


--QxIEt88oQPsT6QmF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 02:16:10PM +0100, Jerome Brunet wrote:
> On Thu 13 Feb 2020 at 19:21, Mark Brown <broonie@kernel.org> wrote:

> >> +#ifdef CONFIG_DEBUG_FS
> >> +	component->debugfs_prefix = debugfs_prefix;
> >> +#endif

> > You really shouldn't be doing this as it could conflict with something
> > the machine driver wants to do however it's probably not going to be an
> > issue in practice as it's not like there's going to be multiple SoCs in
> > the card at once and if there were there'd doubltess be other issues.

> I'm not sure I understand (and I'd prefer to :) )

> As you said before, initially the there was supposed to be a 1:1 mapping
> between device and component. The component name is directly derived
> from the device name, and the debugfs directory is created from component name.

I understand why you're doing it but that feature is intended for the
use of cards when they're integrating components, not for devices
trying to register multiple components on the same device.  This means
that a card that tries to use the feature will conflict with what the
driver is doing, but like I say there's no obvious use case for a card
doing that.

> Instead of addressing the debugfs side effect, maybe  we could just make
> sure that each component name is unique within ASoC ? I'd be happy submit
> something if you think this can helpful.

That'd be better.

--QxIEt88oQPsT6QmF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5GnwIACgkQJNaLcl1U
h9ConAf/ZGIifJ2A3GT7/6hgGBOd30DCPyZ8wpzAq0wHv/ihVoH/uLJqlLiRVglQ
Nqx0WU3HNlkMaHwiGc/1rp2fiXdZ1hzXQsCcHMX+0vQyLVRqtsITAVkHauL9RVE8
U+DlOVSjkI7k4jPw9NQgATNCA0a5cw1WMzorwS6WNeLMUS3eqQdqxBZeLgwTqtdz
zRg9Fwb/c9xmCJgQ8PdybSvDTxW0G9Mx/0BWAfeJqSUTk/2tQjpODkaGQP1fH/Az
keB6n64qi+KoaIGZNUVEfiLL2zJ0w49nfDKyb1n5KndN0+iOVbk9jxRtnDaGajYF
/ZLH5B59EjOw9RfRJTsAvNs2GO8JIA==
=YJRb
-----END PGP SIGNATURE-----

--QxIEt88oQPsT6QmF--


--===============4524833111636167758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4524833111636167758==--

