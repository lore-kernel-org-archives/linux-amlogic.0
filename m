Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03FBC02192
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jan 2025 21:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I7dtzD0J+yJw2I+LXouzybVr0icbZA7GjzSkegNiSQg=; b=HdJnBmKo1kyn+kZNcY3ncQrNSu
	Z67JDkC1EZ1uxYyjAeoObOx8lxS3byx0vP6j6l5nVsY+gxTO7N2mspPh4GaGdMzSZrEZeY6BgTUNt
	Rj7vg8dB4CCvtBFUm1TnugfNIdQRHyo5qbHMLJ9onoC5XtpbDfdoZje1mVdU81qPLPYpueBSqLpUb
	5KlqpFp2EM8IKoNwwdnxwJR7UYkMaL+ggxTdf/9J5BOSNhLd3ikYaITk4UkyEu/As4Z0MtuboqfZ9
	iUfEZUcxH5r/RDktxKB52O1wWDm6gAK91NyvujZeP99uvLEQxbB2VpuW3ywdDMuGYkE3Yyqh1H3tG
	wHAcmvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyU4-0000000BRk4-3C2T;
	Fri, 31 Jan 2025 21:23:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyU2-0000000BRj9-0Agz;
	Fri, 31 Jan 2025 21:23:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75C155C5EA1;
	Fri, 31 Jan 2025 21:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A26C4CED1;
	Fri, 31 Jan 2025 21:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738358605;
	bh=/OS0LJz7wGEUpGR+VvSZsu8R7CgAohC+kmS8JtEiaVI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=AMhwrxuneDEerKPohzvNX4q54TznV3ECcDXgGN5gjOaRoDkjbtomCg7/2fV6fPYku
	 VcV4M7zmZmqwqbbfHnZA+OPS+ykMcRQ3tNhmZ30B7Y4lp/4y/6LJTNMxh8ZPm+rqJ8
	 XH5sL2NjUgq1lqPAI0uEQlpxVpeLrQDuo/6tjIg0JtVe3eefQZACbW8FwZImxUwKqA
	 2yBOqp3XfXenCxWvNASz8upaFKPEq3DuMtg4Yr1C8hNfaepa+z0ppYlx1geJDnnVaD
	 kzTvtkelBHO6e7z/yYZULxxLUrZTB+zWM4K0gyKmOo9Lul49qdGTVDAKzHcHav/k9X
	 HPKd01fTMMsww==
Date: Fri, 31 Jan 2025 15:23:24 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 Karl Chan <exxxxkc@getgoogleoff.me>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Artur Weber <aweber.kernel@gmail.com>
To: Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
Message-Id: <173835855352.46011.13506160179490240246.robh@kernel.org>
Subject: Re: [PATCH 0/2] Add support for Xiaomi Mi TV Stick
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_132326_162703_61329FA5 
X-CRM114-Status: GOOD (  20.82  )
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

