Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB009C5472C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89x3GnUaPQcCZiSA/JY+43oiPqu7chNX2o2pqcHKVCA=; b=Zsu2mlRrRb7Gvq
	/K5cTyfM0ief22tKU8EBHnw9aHbIHAIurqofe81sYjCx5Oxn1efrl549oY/yJ3Gqfyx4saLgmnvNG
	+U8FTfGv0HkFw8NUN2aDx9ptGG1TdxI5rIp8fhIEysIObpiE0WpeD/YORibDYrfeZGLlA+JDMK9UD
	Z8onZ8bldHBvngvJW3hlVKgIlo698VEXSY7fx0g9DVi6AwsEkWLDW3mh+9ePJZzlo/8WkP6pRnLMl
	fviJbYlS80A4z0DHEwIw+oROpFmASScpWvUXciykfTfkn1oOUStgHVTTdtliCsIe+mZOLvOMbNCvo
	HguRSV472fxZPELINRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sigop-00000008isP-281j;
	Mon, 26 Aug 2024 21:00:07 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sigev-00000008gQc-4C4C
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Aug 2024 20:49:56 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240826204948euoutp02ebfbe22aa3ac3630d56fb7480e37f0bd~vYmm3jz8g1330813308euoutp02h
	for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2024 20:49:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240826204948euoutp02ebfbe22aa3ac3630d56fb7480e37f0bd~vYmm3jz8g1330813308euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724705388;
	bh=4rebIsHgGpe9kjnkdd2isgLAS+T1XfSGDMjRcmic9Iw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=J7nfFFY++U7ersfvpQKsiGvI+XD44S4VbJllaKj+oaMHLqoza9c7IgiRbTwkYWW1q
	 u0aYmVAkaQ+6qiwagoPzwtR94keBIiMgW5an9ellz45SfjK+xW5RE1cDjdXabCoA+W
	 dkXIItnO463XZFZx4xomutsfOEhLkRe34XBiGMCg=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20240826204947eucas1p2ca45b0683afb530c6bf3559f690b3604~vYmmMF54M0153901539eucas1p2v;
	Mon, 26 Aug 2024 20:49:47 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id B9.ED.09624.B6AECC66; Mon, 26
	Aug 2024 21:49:47 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240826204947eucas1p2f648781e2a641fef11d61f55e777c708~vYmlijHxe0150201502eucas1p2p;
	Mon, 26 Aug 2024 20:49:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240826204947eusmtrp28267c42beacf04153164872f0848c566~vYmlh8z2e0801108011eusmtrp2G;
	Mon, 26 Aug 2024 20:49:47 +0000 (GMT)
X-AuditID: cbfec7f2-c11ff70000002598-ea-66ccea6b9da6
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id C3.6B.08810.A6AECC66; Mon, 26
	Aug 2024 21:49:46 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20240826204946eusmtip1e907729c0ac54601310fd3d59378378f~vYmktAT171021410214eusmtip1N;
	Mon, 26 Aug 2024 20:49:46 +0000 (GMT)
