Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E152C7EE2F
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 May 2023 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5XvqYdYWAbNV6oF0A3HEVJMLIz3QhDCieThuQyio5I=; b=FMoMfLftZ63ejwNquUj64QEfUd
	wd/LMhWlTtI+ervvSZKf8n8I1bYgFDAMj4tS5c66SOZF7lH3/yHtXDUxBPZG6KCpNoh/SeTUE7gcW
	JtE57vAJ++mxyStDRhLkyPkWppkOJTC0R4jUqAt/pMYhySevKpAD3Bdk2eTXmJXqC9mYFDzFGwV/q
	jGljl1hHN6TnsKQpXxW/VSIHWO+HjkyP0HGkTPmaCQZCaiAGmi9vDrt985LGBx1co+c0ruJxrIL2A
	B94DsksM77Ecek3fe8TI71EaiHtqYtS8t11LHFwWfyiaPceMHxCLz+yhT4ILWks9/dKBDAi1vvFZJ
	J6Pi6TAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BcA-00GnxG-2t;
	Thu, 25 May 2023 14:06:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Bc7-00GnwU-19;
	Thu, 25 May 2023 14:06:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685023607; x=1716559607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=upPO4QUm0taAdlDSGlmbwceJ4JBD1WN4nd0/HmurPiU=;
  b=AzJdFxHhDebZjBdwIyLCFQ5C+1/qT+g1s9XpYbOVbs2Yo8HABleQhGBn
   Brj7r6vfoilwhNbPV5z/hzol3Fi3X184YRUAclbG6RSS5oddNsPYgRY03
   x3FL8gH2kmq9+FxAj/PGnEKyZ+kS1b9N7RQPDdExqxCewgy97R8hJF5qJ
   Tjz0kh8SbvtDt56+Jr9ls7MB54UMHgwMoqAxCBP/hJzOk2q1YDLcGt5vl
   HRzWN7R1zFdH1Cnn9hJVI6QMgbFFEEcftWZWKJCKYkSapEcXd1oHkJTlf
   BG9oyKBUuHA/ycgJT/71Nc9cJaJGCcf631Bg8cFf2kCbhhs2oj7Rrnx+w
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="226989442"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 07:06:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 07:06:40 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 07:06:37 -0700
Date: Thu, 25 May 2023 15:06:15 +0100
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
Message-ID: <20230525-ranging-plow-e3f4427f44b3@wendy>
References: <20230523135351.19133-1-ddrokosov@sberdevices.ru>
 <20230523135351.19133-6-ddrokosov@sberdevices.ru>
 <20230525093736.naztwqlhvskujsoa@CAB-WSD-L081021>
 <20230525-connected-skipper-442c6d0b52c1@wendy>
 <20230525140100.mdzuhyfhxxkf4mx7@CAB-WSD-L081021>
MIME-Version: 1.0
In-Reply-To: <20230525140100.mdzuhyfhxxkf4mx7@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_070647_434741_B3E4032F 
X-CRM114-Status: UNSURE (   7.21  )
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
Content-Type: multipart/mixed; boundary="===============5013624710071791871=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============5013624710071791871==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="98dEgcHdS9y24H6f"
Content-Disposition: inline

--98dEgcHdS9y24H6f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 25, 2023 at 05:01:00PM +0300, Dmitry Rokosov wrote:

> I was unaware of the official policy regarding the removal of RvB during
> renaming changes. I took a cautious approach to the situation :)

Better safe than sorry!


--98dEgcHdS9y24H6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9rVwAKCRB4tDGHoIJi
0qfyAQCEDt2Wmdd7sQ0AFn0qT0m1S6WB+FG53v9IrhD+R5MRiQEAlgl5pqnYxIZ5
1D4vdPj2SIBYSAryBd9N2bDPGtAFTQ0=
=cV7U
-----END PGP SIGNATURE-----

--98dEgcHdS9y24H6f--


--===============5013624710071791871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5013624710071791871==--

