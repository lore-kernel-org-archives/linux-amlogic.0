Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F6AC44515
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zic8xGCivCa1HqmM3fW8eIHNuJ4qNO0x+LDz9fE6qHI=; b=K5u61/8M34FM1u
	ELCDQvRq/cEPwb+a1ZR7ZSzubA7cGLcAJTX6r/G4uDJ912jAxtclVr92roieCxE/E3X4pq5roI/dV
	HWhovH1Q6rgPu3QBAAO0NK9sK1GY2u7QJaJhFFVWikE7kiWxn/QUsMYeDpS5VDIyq/3LmFKOMvBBF
	euw9WLy0CrO8rlGUp5WxEykXq/h2bFvdkLlhJsYWanbvfFm8rFo68t3UiGRbo5iF+/+ukXuqOAb1x
	TKB1wLpwk78EzR2AVu0rGO3gjMEPdOETfRHa+/bbkZmA/Gq/pfeuaGjsCvEGqKAFL/s1dIGewomOx
	QqfGxfXncl+kLUp/7N3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqGg-00000007GcJ-2OED;
	Mon, 20 Jul 2026 15:50:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqGf-00000007Gbw-1kbM
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:50:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B072960A5C;
	Mon, 20 Jul 2026 15:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC5D1F000E9;
	Mon, 20 Jul 2026 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784562656;
	bh=qJQU5tT4gBWPtLIh3ibKXTeM8itlzBuYVgP05V0atv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1sF0eU/to38WbjOxI4rKStfKZXgTUuGYSwOT/8ZSG4nslE/0S+ZLaTo36X6bXpjD
	 muMARxPlmMavvJjYjkgQ1M/uhyphfqBE0zMf8YFeegyRUqiquY/0U0e6WkCwjzJtyf
	 dM+mhK7oaVL0Gy+DuuO2lJiHFewqWHSfTAS5GI2VOA9c73DO+UHCmtySNths9ioBTn
	 XqWm3ipLKW9CDiWc8gfQUm3eR3kBnCzkoLbgoUxVCM6SA5Il6EJoqU1nNI7GAzIDTa
	 s2gTDvG4zU5P4O1BOhIXvrIhre9Q0RFAeNxtRFj7UTrrHwPtREOL8XftS1H7aSN6b1
	 nOBItbX9MYvbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/15] drm/hisilicon/kirin: remove dependency on DRM
 simple helpers
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, wsa+renesas@sang-engineering.com, neil.armstrong@linaro.org
In-Reply-To: <20260720-drm_simple_encoder_init-v2-11-5020b630668a@gmail.com>
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com>
 <20260720-drm_simple_encoder_init-v2-11-5020b630668a@gmail.com>
