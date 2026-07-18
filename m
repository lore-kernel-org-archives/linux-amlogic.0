Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ABBC44521
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2026 23:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpf1R9xSm4iEPjnRQw3keeZpgIG381SaMn5JbQsw5S8=; b=AcZeOimwefWOop
	THhXSFTbz4+KSDt/iw/OR266ZdD/VpDCtRgLA5pSiJqOQVZO7ST1eKn9uKwCPCDAjfPKw1Se9o4Uv
	NgxkxmK7Zh0P5jUblbmeA4ynaWF/AzwZAE/e0lcB6ib7Y6dWuXjNJQhUHqANyI3u970ehn0NQsl6J
	B+2xIHUvFVoQpR5NH5UL0ARQ4/J6gG85jPcPixFlffMcGL//lR4ALW4NT9LK9x6AKTLdVPzJ9N45E
	Wx5UlQpbJ5+ZyM3mMZ+qREsWRAg8jeb7Yv64UlElVSF2PlhVKfi/1jg4vWZDfV5MCyWLM8RYk/Jf+
	HOhlVsVuBUCs6rjcl1ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEqJ-00000004dFy-2Uml;
	Sat, 18 Jul 2026 23:53:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlEqI-00000004dFp-2jqw
	for linux-amlogic@lists.infradead.org;
	Sat, 18 Jul 2026 23:53:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C192C40D7B;
	Sat, 18 Jul 2026 23:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C31F1F000E9;
	Sat, 18 Jul 2026 23:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784418793;
	bh=RRB0k3IsUMHH6EVNPRN7+g/nJgeU96S9NUOTSJiwryU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SqjJU6OMQ41W0h0XmXYOFpLumZsplwHLdfAuJOQ4DRWVse5JlwS6EtZhnmd3RmpHI
	 5AXMrmfdopkkqD193v5uIy7EQNpuauOM+tmFohwzecMK1S7deAIuvg+zjYgdWKYnLo
	 p1+68MUcVdkyZ4PK2R0PGbp5DblGLuWT+UelWnVDbwn+UYWv4MSqP9tnltgEvv4EON
	 stGK5dOXpjDARDxejikaFgQplFiG/n5zPNJX/tQnThbbYX54yaiqp5XXgcQPjuTrka
	 q+UoqPfHIweYLuCur7cj9RbGylmDDZ5do9/tdMXn7ajlq784UlonVR8iCWOIcB1psd
	 JROTRZAKtVuSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/15] drm/meson: remove dependency on DRM simple
 helpers
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260719-drm_simple_encoder_init-v1-13-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-13-a78c509e3062@gmail.com>
Date: Sat, 18 Jul 2026 23:53:13 +0000
Message-Id: <20260718235313.5C31F1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBEZXZtIGxpZmVjeWNsZSBtaXNtYXRjaCB3aXRoIERSTSBkZXZpY2UgbGVhZHMgdG8g
YSBVc2UtQWZ0ZXItRnJlZSBvZiB0aGUgZW5jb2RlciBzdHJ1Y3R1cmUgaWYgdXNlcnNwYWNlIGhv
bGRzIHRoZSBEUk0gZmlsZSBkZXNjcmlwdG9yIG9wZW4gYWZ0ZXIgdGhlIGRldmljZSB1bmJpbmRz
LgotLQoKLS0tIFBhdGNoIFsxM106IFtQQVRDSCAxMy8xNV0gZHJtL21lc29uOiByZW1vdmUgZGVw
ZW5kZW5jeSBvbiBEUk0gc2ltcGxlIGhlbHBlcnMgLS0tCmNvbW1pdCAyYjU5NmVlZmQ1MDZjM2Uy
NTZlODBhNTNiZjg0Yjk1ZWRmYTk4MjRhCkF1dGhvcjogRGlvZ28gU2lsdmEgPGRpb2dvbXBhaXNz
aWx2YUBnbWFpbC5jb20+Cgpkcm0vbWVzb246IHJlbW92ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1w
bGUgaGVscGVycwoKVGhlIHNpbXBsZSBLTVMgaGVscGVycyBhcmUgZGVwcmVjYXRlZCBiZWNhdXNl
IHRoZXkgb25seSBhZGQgYW4gaW50ZXJtZWRpYXRlCmxheWVyIGJldHdlZW4gZHJpdmVycyBhbmQg
YXRvbWljIG1vZGVzZXR0aW5nLiBPcGVuLWNvZGUKZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBi
eSBjYWxsaW5nIGRybV9lbmNvZGVyX2luaXQoKSBkaXJlY3RseSBhbmQKcHJvdmlkaW5nIGRyaXZl
ci1sb2NhbCBkcm1fZW5jb2Rlcl9mdW5jcy4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl9lbmNvZGVyX2N2YnMuYwo+IGluZGV4IDIyY2FjYjE2NjBjNGYuLmNkYjg0ZDIyODNmODMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfY3Zicy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfY3Zicy5jClsgLi4uIF0K
PiBAQCAtMjU3LDggKzI2MSw5IEBAIGludCBtZXNvbl9lbmNvZGVyX2N2YnNfcHJvYmUoc3RydWN0
IG1lc29uX2RybSAqcHJpdikKPiAgCW1lc29uX2VuY29kZXJfY3Zicy0+cHJpdiA9IHByaXY7Cj4g
IAo+ICAJLyogRW5jb2RlciAqLwo+IC0JcmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQocHJp
di0+ZHJtLCAmbWVzb25fZW5jb2Rlcl9jdmJzLT5lbmNvZGVyLAo+IC0JCQkJICAgICAgRFJNX01P
REVfRU5DT0RFUl9UVkRBQyk7Cj4gKwlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KHByaXYtPmRybSwg
Jm1lc29uX2VuY29kZXJfY3Zicy0+ZW5jb2RlciwKPiArCQkJICAgICAgICZtZXNvbl9lbmNvZGVy
X2N2YnNfZnVuY3MsCj4gKwkJCSAgICAgICBEUk1fTU9ERV9FTkNPREVSX1RWREFDLCBOVUxMKTsK
CltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMg
dGhpcyBjcmVhdGUgYSB1c2UtYWZ0ZXItZnJlZSByaXNrCmR1cmluZyBkZXZpY2UgdW5iaW5kPwoK
SW4gbWVzb25fZW5jb2Rlcl9jdmJzX3Byb2JlKCksIHRoZSBlbmNvZGVyIGlzIGVtYmVkZGVkIHdp
dGhpbgptZXNvbl9lbmNvZGVyX2N2YnMsIHdoaWNoIGlzIGFsbG9jYXRlZCB2aWEgZGV2bV9kcm1f
YnJpZGdlX2FsbG9jKCkgYW5kIHRpZWQKdG8gdGhlIGRldmljZSBsaWZldGltZS4gSG93ZXZlciwg
YnkgdXNpbmcgZHJtX2VuY29kZXJfaW5pdCgpLCB0aGUgZW5jb2RlcgppcyByZWdpc3RlcmVkIHdp
dGggdGhlIERSTSBkZXZpY2UncyBsaWZlY3ljbGUuCgpJZiBhIGRyaXZlciB1bmJpbmQgb2NjdXJz
IChlLmcuLCB2aWEgc3lzZnMpIHdoaWxlIHVzZXJzcGFjZSBob2xkcyBhbiBvcGVuCkRSTSBmaWxl
IGRlc2NyaXB0b3IsIGRldnJlcyB3aWxsIGV4ZWN1dGUgYW5kIGZyZWUgdGhlIGJyaWRnZSBtZW1v
cnkgYWxvbmcKd2l0aCB0aGUgZW1iZWRkZWQgZW5jb2Rlci4gTGF0ZXIsIHdoZW4gdGhlIGZpbGUg
ZGVzY3JpcHRvciBpcyBjbG9zZWQsCmRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKCkgaXRlcmF0ZXMg
b3ZlciB0aGUgZW5jb2Rlcl9saXN0IGFuZCBhdHRlbXB0cyB0bwpjYWxsIHRoZSBlbmNvZGVyJ3Mg
ZGVzdHJveSBmdW5jdGlvbiBvbiB0aGUgYWxyZWFkeSBmcmVlZCBtZW1vcnkuCgpDb3VsZCB3ZSB1
c2UgZHJtbV9lbmNvZGVyX2luaXQoKSBpbnN0ZWFkIHRvIHNhZmVseSB0aWUgdGhlIGVuY29kZXIn
cwpsaWZldGltZSB0byB0aGUgRFJNIGRldmljZT8KClRoaXMgc2FtZSBkZXZtIHZzIERSTSBsaWZl
Y3ljbGUgbWlzbWF0Y2ggaXMgYWxzbyBwcmVzZW50IGluCm1lc29uX2VuY29kZXJfZHNpX3Byb2Jl
KCkgaW4gZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29kZXJfZHNpLmMgYW5kCm1lc29u
X2VuY29kZXJfaGRtaV9wcm9iZSgpIGluIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNv
ZGVyX2hkbWkuYy4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA3MTktZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQtdjEtMC1hNzhjNTA5
ZTMwNjJAZ21haWwuY29tP3BhcnQ9MTMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
