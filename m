Return-Path: <SRS0=QuO6=O3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD90C43387
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 13:41:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1763F21873
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 13:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ubokLg7J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="bv9MlXRc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1763F21873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLbgb8itrfJ0aPLCx0rQLhvoa85ZhTwWENWVarRorSs=; b=ubokLg7JhN7mRE
	yVh6PB5cMmgv/tjM0uv4rlwZO9PFCnvNsuYPVo/uO1VrD2wipC1Rlro29JYZ2urek4wNzMY4jhEbq
	49AWalQWsO3Vn2E9FoES9fl6oH9+BSSqz6jjQm+J6HiDQQyFc30J6/+ET7SmcItZSAZwtyTdHRIQr
	ueaUjgNQk8qzqpENn/l1VQLgFIvHsQbHOVxtwrC/dBDq/3B31sT8r7sPan8MLQmIYwU5e+RAZHqUs
	0r/WavBas/1kDqNs57MnKelGvknZ5mvJXcPZGSUGWa301eaaLV2vb/xKrVN3ANR7gGz5vSPNMPE0P
	z2gkP5eUpQAv3fu/5R3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZFcj-0001pt-81; Tue, 18 Dec 2018 13:41:25 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZFcf-0001dM-6l
 for linux-amlogic@lists.infradead.org; Tue, 18 Dec 2018 13:41:23 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20181218134107euoutp02a075f7515e34364621449d8e75140c07~xcRGxYiNC2503225032euoutp02d
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Dec 2018 13:41:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20181218134107euoutp02a075f7515e34364621449d8e75140c07~xcRGxYiNC2503225032euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1545140468;
 bh=iyjckPEYyq+HvUcXDTCFjsJvM7TiJLZ4jxRj7wroLFo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=bv9MlXRcEziyNw07hnLjUPn76TAujtVlx3xDwXF51OEoVit/xu+oNhGfVzQ6LRqb8
 jAx+TuRFWbxedJt+HUX/AgQ9wLCPylAJa0GeLxRmKGkkvKqiU+hk4s60ZANJ8e1n8w
 n/qfMTMOciR8H/ukoHvwvX0krhxkW2EH2j1WwZEY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20181218134107eucas1p28ce1225336155da529f70e0664e78521~xcRF_hG6x1713017130eucas1p27;
 Tue, 18 Dec 2018 13:41:07 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 42.32.04806.2F8F81C5; Tue, 18
 Dec 2018 13:41:06 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20181218134106eucas1p135cc5d59969b78032ce519c11bc908b3~xcRFOZtTc0569405694eucas1p1c;
 Tue, 18 Dec 2018 13:41:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20181218134106eusmtrp1e41bc96e2543e841b6135207fedea238~xcRE-K0Ih1327813278eusmtrp1z;
 Tue, 18 Dec 2018 13:41:06 +0000 (GMT)
X-AuditID: cbfec7f5-34dff700000012c6-eb-5c18f8f217d5
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 8C.7E.04284.1F8F81C5; Tue, 18
 Dec 2018 13:41:05 +0000 (GMT)
