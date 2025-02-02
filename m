Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41204C0218F
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Feb 2025 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3yBIbzJgIt1R8x0HETGiKpT7/snGG9v8CqMHaf3IQ18=; b=i1iMRrArDvCi+I
	S/TitXDesu0nZSetfV7cO8BBPtVz/vebtn9FMPzISrksq7Al5I/XPThzEd3WcYcPjOQOev/VbaUyN
	9bMKWhGrHTWSRSHl/KQqJxv3IBXXahbBOBjgyoIj5KPTSSP4tFeNAlrGxav5SOIVIB2RiMKphXFnT
	QOkVXDeh0l3SkEPRSqAkvPZ9guKsKaW25tOs/Ju6508/DDPAvc5fgogAdO710FyyRBagGfWbrJYc1
	ZltQoynPOHdEno27puafUjcmQKxxezoB89pZqj8YlSFfatNYKoNvIFHLvsa0vPwXAl0OGY/gzJxvI
	D2DnMv19hbtH0OGCSeEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teafj-0000000Dqgs-2ccA;
	Sun, 02 Feb 2025 14:10:03 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teaeP-0000000DqWB-0iIZ
	for linux-amlogic@lists.infradead.org;
	Sun, 02 Feb 2025 14:08:42 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738505309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YVArxw6byNXDXJF0zYPmUVcQzU6VgzWGkQuMNKnrKw=;
	b=DOTEFVU3/BrkD1UysTSI6w8EbS6l3RPoseP0F/elW7mSuNnu88KHj0wMn1cJ0b+aSVoIhR
	FQ1Dl5vJkfMVhQxXJ0aWsOyAro9qsAtKl/CR0rcLcd5ui38CTB2+vin5jFd0AF4UWn+pcx
	TUw3Zo97AfMpvsuy1o2OyOkT0YRy66A+7/Hv/myR+AimYsZGYzblRt3OfskBRkmLX6W7No
	cyPgFaRX/FKG3wF6JzlQuZs55V2218f8WG/tKOcoWIIeFP9zIoVLa1yCuCvxzwWmY6J/RC
	nu7uoJ+wnMuUQyWEtIv+K8DMUm0CE+zmbiyjKK+n5Ss0cv8N0m9KdxA5TCtFLA==
Date: Sun, 02 Feb 2025 14:07:39 +0000
Message-Id: <D7I0OILRTJG9.3O0P7Q6SEHYV3@postmarketos.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
 <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
 <D7I0F3OMXALB.1ZT1G03JTKSEZ@postmarketos.org>
 <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
In-Reply-To: <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_060841_376879_C78B51F6 
X-CRM114-Status: GOOD (  12.13  )
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

T24gU3VuIEZlYiAyLCAyMDI1IGF0IDI6MDcgUE0gVVRDLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIDAyLzAyLzIwMjUgMTQ6NTUsIEZlcmFzcyBFbCBIYWZpZGkgd3JvdGU6Cj4gPiBI
aSwKPiA+IAo+ID4gT24gU3VuIEZlYiAyLCAyMDI1IGF0IDE6NTQgUE0gVVRDLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOgo+ID4+IE9uIFNhdCwgRmViIDAxLCAyMDI1IGF0IDA3OjMwOjQzUE0g
KzAwMDAsIEZlcmFzcyBFbCBIYWZpZGkgd3JvdGU6Cj4gPj4+IEZyb206IEZlcmFzcyBFbMKgSGFm
aWRpIDxmdW5kZXJzY29yZUBwb3N0bWFya2V0b3Mub3JnPgo+ID4+Pgo+ID4+PiBBZGQgc3VwcG9y
dCBmb3IgdGhlIEFtbG9naWMgUzgwNVkgU29DIGFuZCB0aGUgWGlhb21pIE1pIFRWIFN0aWNrIChh
a2EuCj4gPj4+IHhpYW9taS1hcXVhbWFuKS4gIFRoZSBTODA1WSBpcyB2ZXJ5IHNpbWlsYXIgdG8g
dGhlIFM4MDVYLCB3aXRoIGp1c3QgYQo+ID4+PiBmZXcgbWlub3IgZGlmZmVyZW5jZXMuCj4gPj4+
Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEZlcmFzcyBFbMKgSGFmaWRpIDxmdW5kZXJzY29yZUBwb3N0
bWFya2V0b3Mub3JnPgo+ID4+Cj4gPj4gUGxlYXNlIHJ1biBjaGVja3BhdGNoLiBZb3UgaGF2ZSBm
cm9tL1NvQiBtaXNtYXRjaC4KPiA+IAo+ID4gSSBkb24ndCBzZWUgYW55IG1pc21hdGNoLiAgTWF5
YmUgaXQgY29tcGxhaW5zIGJlY2F1c2Ugb2YgYSBzcHVyaW91cwo+ID4gbm9uLWJyZWFraW5nIHNw
YWNlPwo+ID4gCj4gQ291bGQgYmUsIG5vIGNsdWUuIEkgY29waWVkIHRoZW0gdG8gZWRpdG9yIGFu
ZCBpdCBhbHNvIHNlZXMgbWlzbWF0Y2ggLQo+IGJvdGggZW50cmllcyBqdXN0IGRvIG5vdCBtYXRj
aC4KCk9LLCBJJ2xsIHNlZSB3aGF0IEkgY2FuIGRvLgoKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5
c3p0b2YKCkNoZWVycy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
