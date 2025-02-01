Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20CDC02192
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Feb 2025 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fd3X0gu8VpKplJBMyKVGVpZQOkr3ubxdJMTZ+93BvQ4=; b=WQCHRoNeynvRiF
	Hy5BCnqGeWDaow579rptHv7ng9jriGV3S6yJefWaHpF2AsXERvW8NcqDea8y1CTO5XQCKDTZd65kM
	QyNpEpyzBsoGYVjEIkHqjN7VHqkDVQwIpwFG4+VLc1yb/82e6sqIVsYDcL9BZ4MqpXwvTRb9XlBKo
	MKruGcmb77WerLWCumBH7Ktjt11NRxm1l6Bd3vY3D8hrpidLC6GbCOy96aA6m8ZaH071+WObx5LbN
	g8yyX7T0o5vKmFs2bZwqZF7Q8DxCrJ2tFNYcZa6lUA2AAaR7ul7h2XMjc5E0refO2FDi2yAU07/Ug
	FeeOBtfibGl4qHGOl1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teJHR-0000000D3wk-3hK0;
	Sat, 01 Feb 2025 19:35:49 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teJGU-0000000D3qW-0iV0
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Feb 2025 19:34:51 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738438483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfG3HrCxqbeW5d3xVI8UwlzmsQZXhlzTGj9IMuqNOT0=;
	b=qQ7llyaVhB2SxjVamAxxz57OJpCMdoc1XoqY7AqFyGnlmhKa5nxkzO9EYkQHqCUebYZw+l
	+t74MgRSaJHqcCP6CUSfDc1JZLug746pseESsF/C00HDMv2FCLLCoo2dL8p8wROnNGKHZP
	k7m1zrXwUmm3OcGxLeAYoXtoTlEz5Ov730JEGpA01JlUMnLIKUCjcDvabCH0UB+V1/JmyR
	7k4cjAAV/6fuxznNjXCBPzpPHV5EO4rWtdSIuaFsIDwTLVaQlafkmYLHh0kItGjZILBaaU
	Aw/x5eocbnHbN2C4cUEOlPMU59/mQ+mPr3tYEnis3TWXRJCtpDKNZYs30jm82Q==
Date: Sat, 01 Feb 2025 19:33:56 +0000
Message-Id: <D7HCZSPU5TZH.MEWHEM6398EB@postmarketos.org>
Subject: Re: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>
To: "Ferass El Hafidi" <funderscore@postmarketos.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_113450_360104_4BF9DCBE 
X-CRM114-Status: GOOD (  16.93  )
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

