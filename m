Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA09CD5BAC
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 May 2026 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W7ZhvHHlRt0V30eRqcE9hY1tqacOldbh68jKGWp3Mp8=; b=tiXxKRMai6Dp1z
	RuUemEuoIcRgBSS8SZ/1fEnpFwcirOPg55l9J9j5kCZ5h1JiZRvBQBtK4W3axUCw1wylMzR6w6O8T
	3KV8XYulWzVhyX8t8ftYcyaMKX67+ZaXMQt+CeRCoHvW+DQ4qrcyPCRj+qlW5OJwf/XM9hLgSgCUE
	GWXmlRNmn4D/7TjUZfdONDmStLINvkJLgGvLtIR/dNwo16ajF/Q9A402a489KhSDK8bOSlutxRwnr
	256cpeFezIgW54TnciTmiY1i4fZQGVsBSRVMNEeDWMdXpnTqXq9OcA2veJDWEanYCJZa5iR5V2GJY
	uL1QyTK1xD4Xi7Ohp8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLeC-0000000AFJQ-2664;
	Fri, 22 May 2026 08:54:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLe9-0000000AFIo-0f8G
	for linux-amlogic@lists.infradead.org;
	Fri, 22 May 2026 08:54:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23BB343CC5;
	Fri, 22 May 2026 08:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E391F000E9;
	Fri, 22 May 2026 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779440060;
	bh=je3ZmZGovutnMMJsaGBqat4hzzTd5kA/7YykKSA9MIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kayR2NBN6YJ6Me6qMYgNmhwj2qZwxA/O6orXtyUroHpN4k1K7twO06Gjru9K3ucuY
	 txaTnQ+JlUCMq3eQuQFN+X5mIohro/OI9bDhiPhvsZO0zvI4GeKdICWdgDl3hr32R9
	 N76UOyZm6etVU8QIIlDSpMUT2OhP9V6iL0VqkLEpHunYRl5FPzmM7KPrXftOh944bm
	 M7h8utij4IciJ2GB1gMo/jSCpso3STEH1BUVnNt/PtzNyPiixKGPYijpmoA3aBi+Du
	 NVDaeWOUdQyzRTIpWdLZjgt1hNZDNdNav3F3hULbnTxr+qhMQOZQPPrThEVn3uEdJ8
	 o2Pgg8GV2ynFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: meson: keep reset control around
