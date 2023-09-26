Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58ACE7D24C
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Sep 2023 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iKubZxCSxGISS8UdlW7FXJocqXE37jDpnoIeVQzoxQ=; b=LGdztg2p/GQlh1EMHPT7O0Z/0M
	b2/pYrIA/hWbGm1upSIkcTCAjkDZLCrTsSSxtE0Zjetv+uwzntj2zId91vMYQO8HVtQ9qw0h9czSu
	6VRIQImSiHbvD0bIGefQY9CIvSRan0l1+T997CV3nvgNGqpCWIkrUSLbxmqrI517R+00ZIsJ2HaCK
	tJUiL1UCz6tPzKc3D02OCviqHOF7X7pqjo1DQYsEeqS8LBJ3MO8Wwdc3XObUMaeD7QFkVbm3Tj6CT
	RsdFaUSoLXvo2GnUHGPNk9Xa4mSCE+Joz0WvGiGfUlpF2yL/nkMVzdW1YaIC/OTKj5QiNAPftRsZF
	FUVwOQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql33B-00Fq5f-2v;
	Tue, 26 Sep 2023 08:04:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql339-00Fq3q-1H;
	Tue, 26 Sep 2023 08:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64993CE1279;
	Tue, 26 Sep 2023 08:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B023EC433C8;
	Tue, 26 Sep 2023 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695715444;
	bh=Gk8UPv85NpIAuRUm/g1FxXwc/A9EC198ra1ZI3l3y+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2CxJOqPE3nULReRB6ueRzPUzLpG0HduGqLQMB0peveb97gyS0glSpsfF/OfzpYSK
	 FtKFoAboDI/Wl31DYCEJNH6MJwo2lSENM8wLT/hEf+bzbwDajk7F3Z+/7afgxKP8+t
	 8HLSDlYyxmyfYmjUleCNSg0SjLRSaSqubaqV49fJbCMBU6tTD8GTdpTLQuY+18SkcS
	 FiaXCSorr5u2AEdAs1yXGjOyqL98yQX0TOORNHULtuuEU8by8vwSNCZY9y1qW5kfYo
	 DDRKhdJuUgvkNI7oHJFs2R9ba4ixOaxRbcHRAVaJAygr3p8ohvuh/wgFRbxq57jtZA
	 hW71Nb5MESBuA==
Date: Tue, 26 Sep 2023 09:03:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arm64: dts: Add watchdog node for Amlogic C3 SoCs
Message-ID: <20230926-output-musket-a43dd5abd0b5@spud>
References: <20230926055512.2355390-1-huqiang.qin@amlogic.com>
 <20230926055512.2355390-3-huqiang.qin@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20230926055512.2355390-3-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_010407_657407_95270EF0 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Type: multipart/mixed; boundary="===============4243971312537070860=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4243971312537070860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/h6xUWSBVS6sbE34"
Content-Disposition: inline


--/h6xUWSBVS6sbE34
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 01:55:12PM +0800, Huqiang Qin wrote:
> Add watchdog device.
>=20
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
>=20
> V1 -> V2: Increase compatibles of C3 watchdog.
>=20
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boo=
t/dts/amlogic/amlogic-c3.dtsi
> index 998f5050795c..2ad1f8eef199 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -81,6 +81,12 @@ apb4: bus@fe000000 {
>  			#size-cells =3D <2>;
>  			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> =20
> +			watchdog@2100 {
> +				compatible =3D "amlogic,c3-wdt", "amlogic,t7-wdt";

Does this pass dtbs_check?
The binding patch doesn't seem to permit this combo..

> +				reg =3D <0x0 0x2100 0x0 0x10>;
> +				clocks =3D <&xtal>;
> +			};
> +
>  			periphs_pinctrl: pinctrl@4000 {
>  				compatible =3D "amlogic,c3-periphs-pinctrl";
>  				#address-cells =3D <2>;
> --=20
> 2.42.0
>=20

--/h6xUWSBVS6sbE34
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRKQbwAKCRB4tDGHoIJi
0inUAPwLNBh3Grd1kaNeXqiBtQPj8KCHNGRCyoENBGkom8ZsewEApURp1rXmTzcy
YTPySsifKx2BM9nMc5YyQIuMhDpgGg0=
=mVVI
-----END PGP SIGNATURE-----

--/h6xUWSBVS6sbE34--


--===============4243971312537070860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4243971312537070860==--

