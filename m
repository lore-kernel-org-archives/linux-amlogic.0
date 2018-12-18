Return-Path: <SRS0=QuO6=O3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF224C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 12:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE19A217D8
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 12:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ijurtemT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qz9HzBGe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE19A217D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVF/vonDzOWRcQi65ScxFL8AMtObWxoV0lt8Wb6XUHM=; b=ijurtemTSgwcGc
	0xzjOw8N2YwwddHkUmq1s4iDciXMOPq1lRTc4+OxR97NqJqdVEpF8ubBFSGLUJGof0Yuwm0CG86o0
	eqkFEriIVtT+9BZCng2nYUrX3e8seB2pQxmXO8kOuWFwtSDMU5/S2zOrlIZKRsHqvoPFs9LEwSIDT
	T6OY3+c/bp4jgeJsV/hf0juEUNVMdJ7ACPZauSxfj9x9TI2QO4EGjG8z+XB+sTCCDm5db6BGaOI/6
	rM32x431vWSUyAZY2P4RVHX6VRaSvGWxAB+BAunZVp8foCjhoURj8SM7ztvLOD8p/ghlt/UtHx2cc
	ZCNRznbhRwDjANLWHpQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZEdJ-0004vw-0g; Tue, 18 Dec 2018 12:37:57 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZEdF-0004v5-W5
 for linux-amlogic@lists.infradead.org; Tue, 18 Dec 2018 12:37:55 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20181218123742euoutp013f07806fee7bdb1caa6ad8ba9398162f~xbZu8adha1299612996euoutp014
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Dec 2018 12:37:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20181218123742euoutp013f07806fee7bdb1caa6ad8ba9398162f~xbZu8adha1299612996euoutp014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1545136662;
 bh=OyBRWm0JJnobOY2Z5eCg8+D/ocDksLLUXcr4jGsmJSg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qz9HzBGeuth/oqu7EruSg8QOz87pyfP9irH7H41VvnlWHQcdJeNDeLgMVxp7XCqL7
 53Zcq2Lbb21D8Dzss92ZAobYYQHMKhnRe8OdxyKPAyn3rLZjwjmVgyj5AmbC4M5Hsw
 ShtquxcmcECTLDymDHXaPxEwEYQV0XndsKH4sqG0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20181218123741eucas1p2f221cf36d0860cfbadd783ac0cfbeb02~xbZtxj_FP3061530615eucas1p2L;
 Tue, 18 Dec 2018 12:37:41 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 86.4D.04441.51AE81C5; Tue, 18
 Dec 2018 12:37:41 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20181218123740eucas1p2aa6e1be00837c57319b0d06fc5ff3e4d~xbZs2FKoD1194711947eucas1p2f;
 Tue, 18 Dec 2018 12:37:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20181218123740eusmtrp22679c11fe873495bb73e08bca8667476~xbZsnjsHf2146021460eusmtrp2Z;
 Tue, 18 Dec 2018 12:37:40 +0000 (GMT)
X-AuditID: cbfec7f2-5e3ff70000001159-58-5c18ea152345
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id BA.4B.04128.41AE81C5; Tue, 18
 Dec 2018 12:37:40 +0000 (GMT)
