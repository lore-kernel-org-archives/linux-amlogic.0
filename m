Return-Path: <SRS0=eh9O=TW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2EBC072A4
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2019 06:08:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF5A920862
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 May 2019 06:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSzUwahN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WqnD/2NI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF5A920862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:From:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2cm/66wWYkVHlphAH+YyW22M+8ftPVmVMawEWHc4RF8=; b=cSzUwahNiYIUAS
	3PseivtqllXOa/FBH4+5pnIrMucSDRvtUSKwi6F+0Ubp/gAn855fkn2Css0FbUBPh6n7cRSGcAboQ
	H1EaX+Iy7q8MqSD/ZL3aJvoWtH+ooEUQv8l/2VKyali870f6YTAUXCZbXy2b9cZM2bw56dyP6HWkx
	mwJuIun4LWev6SPyfNrn7dcbkl0cAq0tQQd7HhVyrUN1W9VQgLjYW8+VR1JujMEwQN5BPvzEIHM89
	ckmHyAqEh36ej9vero+G6pbOhcTJ6Q29BCFnjjcFGYB69dGbdGILDZsBQJO9kj3x7EpoxHiJTd23r
	/vborRuxaAyIGIeG4TAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTKPx-0005fN-Re; Wed, 22 May 2019 06:08:01 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTKPt-0005eu-JC
 for linux-amlogic@lists.infradead.org; Wed, 22 May 2019 06:07:59 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190522060754euoutp024adbc2265893ed1f0d39dfaa45931245~g7EobXDI52269122691euoutp02N
 for <linux-amlogic@lists.infradead.org>; Wed, 22 May 2019 06:07:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190522060754euoutp024adbc2265893ed1f0d39dfaa45931245~g7EobXDI52269122691euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1558505274;
 bh=gdD8eXaR+637Q+ADEFMcqvaoMZuFCktQ0aqFc/uyg2Q=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=WqnD/2NI7W/0fvW8myaNcnF9VEhj08YlUb8bII5YQi90iJ6xQeWTXWK9fn9//VB1b
 ZeBZyMFuMLuTSMCBrPHYF7PT12lyVKnjIE6jD9aJB75GnwVTV9lnaeGO8M5ajnmgYq
 66fdZeWdX8E5fxXgOAjeUbCbkB3oQZyoOXxBAg0M=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190522060753eucas1p250b904e1ff6a144f42a71fb9d6c59254~g7En15-Al0829708297eucas1p2Q;
 Wed, 22 May 2019 06:07:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 06.F1.04298.937E4EC5; Wed, 22
 May 2019 07:07:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190522060752eucas1p139612543d67443cfb24b5d36125334ee~g7EnG7ieq1219712197eucas1p1L;
 Wed, 22 May 2019 06:07:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190522060752eusmtrp150dfaf2f33c5c4f9b220f6db4088650c~g7Em4y1-j2830728307eusmtrp19;
 Wed, 22 May 2019 06:07:52 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-03-5ce4e73922f8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D6.BF.04146.837E4EC5; Wed, 22
 May 2019 07:07:52 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190522060751eusmtip28f709a5be5efaba5dbf834cbef486f5f~g7EmTyhFp2960929609eusmtip2E;
 Wed, 22 May 2019 06:07:51 +0000 (GMT)
Subject: Re: [PATCH 1/5] drm/bridge: dw-hdmi: allow ycbcr420 modes for >=
 0x200a
