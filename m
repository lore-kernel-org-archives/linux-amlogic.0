Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83A5C44524
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2026 06:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UskCP3OEm8qYjrOdN71AEbTNqwHrLuy7j+fzvULbRwg=; b=yROo/mvpL4gQYj
	bySTDlfTJ0wFxcaQ6W62bhAmMWHVmnAUNOUWCmuIiMA09eWdqM5/lLgUwa4IyswXT+YhMWM5RD2fh
	CEICNQa3So2gd896IF4x49/KzfjgDFETYjMxD72bpfoaQvmyazRMei6dgVhDdMi3EMgs4/1rGOK++
	gXKZXzLAeiaKt0LUthFn3pcOOCpPuyf89coIVL2moMpLSYzbkeziq98rjxcqY+XaFG8BdKbngi1nO
	doenSycFOxlkErN+ZPv0WaA4IWZMFzm2qJzazLL9Ud8GwFCwdgPcdvtuCICvfFKmvTV/cTzmlRNau
	x4nO3tGFZfZC5EvjHTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnHY-0000000Da3v-0aVA;
	Thu, 23 Jul 2026 06:51:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnHW-0000000Da3e-3V25
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Jul 2026 06:51:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E5B7600AD;
	Thu, 23 Jul 2026 06:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743431F000E9;
	Thu, 23 Jul 2026 06:51:45 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] spi: dt-bindings: amlogic: spisg: Document
 A9-specific properties
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
References: <20260723-a9-spisg-v2-0-9fc39106b7e2@amlogic.com>
 <20260723-a9-spisg-v2-1-9fc39106b7e2@amlogic.com>
