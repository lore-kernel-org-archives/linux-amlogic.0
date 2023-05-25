Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1259DC77B7E
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 May 2023 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHmg9Ebnwpc34Xpus2Wrq1YXZvcTo8CgLQvp2APxfg8=; b=NH2gioYcoXEvnsOv6H+D7sHmqj
	TllowNin9hIS+T5ngQ+TreqbdUSg+QceZsDq3rnNbsz/zWfdpyt8xEWetQw7JvSTE1AxBj/K3Y1t5
	9/DkVq6XMU+KtHZT0XjtqHafCiX0ghyQQ5NTL4EBStRW9TmX351WKFrKWCQkFOaXc0FM6sSKIu2YO
	Zd9XqutSbXwyXlQasSgIzhDegsEoNAWuWMJULdEeDP5I/WD1PFtU9zc0TM5OKige7bsXqsYXj4JRt
	3hrisw+izNladsKzf/sIG7tHwZqxXPFnJk77D/+H1ZLQXZ9xYJDwdpsdCH528NgORAFOKlQAg1rpT
	dcqA/YnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ApV-00Gi4o-2J;
	Thu, 25 May 2023 13:16:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ApR-00Gi49-2Z;
	Thu, 25 May 2023 13:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685020587; x=1716556587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bji74CU8lVc3dQnwGVK8uYW1fWx2VIw8L4AKclmka2I=;
  b=d9MjSRa1YqEiBchkjRbMyiG0dILBbf9QUrgrIeScCzNOXuANKHhTB7sO
   0+kS3NNfNLi9Ot14YnhzioNppItJE/X3aGAU598h18b9SkI7d0BkqC4qf
   hN8yK9pfPrDX/C4AjdbR0jfAowev/pyz76gcqwCH0o7kMB3R7puiBL+Mh
   Q/sylqQ1LsEOXebxOJkrcuZA9+v5ReozPfA0CArp9Ss5TzLlyxBDVODtK
   EbnXizVF6YJGEt0S6DBG540jdu+hYSN6G2dyX8l59FitWSxwoA0Vo1Dea
   DMGYpOJX0HtQImmxNqrVuKguo3/3RsXse4dRqd7UyIgkOUo4wyEOq7UsX
   A==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="214869960"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 06:16:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 06:16:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 06:16:24 -0700
Date: Thu, 25 May 2023 14:16:02 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor@kernel.org>, <jian.hu@amlogic.com>, <kernel@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v16 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230525-connected-skipper-442c6d0b52c1@wendy>
References: <20230523135351.19133-1-ddrokosov@sberdevices.ru>
 <20230523135351.19133-6-ddrokosov@sberdevices.ru>
 <20230525093736.naztwqlhvskujsoa@CAB-WSD-L081021>
MIME-Version: 1.0
In-Reply-To: <20230525093736.naztwqlhvskujsoa@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_061629_868614_1B9FE70B 
X-CRM114-Status: GOOD (  10.74  )
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
Content-Type: multipart/mixed; boundary="===============7068094420530556880=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============7068094420530556880==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="68QoUxHiy/kLBBjz"
Content-Disposition: inline

--68QoUxHiy/kLBBjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 12:37:36PM +0300, Dmitry Rokosov wrote:
> Hello Rob, Krzysztof and Conor,
>=20
> Could you please take a look at this patch version? Before Rob marked
> this patchset with RvB at v13 -
> https://lore.kernel.org/linux-amlogic/168130720431.2218249.76710619649880=
64525.robh@kernel.org/
>=20
> However, due to several comments from other maintainers, unfortunately,
> I had to rename the 'a1-clkc' controller to 'a1-peripherals-clkc' and
> remove Rob's RvB.

I dunno if the compatible change is worth dropping the tag for tbh.
That seems to be the only change, so I guess you can have my R-b instead
of Rob's...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--68QoUxHiy/kLBBjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9fkgAKCRB4tDGHoIJi
0pRoAQDxk5nwMh6wGwdzyLznrxJI2Wbak7jHxQtaSq4C+2Zr7AEAt+xK055gIGNQ
a6u9fKyHj5+k8LB9XmdcuS5cl3HwpwI=
=HgEl
-----END PGP SIGNATURE-----

--68QoUxHiy/kLBBjz--


--===============7068094420530556880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7068094420530556880==--

