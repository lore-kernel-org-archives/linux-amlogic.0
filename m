Return-Path: <SRS0=4cQX=7T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCECC433DF
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Jun 2020 15:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E9F20772
	for <linux-amlogic@archiver.kernel.org>; Sat,  6 Jun 2020 15:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EwXw5LK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E9F20772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/Py8yMfRts+FfhkSQC1fpws3j0Qk3xQVQWU57mZNZJM=; b=EwX
	w5LK6Aj9KkY38BvV58j0X9bOONlonDV9I1/ZFlRL0pzgJvfa9RmmHLIKTJDuJj2g6V34W5kI8oFNP
	vnQzEissTPPcF05x33+X35skJytcqqD4IkKxHhyuApjOI8SWr7GSjD0ynEXjoYFC5aJxLNh/fJ1zS
	Wd0y6ES4fasiFa0HKJoMesG9LYlIC4x1lxoJJFXn6T05x3OqV0OCsZECp6TDA/tXINR8NbWcFSYZb
	ZDIqmruTsOe5d43fnpnIiZeVi7Q1M7HFX8LD+S/IR9fu9EX8cb7KHEblvpK+LGKsfhEPSvcm0xorZ
	8Tx4Q6gGkIe+gu9y4WLwzmGb5YJifFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhan2-0003j5-Dv; Sat, 06 Jun 2020 15:31:20 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhamy-0003cr-F9
 for linux-amlogic@lists.infradead.org; Sat, 06 Jun 2020 15:31:18 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id CD6821C0BD2; Sat,  6 Jun 2020 17:31:04 +0200 (CEST)
Date: Sat, 6 Jun 2020 17:31:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
Subject: [PATCH] soc/meson: add missing free_irq() in error path
Message-ID: <20200606153103.GA17905@amd>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200606_083116_658778_3F7C0F7F 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Type: multipart/mixed; boundary="===============4392665176268233385=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4392665176268233385==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/04w6evG8XlLl3ft"
Content-Disposition: inline


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

free_irq() is missing in case of error, fix that.

Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 2e9b56b29d31..b2e867113226 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -249,7 +249,7 @@ int axg_fifo_pcm_open(struct snd_soc_component *compone=
nt,
 	/* Enable pclk to access registers and clock the fifo ip */
 	ret =3D clk_prepare_enable(fifo->pclk);
 	if (ret)
-		return ret;
+		goto free_irq;
=20
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
@@ -269,8 +269,14 @@ int axg_fifo_pcm_open(struct snd_soc_component *compon=
ent,
 	/* Take memory arbitror out of reset */
 	ret =3D reset_control_deassert(fifo->arb);
 	if (ret)
-		clk_disable_unprepare(fifo->pclk);
+		goto free_clk;
+
+	return 0;
=20
+free_clk:
+	clk_disable_unprepare(fifo->pclk);
+free_irq:
+	free_irq(fifo->irq, ss);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_open);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--/04w6evG8XlLl3ft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl7btrcACgkQMOfwapXb+vJ51wCdFIey2vjfzhnWLuSj7KK518uE
1BgAn3bsVTxHs8pdwxUTDu7T0dLdrWBj
=0D1B
-----END PGP SIGNATURE-----

--/04w6evG8XlLl3ft--


--===============4392665176268233385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4392665176268233385==--

