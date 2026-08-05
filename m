Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A722DC55822
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Aug 2026 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0tqRUzjTrmWqSU9Y9gjmB/ZUbmpThSVpljofppnd8U=; b=gT6YbkERXA991y
	qnIE8oHapAGpiHd6rnrksSbI3al5lHvJWxJkr8lMj2L7MGyfr9Up893fbKuojj3lVzHmFS6moFDYz
	hDJoaMNI+SGphd+sM3yYWiEI4JqsIFH3u0EADpMCRVfHCx7IKeV52YmCeaDR3+HbEMR1Q0mM6MSEs
	LhGswMxlrHWNMEGnoi1bpg7aS7BWI91RqwXpJWMfO1pEsnuSLQafKqD63UdkrE8tkUt1ip8Xco6c8
	eSvMox1XgDILsrdzAljGEEePzYLUyBcYrYk7bo7aeEgHcXKaNFw4EfgeLt6R+VaXZ/V7ztja9gUSy
	6e3l5QQN+0BKAgtvzSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWnd-00000003Vts-3dR7;
	Wed, 05 Aug 2026 08:16:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWnc-00000003Vtg-1OLu
	for linux-amlogic@lists.infradead.org;
	Wed, 05 Aug 2026 08:16:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22749408DD;
	Wed,  5 Aug 2026 08:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9BD1F000E9;
	Wed,  5 Aug 2026 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917787;
	bh=m82iw9fI3V25WDVV6gSdMwmA4oHcgc8w57jvm+Rj57Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4YFaBDHKfroh3f0X5t52LCo50uswkrvomwQ03p5vYWcCF1JYgw0N3i3eaU4e+1Ua
	 H0Ntwa6GvRbkDmLTThLU1LoUV5lBmut+i9mBLArxtn9CsErtltVqphV1YdypjU+KMt
	 n6qXrjxDDmCvgApkQIPzZ7mCBcThKGsTQDHORElYltrFEr5w1x93nQX7opc53M+T6p
	 HRvBM3NCB2kCIxznXY9hljA7Eg+bai4gPZg7UOk5fv050OkfGv7vZ6k7HoFvbJB8ii
	 8JnfBso7iA3O93LLPO/0AwfgaFBXeZDblrEW4v2c6LnAqJVugpD1Rhz3fvmsFC1jRn
	 gzDtE2nLA4pbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/6] mfd: khadas-mcu: Add per-variant configuration
 infrastructure and VIM4 support
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: mfd@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-add-mcu-fan-khadas-vim4-v9-1-75df78710b9e@aliel.fr>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-1-75df78710b9e@aliel.fr>
Date: Wed, 05 Aug 2026 08:16:26 +0000
Message-Id: <20260805081626.8F9BD1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gUGFzc2luZyBjaGls
ZC1zcGVjaWZpYyBjb25maWd1cmF0aW9uIChmYW4gcmVnaXN0ZXJzIGFuZCBjb29saW5nIGxldmVs
cykgZnJvbSB0aGUgY29yZSBNRkQgcGFyZW50IGRyaXZlciB0byB0aGUgY2hpbGQgdmlvbGF0ZXMg
TUZEIHNlcGFyYXRpb24gb2YgY29uY2VybnMuCi0gW01lZGl1bV0gVGhlIHBhdGNoIGNsYWltcyB0
byByZW1vdmUgaGFyZGNvZGVkIGNvbnN0YW50cyBhbmQgYWRkIFZJTTQgc3VwcG9ydCBidXQgZmFp
bHMgdG8gaW5jbHVkZSB0aGUgY29ycmVzcG9uZGluZyBDIGNvZGUgbW9kaWZpY2F0aW9ucywgbGVh
dmluZyB0aGUgZmVhdHVyZSBlbnRpcmVseSB1bmltcGxlbWVudGVkLgotLQoKLS0tIFBhdGNoIFsx
XTogW1BBVENIIHY5IDEvNl0gbWZkOiBraGFkYXMtbWN1OiBBZGQgcGVyLXZhcmlhbnQgY29uZmln
dXJhdGlvbiBpbmZyYXN0cnVjdHVyZSBhbmQgVklNNCBzdXBwb3J0IC0tLQpjb21taXQgOWMzMGM5
YzIwYWQ3ZDhhNDJjMjcxYThlYmJlOTQwMjBhYjU4YWU5MApBdXRob3I6IFJvbmFsZCBDbGF2ZWF1
IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZyPgoKbWZkOiBraGFkYXMtbWN1OiBBZGQgcGVyLXZh
cmlhbnQgY29uZmlndXJhdGlvbiBpbmZyYXN0cnVjdHVyZSBhbmQgVklNNCBzdXBwb3J0CgpUaGlz
IGNvbW1pdCBhZGRzIHBlci12YXJpYW50IGNvbmZpZ3VyYXRpb24gc3RydWN0dXJlcyBhbmQgZW51
bXMgdG8gbWFuYWdlCmRpZmZlcmVudCBNQ1UgdmFyaWFudHMsIHNwZWNpZmljYWxseSBhZGRpbmcg
VklNNCBzdXBwb3J0LiBJdCBhbHNvIGludHJvZHVjZXMKYSBzdHJ1Y3R1cmUgdG8gcGFzcyBmYW4g
Y29uZmlndXJhdGlvbiB0byB0aGUgZmFuIHN1Yi1kcml2ZXIgdG8gcmVtb3ZlCmhhcmRjb2RlZCBj
b25zdGFudHMuCgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9raGFkYXMtbWN1Lmgg
Yi9pbmNsdWRlL2xpbnV4L21mZC9raGFkYXMtbWN1LmgKPiBpbmRleCBhOTliYTJlZDBlNGUwLi5l
NDA0NGMyNTFiOTdlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbWZkL2toYWRhcy1tY3Uu
aAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbWZkL2toYWRhcy1tY3UuaAo+IEBAIC03MCw2ICs3MCwx
MyBAQAo+ICAjZGVmaW5lIEtIQURBU19NQ1VfV09MX0lOSVRfU1RBUlRfUkVHCQkweDg3IC8qIFdP
ICovCj4gICNkZWZpbmUgS0hBREFTX01DVV9DTURfRkFOX1NUQVRVU19DVFJMX1JFRwkweDg4IC8q
IFdPICovCj4gIAo+ICsvKiBWSU00IHNwZWNpZmljIHJlZ2lzdGVycyAqLwo+ICsjZGVmaW5lIEtI
QURBU19NQ1VfVklNNF9SRVNUX0NPTkZfUkVHCQkweDJjIC8qIFdPIC0gcmVzZXQgRUVQUk9NICov
Cj4gKyNkZWZpbmUgS0hBREFTX01DVV9WSU00X0xFRF9PTl9SQU1fUkVHCQkweDg5IC8qIFdPIC0g
TEVEIHZvbGF0aWxlICovCj4gKyNkZWZpbmUgS0hBREFTX01DVV9WSU00X0ZBTl9DVFJMX1JFRwkJ
MHg4YSAvKiBXTyAqLwo+ICsjZGVmaW5lIEtIQURBU19NQ1VfVklNNF9XRFRfRU5fUkVHCQkweDhi
IC8qIFdPICovCj4gKyNkZWZpbmUgS0hBREFTX01DVV9WSU00X1NZU19SU1RfUkVHCQkweDkxIC8q
IFdPICovCgpbU2V2ZXJpdHk6IE1lZGl1bV0KV2lsbCB0aGVzZSBuZXcgVklNNCBzcGVjaWZpYyBy
ZWdpc3RlcnMgZXhjZWVkIHRoZSB1bmNoYW5nZWQgbWF4X3JlZ2lzdGVyCigweDg4KSBpbiB0aGUg
Y29yZSBkcml2ZXIncyByZWdtYXAgY29uZmlndXJhdGlvbj8KCkl0IGxvb2tzIGxpa2UgdGhlIEMg
ZmlsZSBtb2RpZmljYXRpb25zIGFyZSBtaXNzaW5nIGZyb20gdGhpcyBwYXRjaCwgbWVhbmluZwp0
aGVzZSBuZXcgcmVnaXN0ZXJzIG1pZ2h0IGJlIHJlamVjdGVkIGJ5IHRoZSByZWdtYXAgQVBJIGlm
IHRoZSBjb25maWd1cmF0aW9uCmlzIG5vdCB1cGRhdGVkIHRvIGFsbG93IGFjY2VzcyB1cCB0byAw
eDkxLgoKWyAuLi4gXQoKPiBAQCAtODgsNCArOTUsMjEgQEAgc3RydWN0IGtoYWRhc19tY3Ugewo+
ICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ICB9Owo+ICAKPiArLyoqCj4gKyAqIHN0cnVjdCBr
aGFkYXNfbWN1X2Zhbl9wZGF0YSAtIGZhbiBzdWItZHJpdmVyIGNvbmZpZ3VyYXRpb24KPiArICog
QGZhbl9yZWc6IHJlZ2lzdGVyIGFkZHJlc3MgdG8gd3JpdGUgdGhlIGZhbiBsZXZlbAo+ICsgKiBA
bGV2ZWxzOiB0YWJsZSBtYXBwaW5nIGxvZ2ljYWwgY29vbGluZy1kZXZpY2Ugc3RhdGVzIHRvIHJh
dyBmYW4gbGV2ZWxzCj4gKyAqIEBubGV2ZWxzOiBudW1iZXIgb2YgZW50cmllcyBpbiBAbGV2ZWxz
Cj4gKyAqLwo+ICtzdHJ1Y3Qga2hhZGFzX21jdV9mYW5fcGRhdGEgewo+ICsJdW5zaWduZWQgaW50
IGZhbl9yZWc7Cj4gKwljb25zdCB1bnNpZ25lZCBpbnQgKmxldmVsczsKPiArCXVuc2lnbmVkIGlu
dCBubGV2ZWxzOwo+ICt9OwoKW1NldmVyaXR5OiBNZWRpdW1dCkRvZXMgcGFzc2luZyBjaGlsZC1z
cGVjaWZpYyBjb25maWd1cmF0aW9uIGxpa2UgZmFuIHJlZ2lzdGVycyBhbmQgY29vbGluZwpsZXZl
bHMgZnJvbSB0aGUgY29yZSBNRkQgcGFyZW50IGRyaXZlciB0byB0aGUgY2hpbGQgdmlvbGF0ZSBN
RkQgc2VwYXJhdGlvbgpvZiBjb25jZXJucz8KClRoZSBNRkQgc3Vic3lzdGVtIGd1aWRlbGluZXMg
c3VnZ2VzdCB0aGF0IHRoZSBjb3JlIE1GRCBwYXJlbnQgZHJpdmVyIHNob3VsZApvbmx5IGhhbmRs
ZSBzaGFyZWQgY29yZSByZXNvdXJjZXMuIFByaXZhdGUgcmVzb3VyY2VzIGNvbnN1bWVkIGV4Y2x1
c2l2ZWx5IGJ5CmEgc2luZ2xlIGNoaWxkIGRyaXZlciBzaG91bGQgdHlwaWNhbGx5IGJlIGluaXRp
YWxpemVkIGRpcmVjdGx5IHdpdGhpbiB0aGF0CmNoaWxkIHJhdGhlciB0aGFuIHBhc3NlZCBmcm9t
IHRoZSBwYXJlbnQuCgpbU2V2ZXJpdHk6IE1lZGl1bV0KVGhlIGNvbW1pdCBtZXNzYWdlIG1lbnRp
b25zIHJlbW92aW5nIGhhcmRjb2RlZCBjb25zdGFudHMgYW5kIHBhc3NpbmcgdGhlc2UKcGFyYW1l
dGVycyB0byB0aGUgZmFuIHN1Yi1kcml2ZXIsIGJ1dCBpcyB0aGlzIHN0cnVjdHVyZSBhY3R1YWxs
eSB1c2VkCmFueXdoZXJlIGluIHRoZSBjb2RlPwoKVGhlIGNvcnJlc3BvbmRpbmcgQyBmaWxlIG1v
ZGlmaWNhdGlvbnMgYXBwZWFyIHRvIGJlIG1pc3NpbmcgZnJvbSB0aGUgY29tbWl0LAp3aGljaCBs
ZWF2ZXMgdGhpcyBzdHJ1Y3R1cmUgZW50aXJlbHkgdW51c2VkLgoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgwNS1hZGQtbWN1LWZh
bi1raGFkYXMtdmltNC12OS0wLTc1ZGY3ODcxMGI5ZUBhbGllbC5mcj9wYXJ0PTEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