To: Neil Armstrong <narmstrong@baylibre.com>, Laurent.pinchart@ideasonboard.com
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <020c82bc-15fd-6e23-a093-62abfa9b466d@samsung.com>
Date: Wed, 22 May 2019 08:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190520133753.23871-2-narmstrong@baylibre.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKKsWRmVeSWpSXmKPExsWy7djP87qWz5/EGPyfxGNx5et7Nov/j16z
 WsydVGtxavIzJour318yW5x8c5XFonPiEnaLBbO5LS7vmsNm8eDlfkaLQ33RDtwe72+0snvM
 W1PtMbtjJqvHiQmXmDzudx9n8ti8pN7j76z9LB4HeiezeGy/No/Z4/MmOY9TXz+zB3BHcdmk
 pOZklqUW6dslcGVc2P2XreAZX8WNKU/YGhjn8HQxcnJICJhI/Gz7zN7FyMUhJLCCUaJx4gIo
 5wujxPYbJxkhnM+MEp37lzHDtNyet4sRxBYSWM4ocXOPAIT9llHi636dLkYODmGBIIkF85RA
 wiICgRLHe7eBzWEWeMEo8ezzXXaQBJuApsTfzTfZQGxeATuJhv53YDNZBFQlOk98BIuLCkRI
 3D+2gRWiRlDi5MwnLCDzOQVsJZ6fiAMJMwvISzRvnc0MYYtL3Hoynwlkl4TAT3aJBTePsEPc
 7CJxf+1CNghbWOLV8S1QcRmJ05N7WCDseon7K1qYIZo7GCW2btgJ9bC1xOHjF1lBFjMDHb1+
 lz5E2FFi2r7t7CBhCQE+iRtvBSFu4JOYtG06M0SYV6KjTQiiWlHi/tmtUAPFJZZe+Mo2gVFp
 FpLHZiH5ZhaSb2Yh7F3AyLKKUTy1tDg3PbXYMC+1XK84Mbe4NC9dLzk/dxMjMLGd/nf80w7G
 r5eSDjEKcDAq8fBaPHwcI8SaWFZcmXuIUYKDWUmE9/SpRzFCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGHdL9U3ycuv9YXVUd6f84sCl/34d1U5TLCzl
 1nIMrsjj2DPV+9+WE9uSnvSsW+Dwdaq7ZNFesceRcvefPQw+dkV779by+RrbzQ9IhETVykRM
 ev72y3Hl4Mx1u7qO75Te8ujL3CvZfB9eM794z9rfInAn9k58UmmayQdNluObPFTYJ++Oulnp
 z6bEUpyRaKjFXFScCADhee9WaAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsVy+t/xe7oWz5/EGHQ9k7S48vU9m8X/R69Z
 LeZOqrU4NfkZk8XV7y+ZLU6+ucpi0TlxCbvFgtncFpd3zWGzePByP6PFob5oB26P9zda2T3m
 ran2mN0xk9XjxIRLTB73u48zeWxeUu/xd9Z+Fo8DvZNZPLZfm8fs8XmTnMepr5/ZA7ij9GyK
 8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DIu7P7LVvCM
 r+LGlCdsDYxzeLoYOTkkBEwkbs/bxdjFyMUhJLCUUWLyqRYmiIS4xO75b5khbGGJP9e62CCK
 XjNKPNv2jKWLkYNDWCBIYsE8JZAaEYFAiUW9C5hBapgFXjBKLOtth2o4zCix8NEEdpAqNgFN
 ib+bb7KB2LwCdhIN/e8YQWwWAVWJzhMfweKiAhESZ96vYIGoEZQ4OfMJ2DJOAVuJ5yfiQMLM
 AuoSf+ZdYoaw5SWat86GssUlbj2ZzzSBUWgWku5ZSFpmIWmZhaRlASPLKkaR1NLi3PTcYkO9
 4sTc4tK8dL3k/NxNjMB43nbs5+YdjJc2Bh9iFOBgVOLhfXDvcYwQa2JZcWXuIUYJDmYlEd7T
 px7FCPGmJFZWpRblxxeV5qQWH2I0BfptIrOUaHI+MNXklcQbmhqaW1gamhubG5tZKInzdggc
 jBESSE8sSc1OTS1ILYLpY+LglGpgXMxWG3yG235TgUaO5aul62f/M+cWLHe7O3FZwb0Ni91l
 czd5bUm36s42DbQrMzxQ0a3aceeGf71EeXowh2Fo+rqGK1ym8ZtLt/YlbSxhnqTi80P1xey2
 Gg3bzAuGRU3nXseGfZu90DKhrVT4/6kz6w682vtk9fO/Mf9vP5wRdk/m8eFsLYtpSizFGYmG
 WsxFxYkAiqx0Jf0CAAA=
X-CMS-MailID: 20190522060752eucas1p139612543d67443cfb24b5d36125334ee
X-Msg-Generator: CA
X-RootMTR: 20190520133802epcas3p3e8d19d3c79e027362ac1e4cc3c09c10f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190520133802epcas3p3e8d19d3c79e027362ac1e4cc3c09c10f
References: <20190520133753.23871-1-narmstrong@baylibre.com>
 <CGME20190520133802epcas3p3e8d19d3c79e027362ac1e4cc3c09c10f@epcas3p3.samsung.com>
 <20190520133753.23871-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_230758_016324_BC5B356B 
