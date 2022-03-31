Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54493C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFgLrirh7psySn7b7a6H6H9rx1d/zl0z3ml0f+Bx7YU=; b=Gc+w8JKrPAlleW
	sNDgU/Ys3Xiu1XAX2gCcquI943qGu5zQWytvVe+HL+tDtbGc/ZlYc/XMrwr4iCPPudRnpkgblBuqz
	G70bo2VHBI75Z7T/paW08HAphmmpJUbIsAcL7eLSdKErbQWsQgCbu4fVdHpYgdwmvk/tzgdClVklG
	bUv8RvhmpwwXWDhZwtyC5EVqd1xoII/DeJL3Lcbg1VjcmG2ZLuZLbTIlcJWqXJ4Ik6POlHV1Y7+dv
	bSTEfu7iDrebHgayZcpixtIkEL15UZgSX5hYAlwNkQbXE1KPBLcFUfdEWqcfX63lWPcD4Eq3vsakh
	qmZtiO4PWJE+zU5D/03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZrY3-001aw7-Sg; Thu, 31 Mar 2022 09:56:59 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrXz-001atp-Q3
 for linux-amlogic@lists.infradead.org; Thu, 31 Mar 2022 09:56:58 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220331095653euoutp02787c472276e5f8917ca940f1d983ef73~hbqmX9kjB1031510315euoutp02G
 for <linux-amlogic@lists.infradead.org>; Thu, 31 Mar 2022 09:56:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220331095653euoutp02787c472276e5f8917ca940f1d983ef73~hbqmX9kjB1031510315euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648720613;
 bh=/NMz6n8aL7PXsymzKWz1HCMBHBCnjrjE/emfCvZi+r8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=k09FTyCAdB8TPqySngtYCQZoxMAGevnAyi+Zx1dxsUU5kLrgmFjetHhCT6uSoOwdA
 UiEFAKdN0ucE9G7xNoRk83ITYuUtuBwa8uHOq4DYWdVLa0k6DYuXutzSWWcYh/nxqV
 qduZb0kG3GPsp4cZUKjqBaek0uIRADcclYHkANBg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220331095653eucas1p249c83675a4ebe10079f8e255c84099c0~hbqmLVSFi1559515595eucas1p2Z;
 Thu, 31 Mar 2022 09:56:53 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 4C.EE.09887.4EA75426; Thu, 31
 Mar 2022 10:56:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220331095652eucas1p2d06107b8c2a39bec14fcd67d001429d7~hbqlx5qV71955319553eucas1p2B;
 Thu, 31 Mar 2022 09:56:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220331095652eusmtrp1f5b02a90c92a1709ebcb558cfb83bb9b~hbqlwg4EQ1929019290eusmtrp1O;
 Thu, 31 Mar 2022 09:56:52 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-c4-62457ae47739
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A4.0F.09522.4EA75426; Thu, 31
 Mar 2022 10:56:52 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220331095652eusmtip145d4f0a4d9c65f3b4556f18a28a89306~hbqlTyTA_2482824828eusmtip1o;
 Thu, 31 Mar 2022 09:56:52 +0000 (GMT)
