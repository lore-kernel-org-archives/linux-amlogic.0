Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE2DC25B5C
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRsulfwUCxF6xDbozfP7tZtIOdk5q599ue97aT+K0Hs=; b=gJfG8Pd8V7x0zN
	8U93SQY85f2vPeD+jYHtTlWSEU3HIpdAuObNqjqoaZQvVLWDsc10ATgWqmI3qEG2V9q0xChtY8uQA
	kwaIYxziMwB3MdW1JhlrcHwglDt5nuwFifmzTQx014soW18w+2GNWsTe/ciGImf1hpLJvzgdATTKU
	4V3PXPQamZd0JccaNuxr/PblyV3DgN63a6eTi5hCO9sdPT2ZaT8IZt0QXkZq8w/U4RS3KuxgUmclE
	bw/iSBDLWSc7NfFxgpVQWuG0R+gMxowEBVGJWDZK7IsyGBgLmDjN9txqIUEBXn4vOwz/D0JmoP+fL
	FU5XIyBYmnZlIqX18EtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3u0y-00000006gYt-3clM;
	Mon, 06 May 2024 08:48:04 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3u0v-00000006gXA-2er3;
	Mon, 06 May 2024 08:48:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47A84FF80D;
	Mon,  6 May 2024 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714985276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qec4JOlCq2MSVwUU+8VRmsKAw88MzHZzy9yA4DQOIHs=;
	b=PJAc57vGVhbV9olxuDC0j3hEPIgju5U6MTQ6IIAoX0CMlsroo8tcN+BdsZCA+A4G526nxI
	7DfJNRfmkRJP+Hod/+t0vf+P8DNxHLtvPdqs29gr3XCkhL4XNIvLTiwmmJh8OWVWcMaule
	4avCb8cj0JtGuNztJMWFh6PO/4RDZ9WnmRSF5NxnCqBR2guX8TceIoL3osnPgcNraPs2ei
	JuxUqoFdobsXA/ngbkJZp+bqnBvcnl3X+mTCmK69l5bhJi/SDvZP2GJW2i/9ClD/ZLktSh
	h4nzCt0+AnNa+ewY5wWoZjuSlbPPIjkiE8/FzBObfRkilGJvGzjdDcuPfYyhNQ==
Date: Mon, 6 May 2024 10:47:53 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <oxffffaa@gmail.com>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v5 2/2] mtd: rawnand: meson: support R/W mode for boot
 ROM
Message-ID: <20240506104753.25e5f8cd@xps-13>
In-Reply-To: <2e5b39a1-ffe6-1186-2ce7-51b61c5006d3@salutedevices.com>
References: <20240416085101.740458-1-avkrasnov@salutedevices.com>
	<20240416085101.740458-3-avkrasnov@salutedevices.com>
	<2e5b39a1-ffe6-1186-2ce7-51b61c5006d3@salutedevices.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_014801_835453_822634CF 
X-CRM114-Status: UNSURE (   5.06  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQXJzZW5peSwKCmF2a3Jhc25vdkBzYWx1dGVkZXZpY2VzLmNvbSB3cm90ZSBvbiBUaHUsIDIg
TWF5IDIwMjQgMDg6MDk6MzQgKzAzMDA6Cgo+IEhlbGxvLCBzb3JyeSwgcGxzIHBpbmcsIDIgd2Vl
a3MgOikKCkkgd2FzIG9uIHZhY2F0aW9uLCBJIGFtIGN1cnJlbnRseSBsYXRlIGJ5IDMwKyBwYXRj
aGVzLCB5b3VycyBpcyBvbiB0aGUKbGlzdCA7KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
