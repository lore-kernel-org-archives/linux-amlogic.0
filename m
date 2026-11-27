Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FED606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hAZq3Zkh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vlu0V2pV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZdwTjq49hJPOHvTfuIKDZUPh5KF3kjAGtZQiUaRfgKs=; b=hAZq3ZkhXE2x4bEuUs7G1UYa02
	jOkRklO7Kabptpeg12U5W7BQSmS5IKN4YWp4EHeG02ZnRqxcSKLVUiv/o7eQUmw8kS/n5QmA2kXX1
	hM4DaXMHn73aecCjbRM74lRJWvCjxi8r8bOn37371xSrNRVqATN/k02JVOg/1ahjBGxmEypEdjgzY
	irBhXzx5kKLy/0vYhu7WmO+lNXflyV97tfPNjtlE4WTdkVapf5gwOqpCWV8SW6VddSYZKEQVCPCSF
	oxlqUL5FYLmHTrrrULzJxhs7HNTee4XtnUZ3YflQHR5X7CFow11M58vEnFUtHLAFRcx1NEE05Ps+a
	KhI8zJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuN6-0000000FsKX-4Alg;
	Fri, 27 Nov 2026 11:44:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuN4-0000000FsK5-3kbT
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 11:44:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 476B3417D2;
	Fri, 27 Nov 2026 11:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020CC1F000C1;
	Fri, 27 Nov 2026 11:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779846;
	bh=ZiRXVKbqHY9z7QITbJQb8sIb9+R6zYt/KBKwKBM16yo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vlu0V2pVCwh6X3rAAIs1lJ/FRHYJCKok9oPf1a2MQPVjNNbEUEhNgMUTMAMVvx1Uv
	 2PAy6O8ZZBgBR5eaX+CxvfwvkyNajpLiDN1Sl2j4RBBaKQhLh972ZmuBAJQ7ba891S
	 9UCgTpJaNsAT1Jyj8T6fzHWpx+MvrKdHQ8iJSKYSzvp/RvF9D2NM2mgudJJdWfe+wC
	 tpMYTlwe3LSuYh9Or6UcuX566fP8mfyX6WvFrhF/7qMg9wTExz9dtDrCTsMF9osM2P
	 FskqPCA8hoP4lUOQpQmVu9peePgS83gxk25xgePnQ60yGqCGFKFkSmy8YGnH3zrWb1
	 zfrdFN+yasZzQ==
Message-ID: <sashiko-outbox-237266@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] pmdomain: amlogic: Tear down EE domains and their
 OF provider
To: "Tian Xuechen" <202300460064@mail.sdu.edu.cn>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261127113326.390398-2-202300460064@mail.sdu.edu.cn>
References: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
 <20261127113326.390398-2-202300460064@mail.sdu.edu.cn>