Message-ID: <7465a7dc-c45e-2612-4c39-d15eceb9b75c@samsung.com>
Date: Thu, 31 Mar 2022 11:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, 'Linux Samsung SOC'
 <linux-samsung-soc@vger.kernel.org>, linux-amlogic@lists.infradead.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220330084710.3r6b5pjspz5hdmy6@houat>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87pPq1yTDDomMFqcfHKd3WLBbG6L
 jz33WC1mnN/HZDHjxz9Gi4unXC3+XdvI4sDu8f5GK7vHnXPn2Tx23F3C6LFpVSebx+Yl9R6f
 N8kFsEVx2aSk5mSWpRbp2yVwZaxZdYOl4KJ4RfdlqwbGlcJdjJwcEgImEs83rGTqYuTiEBJY
 wSix5vhlRgjnC6PEu5mvoZzPQM6iVexdjBxgLUsvhELElzNKXDn/gB3C+cgo0XtmHzvIXF4B
 O4lDP/6D2SwCqhLzrjSxQcQFJU7OfMICYosKJEms3r4aLC4sYC9xZWczI4jNLCAucevJfCYQ
 WwSo90rvXmaI+G9GiTMf5UFsNgFDia63XWwgB3ECHdS+IxqiRF6ieetsZpB7JATucEjs2ryW
 HeJPF4kpk28yQtjCEq+Ob4GKy0icntzDAvFYvsTfGcYQ4QqJa6/XMEPY1hJ3zv0CW8UsoCmx
 fpc+RNhRYtbcLWwQnXwSN94KQlzAJzFp23RmiDCvREebEES1msSs4+vgdh68cIl5AqPSLKQg
 mYXk9VlIfpmFsHcBI8sqRvHU0uLc9NRio7zUcr3ixNzi0rx0veT83E2MwPRz+t/xLzsYl7/6
 qHeIkYmD8RCjBAezkgjv1VjXJCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8yZkbEoUE0hNLUrNT
 UwtSi2CyTBycUg1MxnIe//wFF4gXr6prmPpnv8f5q3xOe+Uvc87Z7niPO+7EVT+NWa6em30f
 rmdtWOTdPreARUwiNq4iO01fL/C9z5EtzfyNLiW7Poecz8gx+KQnvGn/hqDwzLVyexQOr1iU
 FDphh/Xa2Voed/1+r4qy/X6vfqaKV1fo8ZuXOW7nrinV1V/nV7HWql7NXHOX4ZrtxlacmxiF
 Did5nxb2WnTA62/IrYOHfZ/q3k/Lujp9zcYF3hcbS4rmz1mdUse06iKbxRSVSwUedjrKs7W3
 x7QHlAQ+4vuQsLLOue/Yg6ZNSVHrU9v/9S+x6q/vyOJ/e1lHfNWOT2sUdDZO9PoRpaypa2Vz
 9tS3jUFXu94VPhdWYinOSDTUYi4qTgQARoq1pq4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xu7pPqlyTDBZuVLQ4+eQ6u8WC2dwW
 H3vusVrMOL+PyWLGj3+MFhdPuVr8u7aRxYHd4/2NVnaPO+fOs3nsuLuE0WPTqk42j81L6j0+
 b5ILYIvSsynKLy1JVcjILy6xVYo2tDDSM7S00DMysdQzNDaPtTIyVdK3s0lJzcksSy3St0vQ
 y1iz6gZLwUXxiu7LVg2MK4W7GDk4JARMJJZeCO1i5OIQEljKKLG+o5+pi5ETKC4jcXJaAyuE
 LSzx51oXG0TRe0aJix+XsIMkeAXsJA79+A9mswioSsy70sQGEReUODnzCQuILSqQJHGpq50R
 xBYWsJe4srMZzGYWEJe49WQ+2DIRoN4rvXuZQRYwC/xllNi+5ysrxLZZTBKz/twCm8QmYCjR
 9RbkDA4OTqCz23dEQwwyk+ja2gU1VF6ieets5gmMQrOQ3DELyb5ZSFpmIWlZwMiyilEktbQ4
 Nz232FCvODG3uDQvXS85P3cTIzDuth37uXkH47xXH/UOMTJxMB5ilOBgVhLhvRrrmiTEm5JY
 WZValB9fVJqTWnyI0RQYGBOZpUST84GRn1cSb2hmYGpoYmZpYGppZqwkzutZ0JEoJJCeWJKa
 nZpakFoE08fEwSnVwLRDof5PA+ejuI0XtDYvdvQILbqvPu111YPgKE8lNr7k5UsLhJ+I+b1K
 dDzYvkk4jVFN1WLGZIuCBCXO7fMjI/92ZCRcX23xw35xdshN3iNrlztuPtebqXy96anWKpYE
 Bz+fGQ0fNjTLfGh36pvOuXuR88wThR7uzc35yzf9/vFlhwxb6cTeWcazXt7y2FJ55K9yfVi9
 gO0u7XRf2WPtOyMO5sWV7/+459T0WskoLzdb9i0M4XMKVb97X1P723F8GscL3iOvPmYnOphs
 0Y6vZ3x66n+J65Pa0gWZImzSWS07WRy5mh4d+n07085+TbDE8VSXzFglD+G6L65WZ/9aMK4+
 /bNWac63aS/2iV88r8RSnJFoqMVcVJwIAG1LOmJEAwAA
