Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BF0C44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSdHv+8DqwGiXIcE2lJS9/mg1miBmdW4q5TWqK4enu0=; b=SkEOx4NYih1NY8
	ThasmW/jfeXeo4/i3dCLBTaK0QcYDA7Wry97g+oDZ9PZk+MdKBAlutM08bL3LUzlo8f6jqOGT4JgD
	G3TVWRe271ZJGLtvqoTWDiXx9sfNRQVKSsbuFFYXm1MUE+S9jL5+jo7UqQRKHubnwQUwhif8dDAAP
	eS8W33CDgtDADjyS1uER+qDZBr+mqXKVWM1vyJavVG349pxe1ruOkikT9yyJn2yRrAyggojGmISNB
	raiAobjfYKXOrJrLfExaCd1Vm5JvX84IVP8N2e32K3Eux1G8T20QoLwTf2uair16Z0K85qjILdO/9
	C/VLRuFkWSNa2rzeOirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqPn-00000007I8O-1mKP;
	Mon, 20 Jul 2026 16:00:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqPm-00000007I88-3jd8
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 16:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46443600AD;
	Mon, 20 Jul 2026 16:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2561F00A3A;
	Mon, 20 Jul 2026 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563222;
	bh=4LlIpLHzPCnxK1ITIZgjXOXeMb70YEarXXhHjS20X7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OAq+QpxtYaFDOr4ryR+MRNSzY7HcYB1s63Kw9QI47Sx5xekr9a0l6JI6wBSmsLZSG
	 e4uYwH7m8N/T6t7kiY341kRnaeFZ9rJK30eZ9QGtuX/QLq5nCnXczELM45iRAFn8Fs
	 PQvy9A0Nj3CraKtBkY2vEzDf5dL/SodKOckX4N1IoMwKrbEvdtnNd0zj0TCxTXV1oT
	 jXq0NhsCvDbcMXwi9152R4PSQv117feCzYuzpkz1z1SCu/NEeoGYcyAkDTrgCaZJaj
	 AICazzkGUZQfDz6kRptebqbD0H9Vpu55AqmbffgY5PIYE0rwixcPu0yVdtVLabiFTV
	 QEd45yFUTAYeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/15] drm/virtio: remove dependency on DRM simple
 helpers
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: imx@lists.linux.dev, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-6-5020b630668a@gmail.com>
Date: Mon, 20 Jul 2026 16:00:21 +0000
Message-Id: <20260720160021.8D2561F00A3A@smtp.kernel.org>
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
IFtIaWdoXSBVbmhhbmRsZWQgcmV0dXJuIHZhbHVlIG9mIGRybV9jb25uZWN0b3JfaW5pdCgpIGxl
YWRpbmcgdG8gcG90ZW50aWFsIGtlcm5lbCBvb3BzIG9uIGFsbG9jYXRpb24gZmFpbHVyZS4KLS0K
Ci0tLSBQYXRjaCBbNl06IFtQQVRDSCB2MiAwNi8xNV0gZHJtL3ZpcnRpbzogcmVtb3ZlIGRlcGVu
ZGVuY3kgb24gRFJNIHNpbXBsZSBoZWxwZXJzIC0tLQpjb21taXQgYzNlNDg5MTA3MzBjYWIyZWRl
NjNjNTU1NjliMWVhMmYzODZiOWM2MApBdXRob3I6IERpb2dvIFNpbHZhIDxkaW9nb21wYWlzc2ls
dmFAZ21haWwuY29tPgoKZHJtL3ZpcnRpbzogcmVtb3ZlIGRlcGVuZGVuY3kgb24gRFJNIHNpbXBs
ZSBoZWxwZXJzCgpUaGlzIGNvbW1pdCByZW1vdmVzIHRoZSBkZXByZWNhdGVkIERSTSBzaW1wbGUg
S01TIGhlbHBlciBkZXBlbmRlbmN5CmJ5IG9wZW4tY29kaW5nIGRybV9zaW1wbGVfZW5jb2Rlcl9p
bml0KCkgaW50byBkcm1fZW5jb2Rlcl9pbml0KCkKYW5kIGNvcnJlY3RseSBjaGVja2luZyB0aGUg
cmV0dXJuIHZhbHVlIHRvIHByZXZlbnQgc2lsZW50IGZhaWx1cmVzLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92aXJ0aW8vdmlydGdwdV9kaXNwbGF5LmMKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1
X2Rpc3BsYXkuYwoKWyAuLi4gXQoKPiBAQCAtMzA2LDcgKzMxMCwxMSBAQCBzdGF0aWMgaW50IHZn
ZGV2X291dHB1dF9pbml0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsIGludCBpbmRl
eCkKPiAgCWlmICh2Z2Rldi0+aGFzX2VkaWQpCj4gIAkJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZWRp
ZF9wcm9wZXJ0eShjb25uZWN0b3IpOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4
aXN0aW5nIGlzc3VlLCBidXQgbG9va2luZyBhdCB0aGUgY29udGV4dCBqdXN0CmFib3ZlIHRoZXNl
IGxpbmVzIGluIHZnZGV2X291dHB1dF9pbml0KCksIHRoZSByZXR1cm4gdmFsdWUgb2YKZHJtX2Nv
bm5lY3Rvcl9pbml0KCkgaXMgaWdub3JlZC4KClNpbmNlIHRoaXMgcGF0Y2ggY29ycmVjdHMgbWlz
c2luZyBlcnJvciBoYW5kbGluZyBmb3IgZHJtX2VuY29kZXJfaW5pdCgpLAp3b3VsZCBpdCBtYWtl
IHNlbnNlIHRvIGFsc28gY2F0Y2ggZXJyb3JzIGZyb20gZHJtX2Nvbm5lY3Rvcl9pbml0KCkgaW4g
dGhpcwpzYW1lIGZ1bmN0aW9uPwoKSWYgZHJtX2Nvbm5lY3Rvcl9pbml0KCkgZmFpbHMgKHN1Y2gg
YXMgZnJvbSByZXNvdXJjZSBleGhhdXN0aW9uKSwgdGhlCmNvbm5lY3RvciBzdHJ1Y3R1cmUgaXMg
bGVmdCB1bmluaXRpYWxpemVkLiBDYWxsaW5nIGRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgpCmFu
ZCBkcm1fY29ubmVjdG9yX2F0dGFjaF9lZGlkX3Byb3BlcnR5KCkgc3Vic2VxdWVudGx5IHdpbGwg
ZGVyZWZlcmVuY2UgdGhpcwp1bmluaXRpYWxpemVkIHN0YXRlLCB3aGljaCBjYW4gbGVhZCB0byBh
IGNyYXNoLgoKPiAtCWRybV9zaW1wbGVfZW5jb2Rlcl9pbml0KGRldiwgZW5jb2RlciwgRFJNX01P
REVfRU5DT0RFUl9WSVJUVUFMKTsKPiArCXJldCA9IGRybV9lbmNvZGVyX2luaXQoZGV2LCBlbmNv
ZGVyLCAmdmlydGlvX2dwdV9lbmNfZnVuY3MsCj4gKwkJCSAgICAgICBEUk1fTU9ERV9FTkNPREVS
X1ZJUlRVQUwsIE5VTEwpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiAgCWRy
bV9lbmNvZGVyX2hlbHBlcl9hZGQoZW5jb2RlciwgJnZpcnRpb19ncHVfZW5jX2hlbHBlcl9mdW5j
cyk7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNo
c2V0LzIwMjYwNzIwLWRybV9zaW1wbGVfZW5jb2Rlcl9pbml0LXYyLTAtNTAyMGI2MzA2NjhhQGdt
YWlsLmNvbT9wYXJ0PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