Message-ID: <0e710ff1-4ff4-403a-b85d-b1e51c03378a@samsung.com>
Date: Mon, 26 Aug 2024 22:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] thermal/of: Use the .should_bind() thermal
 zone callback
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Linux PM
	<linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Daniel
	Lezcano <daniel.lezcano@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>,
	Zhang Rui <rui.zhang@intel.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Linux Samsung SOC
	<linux-samsung-soc@vger.kernel.org>, Mateusz Majewski
	<m.majewski2@samsung.com>, linux-amlogic@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAJZ5v0gOqNi+-Hi8uyeEJ9dHzhwU6GyL6t_7Xjt5Knf2yJmH-w@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHKsWRmVeSWpSXmKPExsWy7djP87rZr86kGez4rWkx77Osxd7XW9kt
	Fszmtri8aw6bxefeI4wWM87vY7JY2NTCbjHx2GRmi7lfpjJbnDl9idXiycM+NgdujzXz1jB6
	LN7zkslj06pONo871/aweWxeUu+x5Wo7i0ffllWMHp83yQVwRHHZpKTmZJalFunbJXBlvGr1
	LpgoVrHz5D7GBsZ2oS5GTg4JAROJ3k3P2bsYuTiEBFYwSky4cokNwvnCKNFy/CwThPOZUeL0
	2xmMMC3vJu1khUgsZ5SY+rwbquUjo0TP/PssIFW8AnYS++f+YgexWQRUJXZfeA8VF5Q4OfMJ
	mC0qIC9x/9YMsBphgQiJFY8msoHYIgLaEksWXWUGGcossJZZYs+vjWANzALiEreezGcCsdkE
	DCW63naBNXAKBEpMfjyLEaJGXqJ562ywZgmBdk6J9V8+AjVwADkuEv/nykC8ICzx6vgWdghb
	RuL/zvlMUPWMEgt+34dyJjBKNDy/BfW0tcSdc7/YQAYxC2hKrN+lDxF2lOg6dJQZYj6fxI23
	ghA38ElM2jYdKswr0dEGDWw1iVnH18GtPXjhEvMERqVZSMEyC8mXs5B8Mwth7wJGllWM4qml
	xbnpqcWGeanlesWJucWleel6yfm5mxiBSez0v+OfdjDOffVR7xAjEwfjIUYJDmYlEV65yyfT
	hHhTEiurUovy44tKc1KLDzFKc7AoifOqpsinCgmkJ5akZqemFqQWwWSZODilGphULv5Z1fFr
	66oinpArhjEOxVM+7xVmsaiIzJC5dWidaeOjLdzTmb+72U5q/vSfsenBxF8bo/0b1iy5+fZH
	696pbfNPbIy7MP/n1ethZgv+KrrZ7WLa5195/oDldo55rNvq1F64zdk5a/8e5cMxPZEdM29s
	tzCfu1d+x39WN/1/PZLZvHtWOrdERHXZiW78/XGd+vJjUbc1j2ZFNPfEb/y0dP9xyaCeFrVw
	v4OtKZliVTku9fpiHb42vlXXWYK/NS36sP7lsu2Tj12a+4shaKbA2Z9d9Vu+N/V5n71haSqd
	f/RvcNtJ+dc1Aln6RvNXN9Uef+m6Zzdn7pxVFf/sYmR+SorkyM9QLpvt/jt52o2HSizFGYmG
	WsxFxYkAm1Q7kNEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xu7pZr86kGcxpt7CY91nWYu/rrewW
	C2ZzW1zeNYfN4nPvEUaLGef3MVksbGpht5h4bDKzxdwvU5ktzpy+xGrx5GEfmwO3x5p5axg9
	Fu95yeSxaVUnm8eda3vYPDYvqffYcrWdxaNvyypGj8+b5AI4ovRsivJLS1IVMvKLS2yVog0t
	jPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyXrV6F0wUq9h5ch9jA2O7UBcjJ4eE
	gInEu0k7WbsYuTiEBJYySvz/38EIkZCRODmtgRXCFpb4c62LDaLoPaNEy4YuFpAEr4CdxP65
	v9hBbBYBVYndF95DxQUlTs58AmaLCshL3L81A6xGWCBCov1tM1hcREBbYsmiq8wgNrPAWmaJ
	Bdv4IRYsZpLo//qJCSIhLnHryXwwm03AUKLrLcgVnBycAoESkx/PYoSoMZPo2toFZctLNG+d
	zTyBUWgWkjtmIRk1C0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl5+duYgRG7bZjPzfv
	YJz36qPeIUYmDsZDjBIczEoivHKXT6YJ8aYkVlalFuXHF5XmpBYfYjQFBsZEZinR5Hxg2sgr
	iTc0MzA1NDGzNDC1NDNWEuf1LOhIFBJITyxJzU5NLUgtgulj4uCUamCSOdqxfKbTpJA9zrrv
	bz0+KPOrqvf7uYyJ/oJM+wV+Bdu7Kd3XTDtlmJD83aaoRN/5Zmn+C42cWRq77ydOsoqtSPqb
	Wlhq/0N23iT2v7GFK/rsdXZcXJ7gbP3+hH5+o/oJpi2d2fuy0+LnpVSpSyzb5M+bbcDz753C
	o1VRvzufKrS2zdUpMos++4FhW6vDw0s9lyT3qT9SuPIxi8m/Q6Ql83bXvLdvltbPztZ3qnfe
	vunv87KHLz1MLn9be1L9v6LRiqg93P0bHP+pH2OY87T1Znzi/3/Vvf0XMt2kszOeVfYKH9iX
	e/DPR3nRWTpn1TYYMKUW/C/wfnj9Mbe3EtO9GJEflm0KVrcKDjjN6VdiKc5INNRiLipOBABb
	MTeTYwMAAA==
