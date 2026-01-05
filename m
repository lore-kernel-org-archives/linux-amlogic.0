Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6366AC79FAF
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iURo3wvhJN616zYT6/mzWYMjtKFwMf07IY5fsSR/HQ=; b=HNjj6SgqmIRNP8
	dW4Vlrj/nKEaGJWjXOhq2koyQw/ANr5VqXmnYwscPahp1qPajEcpeHFv0lQrfiuF4tp/ZracMDGxy
	FwhtelBxksjD0bfLObiaumluZddNNYvHuDUpavJDm7oywqirGgiVQ51US95FI2zOcRUovQhM2OL3N
	hsTAkEILbQp26v9CdF5wXYAeKYGQRJxSMVnlRFUPQaXvEwkMqpL8TSgEGIB6G63lftbco25LLFyTC
	eSQkoM/zskFs1WRpuCMZe919WLJbNwAbQJSgMoedQD9/Mx9NElUpv9nvrmzSb5u+m0xakgQod9Wkm
	qpSwwa3AtawYtFpfmaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcojU-0000000BsE4-1zup;
	Mon, 05 Jan 2026 17:51:08 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcojN-0000000BsBH-2Pcr
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 17:51:07 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260105175058euoutp0214d4275073aef2ea5b83ff265ca8e27f~H5xVx7OYK0711507115euoutp02v
	for <linux-amlogic@lists.infradead.org>; Mon,  5 Jan 2026 17:50:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260105175058euoutp0214d4275073aef2ea5b83ff265ca8e27f~H5xVx7OYK0711507115euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767635458;
	bh=UIl6SHJhWkfN0/1FLxWUZ38nXwKxplUrKF/eFOo1uVI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GiM/WJV48jrskVobEyKgi0zMxPnakTZILgr9xs5nLcJUMteqWX+UA4H5dn+8tQBfG
	 eEjBFYSdZHxP7pXQLzHJadNpHOS1agFolQJbMwygokqAGAwGse0W4jjI5xCvrsJ2u5
	 x9zG/eMfACdNYs9467DjD7I5LUrKcj9SYhQYX+LY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260105175057eucas1p274610bd996f1599b43d386f0afdb0fb6~H5xVeVD8s2877028770eucas1p2i;
	Mon,  5 Jan 2026 17:50:57 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260105175055eusmtip2bd9960cd4f35babf9088305da14604af~H5xTTw38e1923619236eusmtip2N;
	Mon,  5 Jan 2026 17:50:55 +0000 (GMT)
Message-ID: <d035fc29-3b03-4cd6-b8ec-001f93540bc6@samsung.com>
Date: Mon, 5 Jan 2026 18:50:53 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <brgl@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
	Brunet <jbrunet@baylibre.com>, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
X-CMS-MailID: 20260105175057eucas1p274610bd996f1599b43d386f0afdb0fb6
X-Msg-Generator: CA
X-RootMTR: 20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42
X-EPHeader: CA
X-CMS-RootMailID: 20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com>
	<CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
	<CGME20260105173844eucas1p1d0d5b5a84d4690d42f98f73a04de8b42@eucas1p1.samsung.com>
	<CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_095104_018563_36D059FE 
X-CRM114-Status: GOOD (  11.02  )
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

