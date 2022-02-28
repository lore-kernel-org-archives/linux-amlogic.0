Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAD2C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Feb 2022 14:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJpWh6WnU3A+7aDu04gUDwUIq5WBsV6SNfDWh+JDmbE=; b=c4DO1GqDRTvLKh
	u3FcXI+ve2TbjrPoGBYtKw6QE+nlbYldJZgYmfbQRT6jDg9YFWzl2tcq91QO3L5LWVj9/2ZZwp7uP
	LStGpexVnvWGaQZNAq/W6iSllidbYwt6JnESa017H6VbSjZLzjYkx0x1X84AESSPqXOeb5F2ve+xL
	ruMksaCRNVDtvTYWvAxX+a75ri656/t1s4lnq7yXdvSDDZVQCiRZivNV6HzJ1eEbCFidSE3+rbW/1
	sLC5NZ+lL47QJn+WFoAK/SZLmutky7b3t/4idYYOkHjYaxQk3ee9reiFIb2Y3j3eEgcMdWho+4PI5
	MaW8JF4r/d+2WsNF1HpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOhH8-00Czw8-1e; Mon, 28 Feb 2022 14:45:22 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOh8O-00CwZM-IQ; Mon, 28 Feb 2022 14:36:22 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 28 Feb
 2022 22:36:16 +0800
Message-ID: <a5f19d36-f3b4-f78e-8cff-6062412426f0@amlogic.com>
Date: Mon, 28 Feb 2022 22:36:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
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
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_063620_660304_64BB03D1 
X-CRM114-Status: GOOD (  16.35  )
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

