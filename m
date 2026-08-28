Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792B5C61DBD
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2026 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4E5qKqXXS1j09U1UZWz4SmGNe1ll4jGSQcUao1suN4=; b=ykVhH/+rxXevY4
	MvbmoneH2E5mywFbeyr6qm1YbYZ2apkl29kgBuqdSg0Lgas++5E08JIEqNxeT6CsCRRb+kcg7kDDw
	2Mw7p1PvdP/Zgsprs9HEz2D7zgWEtCffSogYgYZSIsaUAh1Gz1tDwpOgPLSMl5A7+rfPzkLpOiEIQ
	ZxIJ/7MSPeq2ZHBhk4B/qKoUJ+Z8lxi1DpZOLmQNx0d+zf1jHPNeVSK6mAEQeTIu+TbTVuVfm6DH3
	NlRkqkXwdIvK0pyAE4Jxhr2jfyanPXfFoneQZDwFVplD3aXpRlYxkcvf0qXQkKKOnS3IBullyDBqR
	6YowVFaTkoGFpZC/qSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsq4-00000005TGa-0Uww;
	Fri, 28 Aug 2026 09:25:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsq1-00000005TGL-1Eos
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Aug 2026 09:25:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D5AAD43796;
	Fri, 28 Aug 2026 09:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7720A1F000E9;
	Fri, 28 Aug 2026 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787909128;
	bh=c2kvSh2/ELWEywx8INAdI2eJCL/7HoLQC3vS4clKbWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RlQf1rLJ7iXC+ka+iY74uY81662HIYeAvymaCiTic9hE2E6gjxTfJK5rTbfrDaZMR
	 eavnktkiT20cTzhKFbq0nLiU2rAKN6Nu/rWHm944u3sfTJoNLMPn8IpXNwF+dd2R/J
	 s1GKnSMQtVqghjSsNott2WRtyWn6rFH2g4Zz/Xnby4D/UQfEJell4heHOGhs63zMWa
	 nChmBgTvAZ7R4dq+GE2fM1GQZwwmDyVmxk8lp1+lDpSl+xxs0Jpk5VUmKF/jRS5UGX
	 5dLeQKcr8G3VU2bG5rexMWsUXvOgcldBDGKD/YHd5lObAQvo0gCMhM79FyaT6gTS8t
	 ukH+Ld19XysHw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] drm/meson: dw-hdmi: Propagate reset failures during
 initialization
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260828091424.6375-1-pengpeng@iscas.ac.cn>
References: <20260828091424.6375-1-pengpeng@iscas.ac.cn>
Date: Fri, 28 Aug 2026 09:25:28 +0000
Message-Id: <20260828092528.7720A1F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBUaGUgc2hhcmVkIElSUSBoYW5kbGVyIGlzIHJlZ2lzdGVyZWQgYmVmb3JlIHRoZSBo
YXJkd2FyZSBpcyBmdWxseSBpbml0aWFsaXplZCwgcmlza2luZyBhIE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBpZiBpbml0aWFsaXphdGlvbiBmYWlscy4KLSBbSGlnaF0gQ29tcG9uZW50IGJpbmQg
ZXJyb3IgcGF0aHMgcGVybWFuZW50bHkgbGVhayBgZGV2bV9gIGFsbG9jYXRlZCByZXNvdXJjZXMu
Ci0tCgpjb21taXQgZjc0YmYwMWQzZGVkOGIxODIyZjIyNzhiNDlkNWYwMDBlMGQ3MmE2YgpBdXRo
b3I6IFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdAaXNjYXMuYWMuY24+Cgpkcm0vbWVzb246IGR3LWhk
bWk6IFByb3BhZ2F0ZSByZXNldCBmYWlsdXJlcyBkdXJpbmcgaW5pdGlhbGl6YXRpb24KClRoaXMg
Y29tbWl0IHVwZGF0ZXMgbWVzb25fZHdfaGRtaV9pbml0KCkgdG8gcHJvcGFnYXRlIHJlc2V0IGVy
cm9ycyBpbnN0ZWFkCm9mIGlnbm9yaW5nIHRoZW0uIEl0IGFsc28gdXBkYXRlcyB0aGUgYmluZCBh
bmQgcmVzdW1lIHBhdGhzIHRvIGFib3J0IGlmCmluaXRpYWxpemF0aW9uIGZhaWxzLgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHdfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3
X2hkbWkuYwoKWyAuLi4gXQoKPiBAQCAtNzU0LDcgKzc2NCw5IEBAIHN0YXRpYyBpbnQgbWVzb25f
ZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+
ICAJCXJldHVybiByZXQ7Cj4gIAl9Cj4gIAo+IC0JbWVzb25fZHdfaGRtaV9pbml0KG1lc29uX2R3
X2hkbWkpOwo+ICsJcmV0ID0gbWVzb25fZHdfaGRtaV9pbml0KG1lc29uX2R3X2hkbWkpOwo+ICsJ
aWYgKHJldCkKPiArCQlyZXR1cm4gcmV0OwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJl
LWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIG5ldyBlcnJvciBwYXRoIGV4cG9zZSB1cyB0
byBhCk5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBmcm9tIHRoZSBzaGFyZWQgSVJRPwoKRWFybGll
ciBpbiBtZXNvbl9kd19oZG1pX2JpbmQoKSwgYSBzaGFyZWQgSVJRIGlzIHJlcXVlc3RlZCB1c2lu
ZyBhIGRldm1fCmZ1bmN0aW9uOgoKCXJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2
LCBpcnEsIGR3X2hkbWlfdG9wX2lycSwKCQkJCQlkd19oZG1pX3RvcF90aHJlYWRfaXJxLCBJUlFG
X1NIQVJFRCwKCQkJCQkiZHdfaGRtaV90b3BfaXJxIiwgbWVzb25fZHdfaGRtaSk7CgpJZiBtZXNv
bl9kd19oZG1pX2luaXQoKSBmYWlscyBhbmQgcmV0dXJucyBlYXJseSBoZXJlLCB0aGUgSVJRIHJl
bWFpbnMgYWN0aXZlCmJlY2F1c2UgaXRzIGxpZmV0aW1lIGlzIHRpZWQgdG8gdGhlIHBsYXRmb3Jt
IGRldmljZSwgbm90IHRoZSBiaW5kIGxpZmVjeWNsZS4KSWYgdGhlIHNoYXJlZCBJUlEgZmlyZXMs
IGR3X2hkbWlfdG9wX3RocmVhZF9pcnEoKSB1bmNvbmRpdGlvbmFsbHkgCmRlcmVmZXJlbmNlcyBk
d19oZG1pLT5oZG1pIGFuZCBkd19oZG1pLT5icmlkZ2UsIHdoaWNoIHdpbGwgYmUgTlVMTCBzaW5j
ZQpkd19oZG1pX3Byb2JlKCkgd2FzIHNraXBwZWQuCgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNu
J3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgZG9lcyByZXR1cm5pbmcgZWFy
bHkgaGVyZQphbHNvIGNhdXNlIHVuYm91bmRlZCByZXNvdXJjZSBsZWFrcz8KCkJlY2F1c2UgbWVz
b25fZHdfaGRtaV9iaW5kKCkgaXMgYSBjb21wb25lbnQgYmluZCBmdW5jdGlvbiwgaXQgcnVucwpy
ZXBlYXRlZGx5IG9uIGRlZmVycmVkIHByb2JlIG9yIHVuYmluZC9iaW5kIGN5Y2xlcy4gSXQgYWxs
b2NhdGVzIHJlc291cmNlcwp1c2luZyBkZXZtXyBhbGxvY2F0aW9uIGZ1bmN0aW9ucywgc3VjaCBh
czoKCgltZXNvbl9kd19oZG1pID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptZXNvbl9kd19o
ZG1pKSwKCQkJCSAgICAgR0ZQX0tFUk5FTCk7CgpJZiB0aGlzIGJpbmQgb3BlcmF0aW9uIGZhaWxz
IGF0IG1lc29uX2R3X2hkbWlfaW5pdCgpLCB0aGVzZSBkZXZtXyByZXNvdXJjZXMKYXJlIG5vdCBh
dXRvbWF0aWNhbGx5IGZyZWVkIHNpbmNlIHRoZSB1bmRlcmx5aW5nIHBsYXRmb3JtIGRldmljZSBp
cyBub3QKZGVzdHJveWVkLiBDYW4gdGhpcyBsZWFkIHRvIG1lbW9yeSBhbmQgSVJRIGV4aGF1c3Rp
b24gb3ZlciB0aW1lPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MDgyODA5MTQyNC42Mzc1LTEtcGVuZ3BlbmdAaXNjYXMuYWMuY24/
cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