Received: from [106.120.43.17] (unknown [106.120.43.17]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20181218123739eusmtip2be94f6e0f24be0d33c1dd1506db0619c~xbZsR8ead2039520395eusmtip2f;
 Tue, 18 Dec 2018 12:37:39 +0000 (GMT)
Subject: Re: [PATCH RFC v2 3/8] drm/meson: add support for HDMI2.0 2160p modes
To: Neil Armstrong <narmstrong@baylibre.com>, architt@codeaurora.org,
 Laurent.pinchart@ideasonboard.com
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <ee77da70-e16b-1d98-8169-8461ec3a3ff1@samsung.com>
Date: Tue, 18 Dec 2018 13:37:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181130134301.17963-4-narmstrong@baylibre.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsWy7djP87qiryRiDA5uEbRo6njLanHl63s2
 i86JS9gtFszmtri8aw6bxaG+aAc2j/c3Wtk9Lvf1MnnM7pjJ6nG/+ziTx+Yl9R6fN8kFsEVx
 2aSk5mSWpRbp2yVwZax/vpCp4AN7Rfft52wNjEfZuhg5OSQETCTeHPoJZHNxCAmsYJRY93kC
 M4TzhVHizIofUM5nRombT58zwbTcnbmFHSKxnFHifPdVFgjnLaPE+4lTwQYLCwRITH07gQXE
 FhHIlPjZt5QdxGYWSJO4NeMQK4jNJqAp8XfzTbB6XgE7iUndT8HqWQRUJX48/gZWLyoQIdFx
 fzVUjaDEyZlPwGo4BWwlOvbNY4GYKS/RvHU2M4QtLnHryXwmkIMkBFaxSxx5tZYZ4mwXiVML
 /7JD2MISr45vgbJlJP7vnA/1Wr1E08wrzBDNHYwSJxYvhwaTtcTh4xeBruYA2qApsX6XPkTY
 UeLD5i8sIGEJAT6JG28FIW7gk5i0bTozRJhXoqNNCKJaUeL+2a1Q14hLLL3wlW0Co9IsJJ/N
 QvLNLCTfzELYu4CRZRWjeGppcW56arFhXmq5XnFibnFpXrpecn7uJkZg+jn97/inHYxfLyUd
 YhTgYFTi4WU4IR4jxJpYVlyZe4hRgoNZSYT3VqlEjBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe
 aoYH0UIC6YklqdmpqQWpRTBZJg5OqQZGlpYzWwrtXz1cvXVnuDG3gNvTrBmJSbL3VpXMtmZ3
 2zon8H3gxIPZ1RfbdINKxY5OXrpOdlpjlFUfs06P14V1tuHnHZayG/Pv3r1GSrLLVv5l1Ll0
 AVvW+pazdpZKjrOrvfIzrHZ2fDE77fJgRyFPS1jx3PsHa01e7Ks6uODY7IdFi5tqO58rsRRn
 JBpqMRcVJwIAjgJSbTsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRmVeSWpSXmKPExsVy+t/xe7oiryRiDGZ18lk0dbxltbjy9T2b
 RefEJewWC2ZzW1zeNYfN4lBftAObx/sbrewel/t6mTxmd8xk9bjffZzJY/OSeo/Pm+QC2KL0
 bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0MtY/X8hU
 8IG9ovv2c7YGxqNsXYycHBICJhJ3Z25h72Lk4hASWMooseb9WxaIhLjE7vlvmSFsYYk/17rY
 IIpeM0rsPr6UCSQhLOAn8fj+QbBJIgKZEg+mXGQEsZkF0iT+PAVpBmk4zChxfv9LdpAEm4Cm
 xN/NN8EaeAXsJCZ1PwXbxiKgKvHj8TewGlGBCImzL9cxQtQISpyc+QSshlPAVqJj3zwWiAXq
 En/mXWKGsOUlmrfOhrLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GIjveLE
 3OLSvHS95PzcTYzAiNt27OeWHYxd74IPMQpwMCrx8DKcEI8RYk0sK67MPcQowcGsJMJ7q1Qi
 Rog3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPzgckgryTe0NTQ3MLS0NzY3NjMQkmc97xBZZSQ
 QHpiSWp2ampBahFMHxMHp1QDI+Pba8efTPNc4XTKpULfSpW32VL18OwNaz/8NWbKuPT0ufyc
 15O2Lre+byogURP5fNPSJouYuf+WcxwOq1p+qqRp/mFDZ4H5j1im5/B/3801r1Y9bvbuH4ed
 /Pv5P1qeq7v1rjJ/Z9COeJeYxGP9+85EMGUZmq9ynReesLHuXMFumS1VE9kKm5VYijMSDbWY
 i4oTAZwnlxTOAgAA
X-CMS-MailID: 20181218123740eucas1p2aa6e1be00837c57319b0d06fc5ff3e4d
X-Msg-Generator: CA
X-RootMTR: 20181130134343epcas3p10313babda35e397cd1218af8ba3e1dbd
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181130134343epcas3p10313babda35e397cd1218af8ba3e1dbd
References: <20181130134301.17963-1-narmstrong@baylibre.com>
 <CGME20181130134343epcas3p10313babda35e397cd1218af8ba3e1dbd@epcas3p1.samsung.com>
 <20181130134301.17963-4-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_043754_161877_838DC572 
X-CRM114-Status: GOOD (  13.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMzAuMTEuMjAxOCAxNDo0MiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gTm93IHdlIHN1cHBv
cnQgdGhlIFRNRFMgQ2xvY2sgPiAzLjRHSHogYW5kIHN1cHBvcnQgdGhlIFNDREMgQ29udHJvbAo+
IG9wZXJhdGlvbiBpbiB0aGUgRFctSERNSSBDb250cm9sbGVyLCB3ZSBjYW4gZW5hYmxlIHN1cHBv
cnQgZm9yIHRoZQo+IEhETUkyLjAgMzg0MHgyMTYwQDYwLzUwIFJHQjQ0NCBkaXNwbGF5IG1vZGVz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jIHwgMiArKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNv
bl92ZW5jLmMKPiBpbmRleCAwYmEwNGY2ODEzZTYuLjY2ZDczYTkzMmQxOSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3ZlbmMuYwo+IEBAIC04NDgsNiArODQ4LDggQEAgc3RydWN0IG1lc29u
X2hkbWlfdmVuY192aWNfbW9kZSB7Cj4gIAl7IDkzLCAmbWVzb25faGRtaV9lbmNwX21vZGVfMjE2
MHAyNCB9LAo+ICAJeyA5NCwgJm1lc29uX2hkbWlfZW5jcF9tb2RlXzIxNjBwMjUgfSwKPiAgCXsg
OTUsICZtZXNvbl9oZG1pX2VuY3BfbW9kZV8yMTYwcDMwIH0sCj4gKwl7IDk2LCAmbWVzb25faGRt
aV9lbmNwX21vZGVfMjE2MHAyNSB9LAo+ICsJeyA5NywgJm1lc29uX2hkbWlfZW5jcF9tb2RlXzIx
NjBwMzAgfSwKPiAgCXsgMCwgTlVMTH0sIC8qIHNlbnRpbmVsICovCj4gIH07Cj4gIAoKUmV2aWV3
ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMK
QW5kcnplagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
