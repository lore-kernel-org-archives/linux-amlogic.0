Return-Path: <SRS0=Mql2=42=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F40C10F27
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 16:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C5CA20727
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 16:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dlypd6t9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C5CA20727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L+IhXDkfg95Tt02JRG4DEyZAEZK9Geels6KhBhz+A6I=; b=Dlypd6t9D75g3djwgkgEi1W9y
	YDPsAlP2pIIOBn5ymvyKIcnPfGIG12ub3V9KYcvv3vqdq58vJu5sUUc67CJ+WbVan/SyfEM84W4eY
	v/fUdz94Ra0xOxs0vouHKxYFWdKWLboLlILLsOfzVwy0sBqA9KSYFWG9Y+2RtdZBS29jK01kgtbz0
	O7r6YlRa+1O6ahHsxZpmE+tKsl/UGeUWb6i55p9zHvkw4+0xB773jqQ/5AjAvJjd5v+RiWy5fDsq2
	RE5/1HC9Zo1VPYRo8ByYBdKVByH0uu1wK9lI3t6rpuHgk62SAVnwsyl8oC+vh0u7Z+uw54TMKbF+O
	NgheUjuDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBLkR-0002rD-UZ; Mon, 09 Mar 2020 16:59:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBLkP-0002qp-Li
 for linux-amlogic@lists.infradead.org; Mon, 09 Mar 2020 16:59:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E48A41FB;
 Mon,  9 Mar 2020 09:59:20 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68E9A3F534;
 Mon,  9 Mar 2020 09:59:20 -0700 (PDT)
Date: Mon, 9 Mar 2020 16:59:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] sound/soc/meson: fix irq leak in error path
Message-ID: <20200309165918.GI4101@sirena.org.uk>
References: <20200309162912.GA21498@amd>
MIME-Version: 1.0
In-Reply-To: <20200309162912.GA21498@amd>
X-Cookie: Above all things, reverence yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_095921_758682_7FACA789 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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
Cc: lgirdwood@gmail.com, khilman@baylibre.com, tiwai@suse.com, perex@perex.cz,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============1265141703760493287=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1265141703760493287==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FUFe+yI/t+r3nyH4"
Content-Disposition: inline


--FUFe+yI/t+r3nyH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2020 at 05:29:12PM +0100, Pavel Machek wrote:
> Irq seems to be leaked in error path. Fix that.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--FUFe+yI/t+r3nyH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mdeYACgkQJNaLcl1U
h9CCoAf/Tg1V9NN7lBma6RAUr7lr0CLFWaDKyjqFXtwx7isnFIrUOkc4mXutsnch
oDQPhuU/xFmiASiebvnpQfRl0OV/76zo9EE05eoDSJ2cxlZvoi21bPBQzJGmPpMW
AYKwHtxF74xlqW93UdNk+ldRhSAkYg8piOt4vhKDEacLZXFhfWzbewCtsWkg5sER
+6cIAlYelohDbZCjKgxvyO1xCKNx2XM5LBhSZ3YZNABVR6Ft9hPPySv+8/qBDj4u
bhbO5FaCY23DGdsylPzCHvg3IabQCWuc1GVSRGLrJcPWcaw9FD2uoMWfA3C4+eHw
V1NnOlUZCmbhbesMUHZg1nVEtO+gdg==
=71Fr
-----END PGP SIGNATURE-----

--FUFe+yI/t+r3nyH4--


--===============1265141703760493287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1265141703760493287==--

