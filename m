Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8098C5DF66
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 01:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgW/Bc/WtAUzYDRzrf9MsfnRTrXe4EgbEN2pFH//bE0=; b=eDb4e2oN1YKWGU
	EltdNUUtmCH79V9XVT2OHlInYf4mJjOuzGxuDnucmbbKYUEQFUcMxX/wjObYauHCTm62MqI/iDXVR
	B6qDJGRC72kei3N1XJM3wvZCUSqb1q83e4p1TUZT9tGsul7afYGIHhsacrJNl4O8gWdzTttcdnJTj
	uxHCoSmc6hTJnJxGeKE7/TTi5+jIgts4qX+n4W+BfFsAyThTCnyJY12yOgxoLxztI1dVuO2c03/d9
	8qd3Tn9dSFRu91c6X8qgCe9U/W1uRAlwJtIBF4TZ715Qcx9vdjDC8CV38TO70noWEHzrt8/dNQujP
	4IJr8cMdyEDaH4nVwT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugpd-00000001oV6-1Mjg;
	Fri, 14 Aug 2026 01:35:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugpc-00000001oV0-3W6f
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 01:35:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33E0441B19;
	Fri, 14 Aug 2026 01:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90D71F000E9;
	Fri, 14 Aug 2026 01:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786671336;
	bh=le3eD3k/b3+EcZD2/kTVUtNbs4TwbavbabZkJGpALv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TdCQzJba9nAjCzCvRH8FAn0JplxTt8uDGmWEXUj0SRyfdCgS0JzdTQfA/BMDh+goS
	 DBZ9BEWVZsRo6aeL+42ehOzE+O5zoJE1+Qt2FMqPckl3B7aVsDy1Wr8osE1p7xGUbK
	 2VSguFgYgRGN7cTOnX12/3BUR/iGlIIC1x3tZXU6KqhPTzoENNoo6RcbJa2KYD+aLi
	 IkRYK0EXx4JHYPyiTC+OUJQVKDifG54hGUaPZGqs/KB88PLBalHwq34MoeqwPcdKHk
	 viVZNrZgKsKWua6cG0bamEIt+RMETpz2hc2k8Qq0adBe9DDwJaXk0eyhrZp5zEnSiR
	 7QJ4B76YLLUHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 56/78] drm/meson: encoder_hdmi: Switch to
 atomic_create_state
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-56-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-56-0a91018bf886@kernel.org>
Date: Fri, 14 Aug 2026 01:35:31 +0000
Message-Id: <20260814013535.C90D71F000E9@smtp.kernel.org>
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
IFtIaWdoXSBFcnJvciBwYXRocyBpbiBgbWVzb25fZW5jb2Rlcl9oZG1pX3Byb2JlYCBmYWlsIHRv
IHJlbW92ZSB0aGUgYnJpZGdlIGZyb20gdGhlIGdsb2JhbCBgYnJpZGdlX2xpc3RgIGFmdGVyIGl0
IGhhcyBiZWVuIGFkZGVkLCBsZWFkaW5nIHRvIGEgVXNlLUFmdGVyLUZyZWUgKFVBRikuCi0tCgot
LS0gUGF0Y2ggWzU2XTogW1BBVENIIHYyIDU2Lzc4XSBkcm0vbWVzb246IGVuY29kZXJfaGRtaTog
U3dpdGNoIHRvIGF0b21pY19jcmVhdGVfc3RhdGUgLS0tCmNvbW1pdCBhYjczZDYxZjc2NDJmOWZh
NmM3YzAzMTNmNzkzMzhhODE3MzgzYzcyCkF1dGhvcjogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBr
ZXJuZWwub3JnPgoKZHJtL21lc29uOiBlbmNvZGVyX2hkbWk6IFN3aXRjaCB0byBhdG9taWNfY3Jl
YXRlX3N0YXRlCgpUaGlzIGNvbW1pdCByZW1vdmVzIHRoZSBkZXByZWNhdGVkIGRybV9icmlkZ2Vf
ZnVuY3MuYXRvbWljX3Jlc2V0IGNhbGxiYWNrCmFuZCBpdHMgZHJtX2F0b21pY19oZWxwZXJfYnJp
ZGdlX3Jlc2V0KCkgaGVscGVyLiBJdCBzd2l0Y2hlcyB0byB0aGUKYXRvbWljX2NyZWF0ZV9zdGF0
ZSBjYWxsYmFjayBpbnN0ZWFkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX2VuY29kZXJfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2VuY29k
ZXJfaGRtaS5jCj4gaW5kZXggNTVjMDYwMWRmM2M2Mi4uMGM3YTcyY2I1MTRhZSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1pLmMKPiBAQCAtMzY2LDcgKzM2
Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBtZXNvbl9lbmNvZGVy
X2hkbWlfYnJpZGdlX2Z1bmNzID0gewo+ICAJLmF0b21pY19jaGVjayA9IG1lc29uX2VuY29kZXJf
aGRtaV9hdG9taWNfY2hlY2ssCj4gIAkuYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9t
aWNfaGVscGVyX2JyaWRnZV9kdXBsaWNhdGVfc3RhdGUsCj4gIAkuYXRvbWljX2Rlc3Ryb3lfc3Rh
dGUgPSBkcm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfZGVzdHJveV9zdGF0ZSwKPiAtCS5hdG9taWNf
cmVzZXQgPSBkcm1fYXRvbWljX2hlbHBlcl9icmlkZ2VfcmVzZXQsCj4gKwkuYXRvbWljX2NyZWF0
ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2JyaWRnZV9jcmVhdGVfc3RhdGUsCj4gIH07Cj4g
IAo+ICBpbnQgbWVzb25fZW5jb2Rlcl9oZG1pX3Byb2JlKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYp
CgpbU2V2ZXJpdHk6IEhpZ2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBh
dGNoLCBidXQgZG9lcyB0aGUgZXJyb3IgaGFuZGxpbmcgaW4KbWVzb25fZW5jb2Rlcl9oZG1pX3By
b2JlKCkgZmFpbCB0byByZW1vdmUgdGhlIGJyaWRnZSBmcm9tIHRoZSBnbG9iYWwgbGlzdD8KCldo
ZW4gdGhlIGJyaWRnZSBpcyBhZGRlZDoKCglkcm1fYnJpZGdlX2FkZCgmbWVzb25fZW5jb2Rlcl9o
ZG1pLT5icmlkZ2UpOwoKCW1lc29uX2VuY29kZXJfaGRtaS0+cHJpdiA9IHByaXY7CgoJLyogRW5j
b2RlciAqLwoJcmV0ID0gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQocHJpdi0+ZHJtLCAmbWVzb25f
ZW5jb2Rlcl9oZG1pLT5lbmNvZGVyLAoJCQkJICAgICAgRFJNX01PREVfRU5DT0RFUl9UTURTKTsK
CWlmIChyZXQpIHsKCQlkZXZfZXJyX3Byb2JlKHByaXYtPmRldiwgcmV0LCAiRmFpbGVkIHRvIGlu
aXQgSERNSSBlbmNvZGVyXG4iKTsKCQlnb3RvIGVycl9wdXRfbm9kZTsKCX0KCklmIGFuIGVycm9y
IG9jY3VycywgdGhlIGNvZGUganVtcHMgdG8gZXJyX3B1dF9ub2RlLCB3aGljaCBkb2VzIG5vdCBj
YWxsCmRybV9icmlkZ2VfcmVtb3ZlKCkuCgpTaW5jZSBkZXZtIGNsZWFudXAgd2lsbCBldmVudHVh
bGx5IGZyZWUgdGhlIG1lbW9yeSwgZG9lcyBsZWF2aW5nIHRoZSBmcmVlZApicmlkZ2UgbGlua2Vk
IGluIGJyaWRnZV9saXN0IGNhdXNlIGEgdXNlLWFmdGVyLWZyZWUgd2hlbiBzdWJzZXF1ZW50IGRy
aXZlcnMKY2FsbCBvZl9kcm1fZmluZF9hbmRfZ2V0X2JyaWRnZSgpPwoKLS0gClNhc2hpa28gQUkg
cmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDYwOC1kcm0tbm8t
bW9yZS1icmlkZ2UtcmVzZXQtdjItMC0wYTkxMDE4YmY4ODZAa2VybmVsLm9yZz9wYXJ0PTU2Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
