Return-Path: <SRS0=PYAY=4S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE50CC3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 00:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D4A222C2
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 00:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WvVahHpE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bQndGde9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D4A222C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zLec7Mvw+aFn214P20+qnlC9dC3frK6ypSc2okcrB8E=; b=WvVahHpEy14J8Q2Oj4DpQ3fEJ
	NwqWj3Fdnp1RsIp1UWQGyRWeijLaVyE/Ni6YwgvtkgpaVuSUwE8+7RyUMB07H6nvCCl8yeSHvPG5m
	0vqWBoo6uxBRL1fOqCuQHWlM7PsZLEY3njN9kr9Yx0sNSmQNUuRQoUMbgRHdS/7+KcUKxF8vI7/Qi
	7iVgdVQlDTnwAP22+B55NISUKpqK6N7PMqTZ3t4FNCGRHLi86eRlf2whcvPJdKjOUnglk49Xrs8Db
	Yww1rIebmZAfzjqAFr7DzEVCQM6LffeYMR/z6hyihyEB/OtA3T763TkV2hDHN4iFdHD1X1J9IWad8
	EoHx45j2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8CmX-00047v-H3; Sun, 01 Mar 2020 00:48:33 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8CmU-000475-BY; Sun, 01 Mar 2020 00:48:32 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48VPlW5nYLz9sPk;
 Sun,  1 Mar 2020 11:48:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1583023705;
 bh=4nRI6rwZRJmJBCSa2D7NMwK+7ECxFcV3Jplu7f2M8vI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bQndGde94p9FyOTmTOsKt5AnSDdUQoxCwxy7l9+8ZpBXs+oyYGsT/USUpwwCYFUeB
 OAs2OK8w6ainF6Hb1E0AJ3CtUFbC/Gb0BjAl8V8sCSxedVthQ/5mF0cXHyhWH3URuy
 548JnLhcYrDjKtEwM62cZV7xhRlwqKtlLRSnogfOpYniYaEqqhZXM/iY1dM+4u/X/N
 6kc5DIlzx4Xg9x6Gdes2FktrED8OwRU/yMDa6+PP8t50g89z4T4PxnCkpVeVv3S4db
 oEtYHaxZc1SvKAmmMUypMuz3UqBveSsmjCegll5CS64Xsw+gfj6rEWt1n7xZ+786FC
 OU6eoFzkoU47Q==
Date: Sun, 1 Mar 2020 11:47:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] soc: amlogic: fix compile failure with
 MESON_SECURE_PM_DOMAINS & !MESON_SM
Message-ID: <20200301114750.7d270124@canb.auug.org.au>
In-Reply-To: <7hzhd19vuj.fsf@baylibre.com>
References: <1581955933-69832-1-git-send-email-jianxin.pan@amlogic.com>
 <20200218080743.07e58c6e@canb.auug.org.au>
 <20200218092229.0448d266@canb.auug.org.au>
 <20200224101654.530f1837@canb.auug.org.au>
 <7hzhd19vuj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_164830_597967_F46325E4 
X-CRM114-Status: UNSURE (   6.37  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============1925698249855568875=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============1925698249855568875==
Content-Type: multipart/signed; boundary="Sig_/Kf1.E4dLddnNTqvZx6GlV0A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kf1.E4dLddnNTqvZx6GlV0A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Kevin,

On Sat, 29 Feb 2020 17:55:32 +0100 Kevin Hilman <khilman@baylibre.com> wrot=
e:
>
> I've fixed up the trailer whitespace an queued this up now, so should
> show up in linux next shortly.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kf1.E4dLddnNTqvZx6GlV0A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5bBjYACgkQAVBC80lX
0Gw+KAgAhjy4Z4V15rVXk29DVizB7BmoTp0AHlbwyBOXdg1fqDDAgpSapQv/aaTF
t/kpWrI8HPqJIV33mTw9Y4ihIwM3w3hurf1Z3fal9lem4IITW6hlcuXG8jm1I0Zh
rMlvimE+P9nv7UYTDqgQx0+v7nw3Y0kxJTkkoRbtPMOBeX/mq3oEMqHmvyTRzjjf
+uqsMBh50kotDakasWPX47i7cULdhXg3BUd/lPYg7n1wJ179GLOl0F83CLmbeCtK
D5PxpxIZmQEvgFModR81zi8NPz46WCa1WeSQ0edqS2AYBe8p6FWYyEeBCmU2b2ER
xjSTCdXBgNDI8gD67V0Tx7Qs1++sjA==
=V59f
-----END PGP SIGNATURE-----

--Sig_/Kf1.E4dLddnNTqvZx6GlV0A--


--===============1925698249855568875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1925698249855568875==--

