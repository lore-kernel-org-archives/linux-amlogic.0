Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC01BC48BF8
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/aUzQFgvhqhwKwei9hV9XT1i6S+kPtUEJBSBvcvxHM8=; b=akzo3KvK9sC+1m
	v2qUMNUhLEZzsHB7OjmqIB18j/nb83/ugwP1SfHecckHAlE+XinSXm2u4gmOuaGWKtiAoc1t7uPuq
	2bxduMU6geVk7TI14/W9klMVL+9bOnzcRJwLFVtC83hTurW2d/DCt7bH85tkMszWzKUYLJ5D71CCk
	S6lezO71f7dP1R0XVc582REgBVXHm6noSpmQds5pGgu2BMxxzmMhtpow+lLARs8AbJiSTjlRj0rmb
	jLWBVhJLCoLZU68QzGzC1Cnd1jkgC4g/l7k5AsqDNnKEtbjBPNeEzOCOtec4wnSP45any32NDRRvn
	3oF6skOdogcie8kNbfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc38d-0000000ATh8-1IPX;
	Mon, 19 Feb 2024 12:52:51 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc38Z-0000000ATfF-34LJ;
	Mon, 19 Feb 2024 12:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708347164;
	bh=RlJFnwC8vtKaCRSiqNBP6fs/G9L9iiOg4PIBPGdT9RU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QSMVtvfseBUsWHd8wUrB3Ibay4Sz6yDaBFlcdwRfZDu7OZb7dzMN2z0D228h83b6D
	 PpHL+rGH/nqw5fLvRNk0jDlXSVOeD+27wus48q7YrBG5qxc76/KkCQDljqy1MsDZOg
	 micgwVxeWwS1qrGtK/yRCjih5BWeqUr+rSoZhV0Z2LWmIXEhYqyR5UdWrHsBHxQ3hk
	 3f8yGFskfV80sMOw1Ns3IAE1L+6rlsI+WFiFTnx1pnW2UyOPiW5fC1axJ0Sh5/7tR5
	 dup+DkxrWG2e7wJVyBV3261jSKXDSlqC5EGojjeSlnX1DpYtub6lbmZX5ichLsNbwC
	 RYVQj6nkYBqZA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F4A437820C1;
	Mon, 19 Feb 2024 12:52:40 +0000 (UTC)
Message-ID: <e69a275c-4415-4f0c-bae4-af8112357ef6@collabora.com>
Date: Mon, 19 Feb 2024 09:52:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/ci: mediatek: Add job to test panfrost and
 powervr GPU driver
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-4-vignesh.raman@collabora.com>
 <61575073-ce37-4027-8f95-f05290cc10c4@collabora.com>
 <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <2083520a-13f3-0ecd-45ce-ee4ba34d5bca@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_045247_924314_2521E4CD 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiAxOS8wMi8yMDI0IDA2OjM5LCBWaWduZXNoIFJhbWFuIHdyb3RlOgo+IEhpIEhlbGVuLAo+
