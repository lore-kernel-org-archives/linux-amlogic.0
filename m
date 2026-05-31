Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F59CD6E55
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqYKYzObrGRv3BCzMb3cboiz5cjLdJlFu8spUH1Njlg=; b=iXwPMc2ByiZ+U6
	1E1SzT9izh+urOb2N/JWlfFlit54rk3rSNxVnLR4ljwEc5mjhrzK1v4OjxnEWfBn7jh1NCRAbTuA3
	F1d/QHAXGMdn58cPNh2bzYOV04GZZ8OvCcK+kaIr0LBarDwCk1oSymoPyIc4Gt1ydvBrUIl4S0MwF
	bSCAco8a6SxRj4Mtt5nLyGIaez2AsW71yuWdr+b3zJQwl+RlqSPFAMcPEL9Bn+ssmUYlhAk+Ouw8L
	Zfe5HMrLxkKA1gEI8DzYgoSW4eJPlBXggHKcuxvRYAJU40AMwjsuq3VlsGm1R5bzTlrEpYSSlI2mO
	Hk08eGm8T7dSSWd5Tcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbDy-00000009MXb-3aRg;
	Sun, 31 May 2026 08:08:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTbDv-00000009MXE-41IJ
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 08:08:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2144040142;
	Sun, 31 May 2026 08:08:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAFB1F00893;
	Sun, 31 May 2026 08:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780214923;
	bh=mmEiX4acjxWSks9+N55xonZ5x0jywufk9rXGmuFx/RM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mu9M3GDXsMinTxNjFp/ikFbOSVTGZ9Csna5NYRN9UhpmlkZ+FLKqXWvNn9uyG6sfw
	 GCAxSbbN+R20bgQNSbXxcJFQP3ONwRidM7PLjQBmAuQDGFk+6P3OhHU3OYaysbi+ed
	 Vi9mIrOAB5PDPAfK9We00iOOVxHON3nYfC6WnNZ7iPME8atBzT9VqG3loIq6rFduRu
	 7717v5eEbsZ8p0I7VdBi/qglBCazAmCR9bDLXdUS5YF1LAD17/PZiOqtFpm3c4G7OE
	 rp3T5+LzmfF/ElZab/D9+eol5Ma5qp4EH5oaPXVJCfvDsQnuHdtPKwfb9uEI2pMLWK
	 TfbwlyF/jvinA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/6] drm/meson: Open-code drm_simple_encoder_init() in
 encoder_cvbs
