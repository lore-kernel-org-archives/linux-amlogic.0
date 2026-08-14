Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B41C5CFCF
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 01:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEXyiiqLDUBW2Y/cv/AP6JAn8dEaN97VaHoqvHNNPAY=; b=1AKzcbW/IK9enT
	v+sbRT70Tp8AD+veiLJpllPKLDAOuk9EjNtHAHh86dm/a4sDTdUx1Seuh+dvGT+uxwV/lzqVtArO3
	1jkfwBThDCuAUWzpOWZlqbXgAXvHXLb+GqeAZeOXVe17zn8Q9djXaCMN4b8w9TYcmXQP/go8E5Ptt
	Kn8WXohNfQT8B02Bjiz15PHJRbRp0Y3YS7XPgc2rV+/Ma76ECvyoqzXZMTjmynVw6h4qsuf/P9mEY
	PSqDjgH5lCpexiMatOzUwx3OnHdGjwP8PZpwbCxvc2Zvh2q+199pVPjqcLwvGMzuTBBMO/CQzW7S6
	c/EpKLEh3kqw2qKV6ZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugd8-00000001ngk-0gkj;
	Fri, 14 Aug 2026 01:22:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wugd6-00000001ngb-0Xoi
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 01:22:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D86643223;
	Fri, 14 Aug 2026 01:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6905A1F000E9;
	Fri, 14 Aug 2026 01:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786670559;
	bh=CShUSsBLGkyUTeCK6p8Dv3iqnEPkEVwC9ifXz18Lbp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BEaFP5XZq/iA5SOjWT4fwwvy932iVv1krzv3/FRKLdLxbdAmftHLIqCMrQVMMT6UX
	 OXIXH/vhfrc39N4gsbCfq4Dk+IZS6Lxu0aijmeB08Y3leygjcdsSzn9IQdztWP8/Y8
	 +TTzKwe20/d0lFgqAd7q1Gn4jSq/Kkme4fy+L9laLpvMs8Rmdt9a2MISF7+CRwWtN1
	 hGsdwJpLHPe+zXAcK7cUPCODF7//6fFSJZ8E9aOB8ZzKS3iuiGWfy4SKur5Impcemv
	 EVOsAG3VpbePJP2yuCJd56akAB7tU5KNpMci90/7U8AwZEd0oOdqLjzC1Z7P6OzI2I
	 RPWwZnSFwxcaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 54/78] drm/meson: encoder_cvbs: Switch to
 atomic_create_state
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-54-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-54-0a91018bf886@kernel.org>
Date: Fri, 14 Aug 2026 01:22:34 +0000
Message-Id: <20260814012235.6905A1F000E9@smtp.kernel.org>
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
IFtIaWdoXSBNaXNzaW5nIGRybV9icmlkZ2VfcmVtb3ZlKCkgb24gZXJyb3IgcGF0aHMgaW4gbWVz
b25fZW5jb2Rlcl9jdmJzX3Byb2JlIGxlYWRzIHRvIGEgbGVha2VkIGJyaWRnZSwgbGVha2VkICdu
ZXh0X2JyaWRnZScgcmVmZXJlbmNlLCBhbmQgYSBkYW5nbGluZyBwb2ludGVyIGluIHRoZSBnbG9i
YWwgYnJpZGdlX2xpc3QuCi0tCgotLS0gUGF0Y2ggWzU0XTogW1BBVENIIHYyIDU0Lzc4XSBkcm0v
bWVzb246IGVuY29kZXJfY3ZiczogU3dpdGNoIHRvIGF0b21pY19jcmVhdGVfc3RhdGUgLS0tCmNv
bW1pdCA0OTU3ODJmNmZjYzhkNWIxYzdlNmZkNDVhZjlmMWJlMTk4NDhlNDJjCkF1dGhvcjogTWF4
aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgoKZHJtL21lc29uOiBlbmNvZGVyX2N2YnM6
IFN3aXRjaCB0byBhdG9taWNfY3JlYXRlX3N0YXRlCgpUaGlzIGNvbW1pdCBzd2l0Y2hlcyB0aGUg
bWVzb25fZW5jb2Rlcl9jdmJzIGJyaWRnZSBmcm9tIHRoZSBkZXByZWNhdGVkCmF0b21pY19yZXNl
dCBjYWxsYmFjayB0byB0aGUgYXRvbWljX2NyZWF0ZV9zdGF0ZSBjYWxsYmFjay4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYwo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZXNvbi9tZXNvbl9lbmNvZGVyX2N2YnMuYwo+IEBAIC0yMTUsNyArMjE1LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIG1lc29uX2VuY29kZXJfY3Zic19icmlkZ2VfZnVu
Y3MgPSB7Cj4gIAkuYXRvbWljX2NoZWNrID0gbWVzb25fZW5jb2Rlcl9jdmJzX2F0b21pY19jaGVj
aywKPiAgCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gZHJtX2F0b21pY19oZWxwZXJfYnJpZGdl
X2R1cGxpY2F0ZV9zdGF0ZSwKPiAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNf
aGVscGVyX2JyaWRnZV9kZXN0cm95X3N0YXRlLAo+IC0JLmF0b21pY19yZXNldCA9IGRybV9hdG9t
aWNfaGVscGVyX2JyaWRnZV9yZXNldCwKPiArCS5hdG9taWNfY3JlYXRlX3N0YXRlID0gZHJtX2F0
b21pY19oZWxwZXJfYnJpZGdlX2NyZWF0ZV9zdGF0ZSwKPiAgfTsKPiAgCj4gIGludCBtZXNvbl9l
bmNvZGVyX2N2YnNfcHJvYmUoc3RydWN0IG1lc29uX2RybSAqcHJpdikKPiAgewoKWyAuLi4gXQoK
PiAgCWRybV9icmlkZ2VfYWRkKCZtZXNvbl9lbmNvZGVyX2N2YnMtPmJyaWRnZSk7Cj4gIAo+ICAJ
bWVzb25fZW5jb2Rlcl9jdmJzLT5wcml2ID0gcHJpdjsKPiAgCj4gIAkvKiBFbmNvZGVyICovCj4g
IAlyZXQgPSBkcm1fc2ltcGxlX2VuY29kZXJfaW5pdChwcml2LT5kcm0sICZtZXNvbl9lbmNvZGVy
X2N2YnMtPmVuY29kZXIsCj4gIAkJCQkgICAgICBEUk1fTU9ERV9FTkNPREVSX1RWREFDKTsKPiAg
CWlmIChyZXQpCj4gIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUocHJpdi0+ZGV2LCByZXQsCj4gIAkJ
CQkgICAgICJGYWlsZWQgdG8gaW5pdCBDVkJTIGVuY29kZXJcbiIpOwoKW1NldmVyaXR5OiBIaWdo
XQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBidXQgZG9lcyB0aGlzIGVycm9yIHBhdGgg
bGVhayB0aGUgYnJpZGdlPwoKSWYgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBmYWlscywgdGhl
IGZ1bmN0aW9uIHJldHVybnMgZGlyZWN0bHkgd2l0aG91dApjYWxsaW5nIGRybV9icmlkZ2VfcmVt
b3ZlKCkuIEl0IGxvb2tzIGxpa2UgdGhpcyBsZWF2ZXMgdGhlIGJyaWRnZSBvYmplY3QKaW4gdGhl
IGdsb2JhbCBicmlkZ2VfbGlzdC4KCkNvdWxkIHRoaXMgbGVhZCB0byBhIHVzZS1hZnRlci1mcmVl
IG9yIGtlcm5lbCBvb3BzIGlmIHRoZSBkcml2ZXIgbW9kdWxlCmlzIHVubG9hZGVkIGFuZCBhbm90
aGVyIHN1YnN5c3RlbSBpdGVyYXRlcyBvdmVyIHRoZSBsaXN0PyBTaG91bGQgdGhlcmUKYmUgYSBj
bGVhbnVwIHBhdGggaGVyZSBmb3IgZHJtX2JyaWRnZV9hZGQoKSBhbmQgdGhlIG5leHRfYnJpZGdl
IHJlZmVyZW5jZT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA2MDgtZHJtLW5vLW1vcmUtYnJpZGdlLXJlc2V0LXYyLTAtMGE5MTAx
OGJmODg2QGtlcm5lbC5vcmc/cGFydD01NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
