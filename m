Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93757606A31A
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 00:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oVpYGg5l;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FU9DS4vJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=70Ak45OdqClsUSPHIzFv6fn0fPq3txKzZF0XQCF6z5o=; b=oVpYGg5lN1s3OR7VCUd7yk89E7
	UUZIvzv7uxSNGNGLG6m/WJcKh/7IkPyv1jwkrM0Nw7u/iksyRCTaVQrgQdMjoDj7khGravZbOTc3t
	Fo7D7Ysqfd0sNxD9du/WsJIF58/hjSTdQpEFf2ekpBWL+AFa9KOaz8qH93Awvu4JrL3hEZTnWMmSS
	8wXH+ESuH8DTW9+GSvRSQLqaHF0C66iO9kJeleE9vTgBphJ2W/TyA0WEu6x4Q20eEyrLfSeTmRp0v
	+P8TP3OY5qSr6wcQAEI8T3o5LQG0BYq4EbNRur6FusnmxOSOsuME06tS/Y6syQie/F36PlHNTn99C
	D1pxRyng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ23-0000000HIFu-1BHA;
	Sat, 24 Oct 2026 00:54:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ22-0000000HIFn-3gxd
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 00:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5528B4156E;
	Sat, 24 Oct 2026 00:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAA51F01825;
	Sat, 24 Oct 2026 00:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792803286;
	bh=8rTFWG/u8g3zFtmWZhV06zKt+YsOU4geLx3qnx8KCJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FU9DS4vJ4/dAm7XzkIMUAW5vsubdpRax8xjtgox3i6IOnjY0wF/b0/JiJWkhnze98
	 WZYBqTMr0FwmbsJ+xcl1MkRrDNamufd133Ux6UoPorwJWK6QUzj4qUU0r20wo20O1N
	 fz9aXBJAqZVWbnqahLzjtf99nP+mkpv4yNwWTJOB+YfY35/Ens18PAKDuWrG3sy2Lz
	 5tfTHmaiYFjYZrPomX9mfeXFHMrUIAYHPpZWMVb88/jVamw4xNeN3yj3IfmzmFyQ5h
	 fxXWEZaOgZAeDjvlAGrVBndASlRI3/vR0K8Dz1sWhcnhvc3u74LLlrU02HqOSm0Dx2
	 LSRI744njnS4w==