Date: Thu, 23 Jul 2026 06:51:44 +0000
Message-Id: <20260723065145.743431F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gU2V0dGluZyBgZGVm
YXVsdGAgdmFsdWVzIG9uIHByb3BlcnRpZXMgdGhhdCBhcmUgY29uZGl0aW9uYWxseSBmb3JiaWRk
ZW4gKGBmYWxzZWApIGNhdXNlcyBkZXZpY2UgdHJlZSBzY2hlbWEgdmFsaWRhdGlvbiB0byBmYWls
IG9uIHZhbGlkIG9sZGVyIG5vZGVzLgotLQoKLS0tIFBhdGNoIFsxXTogW1BBVENIIHYyIDEvNF0g
c3BpOiBkdC1iaW5kaW5nczogYW1sb2dpYzogc3Bpc2c6IERvY3VtZW50IEE5LXNwZWNpZmljIHBy
b3BlcnRpZXMgLS0tCmNvbW1pdCA1Y2RmZTE4OWMzMDk1Zjk2MDZhNWM3MmY4ZjI4NTZlMGQ0ZDI2
Mzg4CkF1dGhvcjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+CgpzcGk6
IGR0LWJpbmRpbmdzOiBhbWxvZ2ljOiBzcGlzZzogRG9jdW1lbnQgQTktc3BlY2lmaWMgcHJvcGVy
dGllcwoKVGhpcyBjb21taXQgZG9jdW1lbnRzIHRoZSBBbWxvZ2ljIEE5IFNQSVNHIGNvbnRyb2xs
ZXIgYW5kIGFkZHMgdGhlCiJhbWxvZ2ljLGE5LXNwaXNnIiBjb21wYXRpYmxlIHN0cmluZy4gSXQg
YWxzbyBkZWZpbmVzIHRoZSBBOS1zcGVjaWZpYwoiYW1sb2dpYyxtby1pZGxlLW91dHB1dCIgYW5k
ICJhbWxvZ2ljLHdvcmQtZ2FwIiBwcm9wZXJ0aWVzLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hbWxvZ2ljLGE0LXNwaXNnLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FtbG9naWMsYTQtc3Bpc2cueWFtbAo+
IGluZGV4IDliZmI4MDg5ZjdlYTIuLmRkZWY5MmYzZjNiNjYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9hbWxvZ2ljLGE0LXNwaXNnLnlhbWwKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2FtbG9naWMsYTQtc3Bp
c2cueWFtbApbIC4uLiBdCj4gQEAgLTM1LDYgKzM0LDIzIEBAIHByb3BlcnRpZXM6Cj4gICAgcmVz
ZXRzOgo+ICAgICAgbWF4SXRlbXM6IDEKPiAgCj4gKyAgYW1sb2dpYyxtby1pZGxlLW91dHB1dDoK
WyAuLi4gXQo+ICsgICAgZW51bTogWzAsIDEsIDJdCj4gKyAgICBkZWZhdWx0OiAwCj4gKwo+ICsg
IGFtbG9naWMsd29yZC1nYXA6ClsgLi4uIF0KPiArICAgIGVudW06IFswLCAxLCAyLCAzXQo+ICsg
ICAgZGVmYXVsdDogMQo+ICsKWyAuLi4gXQo+ICthbGxPZjoKPiArICAtICRyZWY6IHNwaS1jb250
cm9sbGVyLnlhbWwjCj4gKyAgLSBpZjoKPiArICAgICAgbm90Ogo+ICsgICAgICAgIHByb3BlcnRp
ZXM6Cj4gKyAgICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAgICAgICAgICBjb250YWluczoKPiAr
ICAgICAgICAgICAgICBlbnVtOgo+ICsgICAgICAgICAgICAgICAgLSBhbWxvZ2ljLGE5LXNwaXNn
Cj4gKyAgICB0aGVuOgo+ICsgICAgICBwcm9wZXJ0aWVzOgo+ICsgICAgICAgIGFtbG9naWMsbW8t
aWRsZS1vdXRwdXQ6IGZhbHNlCj4gKyAgICAgICAgYW1sb2dpYyx3b3JkLWdhcDogZmFsc2UKCltT
ZXZlcml0eTogTWVkaXVtXQpEb2VzIHNldHRpbmcgYSBkZWZhdWx0IHZhbHVlIG9uIHByb3BlcnRp
ZXMgdGhhdCBhcmUgY29uZGl0aW9uYWxseSBmb3JiaWRkZW4KY2F1c2UgZGV2aWNlIHRyZWUgc2No
ZW1hIHZhbGlkYXRpb24gdG8gZmFpbCBvbiB2YWxpZCBvbGRlciBub2Rlcz8KClRoZSBkdHNjaGVt
YSB2YWxpZGF0aW9uIHRvb2wgaW5qZWN0cyB0b3AtbGV2ZWwgZGVmYXVsdCBwcm9wZXJ0aWVzIGlu
dG8gYQpwYXJzZWQgbm9kZSBiZWZvcmUgZXZhbHVhdGluZyBhbGxPZiBibG9ja3MuIEZvciB0aGUg
YW1sb2dpYyxhNC1zcGlzZwpjb21wYXRpYmxlLCBpdCB3aWxsIGluamVjdCB0aGUgZGVmYXVsdHMg
KDAgYW5kIDEpIGZvciB0aGUgbWlzc2luZwpwcm9wZXJ0aWVzLiAKClRoZW4gdGhlIGFsbE9mIGJs
b2NrIHdpbGwgZW5mb3JjZSB0aGUgZmFsc2Ugc2NoZW1hIGNvbnN0cmFpbnQuIFNpbmNlIHRoZQpw
cm9wZXJ0aWVzIHdlcmUgaW5qZWN0ZWQsIHRoZSBzY2hlbWEgZXZhbHVhdGVzIHRvIGZhbHNlLCBj
YXVzaW5nIHZhbGlkYXRpb24KZXJyb3JzIGZvciBhbnkgZXhpc3Rpbmcgb3IgZXhhbXBsZSBhNC1z
cGlzZyBub2RlLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC8yMDI2MDcyMy1hOS1zcGlzZy12Mi0wLTlmYzM5MTA2YjdlMkBhbWxvZ2ljLmNv
bT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