To: "Naman Arora" <namanarora029@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260531074627.8936-1-namanarora029@gmail.com>
References: <20260531074627.8936-1-namanarora029@gmail.com>
Date: Sun, 31 May 2026 08:08:42 +0000
Message-Id: <20260531080842.CAAFB1F00893@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_010844_055609_980FC7B1 
X-CRM114-Status: GOOD (  10.40  )
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
IFtIaWdoXSBVc2UtYWZ0ZXItZnJlZSBkdXJpbmcgZHJtX2VuY29kZXJfY2xlYW51cCgpIGR1ZSB0
byBicmlkZ2UgcmVmY291bnQgZHJvcHBpbmcgdG8gMC4KLS0KCmNvbW1pdCBlNzQyY2ZkY2NkMjFm
YTJmODM4MGFkMmM2MWY0OWM5OWVkZjgwOGUxCkF1dGhvcjogTmFtYW4gQXJvcmEgPG5hbWFuYXJv
cmEwMjlAZ21haWwuY29tPgoKZHJtL21lc29uOiBPcGVuLWNvZGUgZHJtX3NpbXBsZV9lbmNvZGVy
X2luaXQoKSBpbiBlbmNvZGVyX2N2YnMKClRoZSBoZWxwZXIgZHJtX3NpbXBsZV9lbmNvZGVyX2lu
aXQoKSBpcyByZXBsYWNlZCB3aXRoIGFuIG9wZW4tY29kZWQKZHJtX2VuY29kZXJfaW5pdCgpIHRv
IHJlbW92ZSB0aGUgZGVwZW5kZW5jeSBvbiBkcm1fc2ltcGxlX2ttc19oZWxwZXIuCkEgc2ltcGxl
IGRlc3Ryb3ktb25seSBlbmNvZGVyIGZ1bmNzIHN0cnVjdCBpcyBhZGRlZC4KCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYwo+IGluZGV4IDhiMjZhMDAzMWNkZTAu
Ljk3OTdlM2Y1N2UwYmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X2VuY29kZXJfY3Zicy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29k
ZXJfY3Zicy5jClsgLi4uIF0KPiBAQCAtMjU3LDggKzI2MCw5IEBAIGludCBtZXNvbl9lbmNvZGVy
X2N2YnNfcHJvYmUoc3RydWN0IG1lc29uX2RybSAqcHJpdikKPiAgCW1lc29uX2VuY29kZXJfY3Zi
cy0+cHJpdiA9IHByaXY7Cj4gIAo+ICAJLyogRW5jb2RlciAqLwo+IC0JcmV0ID0gZHJtX3NpbXBs
ZV9lbmNvZGVyX2luaXQocHJpdi0+ZHJtLCAmbWVzb25fZW5jb2Rlcl9jdmJzLT5lbmNvZGVyLAo+
IC0JCQkJICAgICAgRFJNX01PREVfRU5DT0RFUl9UVkRBQyk7Cj4gKwlyZXQgPSBkcm1fZW5jb2Rl
cl9pbml0KHByaXYtPmRybSwgJm1lc29uX2VuY29kZXJfY3Zicy0+ZW5jb2RlciwKPiArCQkJICAg
ICAgICZtZXNvbl9lbmNvZGVyX2N2YnNfZHJtX2VuY29kZXJfZnVuY3MsCj4gKwkJCSAgICAgICBE
Uk1fTU9ERV9FTkNPREVSX1RWREFDLCBOVUxMKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBh
IHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgdHlpbmcgdGhlIGVuY29kZXIgY2xlYW51cCBk
aXJlY3RseSB0bwpkcm1fZW5jb2Rlcl9jbGVhbnVwKCkgbGVhZCB0byBhIHVzZS1hZnRlci1mcmVl
IGR1cmluZyBkZXZpY2UgdW5iaW5kPwoKSWYgdGhlIGRyaXZlciBpcyB1bmJvdW5kIHdoaWxlIHVz
ZXJzcGFjZSBob2xkcyBhbiBvcGVuIERSTSBkZXZpY2UKcmVmZXJlbmNlLCB0aGUgcGxhdGZvcm0g
dW5iaW5kIHdpbGwgZHJvcCB0aGUgZGV2bSByZWZlcmVuY2UgdG8gdGhlCm1lc29uX2VuY29kZXJf
Y3ZicyBicmlkZ2UgY29udGFpbmVyLiBUaGUgYnJpZGdlIGlzIHRoZW4ga2VwdCBhbGl2ZQpvbmx5
IGJ5IHRoZSBhdHRhY2ggcmVmZXJlbmNlLgoKV2hlbiB1c2Vyc3BhY2UgZmluYWxseSBjbG9zZXMg
dGhlIGZpbGUgZGVzY3JpcHRvciwgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKQpjYWxscyB0aGUg
ZW5jb2RlcidzIGRlc3Ryb3kgaG9vaywgd2hpY2ggbWFwcyB0byBkcm1fZW5jb2Rlcl9jbGVhbnVw
KCkuCgpJbnNpZGUgZHJtX2VuY29kZXJfY2xlYW51cCgpLCBpdCBkcm9wcyB0aGUgZmluYWwgYnJp
ZGdlIHJlZmVyZW5jZToKCmRybV9lbmNvZGVyLmM6ZHJtX2VuY29kZXJfY2xlYW51cCgpIHsKICAg
IC4uLgogICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGJyaWRnZSwgbmV4dCwgJnRtcGxpc3Qs
IGNoYWluX25vZGUpCiAgICAgICAgZHJtX2JyaWRnZV9kZXRhY2goYnJpZGdlKTsKICAgIC4uLgoK
VGhpcyBmcmVlcyB0aGUgbWVzb25fZW5jb2Rlcl9jdmJzIGNvbnRhaW5lci4gSG93ZXZlciwgZHJt
X2VuY29kZXJfY2xlYW51cCgpCmNvbnRpbnVlcyB0byBhY2Nlc3MgdGhlIGVtYmVkZGVkIGVuY29k
ZXI6CgogICAgZHJtX21vZGVfb2JqZWN0X3VucmVnaXN0ZXIoZGV2LCAmZW5jb2Rlci0+YmFzZSk7
CiAgICBrZnJlZShlbmNvZGVyLT5uYW1lKTsKICAgIGxpc3RfZGVsKCZlbmNvZGVyLT5oZWFkKTsK
ICAgIC4uLgogICAgbWVtc2V0KGVuY29kZXIsIDAsIHNpemVvZigqZW5jb2RlcikpOwp9CgpDb3Vs
ZCB0aGlzIHNlcXVlbmNlIGNvcnJ1cHQgbWVtb3J5IHdoZW4gaXQgYWNjZXNzZXMgdGhlIGFscmVh
ZHkgZnJlZWQKZW5jb2RlciBzdHJ1Y3R1cmU/Cgo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShwcml2LT5kZXYsIHJldCwKPiAgCQkJCSAgICAgIkZhaWxlZCB0byBpbml0IENW
QlMgZW5jb2RlclxuIik7CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtv
LmRldi8jL3BhdGNoc2V0LzIwMjYwNTMxMDc0NjI3Ljg5MzYtMS1uYW1hbmFyb3JhMDI5QGdtYWls
LmNvbT9wYXJ0PTQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
