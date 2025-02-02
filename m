Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD14C0218F
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Feb 2025 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16nPPgtO7+sTf0C9wc7sEZaplEZY5LvdO4ss6u8XCrc=; b=1qFuaO0hmphoZd
	akdCXf7f3Y4SFso5ZpU2YnISWr9weXDeqjGeuEsYto8hG7YuLXvjroulIAFp/eB1bicipMh/997LV
	SjxWaxpkwjVCIf4Q69xIBzSSQBwtahApBxgSz6eoJE9hMi6Pue5vn5FAPH3PNWbb+d5R3IXijWdXF
	esYsKqmJ9Ce2LGO1x3jv9P68njM1z3Y77dLoPF2e7sbhkJ7VapoiC+tnz5zE2N54Xk9vohbzso4FF
	GCp3VCIGOlEPwubs7utC4qd729bTZ+SZmCNN6gwQAcLR3q+Ii+sSDnaUbTpBzlOINi4SHJmtnEkbR
	MjcrlyO7f7ZEn1A/sxZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teaSV-0000000Dpe6-04Py;
	Sun, 02 Feb 2025 13:56:23 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teaSR-0000000DpdU-29TZ
	for linux-amlogic@lists.infradead.org;
	Sun, 02 Feb 2025 13:56:22 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738504568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTCjK7GphBpYgmSVOu1ScWLH6UjNwU097e2TCso5clI=;
	b=I+VvQvFBpA2cUT9zyvjYyK8BieeLsCdC5A9qZSH08JTKHKQWomZq/C7Qhys+xvEkJlt9ny
	43qaRft0e9kotHlF9dHeT1Oyrpu+rMtAyT7NA5X8aVArVoMff8Q1/0fNzRkF4goV3+uI3f
	TQq9zuWbyAi/sgd6gWo0Oe7T08aA3YKUt61aVBEsnAhgiPYU4VNNTFSEqAzsWwPgizTi5u
	K7h0r3R4CDzE/I1b4PdMd1DOMT6wvHzFOAFqZrlmkbIhsRVz+SqsyFqqtQQlxufBTx6tpw
	D32Fkj8jrXNaM0NSjm0cGwZdBRTI9D7JV1uFHDG/xt4YPUEH2wqk2+vdpEq0NQ==
Date: Sun, 02 Feb 2025 13:55:21 +0000
Message-Id: <D7I0F3OMXALB.1ZT1G03JTKSEZ@postmarketos.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
 <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
In-Reply-To: <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_055620_920245_0BACB2B1 
X-CRM114-Status: UNSURE (   8.45  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor
 Dooley <conor+dt@kernel.org>, Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Karl Chan <exxxxkc@getgoogleoff.me>, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBTdW4gRmViIDIsIDIwMjUgYXQgMTo1NCBQTSBVVEMsIEtyenlzenRvZiBLb3psb3dz
a2kgd3JvdGU6Cj4gT24gU2F0LCBGZWIgMDEsIDIwMjUgYXQgMDc6MzA6NDNQTSArMDAwMCwgRmVy
YXNzIEVsIEhhZmlkaSB3cm90ZToKPiA+IEZyb206IEZlcmFzcyBFbMKgSGFmaWRpIDxmdW5kZXJz
Y29yZUBwb3N0bWFya2V0b3Mub3JnPgo+ID4gCj4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIEFtbG9n
aWMgUzgwNVkgU29DIGFuZCB0aGUgWGlhb21pIE1pIFRWIFN0aWNrIChha2EuCj4gPiB4aWFvbWkt
YXF1YW1hbikuICBUaGUgUzgwNVkgaXMgdmVyeSBzaW1pbGFyIHRvIHRoZSBTODA1WCwgd2l0aCBq
dXN0IGEKPiA+IGZldyBtaW5vciBkaWZmZXJlbmNlcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
RmVyYXNzIEVswqBIYWZpZGkgPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+Cj4KPiBQbGVh
c2UgcnVuIGNoZWNrcGF0Y2guIFlvdSBoYXZlIGZyb20vU29CIG1pc21hdGNoLgoKSSBkb24ndCBz
ZWUgYW55IG1pc21hdGNoLiAgTWF5YmUgaXQgY29tcGxhaW5zIGJlY2F1c2Ugb2YgYSBzcHVyaW91
cwpub24tYnJlYWtpbmcgc3BhY2U/CgpSZWdhcmRzLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