IAo+IE9uIDA5LzAyLzI0IDIzOjUxLCBIZWxlbiBLb2lrZSB3cm90ZToKPj4KPj4KPj4gT24gMzAv
MDEvMjAyNCAxMjowMywgVmlnbmVzaCBSYW1hbiB3cm90ZToKPj4+IEZvciBtZWRpYXRlayBtdDgx
NzMsIHRoZSBHUFUgZHJpdmVyIGlzIHBvd2VydnIgYW5kIGZvciBtZWRpYXRlawo+Pj4gbXQ4MTgz
LCB0aGUgR1BVIGRyaXZlciBpcyBwYW5mcm9zdC4gU28gYWRkIHN1cHBvcnQgaW4gZHJtLWNpIHRv
Cj4+PiB0ZXN0IHBhbmZyb3N0IGFuZCBwb3dlcnZyIEdQVSBkcml2ZXIgZm9yIG1lZGlhdGVrIFNP
Q3MgYW5kIHVwZGF0ZQo+Pj4geGZhaWxzLiBQb3dlcnZyIGRyaXZlciB3YXMgbWVyZ2VkIGluIGxp
bnV4IGtlcm5lbCwgYnV0IHRoZXJlJ3Mgbm8KPj4+IG1lZGlhdGVrIHN1cHBvcnQgeWV0LiBTbyBk
aXNhYmxlIHRoZSBtdDgxNzMtZ3B1IGpvYiB3aGljaCB1c2VzCj4+PiBwb3dlcnZyIGRyaXZlci4K
Pj4+Cj4+PiBBZGQgcGFuZnJvc3Qgc3BlY2lmaWMgdGVzdHMgdG8gdGVzdGxpc3QgYW5kIHNraXAg
S01TIHRlc3RzIGZvcgo+Pj4gcGFuZnJvc3QgZHJpdmVyIHNpbmNlIGl0IGlzIG5vdCBhIG5vdCBh
IEtNUyBkcml2ZXIuIEFsc28gdXBkYXRlCj4+PiB0aGUgTUFJTlRBSU5FUlMgZmlsZSB0byBpbmNs
dWRlIHhmYWlscyBmb3IgcGFuZnJvc3QgZHJpdmVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFZp
Z25lc2ggUmFtYW4gPHZpZ25lc2gucmFtYW5AY29sbGFib3JhLmNvbT4KPj4KPj4gSGkgVmlnbmVz
aCwgdGhhbmtzIGZvciB5b3VyIHdvcmsuCj4+Cj4+IEknbSBzdGlsbCB3b25kZXJpbmcgYWJvdXQg
YSBmZXcgdGhpbmdzLCBwbGVhc2UgY2hlY2sgYmVsb3cuCj4+Cj4+PiAtLS0KPj4+Cj4+PiB2MjoK
Pj4+IMKgwqAgLSBBZGQgcGFuZnJvc3QgYW5kIFBWUiBHUFUgam9icyBmb3IgbWVkaWF0ZWsgU09D
IHdpdGggbmV3IHhmYWlscywgCj4+PiBhZGQgeGZhaWwKPj4+IMKgwqDCoMKgIGVudHJ5IHRvIE1B
SU5UQUlORVJTLgo+Pgo+PiBNYXliZSB3ZSBzaG91bGQgcmV2aWV3IGhvdyB0aGUgeGZhaWxzIGZh
aWxlcyBhcmUgbmFtZWQuIEkgdGhpbmsgdGhleSAKPj4gc2hvdWxkIHN0YXJ0IHdpdGggdGhlIERS
SVZFUl9OQU1FIGluc3RlYWQgb2YgR1BVX1ZFUlNJT04uCj4+Cj4+IEZvciBpbnN0YW5jZSwgY29u
c2lkZXIgdGhlIGZvbGxvd2luZyBqb2I6Cj4+Cj4+IG1lZGlhdGVrOm10ODE4My1ncHU6Cj4+IMKg
wqAgZXh0ZW5kczoKPj4gwqDCoMKgwqAgLSAubXQ4MTgzCj4+IMKgwqAgdmFyaWFibGVzOgo+PiDC
oMKgwqDCoCBHUFVfVkVSU0lPTjogbWVkaWF0ZWstbXQ4MTgzLWdwdQo+PiDCoMKgwqDCoCBEUklW
RVJfTkFNRTogcGFuZnJvc3QKPj4KPj4gQW5kIHdlIGhhdmUgbWVkaWF0ZWstbXQ4MTgzLWdwdS1z
a2lwcy50eHQKPj4KPj4gSWYgdGhlcmUgaXMgYW4gZXJyb3IsIHdlIHdhbnQgdG8gbm90aWZ5IHRo
ZSBwYW5mcm9zdCBkcml2ZXIgCj4+IG1haW50YWluZXJzIChhbmQgbWF5YmUgbm90IHRoZSBtZWRp
YXRlayBkcml2ZXIgbWFpbnRhaW5lcnMpLCBzbyAKPj4gTUFJTlRBSU5FUlMgZmlsZSBkb2Vzbid0
IGNvcnJlc3BvbmQgdG8gdGhpcy4KPiAKPiBBZ3JlZS4KPiAKPj4KPj4gSG93IGFib3V0IGEgbmFt
aW5nIDxkcml2ZXIgbmFtZT5fPGhhcmR3YXJlL2dwdT5fPHR5cGU6IGdwdS9kaXNwbGF5PiA/Cj4+
Cj4+IHBvd2VydnJfbWVkaWF0ZWstbXQ4MTczX2dwdS1za2lwdHMudHh0Cj4+IG1lZGlhdGVrX21l
ZGlhdGVrLW10ODE3M19kaXNwbGF5LXNraXB0cy50eHQKPj4gcGFuZnJvc3RfbWVkaWF0ZWstbXQ4
MTgzX2dwdS1za2lwcy50eHQKPj4gbWVkaWF0ZWtfbWVkaWF0ZWstbXQ4MTgzX2Rpc3BsYXktc2tp
cHMudHh0Cj4+IC4uLgo+Pgo+PiBXaGF0IGRvIHlvdSB0aGluaz8KPiAKPiBZZXMgd2UgY2FuIGtl
ZXAgdGhpcyBuYW1pbmcuIEluIHRoaXMgY2FzZSBkbyB3ZSBzdGlsbCBuZWVkIGdwdS9kaXNwbGF5
IAo+IGluIHRoZSB4ZmFpbHMgZmlsZSBuYW1lPwoKSWYgeW91IHRoaW5rIHRoaXMgc3BsaXQgaXMg
bm90IHJlcXVpcmVkLCB0aGVuIEknbSBmaW5lIGRyb3BwaW5nIGl0LgoKUmVnYXJkcywKSGVsZW4K
Cj4gCj4gUmVnYXJkcywKPiBWaWduZXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
