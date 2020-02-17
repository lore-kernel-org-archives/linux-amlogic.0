Return-Path: <SRS0=uJma=4F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42430C3402D
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 22:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15967207FD
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Feb 2020 22:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUICb6Zc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fB16ZjEj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15967207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JGzS5jB/E+F5KXFIQNzG/dj2iJKZYJ56P2X/D6x9pvg=; b=UUICb6Zcvh3nAYR5QC5nhn1HI
	LIhBgId/vu7iNcl4Jv+vRle1H22fOD3tftqFqpQ+2S9xzaOaiUeIA7fEPIW46F6NeNQMMHj7SVFbU
	9J1/ABuABzLU18PrfvzFNfVSLBdjUGuF6nv/tsJJ+7cy97kiw7eFErUzVUvy7O09tMNtSr0DCl/Vx
	TP9cCg/EdYSGz+jpOegttHGEe/8o0Tg0x2wq+jBsfaZcow8hJ6u5dvGyhkL12OjEQtCzaL+vJehx6
	FGSMmIaLOss5Qaci8ldVFR/dD/FTofMBz8NSHOsfAmSXHm2zZ0ZucRldeDggFXGfH7vC/EdA5kSvN
	qhsS0GXZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3oms-0003yj-1k; Mon, 17 Feb 2020 22:22:46 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3omo-0003ls-UU; Mon, 17 Feb 2020 22:22:44 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Lz4s3TWQz9sPJ;
 Tue, 18 Feb 2020 09:22:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1581978159;
 bh=T/Ho1UZEyFt8rs4SdRhU3v+8yxewmcXVrq7So23AQHU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fB16ZjEjWQ1+Dxc9OAbPk1bDSsmg4otnhc3HTmHHRUZxQHUqv5wcWqNqrxOTW+r1J
 oZlKigjMDFIO/I4jB/cGtIYxaqCPFdkr9TZeALZFb0sAljMlUU63CmHp+e1vbZIFwA
 u+L8sHcmVeoBFKhmD5BKx7+YPh9dLhdnPOAuMZJNqvTVmYZz8yB44kQUBOEnjUNHFl
 8OwTcN2z4rNA74p27snEmuoIiyUCDSBxm01OyfUdfYBKYvKUttrenaWdpsuNCjWh1+
 27rmHRv6oHPkLT/lmu2Z8Eb++7cOZcqH0Rargn+kVEKD+RPyQHIxPiEAFtm5GJgnW5
 ylz9hfujI2HIQ==
Date: Tue, 18 Feb 2020 09:22:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jianxin Pan <jianxin.pan@amlogic.com>
Subject: Re: [PATCH] soc: amlogic: fix compile failure with
 MESON_SECURE_PM_DOMAINS & !MESON_SM
Message-ID: <20200218092229.0448d266@canb.auug.org.au>
In-Reply-To: <20200218080743.07e58c6e@canb.auug.org.au>
References: <1581955933-69832-1-git-send-email-jianxin.pan@amlogic.com>
 <20200218080743.07e58c6e@canb.auug.org.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_142243_185061_BE14A8B5 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============5619647485865673647=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============5619647485865673647==
Content-Type: multipart/signed; boundary="Sig_/.qVlDOXsSXuL3sxUO2UwZ_+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.qVlDOXsSXuL3sxUO2UwZ_+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 18 Feb 2020 08:07:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 18 Feb 2020 00:12:13 +0800 Jianxin Pan <jianxin.pan@amlogic.com> =
wrote:
> >
> > When MESON_SECURE_PM_DOMAINS & !MESON_SM, there will be compile failure:
> > .../meson-secure-pwrc.o: In function `meson_secure_pwrc_on':
> > .../meson-secure-pwrc.c:76: undefined reference to `meson_sm_call'
> >=20
> > Fix this by adding depends on MESON_SM for MESON_SECURE_PM_DOMAINS.
> >=20
> > Fixes: b3dde5013e13 ("soc: amlogic: Add support for Secure power domain=
s controller")
> >=20
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: patchwork-bot+linux-amlogic<patchwork-bot+linux-amlogic@ke=
rnel.org>
> > Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
> > Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> > ---
> >  drivers/soc/amlogic/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-) =20
>=20
> I will apply that patch to linux-next today.

This fixes the build for me.

Tested-by: Stephen Rothwell<sfr@canb.auug.org.au>

Also, please keep the commit message tags together at the end of the
commit message i.e. remove the blank line after the Fixes: tag above.
(see "git interpret-trailers ")
--=20
Cheers,
Stephen Rothwell

--Sig_/.qVlDOXsSXuL3sxUO2UwZ_+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5LEiUACgkQAVBC80lX
0GxiFQf/YRVKJcX4m5O/6kWTlxZ2/vzcKlyfDLSY2sadgEbNcCoGpqHg3C8MuVN5
SHJd3URexLrLU3zLpCtgxCgDTjoQRNjqUIZVQYnWFBI0bOiWu+rc9Z+SCuJ62UVq
Ct6I89voQEMg9Wdz37uordsgbGJIRq+VFiA2lOSLJhMxQIJ9/5Wf5AO0i2g/RDxz
j/xX2bbl2nb3fFBBWQ59Hs1/GHaXCv73apLt0WTxxw8I5slbF0sRYqWDo0BABABX
PIar9gHeIOrBLJWJJTqJV3E7/JepXwBpfZK7fuZKcroirNefQrkQdhRW26C7gKFN
9uuM1INSTOTPFxa5jaYaw0r3vAnkYg==
=IwNd
-----END PGP SIGNATURE-----

--Sig_/.qVlDOXsSXuL3sxUO2UwZ_+--


--===============5619647485865673647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5619647485865673647==--

