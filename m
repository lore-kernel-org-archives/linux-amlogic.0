Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74391C55173
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Aug 2026 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zkLtpWYivf04NmS0T8B9A4VkiT8Olzjokxyh5CO03s=; b=rxumP7bNjA+SGy
	mHYumLP4U5HxaZnCDmm1YXHebQNZ6GshZzJzsJUFX/vUcvkCVW/VqEGMKZcIzyJpLFhOKBpCZDLKq
	wc5pxoDDpX1Erjn8jg8GLYMHOz5hOxVoPPAli9qLl01sped91bPuHngseWv07gdDJHWqptbWQCn5c
	hMqMvFtOqjXF71bhUuHlG9beduMEvCa1iZy6/wxjjv4cUsr8qUkGt7hcWzK3ffIhfL3MZgVry/ktW
	KZ1xV18Cxrl6S7aubZS52g0cHu2oLUBf+vwZ4KQIeYvbvo6M2j+nhhPyTJ2SnQJSicXM6taodNrIb
	b2uCOSZVz7Q0UL5HRCRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqE7u-0000000EwZE-3V8c;
	Sat, 01 Aug 2026 18:08:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqE7u-0000000EwZ6-0QGD
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Aug 2026 18:08:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7077941FE3;
	Sat,  1 Aug 2026 18:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C88C1F00AC4;
	Sat,  1 Aug 2026 18:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785607681;
	bh=Myff0aT3/en/H1ZCkKfzPs2Zp0xyi8uXjpzibprtM3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DJ1upG9O8v4XfVyCl0K6f9VuN+3XXdbR9qRr5I0ynwiOLrVf0HfLMAt2kIX+uBEFN
	 VPaPoRlXtn5ofDkYgUk6t1JQlHFPbx5/mNHMWdhNgXzrLC6JNDk76WVdi6FHjpdnUW
	 4lihSqkXw4NhQc52nZi/eJCgd+csBfKd/p8S0NFlRtPryuF4SNAtHpRXAEV9G2WHBB
	 4NTalinZqCfsF+GB4lAh5dIwcJuaruTTVpqM10D3KeglVpstu9ctzK//Ke0M/skjcb
	 qumZaGe0jxqbKUCAxVU9Nty0deRvLQKP96itRPVmjJDj/o/PJsKJSLFPfc2iooODwf
	 7jHx1ZdfNzFcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] spi: meson-spifc: use
 devm_pm_runtime_set_active_enabled
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260802-spifc-v2-1-46e9d06a3217@gmail.com>
References: <20260802-spifc-v2-1-46e9d06a3217@gmail.com>
Date: Sat, 01 Aug 2026 18:08:00 +0000
Message-Id: <20260801180801.1C88C1F00AC4@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFJlbW92aW5nIGBwbV9y
dW50aW1lX2Rpc2FibGUoKWAgZnJvbSBgbWVzb25fc3BpZmNfcmVtb3ZlKClgIGludHJvZHVjZXMg
YSByYWNlIGNvbmRpdGlvbiBkdXJpbmcgZGV2aWNlIHJlbW92YWwgdGhhdCBjYW4gY2F1c2UgYSBj
bG9jayB1c2FnZSB1bmRlcmZsb3cuCi0tCgotLS0gUGF0Y2ggWzFdOiBbUEFUQ0ggdjJdIHNwaTog
bWVzb24tc3BpZmM6IHVzZSBkZXZtX3BtX3J1bnRpbWVfc2V0X2FjdGl2ZV9lbmFibGVkIC0tLQpj
b21taXQgYjQ1ZTk1YWEwMGIxYjAyYTlmNmMyOTI3NWI3M2JiMDAzYjI5Nzg3MApBdXRob3I6IEZl
bGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4KCnNwaTogbWVzb24tc3BpZmM6IHVzZSBkZXZtX3Bt
X3J1bnRpbWVfc2V0X2FjdGl2ZV9lbmFibGVkCgpUaGlzIGNvbW1pdCBjb252ZXJ0cyB0aGUgZHJp
dmVyIHRvIHVzZSBkZXZtX3BtX3J1bnRpbWVfc2V0X2FjdGl2ZV9lbmFibGVkKCksCmRyb3BwaW5n
IGV4cGxpY2l0IHBtX3J1bnRpbWVfZW5hYmxlIGFuZCBwbV9ydW50aW1lX2Rpc2FibGUgY2FsbHMg
YWxvbmcgd2l0aAp0aGVpciBhc3NvY2lhdGVkIGVycm9yIHBhdGhzLgoKTGluazogaHR0cHM6Ly9w
YXRjaC5tc2dpZC5saW5rLzIwMjYwNzIyLXNwaWZjLXYxLTEtZTQ0NjJhNGM2YTA2QGdtYWlsLmNv
bQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWZjLmMgYi9kcml2ZXJz
L3NwaS9zcGktbWVzb24tc3BpZmMuYwo+IGluZGV4IGUzNmFhOTRiYmRhZTMuLjgyYzFjM2MwYzg0
YjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLW1lc29uLXNwaWZjLmMKPiArKysgYi9k
cml2ZXJzL3NwaS9zcGktbWVzb24tc3BpZmMuYwo+IEBAIC0zMjUsMjYgKzMyNSwyMCBAQCBzdGF0
aWMgaW50IG1lc29uX3NwaWZjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAo+ICAJbWVzb25fc3BpZmNfaHdfaW5pdChzcGlmYyk7Cj4gIAo+IC0JcG1fcnVudGltZV9zZXRf
YWN0aXZlKHNwaWZjLT5kZXYpOwo+IC0JcG1fcnVudGltZV9lbmFibGUoc3BpZmMtPmRldik7Cj4g
KwlyZXQgPSAgZGV2bV9wbV9ydW50aW1lX3NldF9hY3RpdmVfZW5hYmxlZChzcGlmYy0+ZGV2KTsK
ClsgLi4uIF0KCj4gIHN0YXRpYyB2b2lkIG1lc29uX3NwaWZjX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICB7Cj4gIAlwbV9ydW50aW1lX2dldF9zeW5jKCZwZGV2LT5kZXYp
Owo+IC0JcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+ICAJcG1fcnVudGltZV9wdXRf
bm9pZGxlKCZwZGV2LT5kZXYpOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHJlbW92aW5nIHBtX3J1
bnRpbWVfZGlzYWJsZSgpIGhlcmUgY3JlYXRlIGEgcmFjZSBjb25kaXRpb24gdGhhdCBjYW4KbGVh
ZCB0byBhIGNsb2NrIHVzYWdlIHVuZGVyZmxvdz8KCldoZW4gcG1fcnVudGltZV9wdXRfbm9pZGxl
KCkgZHJvcHMgdGhlIHVzYWdlIGNvdW50IHRvIDAsIFBNIHJ1bnRpbWUgcmVtYWlucwplbmFibGVk
IHVudGlsIHRoZSBkZXZyZXMgdGVhcmRvd24gcGhhc2UuCgpOZXh0LCBkZXZyZXMgdGVhcmRvd24g
cnVucyBkZXZtX3NwaV91bnJlZ2lzdGVyX2NvbnRyb2xsZXIoKSwgd2hpY2gKdW5yZWdpc3RlcnMg
Y2hpbGQgU1BJIGRldmljZXMuCgpJZiBhIGNoaWxkIGRldmljZSAobGlrZSBhbiBTUEkgZmxhc2gp
IHBlcmZvcm1zIGEgZmluYWwgdHJhbnNmZXIgZHVyaW5nIGl0cwpvd24gcmVtb3ZhbCwgdGhlIFNQ
SSBjb3JlIHdpbGwgdGVtcG9yYXJpbHkgd2FrZSB0aGlzIHBhcmVudCBjb250cm9sbGVyIGFuZAp0
aGVuIGNhbGwgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSB3aGVuIHRoZSB0cmFuc2ZlciBj
b21wbGV0ZXMuCgpCZWNhdXNlIHRoZSBiYXNlIHVzYWdlIGNvdW50IGlzIG5vdyAwLCB0aGlzIHF1
ZXVlcyBhbiBhc3luY2hyb25vdXMgc3VzcGVuZC4KV2hlbiBtZXNvbl9zcGlmY19ydW50aW1lX3N1
c3BlbmQoKSBydW5zLCBpdCBjYWxscyBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSwKZHJvcHBpbmcg
dGhlIGNsb2NrIGNvdW50IHRvIDAuCgpMYXRlciBpbiB0aGUgZGV2cmVzIHRlYXJkb3duIHNlcXVl
bmNlLCB0aGUgY2xlYW51cCBmb3IgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKQpleGVjdXRlcyBhbmQg
dW5jb25kaXRpb25hbGx5IGNhbGxzIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGFnYWluLCBjYXVz
aW5nCnRoZSBjbG9jayBjb3VudCB0byB1bmRlcmZsb3cuCgo+ICB9Cj4KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4MDItc3BpZmMt
djItMS00NmU5ZDA2YTMyMTdAZ21haWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