X-CMS-MailID: 20240826204947eucas1p2f648781e2a641fef11d61f55e777c708
X-Msg-Generator: CA
X-RootMTR: 20240826113153eucas1p110e90b4cd98aa70601770fe93d7aa1e5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240826113153eucas1p110e90b4cd98aa70601770fe93d7aa1e5
References: <2205737.irdbgypaU6@rjwysocki.net>
	<CGME20240826113153eucas1p110e90b4cd98aa70601770fe93d7aa1e5@eucas1p1.samsung.com>
	<2236794.NgBsaNRSFp@rjwysocki.net>
	<ef729a47-b7f9-48b6-a14d-692565ef1d38@samsung.com>
	<CAJZ5v0gOqNi+-Hi8uyeEJ9dHzhwU6GyL6t_7Xjt5Knf2yJmH-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_134954_323821_F1F7770F 
X-CRM114-Status: GOOD (  19.46  )
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

T24gMjYuMDguMjAyNCAxNDoxNCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gT24gTW9uLCBB
dWcgMjYsIDIwMjQgYXQgMTozMuKAr1BNIE1hcmVrIFN6eXByb3dza2kKPiA8bS5zenlwcm93c2tp
QHNhbXN1bmcuY29tPiB3cm90ZToKPj4gT24gMTkuMDguMjAyNCAxODozMCwgUmFmYWVsIEouIFd5
c29ja2kgd3JvdGU6Cj4+PiBGcm9tOiBSYWZhZWwgSi4gV3lzb2NraSA8cmFmYWVsLmoud3lzb2Nr
aUBpbnRlbC5jb20+Cj4+Pgo+Pj4gTWFrZSB0aGUgdGhlcm1hbF9vZiBkcml2ZXIgdXNlIHRoZSAu
c2hvdWxkX2JpbmQoKSB0aGVybWFsIHpvbmUgY2FsbGJhY2sKPj4+IHRvIHByb3ZpZGUgdGhlIHRo
ZXJtYWwgY29yZSB3aXRoIHRoZSBpbmZvcm1hdGlvbiBvbiB3aGV0aGVyIG9yIG5vdCB0bwo+Pj4g
YmluZCB0aGUgZ2l2ZW4gY29vbGluZyBkZXZpY2UgdG8gdGhlIGdpdmVuIHRyaXAgcG9pbnQgaW4g
dGhlIGdpdmVuCj4+PiB0aGVybWFsIHpvbmUuICBJZiBpdCByZXR1cm5zICd0cnVlJywgdGhlIHRo
ZXJtYWwgY29yZSB3aWxsIGJpbmQgdGhlCj4+PiBjb29saW5nIGRldmljZSB0byB0aGUgdHJpcCBh
bmQgdGhlIGNvcnJlc3BvbmRpbmcgdW5iaW5kaW5nIHdpbGwgYmUKPj4+IHRha2VuIGNhcmUgb2Yg
YXV0b21hdGljYWxseSBieSB0aGUgY29yZSBvbiB0aGUgcmVtb3ZhbCBvZiB0aGUgaW52b2x2ZWQK
Pj4+IHRoZXJtYWwgem9uZSBvciBjb29saW5nIGRldmljZS4KPj4+Cj4+PiBUaGlzIHJlcGxhY2Vz
IHRoZSAuYmluZCgpIGFuZCAudW5iaW5kKCkgdGhlcm1hbCB6b25lIGNhbGxiYWNrcyB3aGljaAo+
Pj4gYXNzdW1lZCB0aGUgc2FtZSB0cmlwIHBvaW50cyBvcmRlcmluZyBpbiB0aGUgZHJpdmVyIGFu
ZCBpbiB0aGUgdGhlcm1hbAo+Pj4gY29yZSAodGhhdCBtYXkgbm90IGJlIHRydWUgYW55IG1vcmUg
aW4gdGhlIGZ1dHVyZSkuICBUaGUgLmJpbmQoKQo+Pj4gY2FsbGJhY2sgd291bGQgd2FsayB0aGUg
Z2l2ZW4gdGhlcm1hbCB6b25lJ3MgY29vbGluZyBtYXBzIHRvIGZpbmQgYWxsCj4+PiBvZiB0aGUg
dmFsaWQgdHJpcCBwb2ludCBjb21iaW5hdGlvbnMgd2l0aCB0aGUgZ2l2ZW4gY29vbGluZyBkZXZp
Y2UgYW5kCj4+PiBpdCB3b3VsZCBjYWxsIHRoZXJtYWxfem9uZV9iaW5kX2Nvb2xpbmdfZGV2aWNl
KCkgZm9yIGFsbCBvZiB0aGVtIHVzaW5nCj4+PiB0cmlwIHBvaW50IGluZGljZXMgcmVmbGVjdGlu
ZyB0aGUgb3JkZXJpbmcgb2YgdGhlIHRyaXBzIGluIHRoZSBEVC4KPj4+Cj4+PiBUaGUgLnNob3Vs
ZF9iaW5kKCkgY2FsbGJhY2sgc3RpbGwgd2Fsa3MgdGhlIHRoZXJtYWwgem9uZSdzIGNvb2xpbmcg
bWFwcywKPj4+IGJ1dCBpdCBjYW4gdXNlIHRoZSB0cmlwIG9iamVjdCBwYXNzZWQgdG8gaXQgYnkg
dGhlIHRoZXJtYWwgY29yZSB0byBmaW5kCj4+PiB0aGUgdHJpcCBpbiBxdWVzdGlvbiBpbiB0aGUg
Zmlyc3QgcGxhY2UgYW5kIHRoZW4gaXQgdXNlcyB0aGUKPj4+IGNvcnJlc3BvbmRpbmcgJ2Nvb2xp
bmctZGV2aWNlJyBlbnRyaWVzIHRvIGxvb2sgdXAgdGhlIGdpdmVuIGNvb2xpbmcKPj4+IGRldmlj
ZS4gIFRvIGJlIGFibGUgdG8gbWF0Y2ggdGhlIHRyaXAgb2JqZWN0IHByb3ZpZGVkIGJ5IHRoZSB0
aGVybWFsCj4+PiBjb3JlIHRvIGEgc3BlY2lmaWMgZGV2aWNlIG5vZGUsIHRoZSBkcml2ZXIgc2V0
cyB0aGUgJ3ByaXYnIGZpZWxkIG9mIGVhY2gKPj4+IHRyaXAgdG8gdGhlIGNvcnJlc3BvbmRpbmcg
ZGV2aWNlIG5vZGUgcG9pbnRlciBkdXJpbmcgaW5pdGlhbGl6YXRpb24uCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPgo+
PiBUaGlzIHBhdGNoIGxhbmRlZCByZWNlbnRseSBpbiBsaW51eC1uZXh0IGFzIGNvbW1pdCA2ZDcx
ZDU1YzNiMTIKPj4gKCJ0aGVybWFsL29mOiBVc2UgdGhlIC5zaG91bGRfYmluZCgpIHRoZXJtYWwg
em9uZSBjYWxsYmFjayIpCj4gSXQgaGFzIGJlZW4gZml4ZWQgc2luY2UgYW5kIGl0IGlzIGNvbW1p
dCAgOTRjNjExMGIwYjEzYzY0MTYxNDYgbm93LgoKCkNvbmZpcm1lZC4gVGhhbmtzIGZvciBmaXhp
bmcgaXQgYW5kIHNvcnJ5IGZvciB0aGUgbm9pc2UuCgoKPiBCb3R0b20gbGluZSBpcyB0aGF0IGl0
IHdhcyBjYWxsaW5nIG9mX25vZGVfcHV0KCkgdG9vIG1hbnkgdGltZXMgZHVlIHRvCj4gYSBjb2Rp
bmcgbWlzdGFrZS4KPgo+PiBJbiBteSB0ZXN0cyBJIGZvdW5kIHRoYXQgaXQgYnJlYWtzIGJvb3Rp
bmcgc29tZSBvbiBteSB0ZXN0IGJvYXJzOiBFeHlub3MtYmFzZWQKPj4gKE9kcm9pZFhVNCB3aXRo
IEFSTTMyIGJpdCBrZXJuZWwgZnJvbSBtdWx0aV92N19kZWZjb25maWcpIGFuZCBBbWxvZ2ljCj4+
IE1lc29uIGJhc2VkIGJvYXJkcyAoT2Ryb2lkQzQsIFZJTTMgd2l0aCBBUk02NCBkZWZjb25maWcr
c29tZSBkZWJ1Zwo+PiBvcHRpb25zKS4gUmV2ZXJ0aW5nICRzdWJqZWN0IG9uIHRvcCBvZiBuZXh0
LTIwMjQwODIzIHRvZ2V0aGVyIHdpdGgKPj4gYzFlZTZlMWY2OGY1ICgidGhlcm1hbDogY29yZTog
Q2xlYW4gdXAgdHJpcCBiaW5kL3VuYmluZCBmdW5jdGlvbnMiKSBhbmQKPj4gNTI2OTU0OTAwNDY1
ICgidGhlcm1hbDogY29yZTogRHJvcCB1bnVzZWQgYmluZC91bmJpbmQgZnVuY3Rpb25zIGFuZAo+
PiBjYWxsYmFja3MiKSBkdWUgdG8gY29tcGlsZSBkZXBlbmRlbmNpZXMgZml4ZXMgdGhlIGlzc3Vl
Lgo+IFRoYW5rcyBmb3IgdGhlIHJlcG9ydCEKPgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXBy
b3dza2ksIFBoRApTYW1zdW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
