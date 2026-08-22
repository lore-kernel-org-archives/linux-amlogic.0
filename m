Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B84CC5B572
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Aug 2026 10:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yAQwhOQrXMfDFXC/AQ2YkDjQicbTO34oZCImXYan0K0=; b=4QLmTKYNacIODP
	gXtUpUriLzpzHgI9UL58vuVRpTYZGDwJT+OHRiVnN5WqhC8qaZntvRa7iAygW9mLYI29Lh2teSH5u
	6pz72iT7sCqfOCopA7snSpQeBh8QMTx7KSdeV0AXAptHZcXc04F9wgIq97kj5CWgXTV7TXGzyY/As
	dqsOwQg1vV67ZwW3OzAigUHOmA+5tjIrM3qcOmxfGqND3qeVgdR+m8LX+KiTHhK6+hGV/AiaP0Gh8
	dmzHVwhdU7lXR1wdBY3vytvChgnzW00+JezF1gfu1YVa7afohXlmvWZkeNCugceyG9dxWYzedXgzh
	J5la+7+ubC9NK2Waikpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxie0-0000000ESD2-1IZ7;
	Sat, 22 Aug 2026 10:08:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxidy-0000000ESCl-2nf1
	for linux-amlogic@lists.infradead.org;
	Sat, 22 Aug 2026 10:08:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFC636001A;
	Sat, 22 Aug 2026 10:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26681F00A3A;
	Sat, 22 Aug 2026 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787393285;
	bh=tg5kjStL0tCD6eQ9sGookoa7WJnCMLpD6A94KGeYygU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SfVByST27BjnBU3hMZ1TnEVqTN4Bt1BfIdusaJtyjb8SCGCURd840qON+odz/ZTkg
	 QDzOjcyrooJgcpKLdObdOJd7gLg7d8rCchcwnOhFxpeNa0K/rw3h4IW1tqc0rOuT8l
	 pLj/WYxAWZySSGazaHKMOPcrzGoAH7weEt0D/8AkFPXxGMlZgFR4tdzcwIfox5pmtP
	 kTfGk/fV3LucIt5rqNCs6s2LYFCk68zQ9pYUNl7dAdADRZb5wKLVNMRVxQRsAqexE1
	 BzkkCFQoNAsRPySaVk8nni71RQMKccKlUYdI5JFfpDp3OvprFIx5bHgMCaGVdQ4QUx
	 UodhKjUwBYX+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: mdio: mux-meson-g12a: Make sure
 clk_init_data is fully initialized
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <ae6cfac64d3983801b9baa2abb30bf09c3d7ce3b.1787240118.git.geert+renesas@glider.be>
References: <cover.1787240118.git.geert+renesas@glider.be>
 <ae6cfac64d3983801b9baa2abb30bf09c3d7ce3b.1787240118.git.geert+renesas@glider.be>
