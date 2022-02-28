Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ECAC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNCUEvGCNT9QfS2yU2xEqRu6CGeB6QWqM36sNcDWs3w=; b=MmSzgfhhdAFWxO
	0arsLIf6nAToGQ5e+uiH2KdDHFS6d7f2c31hqcfto6cu3jCxYDnwuptZJ4jiqY5E1AooUJGcVrn7/
	UeGVuQRG1XNee1av+En4zQYb1HYwS5Vog0fNXFabDE/zNPQAPD43S9B9EnO2AkFixEDGgVjDDaeT8
	AX7MjRKNNFCjXodTjkkmscwJbUUGareX2Uu1NQC00d6L7PCeKTsXFzysYuRQ7nkp4fP2s3I16cK7p
	zTGr/ovyVE//HHNH+pEDuyqSkt1aX1GzTsYpORrZOrLLZybF+VBa3yp8Zsb8Yxo+LGJr81tp4z1KC
	ei/RNX6+x5rIfHrO0Srg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOgCL-00CcQ0-AX; Mon, 28 Feb 2022 13:36:21 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOgC3-00CcLV-EE; Mon, 28 Feb 2022 13:36:09 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 28 Feb
 2022 21:35:56 +0800
Message-ID: <837c988c-1347-8aa6-cffd-2130f8894cb0@amlogic.com>
Date: Mon, 28 Feb 2022 21:35:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V2] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, <linux-serial@vger.kernel.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, kernel test robot <lkp@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
References: <20220228090351.9976-1-yu.tu@amlogic.com>
 <790952bd-b066-0b41-545c-1f65cd4244af@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <790952bd-b066-0b41-545c-1f65cd4244af@baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_053603_506749_79D34750 
X-CRM114-Status: GOOD (  15.44  )
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

SGkgTmVpbCwKCVRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHkuCgpPbiAyMDIyLzIv
MjggMTc6NTIsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+
IGksCj4gCj4gT24gMjgvMDIvMjAyMiAxMDowMywgWXUgVHUgd3JvdGU6Cj4+IERlc2NyaWJlcyB0
aGUgY2FsY3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIHVzaW5nIGEgY2xvY2sK
Pj4gZnJhbWUuIEZvcmdvdCB0byBhZGQgaW4gS2NvbmZpZyBrZXJuZWwgdGVzdCBSb2JvdCBjb21w
aWxhdGlvbiBlcnJvcgo+PiBkdWUgdG8gQ09NTU9OX0NMSyBkZXBlbmRlbmN5Lgo+Pgo+PiBGaXhl
czogNDQwMjNiOGUxZjE0ICgidHR5OiBzZXJpYWw6bWVzb246IERlc2NyaWJlcyB0aGUgY2FsY3Vs
YXRpb24gb2YgCj4+IHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9jayB1c2luZyBhIGNsb2NrIGZyYW1l
4oCcKQo+IAo+IEFGQUlLIHRoaXMgY29tbWl0IGlzIG5vdCBpbiBhbiB1cHRyZWFtL2ZlYXR1cmUg
YnJhbmNoLCBzbyB5b3Ugc2hvdWxkIAo+IHNpbXBseSBmaXggeW91ciBgVXNlIENDRiB0byBkZXNj
cmliZSB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2tgIGluc3RlYWQuCj4gCkknbGwgY29ycmVjdCBp
dCByaWdodCBhd2F5IGFzIHlvdSBzdWdnZXN0ZWQuCgo+IE5laWwKPiAKPj4gUmVwb3J0ZWQtYnk6
IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBSZXBvcnRlZC1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBZdSBU
dSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvS2Nv
bmZpZ8KgwqDCoMKgwqAgfMKgIDEgKwo+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFy
dC5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29u
ZmlnCj4+IGluZGV4IGU5NTJlYzVjN2E3Yy4uYTBmMmI4MmZjMThiIDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvS2Nv
bmZpZwo+PiBAQCAtMjAwLDYgKzIwMCw3IEBAIGNvbmZpZyBTRVJJQUxfS0dEQl9OTUkKPj4gwqAg
Y29uZmlnIFNFUklBTF9NRVNPTgo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJNZXNvbiBzZXJpYWwg
cG9ydCBzdXBwb3J0Igo+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01Q
SUxFX1RFU1QKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIENPTU1PTl9DTEsKPj4gwqDCoMKgwqDCoCBz
ZWxlY3QgU0VSSUFMX0NPUkUKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgIFRo
aXMgZW5hYmxlcyB0aGUgZHJpdmVyIGZvciB0aGUgb24tY2hpcCBVQVJUcyBvZiB0aGUgQW1sb2dp
Ywo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyAKPj4gYi9k
cml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+IGluZGV4IGJmNmJlNTQ2OGFhZi4uOTcy
ZjIxMGYzNDkyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5j
Cj4+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4gQEAgLTc4MCwyOCAr
NzgwLDM3IEBAIHN0YXRpYyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3QgCj4+IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IMKgwqDC
oMKgwqAgaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4gLcKgwqDCoCBpZiAoaXJx
IDwgMCkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBpcnE7Cj4+ICvCoMKgwqAgaWYgKGlycSA8
IDApIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGlycTsKPj4gK8KgwqDCoMKgwqDCoMKgIGdv
dG8gZXJyX291dF9jbGtfZGlzYWJsZTsKPj4gK8KgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgb2ZfcHJv
cGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsICJmaWZvLXNpemUiLCAmZmlmb3NpemUp
Owo+PiDCoMKgwqDCoMKgIGlmIChtZXNvbl9wb3J0c1twZGV2LT5pZF0pIHsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIGRldl9lcnIoJnBkZXYtPmRldiwgInBvcnQgJWQgYWxyZWFkeSBhbGxvY2F0ZWRc
biIsIHBkZXYtPmlkKTsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUJVU1k7Cj4+ICvCoMKg
wqDCoMKgwqDCoCByZXQgPSAtRUJVU1k7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9vdXRf
Y2xrX2Rpc2FibGU7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIHBvcnQgPSBkZXZtX2t6
YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKHN0cnVjdCB1YXJ0X3BvcnQpLCAKPj4gR0ZQX0tFUk5F
TCk7Cj4+IC3CoMKgwqAgaWYgKCFwb3J0KQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9N
RU07Cj4+ICvCoMKgwqAgaWYgKCFwb3J0KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5P
TUVNOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfb3V0X2Nsa19kaXNhYmxlOwo+PiArwqDC
oMKgIH0KPj4gwqDCoMKgwqDCoCBwb3J0LT5tZW1iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNl
KCZwZGV2LT5kZXYsIHJlc19tZW0pOwo+PiAtwqDCoMKgIGlmIChJU19FUlIocG9ydC0+bWVtYmFz
ZSkpCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihwb3J0LT5tZW1iYXNlKTsKPj4g
K8KgwqDCoCBpZiAoSVNfRVJSKHBvcnQtPm1lbWJhc2UpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXQgPSBQVFJfRVJSKHBvcnQtPm1lbWJhc2UpOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJf
b3V0X2Nsa19kaXNhYmxlOwo+PiArwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBwcml2YXRlX2RhdGEg
PSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2YXRlX2RhdGEpLAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+IC3C
oMKgwqAgaWYgKCFwcml2YXRlX2RhdGEpCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01F
TTsKPj4gK8KgwqDCoCBpZiAoIXByaXZhdGVfZGF0YSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0
ID0gLUVOT01FTTsKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX291dF9jbGtfZGlzYWJsZTsK
Pj4gK8KgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgaWYgKGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRl
di0+ZGV2KSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHByaXZhdGVfZGF0YS0+dXNlX3h0YWxfY2xr
ID0gdHJ1ZTsKPj4gQEAgLTgyMiw3ICs4MzEsNyBAQCBzdGF0aWMgaW50IG1lc29uX3VhcnRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAKPj4gKnBkZXYpCj4+IMKgwqDCoMKgwqAgcmV0ID0g
bWVzb25fdWFydF9wcm9iZV9jbG9ja3MocG9ydCk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4g
LcKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9v
dXRfY2xrX2Rpc2FibGU7Cj4+IMKgwqDCoMKgwqAgbWVzb25fcG9ydHNbcGRldi0+aWRdID0gcG9y
dDsKPj4gwqDCoMKgwqDCoCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwb3J0KTsKPj4gQEAg
LTgzMSw5ICs4NDAsMTUgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Byb2JlKHN0cnVjdCAKPj4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiDCoMKgwqDCoMKgIG1lc29uX3VhcnRfcmVzZXQocG9y
dCk7Cj4+IMKgwqDCoMKgwqAgcmV0ID0gdWFydF9hZGRfb25lX3BvcnQoJm1lc29uX3VhcnRfZHJp
dmVyLCBwb3J0KTsKPj4gLcKgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgIGlmIChyZXQpIHsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIG1lc29uX3BvcnRzW3BkZXYtPmlkXSA9IE5VTEw7Cj4+ICvCoMKg
wqDCoMKgwqDCoCBnb3RvIGVycl9vdXRfY2xrX2Rpc2FibGU7Cj4+ICvCoMKgwqAgfQo+PiArCj4+
ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICtlcnJfb3V0X2Nsa19kaXNhYmxlOgo+PiArwqDCoMKgIGNs
a19kaXNhYmxlX3VucHJlcGFyZShwY2xrKTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDC
oCB9Cj4+Cj4+IGJhc2UtY29tbWl0OiBjMmZhZjczN2FiZmIxMGY4OGYyZDI2MTJkNTczZTllZGMz
YzQyYzM3Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