T24gMDUuMDEuMjAyNiAxODozOCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBNb24s
IDUgSmFuIDIwMjYgMTg6Mjg6MjMgKzAxMDAsIE1hcnRpbiBCbHVtZW5zdGluZ2wKPiA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gc2FpZDoKPj4gSGkgQmFydG9zeiwKPj4KPj4g
T24gTW9uLCBKYW4gNSwgMjAyNiBhdCA0OjA14oCvUE0gQmFydG9zeiBHb2xhc3pld3NraQo+PiA8
YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPj4gWy4uLl0KPj4+
ICAgIG11dGV4X2xvY2tfbmVzdGVkKzB4MjQvMHgzMAo+Pj4gICAgcGluY3RybF9nZXRfZGV2aWNl
X2dwaW9fcmFuZ2UrMHg0NC8weDEyOAo+Pj4gICAgcGluY3RybF9ncGlvX3NldF9jb25maWcrMHg0
MC8weGRjCj4+PiAgICBncGlvY2hpcF9nZW5lcmljX2NvbmZpZysweDI4LzB4M2MKPj4+ICAgIGdw
aW9fZG9fc2V0X2NvbmZpZysweGE4LzB4MTk0Cj4+ICQgZ2l0IGdyZXAgZ3Bpb2NoaXBfZ2VuZXJp
Y19jb25maWcgZHJpdmVycy9waW5jdHJsL21lc29uLwo+PiBkcml2ZXJzL3BpbmN0cmwvbWVzb24v
cGluY3RybC1hbWxvZ2ljLWE0LmM6ICAgICAuc2V0X2NvbmZpZwo+PiAgID0gZ3Bpb2NoaXBfZ2Vu
ZXJpY19jb25maWcsCj4+IGRyaXZlcnMvcGluY3RybC9tZXNvbi9waW5jdHJsLW1lc29uLmM6ICBw
Yy0+Y2hpcC5zZXRfY29uZmlnID0KPj4gZ3Bpb2NoaXBfZ2VuZXJpY19jb25maWc7Cj4+Cj4+IHBp
bmN0cmwtYW1sb2dpYy1hNC5jIHN0aWxsIGhhczoKPj4gICAgLmNhbl9zbGVlcCA9IGZhbHNlLAo+
Pgo+PiBBcmUgdGhlcmUgcGxhbnMgdG8gc2VuZCBhIHNlcGFyYXRlIGZpeCBmb3IgcGluY3RybC1h
bWxvZ2ljLWE0LmMgLSBvcgo+PiB3YXMgdGhlIGludGVudGlvbiB0byBmaXggImFsbCIgQW1sb2dp
YyBwaW4gY29udHJvbGxlcnMgaW4gdGhpcyBwYXRjaAo+PiAod2hpY2ggd291bGQgbWVhbiB0aGF0
IHRoZSBjaGFuZ2UgdG8gcGluY3RybC1hbWxvZ2ljLWE0LmMgaXMgbWlzc2luZyk/Cj4+Cj4+Cj4g
WWVhaCwgSSBtaXNzZWQgaXQuIEkgd2lsbCBzZW5kIGEgZm9sbG93LXVwIHRvbW9ycm93LgoKSSBm
b3VuZCB0aGF0IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXJvY2tjaGlwLmMgc3VmZmVycyBmb3Ig
dGhlIHNhbWUgCmlzc3VlLCBhbHRob3VnaCBJIGRvbid0IHNlZSB3aGVyZSB0aGlzICIuY2FuX3Ns
ZWVwIiBmbGFnIGhhcyB0byBiZSBhZGRlZDoKCkJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVk
IGZyb20gaW52YWxpZCBjb250ZXh0IGF0IAprZXJuZWwvbG9ja2luZy9tdXRleC5jOjU5MQppbl9h
dG9taWMoKTogMSwgaXJxc19kaXNhYmxlZCgpOiAxLCBub25fYmxvY2s6IDAsIHBpZDogMTIsIG5h
bWU6IAprd29ya2VyL3UxNjowCnByZWVtcHRfY291bnQ6IDEsIGV4cGVjdGVkOiAwClJDVSBuZXN0
IGRlcHRoOiAwLCBleHBlY3RlZDogMAo2IGxvY2tzIGhlbGQgYnkga3dvcmtlci91MTY6MC8xMjoK
IMKgIzA6IGZmZmYwMDAxZjAwMThkNDggKCh3cV9jb21wbGV0aW9uKWV2ZW50c191bmJvdW5kIzIp
eysuKy59LXswOjB9LCAKYXQ6IHByb2Nlc3Nfb25lX3dvcmsrMHgxOGMvMHg2MDQKIMKgIzE6IGZm
ZmY4MDAwODQyZGJkZjAgKGRlZmVycmVkX3Byb2JlX3dvcmspeysuKy59LXswOjB9LCBhdDogCnBy
b2Nlc3Nfb25lX3dvcmsrMHgxYjQvMHg2MDQKIMKgIzI6IGZmZmYwMDAxZjE4NDk4ZjggKCZkZXYt
Pm11dGV4KXsuLi4ufS17NDo0fSwgYXQ6IApfX2RldmljZV9hdHRhY2grMHgzOC8weDFiMAogwqAj
MzogZmZmZjAwMDFmNzVmMWU5MCAoJmdkZXYtPnNyY3Upey4rLj99LXswOjB9LCBhdDogCmdwaW9k
X2RpcmVjdGlvbl9vdXRwdXRfcmF3X2NvbW1pdCsweDAvMHgzNjAKIMKgIzQ6IGZmZmYwMDAxZjQ2
ZTNkYjggKCZzaGFyZWRfZGVzYy0+c3BpbmxvY2spey4uLi59LXszOjN9LCBhdDogCmdwaW9fc2hh
cmVkX3Byb3h5X2RpcmVjdGlvbl9vdXRwdXQrMHhkMC8weDE0NCBbZ3Bpb19zaGFyZWRfcHJveHld
CiDCoCM1OiBmZmZmMDAwMWYxODBlZTkwICgmZ2Rldi0+c3JjdSl7LisuP30tezA6MH0sIGF0OiAK
Z3Bpb2RfZGlyZWN0aW9uX291dHB1dF9yYXdfY29tbWl0KzB4MC8weDM2MAppcnEgZXZlbnQgc3Rh
bXA6IDgxNDUwCmhhcmRpcnFzIGxhc3TCoCBlbmFibGVkIGF0ICg4MTQ0OSk6IFs8ZmZmZjgwMDA4
MTNhY2JhND5dIApfcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUrMHg3NC8weDc4CmhhcmRpcnFz
IGxhc3QgZGlzYWJsZWQgYXQgKDgxNDUwKTogWzxmZmZmODAwMDgxM2FiZmI4Pl0gCl9yYXdfc3Bp
bl9sb2NrX2lycXNhdmUrMHg4NC8weDg4CnNvZnRpcnFzIGxhc3TCoCBlbmFibGVkIGF0ICg3OTYx
Nik6IFs8ZmZmZjgwMDA4MTE0NTVmYz5dIApfX2FsbG9jX3NrYisweDE3Yy8weDFlOApzb2Z0aXJx
cyBsYXN0IGRpc2FibGVkIGF0ICg3OTYxNCk6IFs8ZmZmZjgwMDA4MTE0NTVmYz5dIApfX2FsbG9j
X3NrYisweDE3Yy8weDFlOApDUFU6IDIgVUlEOiAwIFBJRDogMTIgQ29tbToga3dvcmtlci91MTY6
MCBOb3QgdGFpbnRlZCAKNi4xOS4wLXJjNC1uZXh0LTIwMjYwMTA1KyAjMTE5NzUgUFJFRU1QVApI
YXJkd2FyZSBuYW1lOiBIYXJka2VybmVsIE9EUk9JRC1NMSAoRFQpCldvcmtxdWV1ZTogZXZlbnRz
X3VuYm91bmQgZGVmZXJyZWRfcHJvYmVfd29ya19mdW5jCkNhbGwgdHJhY2U6CiDCoHNob3dfc3Rh
Y2srMHgxOC8weDI0IChDKQogwqBkdW1wX3N0YWNrX2x2bCsweDkwLzB4ZDAKIMKgZHVtcF9zdGFj
aysweDE4LzB4MjQKIMKgX19taWdodF9yZXNjaGVkKzB4MTQ0LzB4MjQ4CiDCoF9fbWlnaHRfc2xl
ZXArMHg0OC8weDk4CiDCoF9fbXV0ZXhfbG9jaysweDVjLzB4ODk0CiDCoG11dGV4X2xvY2tfbmVz
dGVkKzB4MjQvMHgzMAogwqBwaW5jdHJsX2dldF9kZXZpY2VfZ3Bpb19yYW5nZSsweDQ0LzB4MTI4
CiDCoHBpbmN0cmxfZ3Bpb19kaXJlY3Rpb24rMHgzYy8weGUwCiDCoHBpbmN0cmxfZ3Bpb19kaXJl
Y3Rpb25fb3V0cHV0KzB4MTQvMHgyMAogwqByb2NrY2hpcF9ncGlvX2RpcmVjdGlvbl9vdXRwdXQr
MHhiOC8weDE5YwogwqBncGlvY2hpcF9kaXJlY3Rpb25fb3V0cHV0KzB4MzgvMHg5NAogwqBncGlv
ZF9kaXJlY3Rpb25fb3V0cHV0X3Jhd19jb21taXQrMHgxZDgvMHgzNjAKIMKgZ3Bpb2RfZGlyZWN0
aW9uX291dHB1dF9ub25vdGlmeSsweDdjLzB4MjMwCiDCoGdwaW9kX2RpcmVjdGlvbl9vdXRwdXQr
MHgzNC8weGY4CiDCoGdwaW9fc2hhcmVkX3Byb3h5X2RpcmVjdGlvbl9vdXRwdXQrMHhlYy8weDE0
NCBbZ3Bpb19zaGFyZWRfcHJveHldCiDCoGdwaW9jaGlwX2RpcmVjdGlvbl9vdXRwdXQrMHgzOC8w
eDk0CiDCoGdwaW9kX2RpcmVjdGlvbl9vdXRwdXRfcmF3X2NvbW1pdCsweDFkOC8weDM2MAogwqBn
cGlvZF9kaXJlY3Rpb25fb3V0cHV0X25vbm90aWZ5KzB4N2MvMHgyMzAKIMKgZ3Bpb2RfY29uZmln
dXJlX2ZsYWdzKzB4YmMvMHg0ODAKIMKgZ3Bpb2RfZmluZF9hbmRfcmVxdWVzdCsweDFhMC8weDU3
NAogwqBncGlvZF9nZXRfaW5kZXgrMHg1OC8weDg0CiDCoGRldm1fZ3Bpb2RfZ2V0X2luZGV4KzB4
MjAvMHhiNAogwqBkZXZtX2dwaW9kX2dldF9vcHRpb25hbCsweDE4LzB4MzAKIMKgcm9ja2NoaXBf
cGNpZV9wcm9iZSsweDk4LzB4MzgwCiDCoHBsYXRmb3JtX3Byb2JlKzB4NWMvMHhhYwogwqByZWFs
bHlfcHJvYmUrMHhiYy8weDI5OAoKQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQ
aEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