To: "Philipp Zabel" <p.zabel@pengutronix.de>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260522083548.2360352-1-p.zabel@pengutronix.de>
References: <20260522083548.2360352-1-p.zabel@pengutronix.de>
Date: Fri, 22 May 2026 08:54:19 +0000
Message-Id: <20260522085419.D4E391F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_015421_238793_56CE4097 
X-CRM114-Status: GOOD (  16.80  )
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVuZ3VhcmRlZCBhY2Nl
c3MgdG8gdGhlIGZpeGVkLXNpemUgYGNwdV9yc3RjYCBhcnJheSB1c2luZyB0aGUgYGNwdWAgaW5k
ZXguCi0gW0hpZ2hdIEVhcmx5IHJldHVybnMgaW4gYG1lc29uX3NtcF9wcmVwYXJlX2NwdXNgIGxl
YXZlIGBjcHVfcnN0Y2AgdW5pbml0aWFsaXplZCwgYnlwYXNzaW5nIGVycm9yIGNoZWNrcyBkdXJp
bmcgc2Vjb25kYXJ5IGJvb3QuCi0tCgpjb21taXQgM2E3OGE4NDQ1MmRmYThlYjg1MDkyODJiOGEy
NWRmYTI2OTNlNmUxYQpBdXRob3I6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXgu
ZGU+CgpBUk06IG1lc29uOiBrZWVwIHJlc2V0IGNvbnRyb2wgYXJvdW5kCgpUaGlzIGNvbW1pdCBy
ZXRhaW5zIGV4Y2x1c2l2ZSBjb250cm9sIG92ZXIgdGhlIENQVSByZXNldCBsaW5lIHJhdGhlciB0
aGFuCnJlbGVhc2luZyBpdC4gVGhpcyBpcyBpbnRlbmRlZCB0byBrZWVwIHRoZSByZXNldCBsaW5l
IGRlYXNzZXJ0ZWQgYWZ0ZXIgdHVybmluZwpvbiBhIENQVSBhbmQgYXZvaWRzIGNhbGxpbmcgcmVz
ZXRfY29udHJvbF9wdXQgYmVmb3JlIHdvcmtxdWV1ZXMgYXJlCm9wZXJhdGlvbmFsLgoKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vbWFjaC1tZXNvbi9wbGF0c21wLmMgYi9hcmNoL2FybS9tYWNoLW1l
c29uL3BsYXRzbXAuYwo+IGluZGV4IDMyYWM2MGI4OWZkY2MuLjVmMTg4OTUxMDRlZDggMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9hcm0vbWFjaC1tZXNvbi9wbGF0c21wLmMKPiArKysgYi9hcmNoL2FybS9t
YWNoLW1lc29uL3BsYXRzbXAuYwo+IEBAIC0zNCw2ICszNCw3IEBACj4gIHN0YXRpYyB2b2lkIF9f
aW9tZW0gKnNyYW1fYmFzZTsKPiAgc3RhdGljIHZvaWQgX19pb21lbSAqc2N1X2Jhc2U7Cj4gIHN0
YXRpYyBzdHJ1Y3QgcmVnbWFwICpwbXU7Cj4gK3N0YXRpYyBzdHJ1Y3QgcmVzZXRfY29udHJvbCAq
Y3B1X3JzdGNbNF07Cj4gIAo+ICBzdGF0aWMgc3RydWN0IHJlc2V0X2NvbnRyb2wgKm1lc29uX3Nt
cF9nZXRfY29yZV9yZXNldChpbnQgY3B1KQo+ICB7ClsgLi4uIF0KPiBAQCAtOTksNiArMTAxLDkg
QEAgc3RhdGljIHZvaWQgX19pbml0IG1lc29uX3NtcF9wcmVwYXJlX2NwdXMoY29uc3QgY2hhciAq
c2N1X2NvbXBhdGlibGUsCj4gIAl9Cj4gIAo+ICAJc2N1X2VuYWJsZShzY3VfYmFzZSk7Cj4gKwo+
ICsJZm9yIChjcHUgPSAwOyBjcHUgPCBBUlJBWV9TSVpFKGNwdV9yc3RjKTsgY3B1KyspCj4gKwkJ
Y3B1X3JzdGNbY3B1XSA9IG1lc29uX3NtcF9nZXRfY29yZV9yZXNldChjcHUpOwo+ICB9CgpbU2V2
ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBsZWF2ZSB0aGUgY3B1X3JzdGMgYXJyYXkgdW5pbml0aWFs
aXplZCBpZiBhbiBlYXJsaWVyIHN0ZXAgZmFpbHM/CgpJZiBhIHNldHVwIHN0ZXAgbGlrZSBtYXBw
aW5nIHRoZSBTQ1UgZmFpbHMgZWFybGllciBpbiB0aGlzIGZ1bmN0aW9uLCBpdCBsb2dzCmFuIGVy
cm9yIGFuZCByZXR1cm5zIGVhcmx5IHdpdGhvdXQgZXhlY3V0aW5nIHRoaXMgbG9vcC4gVGhlIGNw
dV9yc3RjIGFycmF5CndpbGwgcmVtYWluIGZpbGxlZCB3aXRoIE5VTEwgcG9pbnRlcnMuCgpXaGVu
IHNtcF9ib290X3NlY29uZGFyeSBzdWJzZXF1ZW50bHkgZXhlY3V0ZXMsIGl0IHJlYWRzIHRoZSB1
bmluaXRpYWxpemVkIE5VTEwKcG9pbnRlciBmcm9tIHRoZSBhcnJheS4gU2luY2UgSVNfRVJSKE5V
TEwpIGV2YWx1YXRlcyB0byBmYWxzZSwgdGhlIGVycm9yCmNoZWNrIGlzIGVudGlyZWx5IGJ5cGFz
c2VkLiBUaGUgc3Vic2VxdWVudCByZXNldCBjb250cm9sIGNhbGxzIHdpbGwgYWN0IGFzCnNpbGVu
dCBuby1vcHMsIHdoaWNoIGNvdWxkIHJlc3VsdCBpbiBhdHRlbXB0aW5nIHRvIHBvd2VyIG9uIGFu
IHVucmVzZXQgQ1BVCmluc3RlYWQgb2YgZ3JhY2VmdWxseSBmYWlsaW5nLgoKWyAuLi4gXQo+IEBA
IC0xNTUsMTAgKzE2MCw5IEBAIHN0YXRpYyBpbnQgbWVzb25fc21wX2ZpbmFsaXplX3NlY29uZGFy
eV9ib290KHVuc2lnbmVkIGludCBjcHUpCj4gIHN0YXRpYyBpbnQgbWVzb244X3NtcF9ib290X3Nl
Y29uZGFyeSh1bnNpZ25lZCBpbnQgY3B1LAo+ICAJCQkJICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KmlkbGUpCj4gIHsKPiAtCXN0cnVjdCByZXNldF9jb250cm9sICpyc3RjOwo+ICsJc3RydWN0IHJl
c2V0X2NvbnRyb2wgKnJzdGMgPSBjcHVfcnN0Y1tjcHVdOwoKW1NldmVyaXR5OiBIaWdoXQpEb2Vz
IHRoaXMgaW50cm9kdWNlIGEgcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgcmVhZCBvbiB0aGUgY3B1
X3JzdGMgYXJyYXk/CgpUaGUgY3B1X3JzdGMgYXJyYXkgaXMgc3RhdGljYWxseSBhbGxvY2F0ZWQg
d2l0aCBhIHNpemUgb2YgNCwgYnV0IHRoZSBjcHUgaW5kZXgKaXMgdXNlZCBkaXJlY3RseSBoZXJl
IHdpdGhvdXQgYm91bmRzIGNoZWNraW5nLiBJZiB0aGUgc3lzdGVtJ3MgZGV2aWNlIHRyZWUKc3Bl
Y2lmaWVzIG1vcmUgdGhhbiA0IGxvZ2ljYWwgQ1BVIG5vZGVzLCBucl9jcHVfaWRzIHdpbGwgZXhj
ZWVkIDQsIGFuZCB0aGUKYm9vdCBjb2RlIHdpbGwgcGFzcyBhbiBpbmRleCB0aGF0IHJlYWRzIHBh
c3QgdGhlIGFycmF5IGJvdW5kcy4KClRoZSBpbnZhbGlkIHBvaW50ZXIgcmV0cmlldmVkIHdvdWxk
IHRoZW4gYmUgZGVyZWZlcmVuY2VkIHdoZW4gYXNzZXJ0aW5nIHRoZQpyZXNldCBjb250cm9sLgoK
PiAgCWludCByZXQ7Cj4gIAo+IC0JcnN0YyA9IG1lc29uX3NtcF9nZXRfY29yZV9yZXNldChjcHUp
Owo+ICAJaWYgKElTX0VSUihyc3RjKSkgewo+ICAJCXByX2VycigiQ291bGRuJ3QgZ2V0IHRoZSBy
ZXNldCBjb250cm9sbGVyIGZvciBDUFUlZFxuIiwgY3B1KTsKPiAgCQlyZXR1cm4gUFRSX0VSUihy
c3RjKTsKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDUyMjA4MzU0OC4yMzYwMzUyLTEtcC56YWJlbEBwZW5ndXRyb25p
eC5kZT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
