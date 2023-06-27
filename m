Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5F1EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 07:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZByxTbZBJIoa+s7q6h2uMomWqziN52yjlxlWoUCsiY=; b=KSg+lSf3LaQ33VGw7VWY8AS/tb
	+jg5m00UYabJJvUd6eXdYRxvll/OFWXWGUoV+V1pschuzygFaKsJFxAS3eu21zDRcIKz1Tdir4eLD
	rBFefWB6X7svSh4wthKuTngwMbdTSid3XwgbS6LazlzyxiVFiYk3bc5fohb6egjdCVtRM8alqKJ3a
	wQ5WVG10Qb2kAgFT6znN8CA+yEfGVvlNTaOJ5LjZvsmjv894RAbbBb0Exlp0vMGkEAkrot9/Imv74
	UGkD6y56gg1UHnIzjCp7TVtEpe7yvQrLISLPbthq3+s8YHvNfSXkhrz64jdCi/iDSACkzmicHl2ga
	2uEGJZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE34B-00CKoH-17;
	Tue, 27 Jun 2023 07:24:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE348-00CKmh-0C;
	Tue, 27 Jun 2023 07:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687850684; x=1719386684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xCt5P1Z0qnjM3jC6ioipHyN0GAsEKKE+YW2j5M5Y1fQ=;
  b=b8liOszcCG0gYwSHsQKigXf3U6YHg9tl1rR6ugnaqm74OZNPK6UDMtgD
   6aq1iAhUEbIrQpsx6UQcvGWdrezDF3HKp2CT3T5C/PaNaEZTz3iC1ZfJo
   x8iYm8oSMOQ0VvMGLoy74/W866hcEe7pXAgPxMrZZkq6ozleehkUEvslW
   M2G0Yiz8l9+uv6BL8eStyrzCyi8B/gYtJmKCVttcBhXKZ9xzL7DtF/t0+
   Xut4npXp/hcOQDzSJ6QATsGLAd3eDu85J9Hpko+20aP+b200r0NPM+C9e
   tpPij93m7f0rFsQHw8vdWH/Su+BKjClSeTmKtSJCFOoLmAPj8/KtJKzr7
   g==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="217800721"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2023 00:24:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 27 Jun 2023 00:23:50 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 27 Jun 2023 00:23:48 -0700
Date: Tue, 27 Jun 2023 08:23:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Lucas Tanure <tanure@linux.com>
Subject: Re: [PATCH 0/2] Baisc devicetree support for Amlogic T7
Message-ID: <20230627-unsure-uniformly-079cad2c26e6@wendy>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626-viewless-marrow-17838c2172f6@wendy>
 <676db602-54d8-d6b0-274f-365e65a2102c@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <676db602-54d8-d6b0-274f-365e65a2102c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_002444_160043_8FC65C4E 
X-CRM114-Status: GOOD (  20.14  )
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
Content-Type: multipart/mixed; boundary="===============7586947942683729744=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============7586947942683729744==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O2oh4OyqqOV39O13"
Content-Disposition: inline

--O2oh4OyqqOV39O13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 02:13:34PM +0800, Xianwei Zhao wrote:
> Hi Conor,
>     Thanks for you reply.
> On 2023/6/26 18:02, Conor Dooley wrote:
>=20
>=20
> > [ EXTERNAL EMAIL ]
> >
> > Hey,
> >
> > On Mon, Jun 26, 2023 at 05:52:21PM +0800, Xianwei Zhao wrote:
> >> T7 is an advanced application processor designed for smart display.
> >>
> >> Add the new T7 SoC/board device tree bindings.
> >>
> >> Add basic support for the T7 based Amlogic AN400 board, which describes
> >> the following components: CPU, GIC, IRQ, Timer, UART. It's capable of
> >> booting up into the serial console.
> >
> > Lucas has already sent patches for the T7 SoC & is at v5:
> > https://lore.kernel.org/linux-devicetree/20230623081242.109131-1-tanure=
@linux.com/
> >
> > There's been a bit of discussion there, and there serial stuff in
> > particular is different in his series (it doesn't use always-on for
> > examples).
> > Could you please go and take a look at his series?
> >
> > Cheers,
> > Conor.
> >
> AN400 is the reference board designed by Amlogic, which is different from
> Khadas VIM4.

Yet you share the same dtsi, which he has got through several iterations
of before you arrived.

> And T7 serial is the same as S4, so I follow S4 serial.

Yeah, no. SoC specific compatible please.


--O2oh4OyqqOV39O13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJqOaAAKCRB4tDGHoIJi
0iv7AP9iHb28BGoo1SFUjvKBfZyWwuJP5ySvXMR4mSMpiHCkfgD/e6idXs5Evq4s
kO+Q4o/Bdpx9rOrHrAWbC9LLfS3aSwg=
=f1Im
-----END PGP SIGNATURE-----

--O2oh4OyqqOV39O13--


--===============7586947942683729744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7586947942683729744==--

