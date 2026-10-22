Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204B9606A31A
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oxd6hiHC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MpUVWD8T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L+zwSx8zEoDGWMi2zj8XVjeQ67P1Ux/S8SGOXLI1TzM=; b=Oxd6hiHCaEGUchuee+sy+dAmxq
	WNYEtfzTv9iny8hp49/G/noDAoN/sYyP1i0Ns+ZBhbY7LK+Jol/p9R7Z+0n+5Kuc2UZm4ShAYh8bH
	G+scoUglBUZKH2vm+rXLG/sZ3F+QESmu2sKIsmoufh3izvLeVO3JSlY9c5JzGfSYHt99FgedMHs5R
	bBFMQtWwqbT5ksF+3hvNjl2BUYoPtLGadRpjuLIJHkWJriJW4KfGiZeMn7kLoK99yYPyQvMdRN+Zf
	PiDiN4qOYKvOArIAB1l7B60c1naiCLuBkoeuVt6wio0Y3gf4ptQ/PQKWlC2jwvArhVw2P/GSHzwjJ
	bW+Z/32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsxD-0000000EDHP-3ZaB;
	Thu, 22 Oct 2026 13:35:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsxC-0000000EDH4-3yOs
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 13:35:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 24DEF60A6F;
	Thu, 22 Oct 2026 13:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1011F000C1;
	Thu, 22 Oct 2026 13:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676133;
	bh=8msTlnzVM9G6d7FDjt5gVAJzZzx4wSTr7tyRKNMn/As=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MpUVWD8TCtRQF6PSOlcjRgt46ubid+GXo6rs7JQfPTDNf7+cd99vWlXHplSOnwcL1
	 Tc9nOsltAFnuZfLQQBF/5FC8WjXT/6h04GLlEl2T3z6tknuR2mniSF0IMr0rUPu0XD
	 DM8RA8g2cP0jdbFTX7S5eMu1x4XnVMkuJA2lgjSe2DZSaZHwHJVKKVhMdBclGUrrz3
	 HPS9Fv0IzP2M15ccHBivPno6VeVbfTxicLA+lG7M2vJXdiKr7y14xiRCvE9TniViv4
	 N/dIuPnY5tvZWvtPsf0/BAOSccGdfB18CawjKHYQiNz1jHs6OyL5kH4p5GDMrar/r2
	 C4ad3lMclnNQg==
