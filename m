Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07538EB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwdUv3D9w8c6NHu3UFvDGJFPdXgPwuJ9ZMpG5YTefTM=; b=IqZXTzMKc7OZWFvNguyaMOHiXf
	zo61oGfeBmVsUmkmQVyrRXeqiVPGImCTSA/mPPj4M+Sz2AWKME88ekJ3xTkm7XOJFmG1AloCdF07N
	eMPoZV9JvCbLW4FYhboBWeNJqEQDPC4pjctBZkcwJTyDqYBmn7vrLzE8CnTvdPns/Az0lG6TQ37o7
	En2Q+92VRxkd77FaKxvhgtMFOqB63ZLpQaasQKXeIU8Ykvf/rOHf6JjR0rifNc2AiqaNKBgNQdP/p
	0NFz12ndqkc58KVaZpyTqlSDrc7WAGppgoNjn0KG+PGDb4i3ZhMQhnUz0SfEF28hnIgjBXN054mOh
	gxLuouwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBswt-00Df9h-2e;
	Wed, 21 Jun 2023 08:12:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBswr-00Df91-38;
	Wed, 21 Jun 2023 08:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687335137; x=1718871137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DM/VZm23k+KBPD9Z2nm/p/7AvFdl8laDmWGgyYJzjtQ=;
  b=v8s7LsvTYflOpQOo6WLwodXmWQK/hEDj2cNFKpjheUzLy5Zp1KNFsVY4
   QPv+FTwzuhA3rI/8WrxbPUUmnB8itKC3bJkA7dcA0/FYn3BgW4sEr4VCx
   T8N7pwGfXnFsSuwnds/P0D7LFOZR3MOD8910skIkgSzj8OINpYK4NvE1Y
   Q3SVnuCAdNZ00YY7t2/1+ml6W5ptHzAJe/dirZhXU6zoGiKNSbCwhYFVI
   MjwB5BDTU9hhZ9w0ovP+Kp6wSWAyp230J4gOeq6fNldHvCpB6dTNQlChr
   +RbQDgLIxJS397SD4+gRcPMyfaDEb0ruuvDpMAinuA3R9+3AhfyUCbb4f
   A==;
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="asc'?scan'208";a="231308487"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2023 01:12:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 01:12:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 21 Jun 2023 01:12:14 -0700
Date: Wed, 21 Jun 2023 09:11:47 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Lucas Tanure <tanure@linux.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Yixun Lan <dlan@gentoo.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Nick <nick@khadas.com>, Artem <art@khadas.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-t7-a311d2-khadas-vim4: add
 initial device-tree
Message-ID: <20230621-sloppy-lisp-d6569b907c41@wendy>
References: <20230620134857.238941-1-tanure@linux.com>
 <20230620134857.238941-3-tanure@linux.com>
 <ZJIjtphyKdC48JrN@ofant>
 <76a7f819-f3d2-d39d-1bc9-f1e7f837fd22@linaro.org>
 <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
 <20230621-barber-enjoyably-04806271daea@wendy>
 <6fe5dfb6-5f18-feca-a2e7-8cfb78627e01@linaro.org>
MIME-Version: 1.0
In-Reply-To: <6fe5dfb6-5f18-feca-a2e7-8cfb78627e01@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_011218_018708_9DC7DC41 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: multipart/mixed; boundary="===============1386564534828076802=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============1386564534828076802==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SUGtz7gnd9H8ZpfO"
Content-Disposition: inline

--SUGtz7gnd9H8ZpfO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 10:04:28AM +0200, Neil Armstrong wrote:
> On 21/06/2023 10:01, Conor Dooley wrote:

> > Aye, but we do not want to propagate that. New stuff should not be
> > adding undocumented compatibles, and those that are undocumented should
> > be documented.
>=20
> Documentation is ongoing, it takes time !

Don't worry, I wasn't trying to criticise, just pointing out the ideal
situation.

--SUGtz7gnd9H8ZpfO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJKwwwAKCRB4tDGHoIJi
0mZ7AP9gCvbPnfk6sA39u0KwkV3NaFictZl7I0Mlsst3rLNtEQEA0Q9A9IX6pcj0
HEsgPVBiC5EVDdVuA9PbNMdVCd/qGwk=
=Rcr8
-----END PGP SIGNATURE-----

--SUGtz7gnd9H8ZpfO--


--===============1386564534828076802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1386564534828076802==--

