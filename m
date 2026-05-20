Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F57CD4F54
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2026 04:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xFzv4Q/2gIZAizW6AzE5iKn6BvuDPdG/NKuKF1fPMHA=; b=4jje97A0wE4bxN
	VKU70ek44OpifJ2zfJcEGGEfSMuQu925Dmnf/W1YCda+AiLVx0RXgOoQ5ACGZw1vvfGMmlrRChpgD
	EVQTXiXFdJmE98t1h9eezL/SwQ0YspA4/Fpsbc7LmcWyqpc4owii09L3MSW6EV+I7VPRfQ75ev5q/
	8V55gzuXLMNIdTGL7ca7EMajHnqWurAJQiGV6etCBwdXwOTBElUjlVEiugVA8Snex7cP/WSs095n8
	+L0OM9s4FgVIVkOYRlnrnqt3ereN3aeUp2cY+OP+k34OQl5nPZIaEgDM8cyPoZBgtG5JI7B/R+30Y
	ZuxxUryQ1CZaGlXJdEdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZ1P-00000003WWY-31kB;
	Wed, 20 May 2026 04:59:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPZ1O-00000003WWS-3T7o
	for linux-amlogic@lists.infradead.org;
	Wed, 20 May 2026 04:59:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC7F860120;
	Wed, 20 May 2026 04:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACBA1F000E9;
	Wed, 20 May 2026 04:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779253145;
	bh=tsepcu1s6bAyalkDN1t0EYTAaUNMkiG6LjUncyGGCxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TKiZdQUmoxsl6HRg00ztoyrBUK1/WPqpZa7bB2WuqPbH7l3fnyKN5V51mTppf3E8C
	 H+Nm5279wUkwzb2RJ4+YX+XPadKk4vDKjG3KyL7oHZhussx1pQMuWL7p818YVuZxA/
	 GooNxfddv0yErxXZZmPodgvJyeoHu0yWYKS54ICxeYZI2lzNKgmyM9mUl62OLCUnqa
	 LyM+KcQCquYlam7QMx24OsJv8ptd82WOaqwnNrn0qyOgXIIj16ua39Qs7S0DP3gDGz
	 2uWX9wqqnH8mjFKGWpSfqeDb8ThASVDtpaTKsEvTX0OxRnNcGluprSpJBGyLUwvIDL
	 ljOvVmFEGUj0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] media: meson: vdec: Fix memory leak in error path of
 vdec_open
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260520044046.7553-1-linux.amoon@gmail.com>
References: <20260520044046.7553-1-linux.amoon@gmail.com>
Date: Wed, 20 May 2026 04:59:05 +0000
Message-Id: <20260520045905.6ACBA1F000E9@smtp.kernel.org>
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtDcml0aWNhbF0gVGhlIGBzZXNzLT5lc3BhcnNlcl9xdWV1ZV93b3JrYCB3b3JrIGl0ZW0gaXMg
bm90IGNhbmNlbGVkIGJlZm9yZSBmcmVlaW5nIHRoZSBzZXNzaW9uIGNvbnRleHQsIGxlYWRpbmcg
dG8gYSBwb3RlbnRpYWwgVXNlLUFmdGVyLUZyZWUgdnVsbmVyYWJpbGl0eS4KLSBbSGlnaF0gVGhl
IHBhdGNoIGF0dGVtcHRzIHRvIGZpeCBhIG1lbW9yeSBsZWFrIHJlcG9ydGVkIGJ5IGttZW1sZWFr
LCBidXQgbWlzZGlhZ25vc2VzIHRoZSByb290IGNhdXNlIGFuZCBsZWF2ZXMgdGhlIHByaW1hcnkg
bWVtb3J5IGxlYWsgKHRoZSBWNEwyIGNvbnRyb2wgaGFuZGxlcikgdW5yZXNvbHZlZC4KLSBbSGln
aF0gVGhlIGRyaXZlciBkb2VzIG5vdCB2ZXJpZnkgaWYgYGt0aHJlYWRfcnVuKClgIHJldHVybnMg
YW4gYEVSUl9QVFJgLCBsZWFkaW5nIHRvIGEga2VybmVsIHBhbmljIHdoZW4gYGt0aHJlYWRfc3Rv
cCgpYCBpcyBjYWxsZWQuCi0tCgpjb21taXQgYWNjY2M0ZmMwMmZlNWUxYmUwYzU0NWQxNzIyMTc5
NjY3YzA3ODQ3NQpBdXRob3I6IEFuYW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KCm1l
ZGlhOiBtZXNvbjogdmRlYzogRml4IG1lbW9yeSBsZWFrIGluIGVycm9yIHBhdGggb2YgdmRlY19v
cGVuCgpUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgcHJvcGVyIGVycl9tMm1fY3R4X3JlbGVhc2Ug
bGFiZWwgaW4gdGhlCnZkZWNfb3BlbiBmdW5jdGlvbi4gSXQgZW5zdXJlcyB2NGwyX20ybV9jdHhf
cmVsZWFzZSBpcyBjYWxsZWQgd2hlbgp2ZGVjX2luaXRfY3RybHMgZmFpbHMsIHByZXZlbnRpbmcg
YSBtZW1vcnkgbGVhayBvZiB0aGUgbTJtIGNvbnRleHQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEv
bWVzb24vdmRlYy92ZGVjLmMKPiBpbmRleCA0Yjc3ZWMxYWY1YTc2Li5hMDM5ZDkyNWMwZmU1IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+ICsr
KyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+IEBAIC04ODksNyAr
ODg5LDcgQEAgc3RhdGljIGludCB2ZGVjX29wZW4oc3RydWN0IGZpbGUgKmZpbGUpCj4gIAo+ICAJ
cmV0ID0gdmRlY19pbml0X2N0cmxzKHNlc3MpOwo+ICAJaWYgKHJldCkKPiAtCQlnb3RvIGVycl9t
Mm1fcmVsZWFzZTsKPiArCQlnb3RvIGVycl9tMm1fY3R4X3JlbGVhc2U7CgpbU2V2ZXJpdHk6IEhp
Z2hdClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgZG9lcyB2
ZGVjX2Nsb3NlKCkgcHJvcGVybHkKZnJlZSB0aGUgdjRsMiBjb250cm9sIGhhbmRsZXIgbWVtb3J5
IGFsbG9jYXRlZCBieSB2ZGVjX2luaXRfY3RybHMoKSBoZXJlPwoKV2hpbGUgdGhpcyBwYXRjaCBm
aXhlcyB0aGUgbTJtIGNvbnRleHQgbGVhayBvbiB0aGUgZXJyb3IgcGF0aCwgaWYKdmRlY19jbG9z
ZSgpIGZhaWxzIHRvIGNhbGwgdjRsMl9jdHJsX2hhbmRsZXJfZnJlZSgmc2Vzcy0+Y3RybF9oYW5k
bGVyKSwKY291bGQgdGhpcyBjb250cm9sIGhhbmRsZXIgbWVtb3J5IHN0aWxsIGxlYWsgb24gZXZl
cnkgc3VjY2Vzc2Z1bCBvcGVuIGFuZApjbG9zZSBjeWNsZT8KCltTZXZlcml0eTogQ3JpdGljYWxd
ClRoaXMgaXMgYSBwcmUtZXhpc3RpbmcgaXNzdWUsIGJ1dCBpcyB0aGUgc2Vzcy0+ZXNwYXJzZXJf
cXVldWVfd29yayBpdGVtCmNhbmNlbGVkIGJlZm9yZSBmcmVlaW5nIHRoZSBzZXNzaW9uIGNvbnRl
eHQ/CgpUaGUgd29yayBpdGVtIGlzIGluaXRpYWxpemVkIGluIHZkZWNfb3BlbigpOgoKdmRlY19v
cGVuKCkgewogICAgLi4uCiAgICBJTklUX1dPUksoJnNlc3MtPmVzcGFyc2VyX3F1ZXVlX3dvcmss
IGVzcGFyc2VyX3F1ZXVlX2FsbF9zcmMpOwogICAgLi4uCn0KCklmIHZkZWNfY2xvc2UoKSBjYWxs
cyBrZnJlZShzZXNzKSB3aXRob3V0IGZpcnN0IHN0b3BwaW5nIG9yIHN5bmNocm9uaXppbmcKd2l0
aCB0aGlzIGJhY2tncm91bmQgd29yayB2aWEgY2FuY2VsX3dvcmtfc3luYygpLCBjb3VsZCBhIGNv
bmN1cnJlbnRseQpydW5uaW5nIGVzcGFyc2VyX3F1ZXVlX2FsbF9zcmMoKSBkZXJlZmVyZW5jZSB0
aGUgZnJlZWQgc2VzcyBzdHJ1Y3R1cmUgYW5kCnRyaWdnZXIgYSB1c2UtYWZ0ZXItZnJlZT8KCltT
ZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gs
IGJ1dCBkb2VzIHRoZSBkcml2ZXIgdmVyaWZ5IGlmCmt0aHJlYWRfcnVuKCkgcmV0dXJucyBhbiBF
UlJfUFRSIHdoZW4gc3RhcnRpbmcgdGhlIHJlY3ljbGUgdGhyZWFkPwoKSWYgdGhyZWFkIGNyZWF0
aW9uIGZhaWxzIGluIHZkZWNfc3RhcnRfc3RyZWFtaW5nKCkgYW5kIHJldHVybnMgYW4gRVJSX1BU
UiwKY291bGQgYSBsYXRlciBjYWxsIHRvIGt0aHJlYWRfc3RvcChzZXNzLT5yZWN5Y2xlX3RocmVh
ZCkgaW4KdmRlY19zdG9wX3N0cmVhbWluZygpIGF0dGVtcHQgdG8gZGVyZWZlcmVuY2UgdGhhdCBF
UlJfUFRSIGFuZCBjYXVzZSBhCmtlcm5lbCBwYW5pYz8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDC
tyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA1MjAwNDQwNDYuNzU1My0xLWxp
bnV4LmFtb29uQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
