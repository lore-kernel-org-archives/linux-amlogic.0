Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757EDC05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOcDfWIoGLlrX/CrAfRSNfB0FCyBJxzcm29w6CWBBfs=; b=OUZj24blkywBlXdUMNtTX9l1Lx
	6OAAg4G/N+tOTrxIFAWvJYDa58Nulxfsoiy3sv7oTC9lUP4VLDUk8m2uIuBirPc5PL9FGH9g7mSs5
	tlq4NDLI9Kp8UrBu1TV/i6+k0wsbwvvJJ9Zxc8ngRRVjRhGv/c4aA/+1u42hOBrCBgDohAJ46Ey0m
	MxENZ3NlTtoDCAqxoiIJFwG/HiPa/6fwiZXpiznrfX2V6moD5zz+Te1tlqk/XYHTHnUwjpRiQf8ld
	vZKe8mqwtw4SmFSGO/dpkvtQiRQHMCEQXe92A7s/soXSjSS4RYm1dZkImio/Tb9qlj2+d7ezGYG6S
	5gjy8w2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNCVJ-00BlOs-1C; Wed, 01 Feb 2023 12:46:21 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNCV8-00BlMZ-Kk; Wed, 01 Feb 2023 12:46:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id l4-20020a17090a850400b0023013402671so2040950pjn.5;
        Wed, 01 Feb 2023 04:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkTFIuSPLKfoCtXCCCEyL+yG+V8An1lDoLyWCS7QCCE=;
        b=mA4Ut5jbcgfFDPIma8gjZ/ALtxNk0qxYXRSplQ+1PZ27gYHRY8MUQ9yaB1G2bJ9qYy
         OjlHRtdx6ChK8qhX96A8+RNKb8BQeA7mRIndjrvkzMw1LVuTSXNNTMuopzazWvzQ9TYs
         RirB4uVo4tRbqoHUJKUsLj/CAs0Np8s2PO/wyV/79UHa1P2KFvehZf8YisTrTwZ41Aan
         BaKYGT6SyTcdSKyaoR9kEiksSv8YT1MIy0uOF71d1d/8FBEkGckQEg7Xj+K6H/P5jHE/
         dYgl9QNubSBQ0Ss72V2FOXH7E4hbahlOL2TJgtCo4uXk5t44NCSA+wjSS4+Fk6issw1Z
         JA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkTFIuSPLKfoCtXCCCEyL+yG+V8An1lDoLyWCS7QCCE=;
        b=j5Sm4cr5FIsoE5LB+H4jMA7EUKTZEdGY2X3TWE3MqK3xDs5eGDCvpJeXCcrgyeZv/q
         e8bqoRXTvafbZoNOBkaSs4B/+jfKGxXWVOycRpLu9h5M2DbbvxJG6xnzYXuJ+B0H+OJ5
         ZGU5RrVqI/d4ctn7LhD6lxIOcYYEGj8fGLHnGnDorQ5UXR19yMpx0E4dJiet5EYqpq0u
         b7P1cylasgdZ6M/ZNnNffVsT+EtTXJcZe6VeBsZbb5HogtDkAs2l5p8+MQ39OYyHD28C
         z6dElsMD3INMR22wjFMJqlNFTRIWQbCkg7bBKATX6XdbdHmGOelXP5Xb+SB2gL4MEYaJ
         rTzw==
X-Gm-Message-State: AO0yUKVSM2/jHJDWjvatmi3rSa+TB48MJM9kSX+IN3DZT/LwMK3alDuz
	NjoNgTTlgEWxVE//DYZvOUo=
X-Google-Smtp-Source: AK7set/+oQpZ3sqH5WEgSzWEjuYdwtIXqhHCYm96eYbih6oxEetY39DrwiJaHfMPJWJ5/5eWaj2RpA==
X-Received: by 2002:a05:6a20:8e22:b0:bc:3290:5759 with SMTP id y34-20020a056a208e2200b000bc32905759mr2910934pzj.34.1675255566873;
        Wed, 01 Feb 2023 04:46:06 -0800 (PST)
Received: from pek-khao-d2 (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11315252pfv.193.2023.02.01.04.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 04:46:06 -0800 (PST)
Date: Wed, 1 Feb 2023 20:45:58 +0800
From: Kevin Hao <haokexin@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
Message-ID: <Y9pfBpoZ4cezf6Bb@pek-khao-d2>
References: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
 <20230131215528.7a791a54@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230131215528.7a791a54@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_044610_723967_ACA977EA 
X-CRM114-Status: GOOD (  14.37  )
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
Content-Type: multipart/mixed; boundary="===============7130642371955005191=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7130642371955005191==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Mk4AfqfvQZZ1jb0O"
Content-Disposition: inline


--Mk4AfqfvQZZ1jb0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 09:55:28PM -0800, Jakub Kicinski wrote:
> On Tue, 31 Jan 2023 22:03:21 +0100 Heiner Kallweit wrote:
> > Jerome provided the information that also the GXL internal PHY doesn't
> > support MMD register access and EEE. MMD reads return 0xffff, what
> > results in e.g. completely wrong ethtool --show-eee output.
> > Therefore use the MMD dummy stubs.
> >=20
> > Note: The Fixes tag references the commit that added the MMD dummy
> > access stubs.
> >=20
> > Fixes: 5df7af85ecd8 ("net: phy: Add general dummy stubs for MMD registe=
r access")
>=20
> Please make sure to CC the author. Adding Kevin Hao <haokexin@gmail.com>

The changes look fine to me, but the using of the "Fixes" tag seems a bit w=
eird.
The "Fixes" tag is used to specify the commit causing regression instead of=
 patch prerequisite.

Thanks,
Kevin


--Mk4AfqfvQZZ1jb0O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEHc6qFoLCZqgJD98Zk1jtMN6usXEFAmPaXwYACgkQk1jtMN6u
sXGSEAf/aq9hSch/hWtBwo81OFaSkRoIMDg4Dc2g5ql9SQMc8Nxvd+o540SbCXuX
h988OPOrvw7JXUEswqX2GJMIwgJAYpDQsfmzkAkwszgMY4Vh8ZepoUvMQK6fjxUU
lipFEBekx5ZWL8WPQSbsXjx9TUvi30qTq3KIXc32UyBA/OqQDyrjOEv8LmaLlZj8
nJFeiF999+tvG7yXAmczxbsfvV2tl29FB/SwyTT2UsYeVuPp5klPkumyzHBmfCXg
tv7938MAL+5gF80jAUhbj4yaUPXhxGA0/DE4pv+9iV7eHDT2m4fWxrzISprylzzF
EbExviPu5xzwIzcJd3xdJo11wX60KA==
=YW6S
-----END PGP SIGNATURE-----

--Mk4AfqfvQZZ1jb0O--


--===============7130642371955005191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7130642371955005191==--

