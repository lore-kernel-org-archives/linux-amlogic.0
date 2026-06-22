Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C9CCD98F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Jun 2026 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89BN0jGIGL2pF7XEotj+eyaaLBD1BUHTQlShQS/wCtI=; b=JCs8QYAMjsAHNZSzzjJJPrA9vu
	6WXNMLsieW06ya7kr1hh5mvuHyaj3EHmHDpPUZzInztVEIVD8gW/8k+J2OriMVMYRuTz8APH+9Oil
	PAf4MQlDCmRDEjKtmWvi1n1E+/Ka5NKTnu94rquq6ZdngmQrOm9PEdo02vBMlW1QM27UvNnYOkWG6
	nwbWwzvnhZz//r9O2E+lJwt/wwU4nhEyiRuFjSMREG2lmSsdmjrbxrlPnnrUgqVPs5N886EZEFiGN
	MmNTyxNwl2IuibqpuB9ocfyfRYGuGNWGEGz5GAAn3dy5Q58mOwoqkaFcMDPWxh4huBqQRxyLFI/Kr
	8nBa9fAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhm0-00000005Ckw-2HHK;
	Mon, 22 Jun 2026 16:45:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhlz-00000005Ckl-3tBs
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Jun 2026 16:45:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC160406B3;
	Mon, 22 Jun 2026 16:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F521F000E9;
	Mon, 22 Jun 2026 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782146723;
	bh=Xqk2PHK3QCcWR0jjFn371IClVpNTBYwDv1jn3DNcUe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AVKaku24GCYD0nsAW1vZxZNtgMsHsrm+c73K7AuXemZwpiQO9iNpfup9UXM5t0jk0
	 /vlizguXb05465Sg1/NmG6OZ7v4yrp8T3es4NTdmMV50mTBnFGAR5tQ0/4q7fhlU3G
	 F9Uk2OJopCOIUSkIJRlAipr7r2+cSjm2Foohgj34szBtTGuAs1OOyiXb5f+qC6lKXC
	 iSOV4Ltl7h18n7JYVmpGqpyZxWE5NehTCqqKfsEyUnyZK6L+shScDUZvWdLdtjSZPb
	 WOkexDPObYafzBfZPrZUFjeB6Q9M/yQErD9lmgCpeU+Eew90c5YbkAiOr8SugerzmM
	 xMNJiaTdPV/Eg==
Date: Mon, 22 Jun 2026 17:45:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: thermal: amlogic: Correct 'reg' in the
 example
Message-ID: <20260622-lance-handset-56a9a04b21a2@spud>
References: <20260622100231.438435-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622100231.438435-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260622100231.438435-4-krzysztof.kozlowski@oss.qualcomm.com>
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
Content-Type: multipart/mixed; boundary="===============3320757652040831121=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3320757652040831121==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VxYsUdreCsY5xfN/"
Content-Disposition: inline


--VxYsUdreCsY5xfN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--VxYsUdreCsY5xfN/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajlmngAKCRB4tDGHoIJi
0nnnAQCxwPKlfC+6wk698cBtgGy7NFD5m7eCQqgTcIXn4ktJNwD/SkCKrgG+s3Z1
Hi/BvoQbiP07o27QsROG7/bcxrfXqAs=
=JdwR
-----END PGP SIGNATURE-----

--VxYsUdreCsY5xfN/--


--===============3320757652040831121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3320757652040831121==--

