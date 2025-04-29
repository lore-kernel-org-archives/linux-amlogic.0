Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50C9C369DC
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXruI0piNBpFl3Tkz3bV2U2Ns+az+2SxSOGsTdCs/rU=; b=OborLHIpju51UU
	RYarNQfKLRgNbem46uI+v+ZEsjBAmK/hrnu4kxX5TnWotsmz5sZioicmxXO7FuvXfprpfsNbxn8sh
	mdZeg5z+G7j4w5KTlBQZl+Fv/aSyWz4dZEQwrLT2ITcl/yjTiva0o6/Wvk/JQmd/icV0tyaap1sB9
	OUqtrYM3hBfUWCuwcKRikMsnl3Nwz8Ca3/UF6nsK2qq6pwuucYuW+TH/epREgv9+wrOv8JCC1zrPB
	4gBjIHSFgVjzV6hhLJ3z4arsBxk/KP9f8+Weg7X0AX0bQ1TUvvA9809vJXYyX1xyPYm6lCP+MDFjq
	cP0TEBfLSG6GYnyEd5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s6l-0000000Aorz-0cNC;
	Tue, 29 Apr 2025 21:03:15 +0000
Received: from smtp-16.smtpout.orange.fr ([80.12.242.16] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s3q-0000000AoSY-0OOn;
	Tue, 29 Apr 2025 21:00:15 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 9s3FuK4cRBfs49s3IuBIq6; Tue, 29 Apr 2025 22:59:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1745960385;
	bh=+TozBWijXodrVUon6QJfDncNinfpv/1bQpJAQR3zwHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=aWaj4RCVHvwG0spz2veNVZYCrnM6nLNlGyfl8IqfdPa1TCsIeGu92xkP3nKUnmZQB
	 iE1ph39mdxBnpKYPgISulUUnSjatciPB0VOhhu3UNseGODeeaScNQyfQeUfXr6H9Ab
	 FdBUB3/lGF1wyxzCqhKt3KXO3s2C/t2kf/FAGdvsKF0loerODbMjXLxJDboeF7CeM7
	 yKqywcqMZ4qhiiMNCQCA0fagB9UG2+pxtuf271dJ9FEsnogOhvQeSw5TtBXDmtzSro
	 lSt2giOKSgCeWaTRAZW5BfagcjN7hoXWIgzEGRlyQQQWxpmR1h/9qZZxNtrhxooW0+
	 T7s3gEoxwIQrQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 29 Apr 2025 22:59:45 +0200
X-ME-IP: 90.11.132.44
Message-ID: <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
Date: Tue, 29 Apr 2025 23:00:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
To: I Hsin Cheng <richard120310@gmail.com>, neil.armstrong@linaro.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
References: <20250429190724.330883-1-richard120310@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250429190724.330883-1-richard120310@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_140014_273555_553DCB28 
X-CRM114-Status: GOOD (  12.03  )
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

TGUgMjkvMDQvMjAyNSDDoCAyMTowNywgSSBIc2luIENoZW5nIGEgw6ljcml0wqA6Cj4gQ292ZXJp
dHkgc2NhbiByZXBvcnRlZCB0aGUgdXNhZ2Ugb2YgIm1vZGUtPmNsb2NrICogMTAwMCIgbWF5IGxl
YWQgdG8KPiBpbnRlZ2VyIG92ZXJmbG93LiBDYXN0IHRoZSB0eXBlIG9mICJtb2RlLT5jbG9jayIg
dG8gInVuc2lnbmVkIGxvbmcgbG9uZyIKPiB3aGVuIHV0aWxpemluZyBpdCB0byBhdm9pZCBwb3Rl
bnRpYWwgaW50ZWdlciBvdmVyZmxvdyBpc3N1ZS4KPiAKPiBMaW5rOiBodHRwczovL3NjYW41LnNj
YW4uY292ZXJpdHkuY29tLyMvcHJvamVjdC12aWV3LzEwMDc0LzEwMDYzP3NlbGVjdGVkSXNzdWU9
MTY0Njc1OQo+IFNpZ25lZC1vZmYtYnk6IEkgSHNpbiBDaGVuZyA8cmljaGFyZDEyMDMxMEBnbWFp
bC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZW5jb2Rlcl9oZG1p
LmMgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNv
ZGVyX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2hkbWkuYwo+
IGluZGV4IDc3NTJkOGFjODVmMC4uZmUzZDNmZjdjNDMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9lbmNvZGVyX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZXNvbi9tZXNvbl9lbmNvZGVyX2hkbWkuYwo+IEBAIC03NSw3ICs3NSw3IEBAIHN0YXRpYyB2
b2lkIG1lc29uX2VuY29kZXJfaGRtaV9zZXRfdmNsayhzdHJ1Y3QgbWVzb25fZW5jb2Rlcl9oZG1p
ICplbmNvZGVyX2hkbWksCj4gICAJdW5zaWduZWQgbG9uZyBsb25nIHZlbmNfZnJlcTsKPiAgIAl1
bnNpZ25lZCBsb25nIGxvbmcgaGRtaV9mcmVxOwo+ICAgCj4gLQl2Y2xrX2ZyZXEgPSBtb2RlLT5j
bG9jayAqIDEwMDA7Cj4gKwl2Y2xrX2ZyZXEgPSAodW5zaWduZWQgbG9uZyBsb25nKSBtb2RlLT5j
bG9jayAqIDEwMDA7CgpIaSwKCm1heWJlLCB1c2luZyAxMDAwVUxMIGluc3RlYWQgd291bGQgZG8g
dGhlIHNhbWUsIGJ1dCB3b3VsZCBiZSBsZXNzIHZlcmJvc2U/CgpDSgoKPiAgIAo+ICAgCS8qIEZv
ciA0MjAsIHBpeGVsIGNsb2NrIGlzIGhhbGYgdW5saWtlIHZlbmMgY2xvY2sgKi8KPiAgIAlpZiAo
ZW5jb2Rlcl9oZG1pLT5vdXRwdXRfYnVzX2ZtdCA9PSBNRURJQV9CVVNfRk1UX1VZWVZZWThfMF81
WDI0KQo+IEBAIC0xMjMsNyArMTIzLDcgQEAgc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIG1l
c29uX2VuY29kZXJfaGRtaV9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fYnJpZGdlICpicmkKPiAgIAlz
dHJ1Y3QgbWVzb25fZW5jb2Rlcl9oZG1pICplbmNvZGVyX2hkbWkgPSBicmlkZ2VfdG9fbWVzb25f
ZW5jb2Rlcl9oZG1pKGJyaWRnZSk7Cj4gICAJc3RydWN0IG1lc29uX2RybSAqcHJpdiA9IGVuY29k
ZXJfaGRtaS0+cHJpdjsKPiAgIAlib29sIGlzX2hkbWkyX3NpbmsgPSBkaXNwbGF5X2luZm8tPmhk
bWkuc2NkYy5zdXBwb3J0ZWQ7Cj4gLQl1bnNpZ25lZCBsb25nIGxvbmcgY2xvY2sgPSBtb2RlLT5j
bG9jayAqIDEwMDA7Cj4gKwl1bnNpZ25lZCBsb25nIGxvbmcgY2xvY2sgPSAodW5zaWduZWQgbG9u
ZyBsb25nKSBtb2RlLT5jbG9jayAqIDEwMDA7Cj4gICAJdW5zaWduZWQgbG9uZyBsb25nIHBoeV9m
cmVxOwo+ICAgCXVuc2lnbmVkIGxvbmcgbG9uZyB2Y2xrX2ZyZXE7Cj4gICAJdW5zaWduZWQgbG9u
ZyBsb25nIHZlbmNfZnJlcTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