Message-ID: <sashiko-outbox-183472@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/9] drm/msm/dp: don't take extra references on
 multiple plug events
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 00:54:45 +0000
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIGRybS9tc20vZHA6IG1z
bV9kcF9ocGRfcGx1Z19oYW5kbGUoKSBza2lwcyBIUEQgaW5pdCB3aGVuIGRwLT5wbHVnZ2VkIGlz
IHNldAotLQoKY29tbWl0IDQxMTMzMTJmODc4Yzc3MWIzNzhiODJjMDVmMzA3NmYyZWQ3OWNmYzcK
QXV0aG9yOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5j
b20+Cgpkcm0vbXNtL2RwOiBkb24ndCB0YWtlIGV4dHJhIHJlZmVyZW5jZXMgb24gbXVsdGlwbGUg
cGx1ZyBldmVudHMKClRoaXMgY29tbWl0IHNraXBzIHN1YnNlcXVlbnQgSFBEIHBsdWcgZXZlbnRz
IGluIG1zbV9kcF9ocGRfcGx1Z19oYW5kbGUoKQp3aGVuIGRwLT5wbHVnZ2VkIGlzIGFscmVhZHkg
c2V0LCBhdm9pZGluZyBleHRyYSBydW50aW1lIFBNIHJlZmVyZW5jZXMuCgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfZGlzcGxheS5jCj4gaW5kZXggZmE4OTQyOTIyYjUzMy4uY2U5MTlhMjZmYmEyOCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCj4gQEAgLTQxMiw2ICs0MTIsOSBA
QCBzdGF0aWMgaW50IG1zbV9kcF9ocGRfcGx1Z19oYW5kbGUoc3RydWN0IG1zbV9kcF9kaXNwbGF5
X3ByaXZhdGUgKmRwKQo+ICAKPiAgCWd1YXJkKG11dGV4KSgmZHAtPnBsdWdnZWRfbG9jayk7Cj4g
IAo+ICsJaWYgKGRwLT5wbHVnZ2VkKQo+ICsJCXJldHVybiAwOwoKW1NldmVyaXR5OiBIaWdoXQpD
b3VsZCB0aGlzIGVhcmx5IHJldHVybiBjYXVzZSBtc21fZHBfaHBkX3BsdWdfaGFuZGxlKCkgdG8g
c2tpcAptc21fZHBfZGlzcGxheV9wcm9jZXNzX2hwZF9oaWdoKCkgY29tcGxldGVseSB3aGVuIGRl
dGVjdGlvbiBydW5zIGJlZm9yZSBIUEQKcGx1ZyBoYW5kbGluZz8KCldoZW4gY29ubmVjdG9yIGRl
dGVjdGlvbiBydW5zIHdoaWxlIGRwLT5wbHVnZ2VkIGlzIGZhbHNlIGFuZCBhIERpc3BsYXlQb3J0
CnNpbmsgaXMgY29ubmVjdGVkIChmb3IgZXhhbXBsZSBhdCBib290IHZpYQpkcm1faGVscGVyX3By
b2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMoKSAtPiBkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9kZXRl
Y3RfY3R4KCksCm9uIHN5c3RlbSByZXN1bWUsIG9yIHZpYSBEUk1fSU9DVExfTU9ERV9HRVRDT05O
RUNUT1IpLApkcm1fYnJpZGdlX2Nvbm5lY3Rvcl9kZXRlY3RfY3R4KCkgY2FsbHMgZGV0ZWN0LT5m
dW5jcy0+ZGV0ZWN0KCkgaW1tZWRpYXRlbHkKYmVmb3JlIGRybV9icmlkZ2VfY29ubmVjdG9yX2hw
ZF9ub3RpZnkoKToKCmRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9icmlkZ2VfY29ubmVjdG9y
LmM6ZHJtX2JyaWRnZV9jb25uZWN0b3JfZGV0ZWN0X2N0eCgpIHsKCWlmIChkZXRlY3QpIHsKCQlz
dGF0dXMgPSBkZXRlY3QtPmZ1bmNzLT5kZXRlY3QoZGV0ZWN0LCBjb25uZWN0b3IpOwoJCS4uLgoJ
CWRybV9icmlkZ2VfY29ubmVjdG9yX2hwZF9ub3RpZnkoY29ubmVjdG9yLCBzdGF0dXMsIERSTV9D
T05ORUNUT1JfTk9fRVhUUkFfU1RBVFVTKTsKCX0KfQoKSW4gbXNtX2RwX2JyaWRnZV9kZXRlY3Qo
KSwgcHJpdi0+cGx1Z2dlZCBpcyBzZXQgdG8gdHJ1ZSBhZnRlciByZWFkaW5nIERQQ0QKaW50byBs
b2NhbCBzdGFjayBidWZmZXJzLCB3aXRob3V0IGNhbGxpbmcgbXNtX2RwX2Rpc3BsYXlfcHJvY2Vz
c19ocGRfaGlnaCgpOgoKZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmM6bXNtX2Rw
X2JyaWRnZV9kZXRlY3QoKSB7CgkuLi4KCXN0YXR1cyA9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVj
dGVkOwoJcHJpdi0+cGx1Z2dlZCA9IHRydWU7Cn0KCldoZW4gZHJtX2JyaWRnZV9jb25uZWN0b3Jf
aHBkX25vdGlmeSgpIHRoZW4gaW52b2tlcyBtc21fZHBfYnJpZGdlX2hwZF9ub3RpZnkoKQotPiBt
c21fZHBfaHBkX3BsdWdfaGFuZGxlKCksIGRwLT5wbHVnZ2VkIGlzIGFscmVhZHkgdHJ1ZSwgc28K
bXNtX2RwX2hwZF9wbHVnX2hhbmRsZSgpIHJldHVybnMgMCB3aXRob3V0IGNhbGxpbmcKbXNtX2Rw
X2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGlnaCgpLgoKU2ltaWxhcmx5LCBpZiBtc21fZHBfaHBkX3Bs
dWdfaGFuZGxlKCkgcnVucyBmaXJzdCBhbmQKbXNtX2RwX2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGln
aCgpIGZhaWxzIChmb3IgZXhhbXBsZSByZXR1cm5pbmcgLUVOT1RDT05OIGluCm1zbV9kcF9wYW5l
bF9yZWFkX2xpbmtfY2FwcygpIHdoZW4gYSBicmFuY2ggZGV2aWNlIGlzIGNvbm5lY3RlZCB3aXRo
CnNpbmtfY291bnQgPT0gMCwgb3Igb24gYSB0cmFuc2llbnQgQVVYIHRpbWVvdXQpLCBtc21fZHBf
aHBkX3BsdWdfaGFuZGxlKCkKc3RpbGwgc2V0cyBkcC0+cGx1Z2dlZCA9IHRydWUgdW5jb25kaXRp
b25hbGx5OgoKZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmM6bXNtX2RwX2hwZF9w
bHVnX2hhbmRsZSgpIHsKCS4uLgoJcmV0ID0gbXNtX2RwX2Rpc3BsYXlfcHJvY2Vzc19ocGRfaGln
aChkcCk7CgkuLi4KCWRwLT5wbHVnZ2VkID0gdHJ1ZTsKCglyZXR1cm4gcmV0Owp9CgpXb3VsZG4n
dCBib3RoIHBhdGhzIGxlYXZlIGRwLT5wYW5lbC0+bGlua19pbmZvLCB0aGUgY29ubmVjdG9yIEVE
SUQsIExUVFBSLAphbmQgZHAtPmxpbmstPnNpbmtfY291bnQgdW5pbml0aWFsaXplZCwgY2F1c2lu
ZyBtc21fZHBfZGlzcGxheV9nZXRfbW9kZXMoKQp0byByZXR1cm4gMCBtb2RlcywgbXNtX2RwX2Rp
c3BsYXlfbW9kZV92YWxpZCgpIHRvIHJlamVjdCBtb2RlcyB3aXRoCk1PREVfQkFELCBhbmQgbXNt
X2RwX2Rpc3BsYXlfcHJlcGFyZV9saW5rKCkgdG8gZmFpbCB3aXRoIC1FTk9UQ09OTj8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEw
MjQtaHBkLWlycS1ldmVudHMtdjgtMC02ZWU5NDllN2EzODRAb3NzLnF1YWxjb21tLmNvbT9wYXJ0
PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