Ck9uIEZyaSwgMzEgSmFuIDIwMjUgMjA6MDM6MTcgKzAwMDAsIEZlcmFzcyBFbCBIYWZpZGkgd3Jv
dGU6Cj4gRnJvbTogRmVyYXNzIEVswqBIYWZpZGkgPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5v
cmc+Cj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMgYWltcyB0byBhZGQgaW5pdGlhbCBzdXBwb3J0IGZv
ciB0aGUgWGlhb21pIE1pIFRWCj4gU3RpY2suCj4gCj4gWGlhb21pIE1pIFRWIFN0aWNrIGlzIGEg
c21hbGwgQW1sb2dpYy1iYXNlZCBBbmRyb2lkIFRWIHN0aWNrIHJlbGVhc2VkIGluCj4gMjAyMCwg
YW5kIGtub3duIGFzIGB4aWFvbWktYXF1YW1hbmAgaW50ZXJuYWxseSAoaW4gdGhlIGRvd25zdHJl
YW0ga2VybmVsLAo+IHUtYm9vdCwgLi4uKQo+IEl0cyBzcGVjaWZpY2F0aW9ucyBhcmUgYXMgZm9s
bG93czoKPiAgKiBBbWxvZ2ljIFM4MDVZIFNvQyAoYmVsaWV2ZWQgdG8gYmUgbW9zdGx5IGlkZW50
aWNhbCB0byBTODA1WCkKPiAgKiA4IEdCIGVNTUMKPiAgKiAxIEdCIG9mIFJBTQo+ICAqIEFuZHJv
aWQgVFYgOSwgdXBncmFkYWJsZSB0byBBbmRyb2lkIFRWIDEwCj4gCj4gVGhlcmUgYXJlIG11bHRp
cGxlIHZhcmlhbnRzOgo+ICAqIDEuIEdyZWVuIFBDQiwgbWFudWZhY3R1cmVkIGluIDIwMjAsIGtu
b3duIFVBUlQgcGlub3V0IChoZWxwZnVsbHkKPiAgICBsYWJlbGVkIG9uIHRoZSBib2FyZCkKPiAg
KiAyLiBCbHVlIFBDQiwgbm90IG11Y2ggZG9jdW1lbnRhdGlvbiBhYm91dCBpdCwgcHJlc3VtYWJs
eSBtYW51ZmFjdHVyZWQKPiAgICBiZXR3ZWVuIDIwMjEgYW5kIDIwMjMKPiAgKiAzLiBHcmVlbiBQ
Q0IsIG1hbnVmYWN0dXJlZCBpbiAyMDIzLCBrbm93biBVQVJUIHBpbm91dCwgc29tZSBsYXlvdXQK
PiAgICBjaGFuZ2VzIGNvbXBhcmVkIHRvIHRoZSAyMDIwIHZhcmlhbnQKPiAKPiBBbW9uZyB0aGVz
ZSB2YXJpYW50cywgdGhlcmUgYXJlIG1hbnkgYm9hcmRzIHVzaW5nIG11bHRpcGxlIGRpZmZlcmVu
dAo+IFdpLUZpIGNoaXBzLiAgU3VwcG9ydGluZyBhbGwgb2YgdGhlbSBpcyBvdXQgb2Ygc2NvcGUg
Zm9yIHRoaXMgcGF0Y2gKPiBzZXJpZXMuCj4gCj4gQXMgb2YgdGhlIHRpbWUgb2Ygd3JpdGluZyB0
aGlzIGhhcyBvbmx5IGJlZW4gdGVzdGVkIG9uIHRoZSAzcmQgdmFyaWFudC4KPiBJdCBpcyBiZWxp
ZXZlZCB0aGF0IHNvZnR3YXJlLXdpc2UgYWxsIHRocmVlIHdvcmsgbW9zdGx5IHRoZSBzYW1lIChp
ZiB3ZQo+IGRvbid0IGNvdW50IFdpLUZpKSwgYnV0IHRlc3Rpbmcgb24gdGhlIG90aGVyIHZhcmlh
bnRzIHdvdWxkIHN0aWxsIGJlCj4gYXBwcmVjaWF0ZWQuCj4gCj4gVGhlIGRldmljZXRyZWUgaXMg
YmFzZWQgb24gdGhlIEFtbG9naWMgUDI0MSBEVFMuCj4gCj4gRmVyYXNzIEVswqBIYWZpZGkgKDIp
Ogo+ICAgZHQtYmluZGluZ3M6IGFybTogYW1sb2dpYzogYWRkIFhpYW9taSBNaSBUViBTdGljawo+
ICAgYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIHN1cHBvcnQgZm9yIHhpYW9taS1hcXVhbWFuL01p
IFRWIFN0aWNrCj4gCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwg
ICAgICB8ICAgMSArCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSAgICAg
ICAgICB8ICAgMSArCj4gIC4uLi9tZXNvbi1neGwtczgwNXkteGlhb21pLWFxdWFtYW4uZHRzICAg
ICAgICB8IDMxMSArKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMTMgaW5z
ZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWd4bC1zODA1eS14aWFvbWktYXF1YW1hbi5kdHMKPiAKPiAtLQo+IDIuNDcuMQo+
IAo+IAoKCk15IGJvdCBmb3VuZCBuZXcgRFRCIHdhcm5pbmdzIG9uIHRoZSAuZHRzIGZpbGVzIGFk
ZGVkIG9yIGNoYW5nZWQgaW4gdGhpcwpzZXJpZXMuCgpTb21lIHdhcm5pbmdzIG1heSBiZSBmcm9t
IGFuIGV4aXN0aW5nIFNvQyAuZHRzaS4gT3IgcGVyaGFwcyB0aGUgd2FybmluZ3MKYXJlIGZpeGVk
IGJ5IGFub3RoZXIgc2VyaWVzLiBVbHRpbWF0ZWx5LCBpdCBpcyB1cCB0byB0aGUgcGxhdGZvcm0K
bWFpbnRhaW5lciB3aGV0aGVyIHRoZXNlIHdhcm5pbmdzIGFyZSBhY2NlcHRhYmxlIG9yIG5vdC4g
Tm8gbmVlZCB0byByZXBseQp1bmxlc3MgdGhlIHBsYXRmb3JtIG1haW50YWluZXIgaGFzIGNvbW1l
bnRzLgoKSWYgeW91IGFscmVhZHkgcmFuIERUIGNoZWNrcyBhbmQgZGlkbid0IHNlZSB0aGVzZSBl
cnJvcihzKSwgdGhlbgptYWtlIHN1cmUgZHQtc2NoZW1hIGlzIHVwIHRvIGRhdGU6CgogIHBpcDMg
aW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKCgpOZXcgd2FybmluZ3MgcnVubmluZyAnbWFrZSBD
SEVDS19EVEJTPXkgZm9yIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy8nIGZvciAyMDI1MDEz
MTIwMDMxOS4xOTk5Ni0xLWZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc6CgphcmNoL2FybTY0
L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hsLXM4MDV5LXhpYW9taS1hcXVhbWFuLmR0YjogcHdt
QDg2YzA6IGNsb2NrLW5hbWVzOiBGYWxzZSBzY2hlbWEgZG9lcyBub3QgYWxsb3cgWydjbGtpbjAn
XQoJZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9wd20vcHdt
LWFtbG9naWMueWFtbCMKYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4bC1zODA1
eS14aWFvbWktYXF1YW1hbi5kdGI6IGxlZHM6IGxlZC13aGl0ZTpkZWZhdWx0LXN0YXRlOjA6ICdo
ZWFydGJlYXQnIGlzIG5vdCBvbmUgb2YgWydvbicsICdvZmYnLCAna2VlcCddCglmcm9tIHNjaGVt
YSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2xlZHMvbGVkcy1ncGlvLnlhbWwj
CmFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwtczgwNXkteGlhb21pLWFxdWFt
YW4uZHRiOiBsZWRzOiBsZWQtd2hpdGU6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBh
bGxvd2VkICgnZGVmYXVsdC1zdGF0ZScgd2FzIHVuZXhwZWN0ZWQpCglmcm9tIHNjaGVtYSAkaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2xlZHMvbGVkcy1ncGlvLnlhbWwjCgoKCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
