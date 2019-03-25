Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48000C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:37:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BE62085A
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SwBPcQ9b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JlDusdM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12BE62085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4OzcobDvpYVPl7q4hMncb9o3Q0gJEf0Q+mPCF3BQ60=; b=SwBPcQ9bDE6K6b
	keWpua9qf9N9ny+NktN2Fop/+pKRtC6aahFLFsFmXb3taQsGYbGGx6BmGNkQZeeymQckwuuJXQ+ts
	/m4Cpfus/kYXjxQnUDAd6VItX7VQUKFFZe1wNIO60Mb6Rb9rSwhcMeFscIixGAe16yfILcIhP4nJj
	UyPbkO4JtKedayiu+g8153CdsFJDRJwp9cDqIrutobxs50AagJ9l7mN3xBYInu0r2oAqEalGpnyGU
	zhEJfmgj8eIdnE9Om6wDE/NiC4glu0mZ51+JaC4NSWNFEYgdxMJkX+SNv5BieFQf8CPTGX9wrWtBQ
	AqAK2PAjk1nOT7/2McBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Nuo-00006u-SU; Mon, 25 Mar 2019 11:37:18 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Nul-0008WM-N8
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 11:37:17 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190325113704euoutp0199b2a64870bdbc29f8c5e09ff0439d90~PMJfHdfIT2608626086euoutp01z
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 11:37:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190325113704euoutp0199b2a64870bdbc29f8c5e09ff0439d90~PMJfHdfIT2608626086euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1553513824;
 bh=/sfpTrnXm1ev+2Q5CfQhERKPxPBrDD/nNA0BG9VaNzo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=JlDusdM6ImeplLbWzhvA6U8Gx8M+H0i3fuec9uXaqQqnkK1XoI8tZP0Mbb0AEvqxr
 SOyxRBaGMzTmgC8xYjvbrArOCrjfLt7fDZH1k8wpNj16eKoeCZIUHpBEX+lKZO+EYK
 pUtd1btjSKPavo95PviWGXq/4G1NcqH5HlUONrMk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190325113704eucas1p2a40bb32ebf39bf93d1d50ad2ce2e8194~PMJekFgT81324213242eucas1p2e;
 Mon, 25 Mar 2019 11:37:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 68.2A.04325.F5DB89C5; Mon, 25
 Mar 2019 11:37:03 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190325113703eucas1p1e7cb22f691c3fdc428c643237cf2c7a3~PMJdtC3i40487604876eucas1p1N;
 Mon, 25 Mar 2019 11:37:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190325113703eusmtrp2d55a837999d38dff2750b7dc3026af90~PMJdfGX-O2685526855eusmtrp2N;
 Mon, 25 Mar 2019 11:37:03 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-d2-5c98bd5fd2d2
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 0A.A3.04146.F5DB89C5; Mon, 25
 Mar 2019 11:37:03 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190325113702eusmtip24b60d3cc42230cafdb061ea09fc24b95~PMJdExWvu0624406244eusmtip2Y;
 Mon, 25 Mar 2019 11:37:02 +0000 (GMT)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: disable SCDC configuration for
 invalid setups
To: Neil Armstrong <narmstrong@baylibre.com>,
 Laurent.pinchart@ideasonboard.com, heiko@sntech.de, robh@kernel.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <6faa365e-2a4d-3666-b00f-79f36258106c@samsung.com>
