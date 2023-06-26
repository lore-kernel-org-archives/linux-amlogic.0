Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99F1EB64D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jun 2023 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzIWnhN8UFcA7iaIakx0zECQwUR/QC/rYeukCjmHwUk=; b=gso96hKOD1xG6jX4/kYSaYKBOe
	7vGKhabUx4Rv29LovklK10FowPaQW86buWpCCAikK4QjkJnA9t3Y1cN9leaxDJmFGnlJc66ic6Zly
	aYjjpPlTqxKZ97Qzph8RLIdTn1JmQzIt1qhKrseH6fxEAFyJsCdH9rMn6ZDOYoQYlnLad4HmVEUA2
	7SmGzmc+IaTvG0i3EU4S7WfOHO3kHOXQzLWkw26bCd9Bgct/goGgZunght25dPaYe4rNqzAfX0TKb
	p2EX4Dh4dKAsZepVr3tvlSBNFeiKuRgJe2Z/+/TcvWfo7VOsuAwYKlXb3dZrcddjYo3LIKXeSl705
	wbaHqnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDj4U-009no8-2f;
	Mon, 26 Jun 2023 10:03:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDj4Q-009nmx-1X;
	Mon, 26 Jun 2023 10:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687773823; x=1719309823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ndQQSMrh9qi21D5rzuuijKcs6vOrnsiA7XIKSTAl9wU=;
  b=oCcqjfsVpamdVla+OqRcWEOnnorru+JxEsG8rD1pbxrPjimNjwjHZ97z
   X5dzBR+cZ7E1BaRu4JZgcdDnbfdDmzCen0FC1YZZqqWArwc6Y/q1bSOZW
   f6fg0fkAJgreSYCMwbARz5Tsxj27gyp2RQNQpN9Ih/mFHTFTb06/lEfyY
   1UOHgw62RiTQK1LlViG5cWB725GTunpydow0KnGWzUoS2D8iAVLon195g
   i4sb6tQ6sug/8HEmqzyw7jlUXgk9zgthgMGGYEiTgiVc+XGZUqBqGVB++
   rLScXflM3J/qEJzlAsISH/+/QYAsAGWMSp0jGGVE2pPZwfwfy98rLidNY
   g==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="asc'?scan'208";a="217659769"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 03:03:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 03:03:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 03:03:23 -0700
Date: Mon, 26 Jun 2023 11:02:55 +0100
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
Message-ID: <20230626-viewless-marrow-17838c2172f6@wendy>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_030342_601487_1ACFBFCF 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Type: multipart/mixed; boundary="===============0456542962197176913=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============0456542962197176913==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubNKkfHy8zvqeN3N"
Content-Disposition: inline

--ubNKkfHy8zvqeN3N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jun 26, 2023 at 05:52:21PM +0800, Xianwei Zhao wrote:
> T7 is an advanced application processor designed for smart display.
>=20
> Add the new T7 SoC/board device tree bindings.
>=20
> Add basic support for the T7 based Amlogic AN400 board, which describes
> the following components: CPU, GIC, IRQ, Timer, UART. It's capable of
> booting up into the serial console.

Lucas has already sent patches for the T7 SoC & is at v5:
https://lore.kernel.org/linux-devicetree/20230623081242.109131-1-tanure@lin=
ux.com/

There's been a bit of discussion there, and there serial stuff in
particular is different in his series (it doesn't use always-on for
examples).
Could you please go and take a look at his series?

Cheers,
Conor.

>=20
> Xianwei Zhao (2):
>   dt-bindings: arm: amlogic: add T7 based AN400 bindings
>   arm64: dts: add support for T7 based Amlogic AN400
>=20
>  .../devicetree/bindings/arm/amlogic.yaml      |   6 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../dts/amlogic/amlogic-t7-a311d2-an400.dts   |  30 ++++
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 156 ++++++++++++++++++
>  4 files changed, 193 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.d=
ts
>  create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>=20
>=20
> base-commit: 057889cb4244096ea5abcbe76ffd4d311c3078fe
> --=20
> 2.37.1
>=20

--ubNKkfHy8zvqeN3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJliTwAKCRB4tDGHoIJi
0r3GAPwN8BOPsz32j+YhMZbfTzQJ27DXHYrrA6ARa465C0tCIQD7B7wRgd2djDnj
rRtZKb8Mgt3O6Pi8KuvDXh9pRwgqfQE=
=9w1Y
-----END PGP SIGNATURE-----

--ubNKkfHy8zvqeN3N--


--===============0456542962197176913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0456542962197176913==--