Date: Sat, 22 Aug 2026 10:08:04 +0000
Message-Id: <20260822100804.F26681F00A3A@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBCdXN5LXdhaXQgbG9vcCBvZiB1cCB0byAxIHNlY29uZCB3aXRoIGludGVycnVwdHMg
ZGlzYWJsZWQgaW4gYXRvbWljIGNsb2NrIGVuYWJsZSBjYWxsYmFjawotLQoKLS0tIFBhdGNoIFsy
XTogW1BBVENIIG5ldC1uZXh0IDIvM10gbmV0OiBtZGlvOiBtdXgtbWVzb24tZzEyYTogTWFrZSBz
dXJlIGNsa19pbml0X2RhdGEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQgLS0tCmNvbW1pdCAwNjFhNzJl
NTE3ZjM1YWQ0YmM0MWEyNzRkMmI3NjhkYjc3ZDg0YWQxCkF1dGhvcjogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KU3ViamVjdDogbmV0OiBtZGlvOiBtdXgtbWVz
b24tZzEyYTogTWFrZSBzdXJlIGNsa19pbml0X2RhdGEgaXMgZnVsbHkgaW5pdGlhbGl6ZWQKClRo
aXMgY29tbWl0IGVuc3VyZXMgdGhlIGNsa19pbml0X2RhdGEgc3RydWN0dXJlIGlzIGZ1bGx5IGlu
aXRpYWxpemVkIGJ5CmFkZGluZyBhbiBlbXB0eSBpbml0aWFsaXplci4gVGhpcyBwcmV2ZW50cyBz
dWJ0bGUgYnVncyByZWxhdGVkIHRvIG11dHVhbGx5CmV4Y2x1c2l2ZSBtZW1iZXJzIHdoZW4gZGlm
ZmVyZW50IHN0YWNrIGluaXRpYWxpemF0aW9uIHBhdHRlcm5zIGFyZSBlbmFibGVkLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1tZXNvbi1nMTJhLmMgYi9kcml2ZXJz
L25ldC9tZGlvL21kaW8tbXV4LW1lc29uLWcxMmEuYwo+IC0tLSBhL2RyaXZlcnMvbmV0L21kaW8v
bWRpby1tdXgtbWVzb24tZzEyYS5jCj4gKysrIGIvZHJpdmVycy9uZXQvbWRpby9tZGlvLW11eC1t
ZXNvbi1nMTJhLmMKPiBAQCAtMjIzLDcgKzIyMyw3IEBAIHN0YXRpYyBpbnQgZzEyYV9lcGh5X2ds
dWVfY2xrX3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+ICAJc3RydWN0IGcxMmFf
bWRpb19tdXggKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAgCWNvbnN0IGNoYXIgKnBh
cmVudF9uYW1lc1tQTExfTVVYX05VTV9QQVJFTlRdOwo+IC0Jc3RydWN0IGNsa19pbml0X2RhdGEg
aW5pdDsKPiArCXN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsKCltTZXZlcml0eTogSGln
aF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IHdoaWxlIHJldmlld2luZyB0aGlz
IGNsb2NrIGluaXRpYWxpemF0aW9uLCAKSSBub3RpY2VkIGEgcG90ZW50aWFsIGxvY2t1cCBpbiB0
aGUgcmVsYXRlZCBQTEwgb3BlcmF0aW9ucy4KCkRvZXMgZzEyYV9lcGh5X3BsbF9lbmFibGUoKSBy
aXNrIHRyaWdnZXJpbmcgdGhlIGhhcmQgbG9ja3VwIGRldGVjdG9yPwoKVGhlIGcxMmFfZXBoeV9w
bGxfb3BzIHN0cnVjdCBpcyB1c2VkIGxhdGVyIGluIHRoaXMgZnVuY3Rpb24gdG8gaW5pdGlhbGl6
ZSAKdGhlIHBsbCBjbG9jaywgYW5kIGl0cyAuZW5hYmxlIGNhbGxiYWNrIG1hcHMgdG8gZzEyYV9l
cGh5X3BsbF9lbmFibGUoKToKCmRyaXZlcnMvbmV0L21kaW8vbWRpby1tdXgtbWVzb24tZzEyYS5j
OmcxMmFfZXBoeV9wbGxfZW5hYmxlKCkgewogICAgLi4uCiAgICByZXR1cm4gcmVhZGxfcG9sbF90
aW1lb3V0KHBsbC0+YmFzZSArIEVUSF9QTExfQ1RMMCwgdmFsLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2YWwgJiBQTExfQ1RMMF9MT0NLX0RJRywgMCwgUExMX0xPQ0tfVElNRU9VVCk7
Cn0KClRoZSBjbG9jayBmcmFtZXdvcmsgY2FsbHMgdGhlIC5lbmFibGUgY2FsbGJhY2sgd2l0aCB0
aGUgZW5hYmxlX2xvY2sgc3BpbmxvY2sKaGVsZCBhbmQgbG9jYWwgaW50ZXJydXB0cyBkaXNhYmxl
ZC4gU2luY2UgdGhlIGRlbGF5IHBhcmFtZXRlciBpcyAwIGFuZCAKUExMX0xPQ0tfVElNRU9VVCBp
cyAxLDAwMCwwMDAsIHJlYWRsX3BvbGxfdGltZW91dCgpIGV2YWx1YXRlcyB0byBhIHRpZ2h0CmJ1
c3ktd2FpdCBsb29wLiAKCklmIHRoZSBQTEwgaGFyZHdhcmUgZmFpbHMgdG8gbG9jayBvciB0YWtl
cyBhIGxvbmcgdGltZSwgY291bGQgdGhpcyBzdGFsbCAKdGhlIENQVSBmb3IgdXAgdG8gMSBzZWNv
bmQgaW4gYW4gaW50ZXJydXB0LWRpc2FibGVkIGNvbnRleHQ/CgpXb3VsZCBpdCBiZSBwb3NzaWJs
ZSB0byBtb3ZlIHRoaXMgaGFyZHdhcmUgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2UgdG8gdGhlIAou
cHJlcGFyZSBjYWxsYmFjayBpbnN0ZWFkLCB3aGljaCBleGVjdXRlcyBpbiBhIHByZWVtcHRpYmxl
IGNvbnRleHQgd2hlcmUgCnNsZWVwaW5nIGRlbGF5cyBhcmUgcGVybWl0dGVkPwoKPiAgCXN0cnVj
dCBnMTJhX2VwaHlfcGxsICpwbGw7Cj4gIAlzdHJ1Y3QgY2xrX211eCAqbXV4Owo+ICAJc3RydWN0
IGNsayAqY2xrOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYv
Iy9wYXRjaHNldC9jb3Zlci4xNzg3MjQwMTE4LmdpdC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZT9w
YXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
