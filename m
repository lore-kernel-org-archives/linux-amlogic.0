Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFC4C02192
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2025 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:To:
	Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUwMOEKMKQkZcAcNQlXXz8OnUMuy+wWhhy62Q2oJyP4=; b=ct2CsFFkb+J5j+
	5vp7T3VpvA96z/PlpYP2R7YfAz9E/qORUESW+0BfdumnyWAXGQztn6GAwTzJ351aGAjILWzo0D+BD
	/TpJ/RGloySFCcZvOECYhYtL1kmp1+ybLavEJclMqxDi8wz9OqU1Qs7Hgxk306ojhqlE/AWDOROrP
	R7z4cUzgJ+Rz0W6F/yC/5BzfPCm80zJzfBcbybLgWOE5weJPPDwI47nCrZ3NJQxhPqdhbXz4Jvq9s
	VZNWl670Fd3ZnzAM0PLgOJ8d2iQVshuk424dcYwMERrEDiHlgNtswLQPMS8O8deAzYR5xDMtVRDtD
	MvUgtqRE/zVW6/u8hb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesfF-0000000EyrF-3LB9;
	Mon, 03 Feb 2025 09:22:45 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesab-0000000ExwP-4Bne
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Feb 2025 09:17:59 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738574263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZ3MU5Alwy2jOdKOqGh+Wgi75fgSkITzfd+ri8LOY3o=;
	b=XekN5ZnQzXVYdJE3CcYaapzKa2Kf+/Hikgg9TZHzdWkN0hdjEAbOTXyDB8ZJSOOLXXPyqU
	o9d0PSXbNEHynQkYfxqKwsgDkKa3cadPWHcfQNGfIzDMBycbwSQ+gg246IdtGtMxmENoNC
	DHaJhOL2JOkRsbjnCsENVNaosUXHeQhFOv5NC8nHc+HtANvdwjfj/LDbwpP05o7ftycr2/
	s4FyCnOAhIzxcwV8AVUbvzb/FjI7SVmaImOnBm8m9edCAiYQcOVdoihx0A+9VRb2mgjTsz
	SHy4DA5qMAvfRRE+aHQ/LL/GDzSHKVs/i8AsNacCXx4I3h61NO+50PyypzWIxQ==
Date: Mon, 03 Feb 2025 09:16:50 +0000
Message-Id: <D7IP4ECJ9XM5.3JSGHFAI75K9M@postmarketos.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
References: <20250201193044.28856-1-funderscore@postmarketos.org>
 <20250201193044.28856-2-funderscore@postmarketos.org>
 <20250202-wisteria-rook-of-intensity-6fecfa@krzk-bin>
 <D7I0F3OMXALB.1ZT1G03JTKSEZ@postmarketos.org>
 <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
In-Reply-To: <56ec442d-54b3-404a-a10b-763a00e7099e@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_011758_174867_3CD7E190 
X-CRM114-Status: GOOD (  11.99  )
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

SGkgS3J6eXN6dG9mLAoKT24gU3VuIEZlYiAyLCAyMDI1IGF0IDI6MDcgUE0gVVRDLCBLcnp5c3p0
b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDAyLzAyLzIwMjUgMTQ6NTUsIEZlcmFzcyBFbCBIYWZp
ZGkgd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gT24gU3VuIEZlYiAyLCAyMDI1IGF0IDE6NTQgUE0g
VVRDLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4+IE9uIFNhdCwgRmViIDAxLCAyMDI1
IGF0IDA3OjMwOjQzUE0gKzAwMDAsIEZlcmFzcyBFbCBIYWZpZGkgd3JvdGU6Cj4gPj4+IEZyb206
IEZlcmFzcyBFbMKgSGFmaWRpIDxmdW5kZXJzY29yZUBwb3N0bWFya2V0b3Mub3JnPgo+ID4+Pgo+
ID4+PiBBZGQgc3VwcG9ydCBmb3IgdGhlIEFtbG9naWMgUzgwNVkgU29DIGFuZCB0aGUgWGlhb21p
IE1pIFRWIFN0aWNrIChha2EuCj4gPj4+IHhpYW9taS1hcXVhbWFuKS4gIFRoZSBTODA1WSBpcyB2
ZXJ5IHNpbWlsYXIgdG8gdGhlIFM4MDVYLCB3aXRoIGp1c3QgYQo+ID4+PiBmZXcgbWlub3IgZGlm
ZmVyZW5jZXMuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEZlcmFzcyBFbMKgSGFmaWRpIDxm
dW5kZXJzY29yZUBwb3N0bWFya2V0b3Mub3JnPgo+ID4+Cj4gPj4gUGxlYXNlIHJ1biBjaGVja3Bh
dGNoLiBZb3UgaGF2ZSBmcm9tL1NvQiBtaXNtYXRjaC4KPiA+IAo+ID4gSSBkb24ndCBzZWUgYW55
IG1pc21hdGNoLiAgTWF5YmUgaXQgY29tcGxhaW5zIGJlY2F1c2Ugb2YgYSBzcHVyaW91cwo+ID4g
bm9uLWJyZWFraW5nIHNwYWNlPwo+ID4gCj4gQ291bGQgYmUsIG5vIGNsdWUuIEkgY29waWVkIHRo
ZW0gdG8gZWRpdG9yIGFuZCBpdCBhbHNvIHNlZXMgbWlzbWF0Y2ggLQo+IGJvdGggZW50cmllcyBq
dXN0IGRvIG5vdCBtYXRjaC4KClRoZSBGcm9tL1NvQiBtaXNtYXRjaCBzaG91bGQgYmUgZml4ZWQg
aW4gdGhlIHYzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjUwMjAz
MDkxNDUzLjE1NzUxLTEtZnVuZGVyc2NvcmVAcG9zdG1hcmtldG9zLm9yZy9ULyN1CgpUaGFua3Mu
Cgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
