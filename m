Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F094C3ABC9
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 May 2025 18:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y5MgszCHB0nI9YX04gaWZhnhMJaq/j/gzvbOFJla5VY=; b=uLqXNajStB87gD+AsbpTWHb3ON
	mWFfAtKqoa9+cwju3nkoCikPQgAK5rMejh5jUgkiqryYEIrq3pLg1uq08iD8cST+seAN0ZaNtctSS
	thkXus2sdSCtVJTdtUiasVfZOU/6ufI6TjTtVxjI+e754S5LVK/koomRnB7gXIqdo/LrGShUgXc5X
	lRjhMui9UZ3HqIgGqIR9TkoHeVb4pHmTQFFsX6b9dzW3GJSZZD+H0o47TLTnmpiNX+zhlv1Ul+3vr
	0Mi3DGPMUdlrtDPwZJpyIx2XXDvFcPoNAhzctF6oVMPz9IY6NjdxaXYGchHKeQetBRgLGwY/GvI7x
	Er26ED+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSLF-00000004YZL-3sru;
	Fri, 09 May 2025 18:21:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQI9-00000004EAr-3zQc;
	Fri, 09 May 2025 16:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5983C43D1F;
	Fri,  9 May 2025 16:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE49C4CEE4;
	Fri,  9 May 2025 16:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806981;
	bh=UKE+0RPXtg1WdCPj4nwbiF1vj2IOeaeA5oRzi512CWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPC0FmTZSPv2FVwCNKrUkVSSIOAQb7ciEg/NJH3r0zJToSXmZ25/70zo6e5/IUVfD
	 DNBL5akw+oun8/VLTLGtgv0kRXgc6K1lvfFwpwu57oNjXohFlLXy+RVAQj80QpTYNY
	 8iwuCW9VBpaMlzDurbxlWpXmpmRDn6ecCB4jI2gxrZl1pSGPlpRzJ3E1xYDKyV76up
	 Hqo/Gstiq+dfpc36GbisWa/nxSUyL7eKSrJSQhE4UdJD8cjyIKOEOfSIZR7NnFS3pR
	 PQihPX1gc/8KhHD5CfgAvAQ3IUBj1G5uR+VTVChdK9jcpJdEmwlLsKWl5cLtLkgEhs
	 z/trChP54b+JQ==
Date: Fri, 9 May 2025 17:09:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: add Amlogic T7 PLL clock
 controller
Message-ID: <20250509-straddle-parish-92306b78486b@spud>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-2-jian.hu@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250509074825.1933254-2-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_090942_012542_548659C7 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7460029412383719441=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7460029412383719441==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Fuzjvst7gC5JW8H"
Content-Disposition: inline


--0Fuzjvst7gC5JW8H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 07:48:19AM +0000, Jian Hu wrote:
> Add DT bindings for the PLL clock controller of the Amlogic T7 SoC family.
>=20
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Looks like Rob's comments got resolved,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--0Fuzjvst7gC5JW8H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4ovwAKCRB4tDGHoIJi
0r1NAP9mZrXhZY6WXko9PL6fkCqKeL/fwtgoQwBt3GzCJr/9MQD+LeFD+itCESb7
ZGtjYJ+O87BFn1X8MeYi+O4FZ6CYMw8=
=bC3h
-----END PGP SIGNATURE-----

--0Fuzjvst7gC5JW8H--


--===============7460029412383719441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7460029412383719441==--