Date: Mon, 25 Mar 2019 12:37:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190315095414.28520-1-narmstrong@baylibre.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7djP87rxe2fEGBw4Ym1x5et7Nov/j16z
 Wlz9/pLZonPiEnaLBbO5LS7vmsNm8enBf2aLQ33RFv/37GB34PR4f6OV3WN2x0xWj02rOtk8
 7ncfZ/LYvKTe40DvZBaP7dfmMXt83iQXwBHFZZOSmpNZllqkb5fAlfHl9BnGgq9yFbtfz2Rq
 YHwi0cXIySEhYCKxfO0F9i5GLg4hgRWMEj27zrBAOF8YJXaeuA2V+cwo8XvVeXaYlhWNh5kh
 EssZJT62H4By3jJKzJt7kBWkSlggUuLIlKMsILaIQLHE8T8vmECKmAWWMkq8f9wCVsQmoCnx
 d/NNNhCbV8BO4tzOvWA2i4CqROPvRWC2qECExPunu1kgagQlTs58AmZzCthKrHy7nhHEZhaQ
 l2jeOpsZwhaXuPVkPtgyCYFz7BLTTjYCLeMAclwklnzXg3hBWOLV8S1Q78hI/N8JUg9i10vc
 X9HCDNHbwSixdcNOZoiEtcTh4xfB5jADHb1+lz5E2FHi/OFlzBDj+SRuvBWEOIFPYtK26VBh
 XomONiGIakWJ+2e3Qg0Ul1h64SvbBEalWUgem4XkmVlInpmFsHcBI8sqRvHU0uLc9NRi47zU
 cr3ixNzi0rx0veT83E2MwIR1+t/xrzsY9/1JOsQowMGoxMP7Yuf0GCHWxLLiytxDjBIczEoi
 vE9EZ8QI8aYkVlalFuXHF5XmpBYfYpTmYFES561meBAtJJCeWJKanZpakFoEk2Xi4JRqYNxV
 e5nrowHPY06Tx7IJDzcUu/mWJnMsn3XK3vXp/laeC2u7NR4rJsfvVLx8Y2u62oImhfORZl87
 D/+OjHDMWi/G1XPsNeeqgMYjEttN/Qq8VKzkZs59W/BRwW1XwEYdld1hD7g6hRp8eM+YL2yP
 9lD2/b7u4VXOadfeRu2pkLO4ynom9J5ykRJLcUaioRZzUXEiALTUktJUAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7rxe2fEGCy6yWZx5et7Nov/j16z
 Wlz9/pLZonPiEnaLBbO5LS7vmsNm8enBf2aLQ33RFv/37GB34PR4f6OV3WN2x0xWj02rOtk8
 7ncfZ/LYvKTe40DvZBaP7dfmMXt83iQXwBGlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqln
 aGwea2VkqqRvZ5OSmpNZllqkb5egl/Hl9BnGgq9yFbtfz2RqYHwi0cXIySEhYCKxovEwcxcj
 F4eQwFJGick/VrNBJMQlds9/ywxhC0v8udbFBlH0mlFi2pSdYAlhgUiJI1OOsoDYIgLFEgdW
 bGAFKWIGmTT/6D2ojgmMEqeONzOBVLEJaEr83XwTbAWvgJ3EuZ17wWwWAVWJxt+LwGxRgQiJ
 uxdfsEDUCEqcnPkEzOYUsJVY+XY9I4jNLKAu8WfeJWYIW16ieetsKFtc4taT+UwTGIVmIWmf
 haRlFpKWWUhaFjCyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/dxAiM0m3Hfm7ewXhpY/AhRgEO
 RiUeXoc902OEWBPLiitzDzFKcDArifA+EZ0RI8SbklhZlVqUH19UmpNafIjRFOi5icxSosn5
 wASSVxJvaGpobmFpaG5sbmxmoSTOe96gMkpIID2xJDU7NbUgtQimj4mDU6qBUYmpZqHB68f5
 4h9z5mRcXa7wseRyUt5e3ieXlZh/tl8Q9WG78sRu82d2ly1njrBeZ87IWBpqEvC4RNgr49NF
 25tXkpgqPlm9E5y5y2nm/DNRuWurZM6ucnBqDPxe+D5beI3x4etthaxLdJ/7p1nuPv3XI69X
 dmugjHiu36+mWt4HLXk9mi4tSizFGYmGWsxFxYkAnsoayegCAAA=
X-CMS-MailID: 20190325113703eucas1p1e7cb22f691c3fdc428c643237cf2c7a3
X-Msg-Generator: CA
X-RootMTR: 20190315095421epcas4p3321555f6918dc4e420acdbf23121338f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190315095421epcas4p3321555f6918dc4e420acdbf23121338f
References: <CGME20190315095421epcas4p3321555f6918dc4e420acdbf23121338f@epcas4p3.samsung.com>
 <20190315095414.28520-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_043715_886757_0C013FF4 