X-CRM114-Status: GOOD (  16.60  )
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
Cc: jernej.skrabec@siol.net, heiko@sntech.de, jonas@kwiboo.se,
 maxime.ripard@bootlin.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hverkuil@xs4all.nl,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAuMDUuMjAxOSAxNTozNywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gTm93IHRoZSBEVy1I
RE1JIENvbnRyb2xsZXIgc3VwcG9ydHMgdGhlIEhETUkyLjAgbW9kZXMsIGVuYWJsZSBzdXBwb3J0
Cj4gZm9yIHRoZXNlIG1vZGVzIGluIHRoZSBjb25uZWN0b3IgaWYgdGhlIHBsYXRmb3JtIHN1cHBv
cnRzIHRoZW0uCj4gV2UgbGltaXQgdGhlc2UgbW9kZXMgdG8gRFctSERNSSBJUCB2ZXJzaW9uID49
IDB4MjAwYSB3aGljaAo+IGFyZSBkZXNpZ25lZCB0byBzdXBwb3J0IEhETUkyLjAgZGlzcGxheSBt
b2Rlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxp
YnJlLmNvbT4KPiBUZXN0ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNiArKysr
KysKPiAgaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCAgICAgICAgICAgICAgfCAxICsKPiAg
MiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS5jCj4gaW5kZXggYWI3OTY4YzhmNmEyLi5iNTBjNDljYWY3YWUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0y
NjI5LDYgKzI2MjksMTIgQEAgX19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYsCj4gIAlpZiAoaGRtaS0+cGh5Lm9wcy0+c2V0dXBfaHBkKQo+ICAJCWhkbWktPnBoeS5v
cHMtPnNldHVwX2hwZChoZG1pLCBoZG1pLT5waHkuZGF0YSk7Cj4gIAo+ICsJaWYgKGhkbWktPnZl
cnNpb24gPj0gMHgyMDBhKQo+ICsJCWhkbWktPmNvbm5lY3Rvci55Y2Jjcl80MjBfYWxsb3dlZCA9
Cj4gKwkJCWhkbWktPnBsYXRfZGF0YS0+eWNiY3JfNDIwX2FsbG93ZWQ7Cj4gKwllbHNlCj4gKwkJ
aGRtaS0+Y29ubmVjdG9yLnljYmNyXzQyMF9hbGxvd2VkID0gZmFsc2U7Cj4gKwoKCkkgc3VzcGVj
dCBlbHNlIGNsYXVzZSBjYW4gYmUgZHJvcHBlZC4KCkJlc2lkZSB0aGlzOgoKUmV2aWV3ZWQtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CgrCoC0tClJlZ2FyZHMKQW5kcnpl
agoKCj4gIAltZW1zZXQoJnBkZXZpbmZvLCAwLCBzaXplb2YocGRldmluZm8pKTsKPiAgCXBkZXZp
bmZvLnBhcmVudCA9IGRldjsKPiAgCXBkZXZpbmZvLmlkID0gUExBVEZPUk1fREVWSURfQVVUTzsK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaCBiL2luY2x1ZGUvZHJt
L2JyaWRnZS9kd19oZG1pLmgKPiBpbmRleCA2NmU3MDc3MGNjZTUuLjBmMGU4MjYzOGZiZSAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCj4gKysrIGIvaW5jbHVkZS9k
cm0vYnJpZGdlL2R3X2hkbWkuaAo+IEBAIC0xMzAsNiArMTMwLDcgQEAgc3RydWN0IGR3X2hkbWlf
cGxhdF9kYXRhIHsKPiAgCQkJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9k
ZSk7Cj4gIAl1bnNpZ25lZCBsb25nIGlucHV0X2J1c19mb3JtYXQ7Cj4gIAl1bnNpZ25lZCBsb25n
IGlucHV0X2J1c19lbmNvZGluZzsKPiArCWJvb2wgeWNiY3JfNDIwX2FsbG93ZWQ7Cj4gIAo+ICAJ
LyogVmVuZG9yIFBIWSBzdXBwb3J0ICovCj4gIAljb25zdCBzdHJ1Y3QgZHdfaGRtaV9waHlfb3Bz
ICpwaHlfb3BzOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
