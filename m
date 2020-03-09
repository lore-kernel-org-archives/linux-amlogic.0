Return-Path: <SRS0=Mql2=42=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8626DC10F27
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 16:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C261222D9
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2020 16:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L1IHHuYD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C261222D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=XonE/Zd9UijawKdhVWcdqkf7wySenO9X22i/uFw84Tg=; b=L1I
	HHuYDLE0bACUaTRuSOsDDWnp1pXkZiRQ+7ChbNT01PbeXyUiu14GBgvcgQ42goye7q2to0cxm8lJ3
	Qguqkv/gOHaNZyelABRusufng/I4RzfJWZ2q9hkYTIsIqjjJCr+MTJyKWYkpy2D2ZsvUsESb5DEXN
	BxHS2jrnfJkVqDQ3L/gnW4QqMQvJ465H+cnhirtnsjI8S3CE2MUDQgbiWDPOxnK9Zslajt9FLOi5m
	1ws3whNjcy2Op4A8fPjQryxJcGRcbDfff5+5pwsXD6P3IXkP7vmA7UxASCUK0MEmOVaFWL2o6x3Qa
	xtqTxYXbtXqQUZr/31twilPGPW+YTTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBLHR-0007mF-KY; Mon, 09 Mar 2020 16:29:25 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBLHO-0007jM-MY
 for linux-amlogic@lists.infradead.org; Mon, 09 Mar 2020 16:29:24 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 5B62C1C0316; Mon,  9 Mar 2020 17:29:14 +0100 (CET)
Date: Mon, 9 Mar 2020 17:29:12 +0100
From: Pavel Machek <pavel@ucw.cz>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] sound/soc/meson: fix irq leak in error path
Message-ID: <20200309162912.GA21498@amd>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_092922_882673_B1455C34 
X-CRM114-Status: UNSURE (   9.86  )
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
Content-Type: multipart/mixed; boundary="===============3922470561562744430=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3922470561562744430==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
Content-Disposition: inline


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Irq seems to be leaked in error path. Fix that.

Signed-off-by: Pavel Machek <pavel@denx.de>

---

I noticed problem during -stable review, and don't have hardware or
ability to test the patch. Handle with care.

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 2f44e93359f6..fbac6de891cd 100644
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
@@ -270,8 +269,14 @@ int axg_fifo_pcm_open(struct snd_soc_component *compon=
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

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl5mbtgACgkQMOfwapXb+vJefgCeM7d1Qx3cehrDJzEYzLcj4iyP
CKMAnA6pptOXe9GMjiERO2VaCYnThakN
=fqcx
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--


--===============3922470561562744430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3922470561562744430==--