X-CRM114-Status: GOOD (  25.83  )
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
Cc: linux-amlogic@lists.infradead.org, jernej.skrabec@siol.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTUuMDMuMjAxOSAxMDo1NCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gVGhpcyBwYXRjaCBp
cyBhbiBhdHRlbXB0IHRvIGxpbWl0IEhETUkgMi4wIFNDREMgc2V0dXAgd2hlbiA6Cj4gLSB0aGUg
U29DIGVtYmVkcyBhbiBIRE1JIDEuNCBvbmx5IGNvbnRyb2xsZXIKPiAtIHRoZSBFRElEIHN1cHBv
cnRzIFNDREMgYnV0IG5vdCBzY3JhbWJsaW5nCj4gLSB0aGUgRURJRCBzdXBwb3J0cyBTQ0RDIHNj
cmFtYmxpbmcgYnV0IG5vdCBmb3IgbG93IFRNRFMgYml0IHJhdGVzLAo+ICAgd2hpbGUgb25seSBz
dXBwb3J0aW5nIGxvdyBUTURTIGJpdCByYXRlcwo+Cj4gVGhpcyB0byBhdm9pZCBjb21tdW5pY2F0
aW5nIHdpdGggdGhlIFNDREMgRERDIHNsYXZlIHVuY2Vzc2FyeSwgYW5kCj4gc2V0dGluZyB0aGUg
RFctSERNSSBUTURTIFNjcmFtYmxlciBzZXR1cCB3aGVuIG5vdCBzdXBwb3J0ZWQgYnkgdGhlCj4g
dW5kZXJseWluZyBoYXJkd2FyZS4KPgo+IFJlcG9ydGVkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgo+IEZpeGVzOiAyNjRmY2U2Y2MyYzEgKCJkcm0vYnJpZGdlOiBkdy1oZG1pOiBB
ZGQgU0NEQyBhbmQgVE1EUyBTY3JhbWJsaW5nIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IE5l
aWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4KPiAtLS0KPgo+IFJvYiwKPgo+
IHRoaXMgcGF0Y2ggc2hvdWxkIGFsc28gc29sdmUgeW91ciBpc3N1ZSB3aXRoIHlvdXIgMTEnIGRp
c3BsYXksIGNvdWxkIHlvdQo+IHRlc3QgaXQgPwo+IElmIHRoaXMgd29ya3MsIEkgd2lsbCBmb2N1
cyBvbiB0aGUgdW5kZXJseWluZyBpc3N1ZSB3aGVyZSB0aGUgUkszMzk5IFNvQwo+IGZyZWV6ZXMg
aW4geW91ciBzZXR1cC4KPgo+IFRoYW5rcywKPiBOZWlsCj4KPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCAzNCArKysrKysrKysrKysrKysrKysrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gaW5kZXggYTYzZTVmMGRhZTU2
Li5kYjc2MTMyOWExZTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWkuYwo+IEBAIC0xMDM3LDYgKzEwMzcsMzEgQEAgdm9pZCBkd19oZG1pX3BoeV9pMmNfd3Jp
dGUoc3RydWN0IGR3X2hkbWkgKmhkbWksIHVuc2lnbmVkIHNob3J0IGRhdGEsCj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTF9HUEwoZHdfaGRtaV9waHlfaTJjX3dyaXRlKTsKPiAgCj4gKy8qIEZpbHRlciBv
dXQgaW52YWxpZCBzZXR1cHMgdG8gYXZvaWQgY29uZmlndXJpbmcgU0NEQyBhbmQgc2NyYW1ibGlu
ZyAqLwo+ICtzdGF0aWMgYm9vbCBkd19oZG1pX3N1cHBvcnRfc2NkYyhzdHJ1Y3QgZHdfaGRtaSAq
aGRtaSkKPiArewo+ICsJc3RydWN0IGRybV9kaXNwbGF5X2luZm8gKmRpc3BsYXkgPSAmaGRtaS0+
Y29ubmVjdG9yLmRpc3BsYXlfaW5mbzsKPiArCj4gKwkvKiBDb21wbGV0ZWx5IGRpc2FibGUgU0NE
QyBzdXBwb3J0IGZvciBvbGRlciBjb250cm9sbGVycyAqLwo+ICsJaWYgKGhkbWktPnZlcnNpb24g
PCAweDIwMGEpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCS8qIERpc2FibGUgaWYgU0NEQyBp
cyBub3Qgc3VwcG9ydGVkLCBvciBpZiBhbiBIRi1WU0RCIGJsb2NrIGlzIGFic2VudCAqLwo+ICsJ
aWYgKCFkaXNwbGF5LT5oZG1pLnNjZGMuc3VwcG9ydGVkIHx8Cj4gKwkgICAgIWRpc3BsYXktPmhk
bWkuc2NkYy5zY3JhbWJsaW5nLnN1cHBvcnRlZCkKPiArCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJ
LyoKPiArCSAqIERpc2FibGUgaWYgZGlzcGxheSBvbmx5IHN1cHBvcnQgbG93IFRNRFMgcmF0ZXMg
YW5kIHNjcmFtYmxpbmcKPiArCSAqIGZvciBsb3cgcmF0ZXMgaXMgbm90IHN1cHBvcnRlZCBlaXRo
ZXIKPiArCSAqLwo+ICsJaWYgKCFkaXNwbGF5LT5oZG1pLnNjZGMuc2NyYW1ibGluZy5sb3dfcmF0
ZXMgJiYKPiArCSAgICBkaXNwbGF5LT5tYXhfdG1kc19jbG9jayA8PSAzNDAwMDApCj4gKwkJcmV0
dXJuIGZhbHNlOwo+ICsKPiArCXJldHVybiB0cnVlOwo+ICt9Cj4gKwo+ICAvKgo+ICAgKiBIRE1J
Mi4wIFNwZWNpZmllcyB0aGUgZm9sbG93aW5nIHByb2NlZHVyZSBmb3IgSGlnaCBUTURTIEJpdCBS
YXRlczoKPiAgICogLSBUaGUgU291cmNlIHNoYWxsIHN1c3BlbmQgdHJhbnNtaXNzaW9uIG9mIHRo
ZSBUTURTIGNsb2NrIGFuZCBkYXRhCj4gQEAgLTEwNTUsNyArMTA4MCw3IEBAIHZvaWQgZHdfaGRt
aV9zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+ICAJdW5z
aWduZWQgbG9uZyBtdG1kc2Nsb2NrID0gaGRtaS0+aGRtaV9kYXRhLnZpZGVvX21vZGUubXRtZHNj
bG9jazsKPiAgCj4gIAkvKiBDb250cm9sIGZvciBUTURTIEJpdCBQZXJpb2QvVE1EUyBDbG9jay1Q
ZXJpb2QgUmF0aW8gKi8KPiAtCWlmIChoZG1pLT5jb25uZWN0b3IuZGlzcGxheV9pbmZvLmhkbWku
c2NkYy5zdXBwb3J0ZWQpIHsKPiArCWlmIChkd19oZG1pX3N1cHBvcnRfc2NkYyhoZG1pKSkgewo+
ICAJCWlmIChtdG1kc2Nsb2NrID4gSERNSTE0X01BWF9UTURTQ0xLKQo+ICAJCQlkcm1fc2NkY19z
ZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKGhkbWktPmRkYywgMSk7Cj4gIAkJZWxzZQo+IEBAIC0x
NTc5LDggKzE2MDQsOSBAQCBzdGF0aWMgdm9pZCBoZG1pX2F2X2NvbXBvc2VyKHN0cnVjdCBkd19o
ZG1pICpoZG1pLAo+ICAKPiAgCS8qIFNldCB1cCBIRE1JX0ZDX0lOVklEQ09ORiAqLwo+ICAJaW52
X3ZhbCA9IChoZG1pLT5oZG1pX2RhdGEuaGRjcF9lbmFibGUgfHwKPiAtCQkgICB2bW9kZS0+bXRt
ZHNjbG9jayA+IEhETUkxNF9NQVhfVE1EU0NMSyB8fAo+IC0JCSAgIGhkbWlfaW5mby0+c2NkYy5z
Y3JhbWJsaW5nLmxvd19yYXRlcyA/Cj4gKwkJICAgKGR3X2hkbWlfc3VwcG9ydF9zY2RjKGhkbWkp
ICYmCj4gKwkJICAgICh2bW9kZS0+bXRtZHNjbG9jayA+IEhETUkxNF9NQVhfVE1EU0NMSyB8fAo+
ICsJCSAgICAgaGRtaV9pbmZvLT5zY2RjLnNjcmFtYmxpbmcubG93X3JhdGVzKSkgPwo+ICAJCUhE
TUlfRkNfSU5WSURDT05GX0hEQ1BfS0VFUE9VVF9BQ1RJVkUgOgo+ICAJCUhETUlfRkNfSU5WSURD
T05GX0hEQ1BfS0VFUE9VVF9JTkFDVElWRSk7CgoKVGhlIGNvbmRpdGlvbiBpcyBoYXJkIHRvIHJl
YWQsIGJ1dCBJIGhhdmUgbm8gaWRlYSBhdG0gaG93IG1ha2UgaXQKY29tcGFjdCBhbmQgcHJldHR5
IDopCgpBbnl3YXk6CgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5n
LmNvbT4KCgpBcyBJIHJlbWVtYmVyIHlvdSBjYW4gcXVldWUgaXQgdG8gZHJtLW1pc2MsIGlmIG5v
dCBJIGNhbiBkbyBpdCwganVzdCBsZXQKbWUga25vdy4KCgrCoC0tClJlZ2FyZHMKQW5kcnplagoK
Cgo+ICAKPiBAQCAtMTY0Niw3ICsxNjcyLDcgQEAgc3RhdGljIHZvaWQgaGRtaV9hdl9jb21wb3Nl
cihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwKPiAgCX0KPiAgCj4gIAkvKiBTY3JhbWJsaW5nIENvbnRy
b2wgKi8KPiAtCWlmIChoZG1pX2luZm8tPnNjZGMuc3VwcG9ydGVkKSB7Cj4gKwlpZiAoZHdfaGRt
aV9zdXBwb3J0X3NjZGMoaGRtaSkpIHsKPiAgCQlpZiAodm1vZGUtPm10bWRzY2xvY2sgPiBIRE1J
MTRfTUFYX1RNRFNDTEsgfHwKPiAgCQkgICAgaGRtaV9pbmZvLT5zY2RjLnNjcmFtYmxpbmcubG93
X3JhdGVzKSB7Cj4gIAkJCS8qCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