Date: Fri, 27 Nov 2026 11:44:05 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gcG1kb21haW46IGFtbG9n
aWM6IGNsb2NrIHByZXBhcmUvZW5hYmxlIGxlYWsgaW4KICBtZXNvbl9lZV9wd3JjX2luaXRfZG9t
YWluKCkKLS0KCmNvbW1pdCBlOThmZGRiZDAwZTlhODNiY2U1MDIwYzhhZDg1NmUyMmQ2NTI1Y2Nj
CkF1dGhvcjogVGlhbiBYdWVjaGVuIDwyMDIzMDA0NjAwNjRAbWFpbC5zZHUuZWR1LmNuPgoKcG1k
b21haW46IGFtbG9naWM6IFRlYXIgZG93biBFRSBkb21haW5zIGFuZCB0aGVpciBPRiBwcm92aWRl
cgoKVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgT0YgZ2VucGQgcHJvdmlkZXIgb24gZHJpdmVyIHVu
YmluZCBhbmQgcmVnaXN0ZXJzCmEgZGV2bSBjbGVhbnVwIGFjdGlvbiB0byByZW1vdmUgaW5pdGlh
bGl6ZWQgcG93ZXIgZG9tYWlucyBvbiBwcm9iZQpmYWlsdXJlIG9yIHVuYmluZC4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1lZS1wd3JjLmMgYi9kcml2ZXJz
L3BtZG9tYWluL2FtbG9naWMvbWVzb24tZWUtcHdyYy5jCj4gaW5kZXggMzM4ZjcwZDc3YmYwMy4u
ZjEwOGQ5MzM3ZTVlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BtZG9tYWluL2FtbG9naWMvbWVz
b24tZWUtcHdyYy5jCj4gKysrIGIvZHJpdmVycy9wbWRvbWFpbi9hbWxvZ2ljL21lc29uLWVlLXB3
cmMuYwo+IEBAIC00MjgsNiArNDI4LDE2IEBAIHN0YXRpYyBpbnQgbWVzb25fZWVfcHdyY19vbihz
dHJ1Y3QgZ2VuZXJpY19wbV9kb21haW4gKmRvbWFpbikKPiAgCQkJCSAgICAgICBwd3JjX2RvbWFp
bi0+Y2xrcyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIG1lc29uX2VlX3B3cmNfcmVtb3ZlX2Rv
bWFpbih2b2lkICpkYXRhKQo+ICt7Cj4gKwlwbV9nZW5wZF9yZW1vdmUoZGF0YSk7Cj4gK30KPiAr
Cj4gK3N0YXRpYyB2b2lkIG1lc29uX2VlX3B3cmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCj4gK3sKPiArCW9mX2dlbnBkX2RlbF9wcm92aWRlcihwZGV2LT5kZXYub2Zfbm9k
ZSk7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgbWVzb25fZWVfcHdyY19pbml0X2RvbWFpbihzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAJCQkJICAgICBzdHJ1Y3QgbWVzb25fZWVfcHdy
YyAqcHdyYywKPiAgCQkJCSAgICAgc3RydWN0IG1lc29uX2VlX3B3cmNfZG9tYWluICpkb20pCj4g
QEAgLTQ5NCw3ICs1MDQsOCBAQCBzdGF0aWMgaW50IG1lc29uX2VlX3B3cmNfaW5pdF9kb21haW4o
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgCQkJcmV0dXJuIHJldDsKPiAgCX0KPiAg
Cj4gLQlyZXR1cm4gMDsKPiArCXJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnBkZXYt
PmRldiwgbWVzb25fZWVfcHdyY19yZW1vdmVfZG9tYWluLAo+ICsJCQkJCSZkb20tPmJhc2UpOwo+
ICB9CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyB0aGlzIGxlYWsgdGhlIHByZXBhcmUgYW5kIGVu
YWJsZSByZWZlcmVuY2VzIG9uIGRvbS0+Y2xrcyB3aGVuIGFuCmFscmVhZHktcG93ZXJlZC1vbiBk
b21haW4gaXMgdG9ybiBkb3duIG9yIGZhaWxzIHRvIGluaXRpYWxpemU/CgpJbiBtZXNvbl9lZV9w
d3JjX2luaXRfZG9tYWluKCksIGEgZG9tYWluIHdpdGggY2xvY2tzIHRoYXQgaXMgYWxyZWFkeQpw
b3dlcmVkIG9uIGNhbGxzIGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKCkgYW5kIHNldHMgR0VOUERf
RkxBR19BTFdBWVNfT046Cgpkcml2ZXJzL3BtZG9tYWluL2FtbG9naWMvbWVzb24tZWUtcHdyYy5j
Om1lc29uX2VlX3B3cmNfaW5pdF9kb21haW4oKSB7CglpZiAoZG9tLT5udW1fY2xrcyAmJiBkb20t
PmRlc2MuaXNfcG93ZXJlZF9vZmYgJiYgIWRvbS0+ZGVzYy5pc19wb3dlcmVkX29mZihkb20pKSB7
CgkJcmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoZG9tLT5udW1fY2xrcywgZG9tLT5jbGtz
KTsKCQlpZiAocmV0KQoJCQlyZXR1cm4gcmV0OwoKCQlkb20tPmJhc2UuZmxhZ3MgPSBHRU5QRF9G
TEFHX0FMV0FZU19PTjsKCQlyZXQgPSBwbV9nZW5wZF9pbml0KCZkb20tPmJhc2UsIE5VTEwsIGZh
bHNlKTsKCQlpZiAocmV0KQoJCQlyZXR1cm4gcmV0OwoJfQp9CgpOZWl0aGVyIGEgZmFpbHVyZSBp
biBwbV9nZW5wZF9pbml0KCkgbm9yIG1lc29uX2VlX3B3cmNfcmVtb3ZlX2RvbWFpbigpCmNhbGxz
IGNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKCksIGFuZCBkZXZtX2Nsa19idWxrX2dldF9hbGwo
KSBvbmx5IHB1dHMKdGhlIGNsb2NrIGhhbmRsZXMgb24gcmVsZWFzZSwgbGVhdmluZyB0aGVpciBw
cmVwYXJlIGFuZCBlbmFibGUgY291bnRzCmVsZXZhdGVkIG9uIHByb2JlIGZhaWx1cmUgb3IgZHJp
dmVyIHVuYmluZC4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjExMjcxMTMzMjYuMzkwMzk4LTEtMjAyMzAwNDYwMDY0QG1haWwuc2R1
LmVkdS5jbj9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
