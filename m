Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26985C5B56A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MN8Ff6+49CJGe8+QmPFbTCJQoRGtPYpTCiq/l6yDSW4=; b=lXqgM0NMxPyzCB
	IPCCZCZnWsA9mbTwEyr68VyQoQz1AX8Ff0h4HLE6zVhlga8GT2Jl+iYEheDs2CXncd2Eg7jSs20av
	/pFjF/T52AeH93VCqRs8dyvtQNWqPgjyoccQP5+UgEL4v/oTfg3MuPlJiVrP1a1dCGt73T+GD3fI3
	b3uJkIrhhuwQMXoYGh6vth3VVK4XdP1eDZV0H72mjkrPn6fVlhppv1A3C/ap3shUMJfItl5JJOcJ3
	RqEV4nqFKTPCalMOmzNEsP9/S8hBDqe7i/tkTTD/+8nQJ3oKCVm7OQLci/2/l4ShXad0/4gpKqiRx
	Ib1rr8dBUL8Is6BXF9qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Bu-0000000FtU8-00ey;
	Wed, 12 Aug 2026 10:28:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Bs-0000000FtTV-294e
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 10:28:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDAB4600E2;
	Wed, 12 Aug 2026 10:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B1F1F000E9;
	Wed, 12 Aug 2026 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786530487;
	bh=btutGFJRS858/BaOzk7WNAoIRfLrVOlcfpl+QYj48X0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dX5Getjj8DjM1w/P5H4fG7okN0l7QsFPe7x0qq96NWaB+zTMzoqHLRRjsqnIbatqn
	 C5x5DTKFHPvACJ4SCOAoUa6t/yp7QGr/xb7zmS3MryLT1pek9TH1CoCn2wm1zoIcYs
	 eeb4KAhMdLQDLy8MUQWjqoJW2nbu+03Z+iXYZgFWL2Hw9gL4CP8SGEIkfzAVFMEIHP
	 nBuFlqI9wm1VdgF8g18Jidgxgw+uJPw82B+C8u2+zFRhhnmlR3pcC+OKsKAFJQvWFw
	 WYps/E8im3aa2bdw2Kvyw9M2mMg0XKpOauTagpennbRVu0vIDXw0Zy7pPresN348mE
	 WstRPZYV2UB0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: meson: a4: Add input enable pin configuration
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
References: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
Date: Wed, 12 Aug 2026 10:28:06 +0000
Message-Id: <20260812102806.E8B1F1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gYW1sX3BpbmNvbmZf
Z2V0KCkgdmlvbGF0ZXMgdGhlIHBpbmN0cmwgc3Vic3lzdGVtIGNvbnRyYWN0IGJ5IHJldHVybmlu
ZyAwIChzdWNjZXNzKSBpbnN0ZWFkIG9mIC1FSU5WQUwgd2hlbiBib29sZWFuIGNvbmZpZ3VyYXRp
b25zIFBJTl9DT05GSUdfT1VUUFVUX0VOQUJMRSBhbmQgUElOX0NPTkZJR19JTlBVVF9FTkFCTEUg
YXJlIGRpc2FibGVkLCBicmVha2luZyBwaW5jdHJsIGRlYnVnZnMgcmVwb3J0aW5nLgotLQoKLS0t
IFBhdGNoIFsxXTogW1BBVENIXSBwaW5jdHJsOiBtZXNvbjogYTQ6IEFkZCBpbnB1dCBlbmFibGUg
cGluIGNvbmZpZ3VyYXRpb24gLS0tCmNvbW1pdCBjMWMwMDViM2FlZmQ2YjY4MDg3ZTRlMzMxNDQ4
YWQzNzkyY2EwMDJkCkF1dGhvcjogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5j
b20+CgpwaW5jdHJsOiBtZXNvbjogYTQ6IEFkZCBpbnB1dCBlbmFibGUgcGluIGNvbmZpZ3VyYXRp
b24KClRoaXMgY29tbWl0IGFkZHMgc3VwcG9ydCBmb3IgUElOX0NPTkZJR19JTlBVVF9FTkFCTEUg
aW4gdGhlIEFtbG9naWMgQTQKcGluY3RybCBkcml2ZXIuIEl0IHVzZXMgdGhlIGV4aXN0aW5nIG91
dHB1dCBlbmFibGUgY29udHJvbCB0byBjb25maWd1cmUgdGhlCmlucHV0IGVuYWJsZSBzdGF0ZSwg
YW5kIHVwZGF0ZXMgUElOX0NPTkZJR19PVVRQVVRfRU5BQkxFIGhhbmRsaW5nLgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy1hNC5jIGIvZHJpdmVy
cy9waW5jdHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy1hNC5jCj4gLS0tIGEvZHJpdmVycy9waW5j
dHJsL21lc29uL3BpbmN0cmwtYW1sb2dpYy1hNC5jCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL21l
c29uL3BpbmN0cmwtYW1sb2dpYy1hNC5jCj4gQEAgLTQ2OSw5ICs0NjksMTUgQEAgc3RhdGljIGlu
dCBhbWxfcGluY29uZl9nZXQoc3RydWN0IHBpbmN0cmxfZGV2ICpwY2RldiwgdW5zaWduZWQgaW50
IHBpbiwKPiAgCQlicmVhazsKPiAgCWNhc2UgUElOX0NPTkZJR19PVVRQVVRfRU5BQkxFOgo+ICAJ
CXJldCA9IGFtbF9waW5jb25mX2dldF9vdXRwdXQoaW5mbywgcGluKTsKPiAtCQlpZiAocmV0IDw9
IDApCj4gKwkJaWYgKHJldCA8IDApCj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJCWFyZyA9IHJl
dDsKPiArCQlicmVhazsKPiArCWNhc2UgUElOX0NPTkZJR19JTlBVVF9FTkFCTEU6Cj4gKwkJcmV0
ID0gYW1sX3BpbmNvbmZfZ2V0X291dHB1dChpbmZvLCBwaW4pOwo+ICsJCWlmIChyZXQgPCAwKQo+
ICAJCQlyZXR1cm4gLUVJTlZBTDsKPiAtCQlhcmcgPSAxOwo+ICsJCWFyZyA9ICFyZXQ7Cj4gIAkJ
YnJlYWs7CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyByZXR1cm5pbmcgMCBpbnN0ZWFkIG9mIC1F
SU5WQUwgd2hlbiB0aGVzZSBib29sZWFuIGNvbmZpZ3VyYXRpb25zIGFyZQpkaXNhYmxlZCB2aW9s
YXRlIHRoZSBwaW5jdHJsIHN1YnN5c3RlbSBjb250cmFjdCBpbiBhbWxfcGluY29uZl9nZXQ/CgpU
aGUgZ2VuZXJpYyBwaW5jdHJsIHN1YnN5c3RlbSByZWxpZXMgb24gdGhlIC1FSU5WQUwgcmV0dXJu
IGNvZGUgdG8gb21pdApkaXNhYmxlZCBib29sZWFuIGZlYXR1cmVzLiBCZWNhdXNlIGJvb2xlYW4g
ZmVhdHVyZXMgaWdub3JlIHRoZSByZXR1cm5lZAphcmd1bWVudCB2YWx1ZSwgcmV0dXJuaW5nIDAg
d2l0aCBhcmcgPSAwIHdoZW4gdGhlIGZlYXR1cmUgaXMgZGlzYWJsZWQgd2lsbApjYXVzZSBkZWJ1
Z2ZzIChzdWNoIGFzIC9zeXMva2VybmVsL2RlYnVnL3BpbmN0cmwvLi4uL3BpbmNvbmYtcGlucykg
dG8KZmFsc2VseSByZXBvcnQgYm90aCAnb3V0cHV0IGVuYWJsZWQnIGFuZCAnaW5wdXQgZW5hYmxl
ZCcgYXMgYWN0aXZlIGZvcgpldmVyeSBwaW4uCgpTaG91bGQgdGhlIGNoZWNrIGZvciBQSU5fQ09O
RklHX09VVFBVVF9FTkFCTEUgcmVtYWluIHJldCA8PSAwLCBhbmQgc2hvdWxkClBJTl9DT05GSUdf
SU5QVVRfRU5BQkxFIGFsc28gcmV0dXJuIC1FSU5WQUwgd2hlbiBpbnB1dCBpcyBub3QgZW5hYmxl
ZD8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjA4MTItaW5wdXQtZW5hYmxlLXYxLTEtODFlNWNhNzc3MmFhQGFtbG9naWMuY29tP3Bh
cnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
