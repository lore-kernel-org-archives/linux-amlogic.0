Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62499CA0FF0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Aug 2025 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3qhIhjUS3BTv6FT7MkbT+t9vHNHuDeTrRtK1SCzKx8=; b=P3nBkheTC63FvEG0qvoyFnKg/h
	leSYHxD973B4MrMu3ey8EuzEB4xx1zqce0FgtuYdRnWQWIc8rdi9OM13ZCrvoHp9xnYoWHfQTg3zu
	aNYGTD5RGm4rPm3BEpgIhk6aYEesj4cra9qzsAqfaHqKA8S8u1l1gY3Z+aXOOzOnQwNItnLjufeXr
	H10e7K1wqhc1nG6NGu3A8VlYAJdv7Jp4G/PlX/DSdzvzOBsZDe15EMP12WL1OWlrkLIVjykAVbkwd
	EnXsYj0uSgVBPNZM4Me7/uG+CViz3S/IiXEZk0UYeo2Fruwk5zpvn3NUSmHYrvFixUv7k/m0ju/6V
	/GmzqQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5Aq-00000006oPS-0rJg;
	Fri, 29 Aug 2025 19:54:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0qf-00000006AW7-0iLV
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Aug 2025 15:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7707E43745;
	Fri, 29 Aug 2025 15:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27324C4CEF0;
	Fri, 29 Aug 2025 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756480594;
	bh=FJtaleC68nhBHq+4faUuH/z5iHXXo3ZXutIEf+99VKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgleI0+u1fSKPRmtgPucOUDLXfyM2Q7doDkt/Rbr2dC5a75yPl4Ew/36Qgp3hpHEW
	 eBoQlyXsAqIjJO+zmCJdgLTlmlCkExK/Mjk+z/C8umEta4IDUkBkvfrRhvJoro3F+f
	 OorXXLupNXgYoOPXvKug5gsNrJWWQzIbXtLXH+KRwLJceABl5rSHi9OlssteaWo6aC
	 db3eBjTplH50HeQgU3ltTGfRae3BTZi3I0STSAlOVe3LFpjL3p64ZBDFn85LvqCHYW
	 jdTuvDkbMYzRM50uFhJ4HaCF9Qw/H3cHignuSEbCTmRWa95GV0CHWW7Tu8cncQZYgl
	 r8PWQlHIgKLzw==
Date: Fri, 29 Aug 2025 16:16:29 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/3] spi: dt-bindings: add Amlogic A113L2 SFC
Message-ID: <20250829-ignore-scheme-d3d8b67ea125@spud>
References: <20250829-spifc-v4-0-1e57fd39f584@amlogic.com>
 <20250829-spifc-v4-1-1e57fd39f584@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250829-spifc-v4-1-1e57fd39f584@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_081705_225936_8D3F1795 
X-CRM114-Status: UNSURE (   6.33  )
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
Content-Type: multipart/mixed; boundary="===============4943424820744956099=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4943424820744956099==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/dYG5m5bU/0llhy+"
Content-Disposition: inline


--/dYG5m5bU/0llhy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--/dYG5m5bU/0llhy+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLHETQAKCRB4tDGHoIJi
0iQNAP9CvtzX1G5VfH9mTB3CnPaw1gwpTiQ3LJr6l25zrcRNDAD/T73b1fZtu7dk
NsdcwCV2Q3N3CloTLpWKP/u7Ii+XLgc=
=2/0u
-----END PGP SIGNATURE-----

--/dYG5m5bU/0llhy+--


--===============4943424820744956099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4943424820744956099==--

