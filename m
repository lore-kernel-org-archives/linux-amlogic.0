Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43865C3DA6E
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jan 2024 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7xGJ6cPmdcTAsAwmfPkavph6Vw/SMPr/i5y+JCeynM=; b=Za0BHohnDwu/bf8CTs2Go7ahrs
	N3EgA8Xnj0DDhfnEex1I2dfMCfgQtOe+HdUfIkgWlYLx3rq14KEUUn4HWQA6ObtYXNg6ywi+AEiyD
	0KdRG8BCy8n9LoogfF6fzsr8nsa/okNQ4utynGo0c0GfGxCDMGIM2jb+dyRC8ZEJuf97HRUBPIj4I
	ZSUIwYUo82/+eKsMuaIInWjBS7eefpRZBOXyrSwFqs3ntGMqCBUyo8gUnIJyOOuvxBdyTENB2fJUB
	ibrUA6zY1kjSvPh85Y1QfwtDQhsyNkF+fh1rAsARR6dxS66lSKw3/IBDg/gdXYDB8HH6R0SKDm+Ou
	cswF1HIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUOF-00Antk-1A;
	Wed, 10 Jan 2024 08:56:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNUOC-00Ant0-1N
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jan 2024 08:56:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNUNx-0004Iz-T7; Wed, 10 Jan 2024 09:56:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNUNu-001f8W-QB; Wed, 10 Jan 2024 09:56:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rNUNu-006Ntr-2E;
	Wed, 10 Jan 2024 09:56:26 +0100
Date: Wed, 10 Jan 2024 09:56:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Raag Jadav <raag.jadav@intel.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Kevin Hilman <khilman@baylibre.com>, 
	Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-arm-msm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Frank Li <Frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Besar Wicaksono <bwicaksono@nvidia.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jiucheng Xu <jiucheng.xu@amlogic.com>, Robin Murphy <robin.murphy@arm.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 00/18] perf: Convert to platform remove callback
 returning void
Message-ID: <vlnl6og3bts5hcdjw5h7c4km7zolzuf6h7cwyfymjzan3uqjwy@rsra3lqdhou7>
References: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <cover.1702648124.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_005644_481925_9A0E6FC8 
X-CRM114-Status: GOOD (  18.21  )
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
Content-Type: multipart/mixed; boundary="===============4360453048200009412=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4360453048200009412==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="no4oat75dmv7km36"
Content-Disposition: inline


--no4oat75dmv7km36
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Dec 15, 2023 at 02:59:00PM +0100, Uwe Kleine-K=F6nig wrote:
> this series converts all drivers below drivers/perf to use
> .remove_new(). See commit 5c5a7680e67b ("platform: Provide a remove
> callback that returns no value") for an extended explanation and the
> eventual goal. The TL;DR; is to make it harder for driver authors to
> leak resources without noticing.
>=20
> I based the patches on today's next, I had to revert commits=20
> 3115ee021bfb ("arm64: perf: Include threshold control fields in
> PMEVTYPER mask") and 816c26754447 ("arm64: perf: Add support for event
> counting threshold") to compile test on ARCH=3Darm (this is a problem in
> next, not in my patch series).
>=20
> This is merge window material. All patches are pairwise independent of
> each other so they can be applied individually. Still it would be great
> to let them go in all together.

I wonder if this series is still on someone's radar. It didn't appear in
next up to now, so I guess it's too late for 6.8-rc1?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--no4oat75dmv7km36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWeW7kACgkQj4D7WH0S
/k5rIwgAqr3/DiavBC9snrdYbr7SgHIPe7cKime6131NsWiElWfvc2pWiDnQyj1t
qo6sBLxFi+qRa61dSSRy7b7NT3XZ4orkpEgASsGYtgyc/b0f0XlAkn2RRcRaPeQW
XKbHFW4fjGZfXhyUdOBp9vvhuraDQx1GZezpISG0YWvT4UFQIlFSfX6GaoiIGe4d
LidSuc3leV3Ke2RsFLw0GhIHrv7ctd96TqJsXP7zmDh/sFF4ysQEfbpeSkFDEjX0
fnGnHlj4cefY5TkgFtHZW7avEDUda7WdADNApxyYijPvMaoVg/5gRLjuoTABLO1h
abXTI2fsT0fot+C8JuPHCxKOwfIprA==
=53Rz
-----END PGP SIGNATURE-----

--no4oat75dmv7km36--


--===============4360453048200009412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4360453048200009412==--