Date: Mon, 20 Jul 2026 15:50:55 +0000
Message-Id: <20260720155055.EEC5D1F000E9@smtp.kernel.org>
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
IFtDcml0aWNhbF0gVGhlIGBkc2lfZGF0YWAgc3RydWN0dXJlLCB3aGljaCBlbWJlZHMgdGhlIGBk
cm1fZW5jb2RlcmAgb2JqZWN0IHZpYSBgZHdfZHNpYCwgaXMgYWxsb2NhdGVkIHVzaW5nIGBkZXZt
X2t6YWxsb2NgLiBUaGlzIHZpb2xhdGVzIERSTSBsaWZldGltZSBydWxlcyBhbmQgbGVhZHMgdG8g
YSB1c2UtYWZ0ZXItZnJlZSB3aGVuIHRoZSBwbGF0Zm9ybSBkZXZpY2UgdW5iaW5kcy4KLS0KCi0t
LSBQYXRjaCBbMTFdOiBbUEFUQ0ggdjIgMTEvMTVdIGRybS9oaXNpbGljb24va2lyaW46IHJlbW92
ZSBkZXBlbmRlbmN5IG9uIERSTSBzaW1wbGUgaGVscGVycyAtLS0KY29tbWl0IGI5YTAxMTdmNmFj
MWU4NjAwMzBkZmI1M2JlNThlNDQ3MzA2NTlhZDgKQXV0aG9yOiBEaW9nbyBTaWx2YSA8ZGlvZ29t
cGFpc3NpbHZhQGdtYWlsLmNvbT4KCmRybS9oaXNpbGljb24va2lyaW46IHJlbW92ZSBkZXBlbmRl
bmN5IG9uIERSTSBzaW1wbGUgaGVscGVycwoKVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBkZXByZWNh
dGVkIHNpbXBsZSBLTVMgaGVscGVycyBieSBvcGVuLWNvZGluZwpkcm1fc2ltcGxlX2VuY29kZXJf
aW5pdCgpIHRvIGNhbGwgZHJtX2VuY29kZXJfaW5pdCgpIGRpcmVjdGx5IGFuZApwcm92aWRpbmcg
ZHJpdmVyLWxvY2FsIGRybV9lbmNvZGVyX2Z1bmNzLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9raXJpbi9kd19kcm1fZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2tpcmluL2R3X2RybV9kc2kuYwo+IGluZGV4IDE1MDQyMzY1ZGVjMDAuLjYyYzViZDMy
NzdkYTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9kd19k
cm1fZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2R3X2RybV9k
c2kuYwoKWyAuLi4gXQoKPiBAQCAtNjg3LDYgKzY4NywxMCBAQCBzdGF0aWMgaW50IGRzaV9lbmNv
ZGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCj4gIAlyZXR1cm4g
MDsKPiAgfQo+ICAKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZW5jb2Rlcl9mdW5jcyBkd19l
bmNvZGVyX2Z1bmNzID0gewo+ICsJLmRlc3Ryb3kgPSBkcm1fZW5jb2Rlcl9jbGVhbnVwLAoKW1Nl
dmVyaXR5OiBDcml0aWNhbF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGNvdWxk
IHRoaXMgc2V0dXAgbGVhZCB0byBhIHVzZS1hZnRlci1mcmVlCndoZW4gdGhlIHBsYXRmb3JtIGRl
dmljZSB1bmJpbmRzPwoKVGhlIGVuY29kZXIgaXMgZW1iZWRkZWQgaW4gdGhlIGRzaV9kYXRhIHN0
cnVjdHVyZSwgd2hpY2ggaXMgYWxsb2NhdGVkCnVzaW5nIGRldm1fa3phbGxvYygpIGluIGRzaV9w
cm9iZSgpOgoKZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9kd19kcm1fZHNpLmM6ZHNp
X3Byb2JlKCkgewogICAgLi4uCiAgICBkYXRhID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNp
emVvZigqZGF0YSksIEdGUF9LRVJORUwpOwogICAgLi4uCn0KCklmIHVzZXJzcGFjZSBob2xkcyBh
biBvcGVuIGZpbGUgZGVzY3JpcHRvciB3aGVuIHRoZSBwbGF0Zm9ybSBkZXZpY2UgdW5iaW5kcywK
dGhlIERSTSBkZXZpY2UgYW5kIGl0cyBtb2RlIG9iamVjdHMgd2lsbCBvdXRsaXZlIHRoZSBwbGF0
Zm9ybSBkZXZpY2UuIFRoZQpkZXZyZXMgY2xlYW51cCB3aWxsIGZyZWUgdGhlIGRzaV9kYXRhIG1l
bW9yeSwgYnV0IHRoZSBEUk0gZGV2aWNlIHdpbGwgc3RpbGwKaG9sZCBhIHBvaW50ZXIgdG8gdGhl
IGVuY29kZXIgaW4gaXRzIGludGVybmFsIGxpc3RzLgoKV2hlbiB0aGUgRFJNIGRldmljZSBpcyBm
aW5hbGx5IHJlbGVhc2VkLCBkcm1fbW9kZV9jb25maWdfY2xlYW51cCgpIHdpbGwKaXRlcmF0ZSBv
dmVyIGl0cyBlbmNvZGVyIGxpc3QgYW5kIGludm9rZSB0aGlzIC5kZXN0cm95IGNhbGxiYWNrCihk
cm1fZW5jb2Rlcl9jbGVhbnVwKSBvbiB0aGUgYWxyZWFkeS1mcmVlZCBtZW1vcnkuCgpTaW5jZSB5
b3UgYXJlIHJlZmFjdG9yaW5nIHRoZSBlbmNvZGVyIGluaXRpYWxpemF0aW9uIGhlcmUsIHdvdWxk
IHRoaXMgYmUgYQpnb29kIHRpbWUgdG8gdHJhbnNpdGlvbiB0byBkcm1tX2VuY29kZXJfYWxsb2Mo
KSBvciBkcm1tX2t6YWxsb2MoKSB0byB0aWUgdGhlCmFsbG9jYXRpb24gbGlmZXRpbWUgdG8gdGhl
IERSTSBkZXZpY2UgaW5zdGVhZCBvZiB0aGUgcGxhdGZvcm0gZGV2aWNlPwoKPiArfTsKPiArCj4g
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VuY29kZXJfaGVscGVyX2Z1bmNzIGR3X2VuY29kZXJf
aGVscGVyX2Z1bmNzID0gewo+ICAJLmF0b21pY19jaGVjawk9IGRzaV9lbmNvZGVyX2F0b21pY19j
aGVjaywKPiAgCS5tb2RlX3ZhbGlkCT0gZHNpX2VuY29kZXJfbW9kZV92YWxpZCwKCi0tIApTYXNo
aWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA3MjAt
ZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQtdjItMC01MDIwYjYzMDY2OGFAZ21haWwuY29tP3BhcnQ9
MTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
