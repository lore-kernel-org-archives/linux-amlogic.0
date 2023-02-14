Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E7CC05027
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMhVM6gsCyhubrD4VVZUnC+ZRoPUCbSLXvX/o3P01XQ=; b=M3TWhi1oaufUaTM73YLW3BEA55
	+uT4i8ecAIv/ziUdOdjGFs8MNU2poj8JlmL3B/ptU1LnAwiD8dDUzsUjIGmGtO6RI1lBsq0KUHNoN
	WZfJb8+uYoBFxspKimjUaP6GCCNOD7hx1N9gmLSmqqtzUTxHFRoQLROB2kGVbC38VNc+1Srgj2M+5
	1sT/vI7brypBPUaTlWZdq+qcrTy13TQdcJ35r8+XzQOIjYQVjQAKaSeuq+pwAHY27SK5ptK4LEB35
	sizPjPANMMXRYe4zzGhTmFJbI5/cD9zMvAWNnkD9Mg5ihLebpWRt7rCJgIpMJLp4/uR5NQB1hjnlk
	XHZhA6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3UL-003kAe-JM; Tue, 14 Feb 2023 22:09:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS3UI-003k8w-8p
	for linux-amlogic@lists.infradead.org; Tue, 14 Feb 2023 22:09:23 +0000
Received: from mercury (unknown [185.209.196.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 84B776602173;
	Tue, 14 Feb 2023 22:09:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676412556;
	bh=alXr5cFGo6ZX+NcmH0aKeKPUofQn3NagXbNvEpCcFf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzHQaH3ubU12gc9D9ci87g24fmc54eqPFhD+EtZwabcZuvw0+vuX1iQl9/tixjQ2D
	 AKsttnxf+pobj/u8QQlgfdcKRzOYalua5A64v9j5CxhkOHy1BjH/gLZsuenKy/qZfn
	 LzvwTVTLNyD2Gb3ZS5P5L3Dg946+6K3Em6nfCLNY5aAZCfMaHqs7kPCxvHptV+47Sj
	 5/bjxp8J/WJnvH++W1kfWwreVk19FRxzZi8x6zVfWUw7KsibIWZ4RPlqA0lTRMv+yU
	 tFd1d1deoxTCjpZjOvOH8gWsMlWjn2j7w/Ac1OPMXRsCfW0SzIB27Tjyomxq5SohB7
	 Cpw954tuXwFYA==
Received: by mercury (Postfix, from userid 1000)
	id B492310603FE; Tue, 14 Feb 2023 23:09:08 +0100 (CET)
Date: Tue, 14 Feb 2023 23:09:08 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4] power: reset: add Odroid Go Ultra poweroff driver
Message-ID: <20230214220908.vpzlduyhfcoqzenb@mercury.elektranox.org>
References: <20230126-b4-odroid-go-ultra-poweroff-v4-1-979efb6eb3fb@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230126-b4-odroid-go-ultra-poweroff-v4-1-979efb6eb3fb@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_140922_479660_A182659A 
X-CRM114-Status: GOOD (  12.78  )
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
Content-Type: multipart/mixed; boundary="===============5157265694781423465=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5157265694781423465==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t46mdvvr7bb4ua2l"
Content-Disposition: inline


--t46mdvvr7bb4ua2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 14, 2023 at 05:41:18PM +0100, Neil Armstrong wrote:
> The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a powe=
roff
> to its two PMICs in order, this represents the poweroff scheme needed to =
complete
> a clean poweroff of the system.
>=20
> This implement this scheme by implementing a self registering driver to p=
ermit
> using probe defer until both pmics are finally probed.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Previous submission was at [1], but I converted it to an independent
> platform device with device auto registration to permit waiting for
> both the PMICs drivers to probe.
>=20
> [1] https://lore.kernel.org/all/20221031-b4-odroid-go-ultra-initial-v1-2-=
42e3dbea86d5@linaro.org/
> ---

Thanks, queued.

-- Sebastian

--t46mdvvr7bb4ua2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmPsBoQACgkQ2O7X88g7
+pqYSQ//ZQ7xDk9zbf/G8rWnumQwSRBpGvVYR8J5b4sfxFtcH5CmlDYXAtIrYyq5
pjcSnkQk6/v3g+hTX9yBcqLKtGUcC7xfk++QujipQKq2JNbVmq+0W3/A4dGlv+u/
b1fTXfXOfU1PxJ46NwXzj391GEFbsAFljwhpkfIcncU6LJsOknalZ35YXths/Woi
EDvxSkfbC01PV+JyFqd3lMzj1EPLlMBjHkVeVpQjj0EgGtaLIoi5t5w2w3euPm4C
6fsniaL7DwunQeqhB7L9bjekD9zyNjHyboB/IJg5YKnLNRj8y1g7DD4nVrhcWqpu
U6LRa1e5Y4D+Mgi8F4kkaS96A++gtMhWtwsXFzIy5OBP947kM3TQlNbufSMsEVOm
zTwk+yjohrNKygBrhJazt+tWO9vub1nEs9hEnlpLlOvEVpz4dRqKOUuS9boqbEgG
rOkxRLOvO0nnBhpKtwqXebJg/AZ7rctuqTnbsQnMtdIxZ0/jbzwObAtDf5C2xsG2
T6EwKSJrJZ+45i/9k9SrJirbNKgJsVM6I9V0Tr7m30pD7CbGciBvy/STvwb2PRDX
sjyWRm07aXPvSs+aYCfTr5fD3HPB310mXnYdVGhZ+bwFczOWiPifYnY1AZ4KVfp2
Yc5yDhollHdA9ptAvhs70YFPMPT7r6kVOT1QjplNcdeeFDduEPk=
=j0ok
-----END PGP SIGNATURE-----

--t46mdvvr7bb4ua2l--


--===============5157265694781423465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5157265694781423465==--

