Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBC660A2610
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dhz22/OY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4rDRI/f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A+pBci3DSogqF/iZJqz+7MoinDj++GgNDnpgE7XfDT8=; b=dhz22/OYnjEM9hlBVTqr32NWXN
	gbVvhzRWsZIjD9OV9z4VMg1o4VYbMQgow68IYnIMP9p2S5RTrm811o6cGv09b1YeZojSG5ENEYIVa
	+n+U5UnV0tTpdp9lPBdlQtT6lqQZLr7Ivq/K7eTqs0jfkEu/yYL+izn7wXgLeenk+J7y+w6rH+GT4
	5h0tF11IBDL5TGKA0bb/eWLvQ9jhkXgNp6kam1gOt6kLFB+JRCXfTFaPrPX5OdsXCI+3oGBMohKj3
	MiQMkdrl07h6TKX0yUl8TI4KN6sra9jKQl+MA/MrI8wvA+Utr1LLS2gl520I3HGXeluhXDmCDlY8+
	zfHJySeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ff-00000006Bv3-23Zu;
	Wed, 11 Nov 2026 09:31:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4ff-00000006Bum-0XET
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 09:31:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AA216182C;
	Wed, 11 Nov 2026 09:31:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D151F00A06;
	Wed, 11 Nov 2026 09:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389470;
	bh=3AgO7XPSpjRTP9NmHs0yfYc5+nB1Tmy9MJPmu3vfD8M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4rDRI/fWWqVwCThg4/xbD1N7/ofsy+Jf2Z604cMa+tbYZkENSHZ24i4fub8aunpc
	 mqatzY/Vjd+lU0CJ4eL/Y5T83+brkpmgSn/d+vAgrijOsInv+GJPhIPMJwav9HfXZB
	 0rryxXZrXeRzvTGMNWqPN6AKCziC9xNR3CB9f7cGGrZ/gzFHNr7ovoRp0jD7a1h1G4
	 eYnRclNVxqj6srytHtzqIuh553xgDDBCJA9/CVRqLDdeLHXR3QwHspKrGfPkJRTJg9
	 6pwypKx6xRInq1BLRN4qkxLm1I3S2xUsEHuBdlAwy65qBoaLfrjSHpTSGRSydlbkUG
	 5sIGRaxgWHJKg==
Message-ID: <sashiko-outbox-208700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/meson: fix NULL pointer dereference in
 meson_drv_bind_master()
To: "Rand Deeb" <rand.sec96@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261111091657.598-1-rand.sec96@gmail.com>
References: <20261111091657.598-1-rand.sec96@gmail.com>
Date: Wed, 11 Nov 2026 09:31:09 +0000
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIGRybS9tZXNv
bjogbWlzc2luZyBkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoKSBvbiBlcnJvciBpbgogIG1lc29u
X2Rydl9iaW5kX21hc3RlcigpIFsxXQotLQoKY29tbWl0IDc5YTZhMTkyNDNmMzIxZTBjMThhMDRl
YTgyZTRhZWZjZGNhY2RkZjQKQXV0aG9yOiBSYW5kIERlZWIgPHJhbmQuc2VjOTZAZ21haWwuY29t
PgoKZHJtL21lc29uOiBmaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIG1lc29uX2Rydl9i
aW5kX21hc3RlcigpCgpUaGlzIGNvbW1pdCBhdm9pZHMganVtcGluZyB0byBmcmVlX2RybSB3aGVu
IGFsbG9jYXRpbmcgcHJpdiBmYWlscyBpbgptZXNvbl9kcnZfYmluZF9tYXN0ZXIoKSwgZGlyZWN0
bHkgcHV0dGluZyB0aGUgZHJtIGRldmljZSBhbmQgcmV0dXJuaW5nIC1FTk9NRU0Kc28gZW5jb2Rl
ciByZW1vdmFsIGhlbHBlcnMgYXJlIG5vdCBjYWxsZWQgd2l0aCBhIE5VTEwgcHJpdi4KCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl9kcnYuYwo+IGluZGV4IDM4YmYyODExZDA2OGQuLmE5YjcwNzA2MmI0
ZjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCj4gQEAgLTIwNCw4ICsyMDQsOCBA
QCBzdGF0aWMgaW50IG1lc29uX2Rydl9iaW5kX21hc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIGJv
b2wgaGFzX2NvbXBvbmVudHMpCj4gIAo+ICAJcHJpdiA9IGRldm1fa3phbGxvY19vYmooZGV2LCAq
cHJpdik7Cj4gIAlpZiAoIXByaXYpIHsKPiAtCQlyZXQgPSAtRU5PTUVNOwo+IC0JCWdvdG8gZnJl
ZV9kcm07Cj4gKwkJZHJtX2Rldl9wdXQoZHJtKTsKPiArCQlyZXR1cm4gLUVOT01FTTsKPiAgCX0K
PiAgCWRybS0+ZGV2X3ByaXZhdGUgPSBwcml2Owo+ICAJcHJpdi0+ZHJtID0gZHJtOwoKW1NldmVy
aXR5OiBDcml0aWNhbF0KVGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0
Y2gsIGJ1dCBjYW4gYSBmYWlsdXJlIGluCmRybV9kZXZfcmVnaXN0ZXIoKSBjYXVzZSBhIHVzZS1h
ZnRlci1mcmVlIG9uCmRybS0+bW9kZV9jb25maWcub3V0cHV0X3BvbGxfd29yayBbMV0/Cgpkcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmM6bWVzb25fZHJ2X2JpbmRfbWFzdGVyKCkgewog
ICAgLi4uCglkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKCglwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBwcml2KTsKCglyZXQgPSBkcm1fZGV2X3JlZ2lzdGVyKGRybSwgMCk7CglpZiAo
cmV0KQoJCWdvdG8gdW5pbnN0YWxsX2lycTsKICAgIC4uLgp1bmluc3RhbGxfaXJxOgoJZnJlZV9p
cnEocHJpdi0+dnN5bmNfaXJxLCBkcm0pOwp9CgpXaGVuIGRybV9kZXZfcmVnaXN0ZXIoKSBmYWls
cywganVtcGluZyB0byB1bmluc3RhbGxfaXJxIHJlYWNoZXMKZHJtX2Rldl9wdXQoKSB3aXRob3V0
IGNhbGxpbmcgZHJtX2ttc19oZWxwZXJfcG9sbF9maW5pKCksIGxlYXZpbmcKb3V0cHV0X3BvbGxf
d29yayBhY3RpdmUgYWZ0ZXIgdGhlIGRybV9kZXZpY2UgaXMgZnJlZWQuCgpbMV0gaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL2J1Zy9saW51eC1lMWM2OTM1My1kYWNlLTQ3NmQtYmVmMi00YWIxYzIwNTIx
NWMKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hz
ZXQvMjAyNjExMTEwOTE2NTcuNTk4LTEtcmFuZC5zZWM5NkBnbWFpbC5jb20/cGFydD0xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