SGksCgpPbiBGcmkgSmFuIDMxLCAyMDI1IGF0IDg6MDMgUE0gVVRDLCBGZXJhc3MgRWwgSGFmaWRp
IHdyb3RlOgo+IEZyb206IEZlcmFzcyBFbMKgSGFmaWRpIDxmdW5kZXJzY29yZUBwb3N0bWFya2V0
b3Mub3JnPgo+Cj4gVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBhZGQgaW5pdGlhbCBzdXBwb3J0
IGZvciB0aGUgWGlhb21pIE1pIFRWCj4gU3RpY2suCj4KPiBYaWFvbWkgTWkgVFYgU3RpY2sgaXMg
YSBzbWFsbCBBbWxvZ2ljLWJhc2VkIEFuZHJvaWQgVFYgc3RpY2sgcmVsZWFzZWQgaW4gCj4gMjAy
MCwgYW5kIGtub3duIGFzIGB4aWFvbWktYXF1YW1hbmAgaW50ZXJuYWxseSAoaW4gdGhlIGRvd25z
dHJlYW0ga2VybmVsLAo+IHUtYm9vdCwgLi4uKQo+IEl0cyBzcGVjaWZpY2F0aW9ucyBhcmUgYXMg
Zm9sbG93czoKPiAgKiBBbWxvZ2ljIFM4MDVZIFNvQyAoYmVsaWV2ZWQgdG8gYmUgbW9zdGx5IGlk
ZW50aWNhbCB0byBTODA1WCkKPiAgKiA4IEdCIGVNTUMKPiAgKiAxIEdCIG9mIFJBTQo+ICAqIEFu
ZHJvaWQgVFYgOSwgdXBncmFkYWJsZSB0byBBbmRyb2lkIFRWIDEwCj4KPiBUaGVyZSBhcmUgbXVs
dGlwbGUgdmFyaWFudHM6Cj4gICogMS4gR3JlZW4gUENCLCBtYW51ZmFjdHVyZWQgaW4gMjAyMCwg
a25vd24gVUFSVCBwaW5vdXQgKGhlbHBmdWxseSAKPiAgICBsYWJlbGVkIG9uIHRoZSBib2FyZCkK
PiAgKiAyLiBCbHVlIFBDQiwgbm90IG11Y2ggZG9jdW1lbnRhdGlvbiBhYm91dCBpdCwgcHJlc3Vt
YWJseSBtYW51ZmFjdHVyZWQKPiAgICBiZXR3ZWVuIDIwMjEgYW5kIDIwMjMKPiAgKiAzLiBHcmVl
biBQQ0IsIG1hbnVmYWN0dXJlZCBpbiAyMDIzLCBrbm93biBVQVJUIHBpbm91dCwgc29tZSBsYXlv
dXQKPiAgICBjaGFuZ2VzIGNvbXBhcmVkIHRvIHRoZSAyMDIwIHZhcmlhbnQKPgo+IEFtb25nIHRo
ZXNlIHZhcmlhbnRzLCB0aGVyZSBhcmUgbWFueSBib2FyZHMgdXNpbmcgbXVsdGlwbGUgZGlmZmVy
ZW50Cj4gV2ktRmkgY2hpcHMuICBTdXBwb3J0aW5nIGFsbCBvZiB0aGVtIGlzIG91dCBvZiBzY29w
ZSBmb3IgdGhpcyBwYXRjaAo+IHNlcmllcy4KPgo+IEFzIG9mIHRoZSB0aW1lIG9mIHdyaXRpbmcg
dGhpcyBoYXMgb25seSBiZWVuIHRlc3RlZCBvbiB0aGUgM3JkIHZhcmlhbnQuCj4gSXQgaXMgYmVs
aWV2ZWQgdGhhdCBzb2Z0d2FyZS13aXNlIGFsbCB0aHJlZSB3b3JrIG1vc3RseSB0aGUgc2FtZSAo
aWYgd2UgCj4gZG9uJ3QgY291bnQgV2ktRmkpLCBidXQgdGVzdGluZyBvbiB0aGUgb3RoZXIgdmFy
aWFudHMgd291bGQgc3RpbGwgYmUKPiBhcHByZWNpYXRlZC4KPgo+IFRoZSBkZXZpY2V0cmVlIGlz
IGJhc2VkIG9uIHRoZSBBbWxvZ2ljIFAyNDEgRFRTLgo+Cj4gRmVyYXNzIEVswqBIYWZpZGkgKDIp
Ogo+ICAgZHQtYmluZGluZ3M6IGFybTogYW1sb2dpYzogYWRkIFhpYW9taSBNaSBUViBTdGljawo+
ICAgYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIHN1cHBvcnQgZm9yIHhpYW9taS1hcXVhbWFuL01p
IFRWIFN0aWNrCj4KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCAg
ICAgIHwgICAxICsKPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAg
ICAgIHwgICAxICsKPiAgLi4uL21lc29uLWd4bC1zODA1eS14aWFvbWktYXF1YW1hbi5kdHMgICAg
ICAgIHwgMzExICsrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDMxMyBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tZ3hsLXM4MDV5LXhpYW9taS1hcXVhbWFuLmR0cwoKU3VwZXJzZWRlZCBieSB2Mjog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjAxMTkzMDQ0LjI4ODU2LTEtZnVuZGVy
c2NvcmVAcG9zdG1hcmtldG9zLm9yZy8KCkNoZWVycy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