SGksCgpPbiAyMDIyLzIvMjggMjI6MTMsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsgRVhURVJO
QUwgRU1BSUwgXQo+IAo+IEhpLAo+IAo+IE9uIDI4LzAyLzIwMjIgMTQ6NTUsIFl1IFR1IHdyb3Rl
Ogo+PiBEZXNjcmliZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9j
ayB1c2luZyBhIGNsb2NrCj4+IGZyYW1lLiBGb3Jnb3QgdG8gYWRkIGluIEtjb25maWcga2VybmVs
IHRlc3QgUm9ib3QgY29tcGlsYXRpb24gZXJyb3IKPj4gZHVlIHRvIENPTU1PTl9DTEsgZGVwZW5k
ZW5jeS4KPj4KPj4gRml4ZXM6ICgidHR5OiBzZXJpYWw6bWVzb246IERlc2NyaWJlcyB0aGUgY2Fs
Y3VsYXRpb24gb2YgdGhlIFVBUlQgYmF1ZCAKPj4gcmF0ZSBjbG9jayB1c2luZyBhIGNsb2NrIGZy
YW1l4oCcKQo+IAo+IEFzIEkgYWxyZWFkeSByZXBsaWVkIG9uIFYyIG9mIHRoaXMgcGF0Y2gsIHlv
dSdyZSBpbnZpdGVkIHRvIGFwcGx5IHRoZXNlIAo+IGZpeGVzIGRpcmVjdGx5Cj4gb24gdGhlIG5l
eHQgdmVyc2lvbiBvZiB5b3VyICJVc2UgQ0NGIHRvIGRlc2NyaWJlIHRoZSBVQVJUIGJhdWQgcmF0
ZSAKPiBjbG9jayIgcGF0Y2hzZXQKPiBhbmQgbm90IGFzIGEgc2VwYXJhdGUgcGF0Y2guCj4gClNv
cnJ5LCBJIGRvbid0IHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4gQ291bGQgeW91IGJlIG1vcmUg
c3BlY2lmaWM/Cj4gVGhhbmtzLAo+IE5laWwKPiAKPj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBZdSBUdSA8eXUudHVAYW1s
b2dpYy5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZ8KgwqDCoMKg
wqAgfMKgIDEgKwo+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jIHwgMzcgKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjcg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3R0eS9zZXJpYWwvS2NvbmZpZyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9LY29uZmlnCj4+IGluZGV4
IGU5NTJlYzVjN2E3Yy4uYTBmMmI4MmZjMThiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9z
ZXJpYWwvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwo+PiBAQCAt
MjAwLDYgKzIwMCw3IEBAIGNvbmZpZyBTRVJJQUxfS0dEQl9OTUkKPj4gwqAgY29uZmlnIFNFUklB
TF9NRVNPTgo+PiDCoMKgwqDCoMKgIHRyaXN0YXRlICJNZXNvbiBzZXJpYWwgcG9ydCBzdXBwb3J0
Igo+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQVJDSF9NRVNPTiB8fCBDT01QSUxFX1RFU1QKPj4g
K8KgwqDCoCBkZXBlbmRzIG9uIENPTU1PTl9DTEsKPj4gwqDCoMKgwqDCoCBzZWxlY3QgU0VSSUFM
X0NPUkUKPj4gwqDCoMKgwqDCoCBoZWxwCj4+IMKgwqDCoMKgwqDCoMKgIFRoaXMgZW5hYmxlcyB0
aGUgZHJpdmVyIGZvciB0aGUgb24tY2hpcCBVQVJUcyBvZiB0aGUgQW1sb2dpYwo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyAKPj4gYi9kcml2ZXJzL3R0eS9z
ZXJpYWwvbWVzb25fdWFydC5jCj4+IGluZGV4IGJmNmJlNTQ2OGFhZi4uOTcyZjIxMGYzNDkyIDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFydC5jCj4+ICsrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4gQEAgLTc4MCwyOCArNzgwLDM3IEBAIHN0
YXRpYyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3QgCj4+IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IMKgwqDCoMKgwqAgaXJxID0g
cGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPj4gLcKgwqDCoCBpZiAoaXJxIDwgMCkKPj4gLcKg
wqDCoMKgwqDCoMKgIHJldHVybiBpcnE7Cj4+ICvCoMKgwqAgaWYgKGlycSA8IDApIHsKPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldCA9IGlycTsKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX291dF9j
bGtfZGlzYWJsZTsKPj4gK8KgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgb2ZfcHJvcGVydHlfcmVhZF91
MzIocGRldi0+ZGV2Lm9mX25vZGUsICJmaWZvLXNpemUiLCAmZmlmb3NpemUpOwo+PiDCoMKgwqDC
oMKgIGlmIChtZXNvbl9wb3J0c1twZGV2LT5pZF0pIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRl
dl9lcnIoJnBkZXYtPmRldiwgInBvcnQgJWQgYWxyZWFkeSBhbGxvY2F0ZWRcbiIsIHBkZXYtPmlk
KTsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUJVU1k7Cj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXQgPSAtRUJVU1k7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9vdXRfY2xrX2Rpc2FibGU7
Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIHBvcnQgPSBkZXZtX2t6YWxsb2MoJnBkZXYt
PmRldiwgc2l6ZW9mKHN0cnVjdCB1YXJ0X3BvcnQpLCAKPj4gR0ZQX0tFUk5FTCk7Cj4+IC3CoMKg
wqAgaWYgKCFwb3J0KQo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4+ICvCoMKg
wqAgaWYgKCFwb3J0KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+PiArwqDC
oMKgwqDCoMKgwqAgZ290byBlcnJfb3V0X2Nsa19kaXNhYmxlOwo+PiArwqDCoMKgIH0KPj4gwqDC
oMKgwqDCoCBwb3J0LT5tZW1iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYs
IHJlc19tZW0pOwo+PiAtwqDCoMKgIGlmIChJU19FUlIocG9ydC0+bWVtYmFzZSkpCj4+IC3CoMKg
wqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihwb3J0LT5tZW1iYXNlKTsKPj4gK8KgwqDCoCBpZiAo
SVNfRVJSKHBvcnQtPm1lbWJhc2UpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBQVFJfRVJS
KHBvcnQtPm1lbWJhc2UpOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfb3V0X2Nsa19kaXNh
YmxlOwo+PiArwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBwcml2YXRlX2RhdGEgPSBkZXZtX2t6YWxs
b2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2YXRlX2RhdGEpLAo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+IC3CoMKgwqAgaWYgKCFw
cml2YXRlX2RhdGEpCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4gK8KgwqDC
oCBpZiAoIXByaXZhdGVfZGF0YSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVOT01FTTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX291dF9jbGtfZGlzYWJsZTsKPj4gK8KgwqDCoCB9
Cj4+IMKgwqDCoMKgwqAgaWYgKGRldmljZV9nZXRfbWF0Y2hfZGF0YSgmcGRldi0+ZGV2KSkKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHByaXZhdGVfZGF0YS0+dXNlX3h0YWxfY2xrID0gdHJ1ZTsKPj4g
QEAgLTgyMiw3ICs4MzEsNyBAQCBzdGF0aWMgaW50IG1lc29uX3VhcnRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAKPj4gKnBkZXYpCj4+IMKgwqDCoMKgwqAgcmV0ID0gbWVzb25fdWFydF9w
cm9iZV9jbG9ja3MocG9ydCk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gLcKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9vdXRfY2xrX2Rpc2Fi
bGU7Cj4+IMKgwqDCoMKgwqAgbWVzb25fcG9ydHNbcGRldi0+aWRdID0gcG9ydDsKPj4gwqDCoMKg
wqDCoCBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwb3J0KTsKPj4gQEAgLTgzMSw5ICs4NDAs
MTUgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Byb2JlKHN0cnVjdCAKPj4gcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+PiDCoMKgwqDCoMKgIG1lc29uX3VhcnRfcmVzZXQocG9ydCk7Cj4+IMKgwqDC
oMKgwqAgcmV0ID0gdWFydF9hZGRfb25lX3BvcnQoJm1lc29uX3VhcnRfZHJpdmVyLCBwb3J0KTsK
Pj4gLcKgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgIGlmIChyZXQpIHsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIG1lc29uX3BvcnRzW3BkZXYtPmlkXSA9IE5VTEw7Cj4+ICvCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycl9vdXRfY2xrX2Rpc2FibGU7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgcmV0
dXJuIDA7Cj4+ICtlcnJfb3V0X2Nsa19kaXNhYmxlOgo+PiArwqDCoMKgIGNsa19kaXNhYmxlX3Vu
cHJlcGFyZShwY2xrKTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiDCoCB9Cj4+Cj4+IGJh
c2UtY29tbWl0OiBjMmZhZjczN2FiZmIxMGY4OGYyZDI2MTJkNTczZTllZGMzYzQyYzM3Cj4gCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