Received: from [106.120.43.17] (unknown [106.120.43.17]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20181218134105eusmtip263f90ff3afa6392bad83785b4053c94d~xcREfp4BI0563005630eusmtip2W;
 Tue, 18 Dec 2018 13:41:05 +0000 (GMT)
Subject: Re: [PATCH RFC v2 4/8] drm/bridge: dw-hdmi: add support for YUV420
 output
To: Neil Armstrong <narmstrong@baylibre.com>, architt@codeaurora.org,
 Laurent.pinchart@ideasonboard.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, maxime.ripard@bootlin.com
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <edebea46-7edd-a5e1-d673-6df6a12fc99b@samsung.com>
Date: Tue, 18 Dec 2018 14:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181130134301.17963-5-narmstrong@baylibre.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRj1t/vY3Wx1vRX70B60kEwojR5csEQp6P5ZWZQp2aqbGzmtXddD
 C8VHLlOrhXObWlKaopE2NWP2gEVuUZmhiBmlliVlIqRSQrPc7iT/O9853+E758ePwpi3RDCl
 TU3n9anqFBUpxx90TL9Z9/M3JEZWmTexOcYxgu2ZGifZv59GCbbSdIG9dK1aylaVB7LdjgqS
 Hfz2FLHOkgT2w0c3zjbmRcQEcuN9+VLuxt1MrrukWMKVG60EN3DZJeGaq7O4K55IzmN7inNt
 vTcwbsK+Ypf8oHzrMT5Fe5rXR0QflmuGhn5gJ+8TZ9sfOYls1IoXIhkF9Cbo77gyi+UUQ9ch
 cM+U+odJBKO/8jBxmEDwvMtCzFnMBWZCFGoR9NQ/Jr0CQ48hGC4JLUQUtZjeCx0mn3kJnSeB
 X5YvvgGjixG0fO7EvAaSXgue5nc+s4KOBrPFKvFinA4F9+iEL+BS+gAYBxr8O0Hwwjrs42X0
 NmhvakdejNErIbe1HBOxEvqHb0q8x4Aek8L7snp/0x3Q7rH68WL47mqRingZvLxe5OezIMfa
 g4lm4+xr3K4lRSEKnrneEt5q2GzqRkeESMeCzdGNe2mgF0LfWJCYYSGYHpRhIq0A40VG3F4F
 A69bMREroaZriryKVLZ5zWzz2tjmtbH9v1uF8Hqk5A2CLpkXNqbyZ9YLap1gSE1efzRNZ0ez
 H+3ljGvqIXry54gT0RRSLVAEuJWJDKE+LZzTORFQmGqJot8AiYzimPpcBq9PS9IbUnjBiUIo
 XKVUZAYMJjB0sjqdP8HzJ3n9nCqhZMHZ6M7umm5TRVJQ75bVzcbK7Ka2EPyV4ojlPNGx72vp
 5vjc5VsitRvyG8iMmEWnzjAZg+Oejx6pjJ1MUIRPh7+XF2nsRWFaqtJj2DnUKWnYuH2/UFia
 LhxIe6fTn42y3xtxLI2DvXWHYolqB1V36/jwiCVuz642TfzAmgwyqyDsqAoXNOoN4ZheUP8D
 WFW/p2QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7off0jEGKx6YW3R1PGW1eLK1/ds
 Fv8fvWa1mDup1qJz4hJ2iwWzuS0u75rDZvHg5X5Gi0N90RZ3751gsVjfou/A7fH+Riu7x7w1
 1R6X+3qZPGZ3zGT1uN99nMlj85J6j/6/Bh5/Z+1n8dh+bR6zx+dNcgFcUXo2RfmlJakKGfnF
 JbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZDx++YS7YyFqxe88h1gbG
 rSxdjJwcEgImEtPap7GC2EICSxkllny0g4iLS+ye/5YZwhaW+HOti62LkQuo5jWjxJSOF0AN
 HBzCAiESxyaB1YgItDBJvHxuDVLDLNDLKPHm6hcmiIbDjBK995rBtrEJaEr83XyTDcTmFbCT
 mDZjJhOIzSKgKnHi9WewGlGBCImzL9cxQtQISpyc+QQszilgK7F7w26wOLOAusSfeZeYIWx5
 ieats6FscYlbT+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYUK84Mbe4NC9dLzk/
 dxMjMIK3Hfu5eQfjpY3BhxgFOBiVeHgZTojHCLEmlhVX5h5ilOBgVhLhvVUqESPEm5JYWZVa
 lB9fVJqTWnyI0RTouYnMUqLJ+cDkklcSb2hqaG5haWhubG5sZqEkznveoDJKSCA9sSQ1OzW1
 ILUIpo+Jg1OqgbEx15Vn/0MX/ymSeawxZqebdKY+bDXiVPXnS/yn2i/a+sNWcs7nkGsCFooW
 0+fl6ZYWXNp6nTGQ59babytidxz41xWX8kApzvrL7LUHlnz9/uHqRpndtUbSlt9mPPnw6GmI
 o57Vjfe7nP5Kfs8qbTbc+WabkrT5PS+jc/WZ9ivS9R+43F6g/EmJpTgj0VCLuag4EQAYj9zl
 9gIAAA==
X-CMS-MailID: 20181218134106eucas1p135cc5d59969b78032ce519c11bc908b3
X-Msg-Generator: CA
X-RootMTR: 20181130134319epcas5p1681fc1aa84565eb0ae8824c00515b9ae
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20181130134319epcas5p1681fc1aa84565eb0ae8824c00515b9ae
References: <20181130134301.17963-1-narmstrong@baylibre.com>
 <CGME20181130134319epcas5p1681fc1aa84565eb0ae8824c00515b9ae@epcas5p1.samsung.com>
 <20181130134301.17963-5-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_054121_382778_8F13D4AF 
X-CRM114-Status: GOOD (  12.34  )
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
 dri-devel@lists.freedesktop.org, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMzAuMTEuMjAxOCAxNDo0MiwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSW4gb3JkZXIgdG8g
c3VwcG9ydCB0aGUgSERNSTIuMCBZVVY0MjAgZGlzcGxheSBtb2RlcywgdGhpcyBwYXRjaAo+IGFk
ZHMgc3VwcG9ydCBmb3IgdGhlIFlVVjQyMCBUTURTIENsb2NrIGRpdmlkZWQgYnkgMiBhbmQgdGhl
IGNvbnRyb2xsZXIKPiBwYXNzdGhyb3VnaCBtb2RlLgo+Cj4gWVVWNDIwIFN5bm9wc3lzIFBIWSBz
dXBwb3J0IHdpbGwgbmVlZCBzb21lIHNwZWNpZmljIGNvbmZpZ3VyYXRpb24gdGFibGUKPiB0byBz
dXBwb3J0IHRoZXNlcyBtb2Rlcy4KPgo+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gd29yayBmcm9t
IFpoZW5nIFlhbmcgPHpoZW5neWFuZ0Byb2NrLWNoaXBzLmNvbT4gaW4KPiB0aGUgUm9ja2NoaXAg
TGludXggNC40IEJTUCBhdCBbMV0KPgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vcm9ja2NoaXAt
bGludXgva2VybmVsL3RyZWUvcmVsZWFzZS00LjQKPgo+IENjOiBaaGVuZyBZYW5nIDx6aGVuZ3lh
bmdAcm9jay1jaGlwcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5hcm1z
dHJvbmdAYmF5bGlicmUuY29tPgoKClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRh
QHNhbXN1bmcuY29tPgoKwqAtLQpSZWdhcmRzCkFuZHJ6ZWoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