X-CMS-MailID: 20220331095652eucas1p2d06107b8c2a39bec14fcd67d001429d7
X-Msg-Generator: CA
X-RootMTR: 20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_025656_250290_952F8333 
X-CRM114-Status: GOOD (  20.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAzMC4wMy4yMDIyIDEwOjQ3LCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+IE9uIFdlZCwg
TWFyIDMwLCAyMDIyIGF0IDEwOjA2OjEzQU0gKzAyMDAsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6
Cj4+IE9uIDI1LjAzLjIwMjIgMTc6MTEsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+PiBXaGlsZSB0
aGUgY3VycmVudCBjb2RlIHdpbGwgdHJpZ2dlciBhIG5ldyBjbGtfc2V0X3JhdGUgY2FsbCB3aGVu
ZXZlciB0aGUKPj4+IHJhdGUgYm91bmRhcmllcyBhcmUgY2hhbmdlZCB0aHJvdWdoIGNsa19zZXRf
cmF0ZV9yYW5nZSwgdGhpcyBkb2Vzbid0Cj4+PiBvY2N1ciB3aGVuIGNsa19wdXQoKSBpcyBjYWxs
ZWQuCj4+Pgo+Pj4gSG93ZXZlciwgdGhpcyBpcyBlc3NlbnRpYWxseSBlcXVpdmFsZW50IHNpbmNl
LCBhZnRlciBjbGtfcHV0KCkKPj4+IGNvbXBsZXRlcywgdGhvc2UgYm91bmRhcmllcyB3b24ndCBi
ZSBlbmZvcmNlZCBhbnltb3JlLgo+Pj4KPj4+IExldCdzIGFkZCBhIGNhbGwgdG8gY2xrX3NldF9y
YXRlX3JhbmdlIGluIGNsa19wdXQgdG8gbWFrZSBzdXJlIHRob3NlCj4+PiByYXRlIGJvdW5kYXJp
ZXMgYXJlIGRyb3BwZWQgYW5kIHRoZSBjbG9jayBkcml2ZXJzIGNhbiByZWFjdC4KPj4+Cj4+PiBM
ZXQncyBhbHNvIGFkZCBhIGZldyB0ZXN0cyB0byBtYWtlIHN1cmUgdGhpcyBjYXNlIGlzIGNvdmVy
ZWQuCj4+Pgo+Pj4gRml4ZXM6IGM4MGFjNTBjYmIzNyAoImNsazogQWx3YXlzIHNldCB0aGUgcmF0
ZSBvbiBjbGtfc2V0X3JhbmdlX3JhdGUiKQo+Pj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lQGNlcm5vLnRlY2g+Cj4+IFRoaXMgcGF0Y2ggbGFuZGVkIHJlY2VudGx5IGluIGxp
bnV4LW5leHQgMjAyMjAzMjggYXMgY29tbWl0IDdkYWJmYTJiYzQ4MAo+PiAoImNsazogRHJvcCB0
aGUgcmF0ZSByYW5nZSBvbiBjbGtfcHV0KCkiKS4gU2FkbHkgaXQgYnJlYWtzIGJvb3Rpbmcgb2YK
Pj4gdGhlIGZldyBvZiBteSB0ZXN0IHN5c3RlbXM6IFNhbXN1bmcgQVJNIDMyYml0IEV4eW5vczMy
NTAgYmFzZWQgUmluYXRvCj4+IGJvYXJkIGFuZCBhbGwgQW1sb2dpYyBNZXNvbiBHMTJCL1NNMSBi
YXNlZCBib2FyZHMgKE9kcm9pZCBDNCwgTjIsIEtoYWRhcwo+PiBWSU0zL1ZJTTNsKS4gUmluYXRv
IGhhbmdzIGFsd2F5cyB3aXRoIHRoZSBmb2xsb3dpbmcgb29wczoKPj4KPj4gLS0tPjgtLS0KPj4K
Pj4gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IE1DVCBoYW5ncyBhZnRlciB3cml0aW5nIDQg
KG9mZnNldDoweDQyMCkKPj4gQ1BVOiAxIFBJRDogMCBDb21tOiBzd2FwcGVyLzEgTm90IHRhaW50
ZWQgNS4xNy4wLXJjMS0wMDAxNC1nN2RhYmZhMmJjNDgwCj4+ICMxMTU1MQo+PiBIYXJkd2FyZSBu
YW1lOiBTYW1zdW5nIEV4eW5vcyAoRmxhdHRlbmVkIERldmljZSBUcmVlKQo+PiAgIMKgdW53aW5k
X2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHgxMC8weDE0Cj4+ICAgwqBzaG93X3N0YWNrIGZy
b20gZHVtcF9zdGFja19sdmwrMHg1OC8weDcwCj4+ICAgwqBkdW1wX3N0YWNrX2x2bCBmcm9tIHBh
bmljKzB4MTBjLzB4MzI4Cj4+ICAgwqBwYW5pYyBmcm9tIGV4eW5vczRfbWN0X3RpY2tfc3RvcCsw
eDAvMHgyYwo+PiAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogTUNUIGhhbmdz
IGFmdGVyIHdyaXRpbmcgNAo+PiAob2Zmc2V0OjB4NDIwKSBdLS0tCj4+Cj4+IC0tLT44LS0tCj4+
Cj4+IEFtbG9naWMgYm9hcmRzIGhhbmcgcmFuZG9tbHkgZHVyaW5nIGVhcmx5IHVzZXJzcGFjZSBp
bml0LCB1c3VhbGx5IGp1c3QKPj4gYWZ0ZXIgbG9hZGluZyB0aGUgZHJpdmVyIG1vZHVsZXMuCj4+
Cj4+IFJldmVydGluZyAkc3ViamVjdCBvbiB0b3Agb2YgbGludXgtbmV4dCBmaXhlcyBhbGwgdGhv
c2UgcHJvYmxlbXMuCj4+Cj4+IEkgd2lsbCB0cnkgdG8gYW5hbHl6ZSBpdCBhIGJpdCBtb3JlIGFu
ZCBpZiBwb3NzaWJsZSBwcm92aWRlIHNvbWUgbW9yZQo+PiB1c2VmdWwvbWVhbmluZyBmdWxsIGxv
Z3MgbGF0ZXIuCj4gSSdtIG5vdCBzdXJlIHdoYXQgY291bGQgZ28gd3JvbmcgdGhlcmUsIGJ1dCBp
ZiB5b3UgY2FuIGZpZ3VyZSBvdXQgdGhlCj4gY2xvY2ssIGlmIGl0IHRyaWVzIHRvIHNldCBhIG5l
dyByYXRlIGFuZCB3aGF0IHJhdGUgaXQgaXMsIGl0IHdvdWxkIGJlCj4gYXdlc29tZSA6KQoKU28g
ZmFyIEkndmUgbm90aWNlZCB0aGF0IHRoZSBwcm9ibGVtIGlzIGNhdXNlZCBieSBzZXR0aW5nIHJh
dGUgb2Ygc29tZSAKY2xvY2tzIHRvIHplcm8uIFRoZSBmb2xsb3dpbmcgcGF0Y2ggZml4ZXMgbXkg
aXNzdWVzOgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay5jIGIvZHJpdmVycy9jbGsvY2xr
LmMKaW5kZXggMzJhOWVhZjM1YzZiLi4zOWNhYjA4ZGJlY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Y2xrL2Nsay5jCisrKyBiL2RyaXZlcnMvY2xrL2Nsay5jCkBAIC0yMjAxLDYgKzIyMDEsOSBAQCBz
dGF0aWMgaW50IGNsa19jb3JlX3NldF9yYXRlX25vbG9jayhzdHJ1Y3QgCmNsa19jb3JlICpjb3Jl
LAogwqDCoMKgwqDCoMKgwqAgaWYgKCFjb3JlKQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAwOwoKK8KgwqDCoMKgwqDCoCBpZiAocmVxX3JhdGUgPT0gMCkKK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7CisKIMKgwqDCoMKgwqDCoMKgIHJhdGUgPSBj
bGtfY29yZV9yZXFfcm91bmRfcmF0ZV9ub2xvY2soY29yZSwgcmVxX3JhdGUpOwoKIMKgwqDCoMKg
wqDCoMKgIC8qIGJhaWwgZWFybHkgaWYgbm90aGluZyB0byBkbyAqLwotLQoKSSB3aWxsIHNvb24g
Z3JhYiB0aGUgY2FsbCBzdGFjayBhbmQgcmVsZXZhbnQgY2xvY2sgdG9wb2xvZ3kgc2hvdyBob3cg
dGhlIApyYXRlIGlzIHNldCB0byB6ZXJvLgoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93
c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
