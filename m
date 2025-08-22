Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8259CA0EE4
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuqUJUJNGzeeBJBKAbDmBwBD99dolQXuMKATwqF/X2I=; b=pqQkhmEqoxf6WgJ2/zAB/keb2w
	pdju8qMluo2fG5bibtqPqsewWvVqB4eH3YPZbRjUb3TXjGtSIOlH2Xu4wA8rNyQZgISyvvOvf2lYq
	htyUQXfntWoBDjM8OHEnIr2KVHxmJCDJmCUldN4RVaS7eswRahsfPH3jXAblVztd5H2QRk1eIsuI+
	jkGijhxxdHopQX4W5CorVd/0nFRgQRKJ9EgvS7hfajuDpXFxKJ3rebxZ6hk1WgdCsguy0lvTI9F0o
	/j6HcTkZ24QwzNN8IGgFOS+8vKqTRNRFa9HqiADEKDui/ikrWHum1hOMveg8/nZzni4qlEr2Gi7bQ
	Je5kdEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfP-00000004Uib-2OPF;
	Sat, 23 Aug 2025 09:36:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV1X-00000003Cg0-3iVD;
	Fri, 22 Aug 2025 16:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABC345C7146;
	Fri, 22 Aug 2025 16:53:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63074C4CEED;
	Fri, 22 Aug 2025 16:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755881634;
	bh=J9Pc+PAihK6OLwpz+8d8MSEkFl3S9CIiabPdvcTk9v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdwyCWqjwop9mnpY+v/oAFKE3edAqepKLXQyUCy+vtjyb2zYUljXfdkuHphvlPc/I
	 +Kl51TGtHpjk3Q3OVh2CV1ldi5R2qJd4CVYGz+9gjIJ/h6B2VwEOOlD9zdrya8lZQG
	 WvoLJ7goU1Ys8sswVHb4SvXRjUCcd+5yIoqQwwbt+nqNO64RbJFETce6bkOgePh3Qe
	 7ydnMdv6M7Hm3ZEOgqrmWoevoiC74nZ0Q95wLSJeqmYxJ/IPacNb/mqzswQZXXW7XT
	 8JSapDmG0hbvchp5AX5pg16yrniIRKfg3uktLojhRtWVUi58jkIOzXfay+7TarTS3v
	 lr1WlxWh2e/1g==
Date: Fri, 22 Aug 2025 17:53:49 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, "hongyu.chen1" <hongyu.chen1@amlogic.com>
Subject: Re: [PATCH 1/5] dt-bindings: power: add Amlogic S6 S7 S7D power
 domains
Message-ID: <20250822-gala-contents-4f16558dcd68@spud>
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
 <20250822-pm-s6-s7-s7d-v1-1-82e3f3aff327@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-1-82e3f3aff327@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_095355_957121_F9CF0056 
X-CRM114-Status: UNSURE (   6.67  )
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
Content-Type: multipart/mixed; boundary="===============8475157265375413227=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8475157265375413227==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+Hljh53Ey6WSwxk"
Content-Disposition: inline


--/+Hljh53Ey6WSwxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/+Hljh53Ey6WSwxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKignQAKCRB4tDGHoIJi
0mN9AQDE4nlsgOE9D3gmaacJI+/i2rKetx2wsfYbDyeZK3FRzQD+NFyZz67qC78e
nDNCV2Nrhip+LAe9vQttb4M7UTiWxAk=
=MTEB
-----END PGP SIGNATURE-----

--/+Hljh53Ey6WSwxk--


--===============8475157265375413227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8475157265375413227==--