Message-ID: <sashiko-outbox-181549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] drm/bridge: pass down IRQ_HPD to the drivers
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:35:32 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHJtL29tYXA6IHVudXBk
YXRlZCBocGRfbm90aWZ5KCkgc2lnbmF0dXJlIGluIGhkbWk1X2JyaWRnZV9ocGRfbm90aWZ5KCkK
LS0KCmNvbW1pdCA5Y2Y1NWZmMGY5NmI0NDBiYTA1NjY1ZTNkYjllODJjNTM3MmZkNjQwCkF1dGhv
cjogRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPgoK
ZHJtL2JyaWRnZTogcGFzcyBkb3duIElSUV9IUEQgdG8gdGhlIGRyaXZlcnMKClRoaXMgY29tbWl0
IGFkZHMgYW4gZW51bSBkcm1fY29ubmVjdG9yX2RwX2V2ZW50IHBhcmFtZXRlciB0byB0aGUKZHJt
X2JyaWRnZV9mdW5jcy5ocGRfbm90aWZ5IGNhbGxiYWNrIGFuZCB1cGRhdGVzIGl0cyBjYWxsZXJz
IGFuZCBicmlkZ2UKaW1wbGVtZW50YXRpb25zIHNvIERpc3BsYXlQb3J0IGJyaWRnZXMgY2FuIGhh
bmRsZSBJUlFfSFBEIGV2ZW50cy4KClsgLi4uIF0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hk
bWk0LmMKPiBpbmRleCBiZDZjNGQyZGNkYzg2Li43Mjk3MmE2ZmU5ODliIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL29tYXBkcm0vZHNzL2hkbWk0LmMKPiBAQCAtNDI5LDcgKzQyOSw4IEBAIHN0YXRpYyB2b2lk
IGhkbWk0X2JyaWRnZV9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4gIAo+ICBz
dGF0aWMgdm9pZCBoZG1pNF9icmlkZ2VfaHBkX25vdGlmeShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlLAo+ICAJCQkJICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4gLQkJCQkg
ICAgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXMpCj4gKwkJCQkgICAgZW51bSBkcm1f
Y29ubmVjdG9yX3N0YXR1cyBzdGF0dXMsCj4gKwkJCQkgICAgZW51bSBkcm1fY29ubmVjdG9yX2Rw
X2V2ZW50IGV2ZW50KQo+ICB7Cj4gIAlzdHJ1Y3Qgb21hcF9oZG1pICpoZG1pID0gZHJtX2JyaWRn
ZV90b19oZG1pKGJyaWRnZSk7Cj4gIAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYnJp
ZGdlLmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBpbmRleCAxOTgxZDI0YTcwMGQyLi42
MzgyZWY1ZjFlYTI4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ICsr
KyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+IEBAIC01MDksNyArNTA5LDggQEAgc3RydWN0
IGRybV9icmlkZ2VfZnVuY3Mgewo+ICAJICovCj4gIAl2b2lkICgqaHBkX25vdGlmeSkoc3RydWN0
IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkJICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwKPiAtCQkJICAgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXMpOwo+ICsJCQkg
ICBlbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIHN0YXR1cywKPiArCQkJICAgZW51bSBkcm1fY29u
bmVjdG9yX2RwX2V2ZW50IGV2ZW50KTsKPiAgCj4gIAkvKioKPiAgCSAqIEBocGRfZW5hYmxlOgoK
W1NldmVyaXR5OiBMb3ddCldoaWxlIGhkbWk0X2JyaWRnZV9ocGRfbm90aWZ5KCkgaW4gZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0LmMgaXMKdXBkYXRlZCBoZXJlLCBpdCBsb29rcyBs
aWtlIGhkbWk1X2JyaWRnZV9ocGRfbm90aWZ5KCkgaW4KZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2hkbWk1LmMgc3RpbGwgaGFzIHRoZSBvbGQgMy1hcmd1bWVudCBzaWduYXR1cmU6CgpzdGF0
aWMgdm9pZCBoZG1pNV9icmlkZ2VfaHBkX25vdGlmeShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdl
LAoJCQkJICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCgkJCQkgICAgZW51bSBk
cm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXMpCnsKCXN0cnVjdCBvbWFwX2hkbWkgKmhkbWkgPSBk
cm1fYnJpZGdlX3RvX2hkbWkoYnJpZGdlKTsKCgloZG1pX2F1ZGlvX2hwZF9ub3RpZnkoaGRtaSwg
c3RhdHVzKTsKfQouLi4Kc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIGhkbWk1
X2JyaWRnZV9mdW5jcyA9IHsKCS4uLgoJLmhwZF9ub3RpZnkgPSBoZG1pNV9icmlkZ2VfaHBkX25v
dGlmeSwKCS5lZGlkX3JlYWQgPSBoZG1pNV9icmlkZ2VfZWRpZF9yZWFkLAp9OwoKU2hvdWxkIGhk
bWk1X2JyaWRnZV9ocGRfbm90aWZ5KCkgYWxzbyBiZSB1cGRhdGVkIHRvIGFjY2VwdCBlbnVtCmRy
bV9jb25uZWN0b3JfZHBfZXZlbnQgZXZlbnQgc28gdGhhdCBidWlsZHMgd2l0aCBDT05GSUdfT01B
UDVfRFNTX0hETUkKZW5hYmxlZCBkbyBub3QgZmFpbCB3aXRoIGFuIGluY29tcGF0aWJsZSBmdW5j
dGlvbiBwb2ludGVyIHR5cGUgZXJyb3I/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDIyLWhwZC1pcnEtZXZlbnRzLXY2LTAtMzM3
ZWEzZGRhYTYyQG9zcy5xdWFsY29tbS5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
