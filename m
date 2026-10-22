Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B3B606A31A
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szbZOYse;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ilKJeme/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=joNhDuQBe2UuP2mbGI+TNAtW1vG+fquQy9iUDy6uko8=; b=szbZOYseTyl942MrarLVgcIygD
	Jat1hMYfh2DDXyDFvmzveDjo3j9fiPkKdfr8HH/WIeGZWvRk09c9Lxu+DxlHTvya8GG6DFywdkGaj
	svMz/LgsE35EEqJhgB9Lbi3TUweEsMB2uTyf64LGlNKkPJh/8gWikJ2yjalicDK947pkANUA++blz
	Wzk6G1KPw0/mqpN3QUoyZCBlwxTZHRdEBSA+zKTW7lomuE1FgDSWYYVq6UObEklBDiG2tSk1YgPwk
	78Abh73YEbkpH5vBBpd2GyrZdcJ0DFt6sXfRe9vNb3dvuT4o1EggDHEZHv82d1RdE7H0Xoo7agZKY
	hHw5OBMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJt0K-0000000EDml-2mt9;
	Thu, 22 Oct 2026 13:38:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJt0I-0000000EDmB-1ENh
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 13:38:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B58CE417F7;
	Thu, 22 Oct 2026 13:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 535AE1F000C1;
	Thu, 22 Oct 2026 13:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792676325;
	bh=ULYZ/55QiRddvfDhSSFtUGP38N9/fKV9BspCQGFIXXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilKJeme/HkOCKSlSoyh0+0sFTsIhd0temS8j1xbMB9yw9gFqB4SKz27idnxkALOWj
	 Y6W9a4l1Qz//YiB4jKEiK5Rb97nxmRu7G6DR/b0EA5C3TN/p9PjALEPAfnreVP0vyf
	 DnzR3ubExHV8met34jnepcdCRVJCM1TuX2G1hgS0ShBd8JMEsHiEbEg/uH19f21+Eq
	 QDiC8b4s+EPMsCIrq1tXzD1FfuwHefifCDPtg8ZAy3MSPAX5SloC3r9AQc/RlhaZsm
	 erm2j/FwJtSQyWWKeGNLxazVt4hpSj0FVNufGG8u8R4S1mMzZB/LKwUIiN3OxlP4M5
	 1+NFtnLXCc9sg==
