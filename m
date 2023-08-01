Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C306EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Aug 2023 06:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGlZvcLlxAyH5/5h97IsXYTU5aijgrVMW/5Iul7w6pg=; b=U00cqrHPZGtViYWuv/zzJVEphf
	V6FMAv2i8z3+ELhvpo6DRb4YV1TFiH24EmG8iCy6smsZUxHkg9fVlrncDV4iFTiSfC2MGtuixcoBo
	jYMASboB2qw2wPiBpsL8uH/EL33Wn8uDkNg3p4Jh5wpZ20cKUNj8+PJ8ZLC2PBWkR3PlIJaIah0j/
	eWI4mFi46/AvQOi6XEYA2Plxe0WNQSN6dttta8wizGa0HhorlRkdzuX6OB7qFYL6cMuQ/Lgf7frQq
	yqJLU7iLt8Sjq/HQrDrdz/jXnwB+MraTrIZaCRFZh/8fTtltxMlUNJtBBVJ2xQ/NRqxvY4MxfjRV+
	9NWAoorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQj1X-000Ta0-28;
	Tue, 01 Aug 2023 06:38:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQj1U-000TXZ-0V
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Aug 2023 06:38:25 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qQj0d-00070v-4I; Tue, 01 Aug 2023 08:37:31 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 76E8C20035C;
	Tue,  1 Aug 2023 06:37:21 +0000 (UTC)
Date: Tue, 1 Aug 2023 08:37:21 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jose Abreu <joabreu@synopsys.com>, imx@lists.linux.dev,
	Simon Horman <simon.horman@corigine.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Fabio Estevam <festevam@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jerome Brunet <jbrunet@baylibre.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Wong Vee Khee <veekhee@apple.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Revanth Kumar Uppala <ruppala@nvidia.com>,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 net 1/2] net: stmmac: add new mode parameter for
 fix_mac_speed
Message-ID: <20230801-portside-prepaid-513f1f39f245-mkl@pengutronix.de>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-2-shenwei.wang@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20230731161929.2341584-2-shenwei.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_233824_191755_8ED49A8C 
X-CRM114-Status: GOOD (  17.09  )
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
Content-Type: multipart/mixed; boundary="===============1467372946405368677=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1467372946405368677==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bosuzfm7oov47gw7"
Content-Disposition: inline


--bosuzfm7oov47gw7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31.07.2023 11:19:28, Shenwei Wang wrote:
> A mode parameter has been added to the callback function of fix_mac_speed
> to indicate the physical layer type.
>=20
> The mode can be one the following:
> 	MLO_AN_PHY	- Conventional PHY
> 	MLO_AN_FIXED	- Fixed-link mode
> 	MLO_AN_INBAND	- In-band protocol
>=20
> Also use short version of 'uint' to replace the 'unsigned int' in the
> function definitions.

There are not many users of 'uint' in the kernel and it's not used in
the stmmac driver so far. From my point of view I would not introduce
it and stick to the standard 'unsigned int'.

Just my 2 cent,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--bosuzfm7oov47gw7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTIqBwACgkQvlAcSiqK
BOi7Jgf/UaTFYSC4IuXT7k8VsP0wkBG1kcRP+yNZbLdHhdJNmRn2K0iTpv82c/8q
ZYpLreaQqEKOb7TszFXyDCSS1Mssv66nj047Dc6LHrnW2VbY7P9LSCMsnSUaoh0a
lkOknimCFo9HKbYqND+gh1y/o6Wz5PO36qbaBR1giHbUdB9+Ow0AlTR3V9KeMOb4
OsXSR2ihf5LYXebKvn8StZSwICnzZ78eLFZJsxu0oEMJDnaxIM5VQb9MaCfPbZv8
/Bco4yUWkcOqrMmHnL9TSVvgaNJLzxowhcbwA9rucxpS314AJAqil34OSnmnQeGW
1+lihD2B9mQqxq0drsTeFh5UBcLxNA==
=DXrv
-----END PGP SIGNATURE-----

--bosuzfm7oov47gw7--


--===============1467372946405368677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1467372946405368677==--