Message-ID: <sashiko-outbox-181556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] drm/bridge: pass extra events to the HPD
 callback
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261022-hpd-irq-events-v6-4-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-4-337ea3ddaa62@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 13:38:44 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHJtL2JyaWRnZTogbWlz
cGxhY2VkIGhkbWk1X2JyaWRnZV9ocGRfbm90aWZ5KCkgaHVuayBicmVha3MgYmlzZWN0YWJpbGl0
eQotLQoKY29tbWl0IGM2Y2QwZTZlOWYzZWZkODhmNDBhYmEzMGRjNzQ2M2UwNzIzNTFjNTMKQXV0
aG9yOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+
Cgpkcm0vYnJpZGdlOiBwYXNzIGV4dHJhIGV2ZW50cyB0byB0aGUgSFBEIGNhbGxiYWNrCgpUaGlz
IGNvbW1pdCBhZGRzIGRybV9icmlkZ2VfaHBkX25vdGlmeV9leHRyYSgpIGFuZCB1cGRhdGVzIHRo
ZSBIUEQgY2FsbGJhY2sKc2lnbmF0dXJlIHJlZ2lzdGVyZWQgdmlhIGRybV9icmlkZ2VfaHBkX2Vu
YWJsZSgpIHRvIHBhc3MgZXh0cmEgc2luayBldmVudHMKc3VjaCBhcyBEaXNwbGF5UG9ydCBJUlFf
SFBEIHRvIHVuZGVybHlpbmcgZHJpdmVycy4KClsgLi4uIF0KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0v
ZHNzL2hkbWk1LmMKPiBpbmRleCBjNTQyYmE2Y2U3ZDMyLi5hMjFmOTM1NTU5NGNjIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk1LmMKPiBAQCAtNDI3LDcgKzQyNyw4IEBAIHN0YXRp
YyB2b2lkIGhkbWk1X2JyaWRnZV9kaXNhYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCj4g
IAo+ICBzdGF0aWMgdm9pZCBoZG1pNV9icmlkZ2VfaHBkX25vdGlmeShzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLAo+ICAJCQkJICAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4g
LQkJCQkgICAgZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXMpCj4gKwkJCQkgICAgZW51
bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBzdGF0dXMsCj4gKwkJCQkgICAgZW51bSBkcm1fY29ubmVj
dG9yX2RwX2V2ZW50IGV2ZW50KQo+ICB7Cj4gIAlzdHJ1Y3Qgb21hcF9oZG1pICpoZG1pID0gZHJt
X2JyaWRnZV90b19oZG1pKGJyaWRnZSk7Cj4gIAoKW1NldmVyaXR5OiBMb3ddCkluIGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL2Rzcy9oZG1pNS5jLCBoZG1pNV9icmlkZ2VfaHBkX25vdGlmeSgpIGlz
IGFzc2lnbmVkCnRvIHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzLmhwZF9ub3RpZnkgcmF0aGVyIHRo
YW4gcmVnaXN0ZXJlZCB2aWEKZHJtX2JyaWRnZV9ocGRfZW5hYmxlKCk6CgpzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9icmlkZ2VfZnVuY3MgaGRtaTVfYnJpZGdlX2Z1bmNzID0gewoJLi4uCgkuaHBk
X25vdGlmeSA9IGhkbWk1X2JyaWRnZV9ocGRfbm90aWZ5LAoJLmVkaWRfcmVhZCA9IGhkbWk1X2Jy
aWRnZV9lZGlkX3JlYWQsCn07CgpUaGUgaHBkX25vdGlmeSBjYWxsYmFjayBzaWduYXR1cmUgaW4g
c3RydWN0IGRybV9icmlkZ2VfZnVuY3MgKGluCmluY2x1ZGUvZHJtL2RybV9icmlkZ2UuaCkgYW5k
IHRoZSBvdGhlciBpbi10cmVlIGltcGxlbWVudGF0aW9ucyAoaW5jbHVkaW5nCmhkbWk0X2JyaWRn
ZV9ocGRfbm90aWZ5KCkgaW4gZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0LmMpIHdl
cmUKdXBkYXRlZCBpbiBwYXJlbnQgY29tbWl0IDljZjU1ZmYwZjk2YiAoImRybS9icmlkZ2U6IHBh
c3MgZG93biBJUlFfSFBEIHRvIHRoZQpkcml2ZXJzIikuCgpCZWNhdXNlIHRoZSBoZG1pNV9icmlk
Z2VfaHBkX25vdGlmeSgpIHVwZGF0ZSBsYW5kZWQgaW4gdGhpcyBwYXRjaCBpbnN0ZWFkLApidWls
ZGluZyB0aGUga2VybmVsIGF0IGNvbW1pdCA5Y2Y1NWZmMGY5NmIgd2l0aCBDT05GSUdfRFJNX09N
QVAgYW5kCkNPTkZJR19PTUFQNV9EU1NfSERNSSBlbmFibGVkIGZhaWxzIHdpdGggYW4gaW5jb21w
YXRpYmxlIGZ1bmN0aW9uIHBvaW50ZXIgdHlwZQplcnJvciB3aGVuIGluaXRpYWxpemluZyBoZG1p
NV9icmlkZ2VfZnVuY3MuaHBkX25vdGlmeS4KClNob3VsZCB0aGlzIGh1bmsgYmUgbW92ZWQgaW50
byBjb21taXQgOWNmNTVmZjBmOTZiICgiZHJtL2JyaWRnZTogcGFzcyBkb3duCklSUV9IUEQgdG8g
dGhlIGRyaXZlcnMiKSB0byBwcmVzZXJ2ZSBiaXNlY3RhYmlsaXR5PwoKWyAuLi4gXQoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAy
Mi1ocGQtaXJxLWV2ZW50cy12Ni0wLTMzN2VhM2RkYWE2MkBvc3MucXVhbGNvbW0uY29tP3BhcnQ9
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
