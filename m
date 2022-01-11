Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F9AC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 02:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4M+OSUzl4IKDziffCT7Wr9qXgJfwWts6YFpct5DGv0=; b=SCMQc78iri6jVh
	TpdDkECGHWN+Me7HAqtn95V40clUKkGzoPwEoWfq8Gdd5CLXTtOzZBwdvRS56+0rWIy3TLurcp0VQ
	UvI0kqd7L+08VkEnC6IberoQcB24DkC1yQtkxZTlqNvycvDaycdzOxQiGcmtID/eCwOVR+KJLAysM
	tjE520J1xkRynpC3zV5/FyEaVAB5QKNpqqm09NnFpq+WbH0szTyseFwvnT6WFCya+GyRTgLA/sWhx
	HZOQtT2ie+Q8lR1V1o33sBQr4XFujI12zleMgoElQJxbznQ+o2PjeVzqopu2g3hx98Mmc2/YpDJgs
	fWybw9hln/HyiCkGaHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n77Df-00ELE7-Rc; Tue, 11 Jan 2022 02:49:07 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n77DQ-00EL6J-OC; Tue, 11 Jan 2022 02:48:54 +0000
Received: from [10.18.29.173] (10.18.29.173) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 11 Jan
 2022 10:48:42 +0800
Message-ID: <cad33ab0-26d3-5b78-3bcf-62217aa70871@amlogic.com>
Date: Tue, 11 Jan 2022 10:48:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V5 2/5] tty: serial: meson: Move request the register
 region.
Content-Language: en-US
To: Jiri Slaby <jirislaby@kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220110104214.25321-1-yu.tu@amlogic.com>
 <20220110104214.25321-3-yu.tu@amlogic.com>
 <01066e66-5d97-ab40-b4a6-99e962b47073@kernel.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <01066e66-5d97-ab40-b4a6-99e962b47073@kernel.org>
X-Originating-IP: [10.18.29.173]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_184852_821623_849D8C7F 
X-CRM114-Status: GOOD (  16.48  )
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

SGkgSmlyaSAsCglUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIHJlcGx5LgoKT24gMjAyMi8x
LzEwIDE5OjU4LCBKaXJpIFNsYWJ5IHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IEhp
LAo+IAo+IE9uIDEwLiAwMS4gMjIsIDExOjQyLCBZdSBUdSB3cm90ZToKPj4gVGhpcyBzaW1wbGlm
aWVzIHJlc2V0dGluZyB0aGUgVUFSVCBjb250cm9sbGVyIGR1cmluZyBwcm9iZQo+PiBhbmQgd2ls
bCBtYWtlIGl0IGVhc2llciB0byBpbnRlZ3JhdGUgdGhlIGNvbW1vbiBjbG9jayBjb2RlCj4+IHdo
aWNoIHdpbGwgcmVxdWlyZSB0aGUgcmVnaXN0ZXJzIGF0IHByb2JlIHRpbWUgYXMgd2VsbC4KPiAK
PiBBbmQgeW91IGFyZSAqYWxzbyogc3dpdGNoaW5nIGRldm1fcmVxdWVzdF9tZW1fcmVnaW9uK2Rl
dm1faW9yZW1hcCBpbnRvIAo+IGRldm1faW9yZW1hcF9yZXNvdXJjZSB3aXRob3V0IGV2ZW4gbm90
aW5nIGl0IGhlcmUuIEl0IHNob3VsZCd2ZSBiZWVuIAo+IGRvbmUgaW4gYSBzZXBhcmF0ZSBwYXRj
aC4KPiAKSSBjYW4gY2hhbmdlIGl0IGFzIHlvdSBzdWdnZXN044CCClRoZSBzd2l0Y2hpbmcgZGV2
bV9yZXF1ZXN0X21lbV9yZWdpb24rZGV2bV9pb3JlbWFwIGludG8KZGV2bV9pb3JlbWFwX3Jlc291
cmNlIGluIGEgc2VwYXJhdGUgcGF0Y2guCgo+IEFuZCBubywgZG8gbm90IHJlc2VuZCBhIG5ldyB2
ZXJzaW9uIGluIHRoZSBuZXh0IGZldyBkYXlzLiBIYXZpbmcgdjUgaW4gCj4gMjAgZGF5cyBpcyBh
IGJpdCB0b28gbXVjaC4gR2l2ZSBtYWludGFpbmVycyBhbmQgcmV2aWV3ZXJzIHNvbWUgbW9yZSAK
PiBzcGFjZSB0byBleHByZXNzIHRoZW1zZWx2ZXMuCkkgYW0gc28gc29ycnkgaWYgUEFUQ0ggaXMg
c2VudCB0b28gZnJlcXVlbnRseSwgd2hpY2ggaGFzIGRpc3R1cmJlZCB5b3UuCkhvdyBvZnRlbiBz
aG91bGQgSSBzZW5kIGl0PyBPciB1bmRlciB3aGF0IGNpcmN1bXN0YW5jZXMgY2FuIEkgc2VuZCB0
aGUgCm5leHQgdmVyc2lvbj8KCj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxvZ2lj
LmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMgfCAyNCAr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJp
YWwvbWVzb25fdWFydC5jIAo+PiBiL2RyaXZlcnMvdHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4g
aW5kZXggNDVlMDBkOTI4MjUzLi43NTcwOTU4ZDAxMGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
dHR5L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL21lc29u
X3VhcnQuYwo+PiBAQCAtMzk1LDI0ICszOTUsMTEgQEAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Zl
cmlmeV9wb3J0KHN0cnVjdCAKPj4gdWFydF9wb3J0ICpwb3J0LAo+PiDCoCBzdGF0aWMgdm9pZCBt
ZXNvbl91YXJ0X3JlbGVhc2VfcG9ydChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQo+PiDCoCB7Cj4+
IC3CoMKgwqAgZGV2bV9pb3VubWFwKHBvcnQtPmRldiwgcG9ydC0+bWVtYmFzZSk7Cj4+IC3CoMKg
wqAgcG9ydC0+bWVtYmFzZSA9IE5VTEw7Cj4+IC3CoMKgwqAgZGV2bV9yZWxlYXNlX21lbV9yZWdp
b24ocG9ydC0+ZGV2LCBwb3J0LT5tYXBiYXNlLCBwb3J0LT5tYXBzaXplKTsKPj4gK8KgwqDCoCAv
KiBub3RoaW5nIHRvIGRvICovCj4+IMKgIH0KPj4gwqAgc3RhdGljIGludCBtZXNvbl91YXJ0X3Jl
cXVlc3RfcG9ydChzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0KQo+PiDCoCB7Cj4+IC3CoMKgwqAgaWYg
KCFkZXZtX3JlcXVlc3RfbWVtX3JlZ2lvbihwb3J0LT5kZXYsIHBvcnQtPm1hcGJhc2UsIAo+PiBw
b3J0LT5tYXBzaXplLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZXZfbmFtZShwb3J0LT5kZXYpKSkgewo+PiAtwqDCoMKgwqDCoMKgwqAgZGV2X2Vycihwb3J0
LT5kZXYsICJNZW1vcnkgcmVnaW9uIGJ1c3lcbiIpOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FQlVTWTsKPj4gLcKgwqDCoCB9Cj4+IC0KPj4gLcKgwqDCoCBwb3J0LT5tZW1iYXNlID0gZGV2
bV9pb3JlbWFwKHBvcnQtPmRldiwgcG9ydC0+bWFwYmFzZSwKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwb3J0LT5tYXBzaXplKTsKPj4gLcKgwqDC
oCBpZiAoIXBvcnQtPm1lbWJhc2UpCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsK
Pj4gLQo+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+IEBAIC03MzMsNiArNzIwLDEw
IEBAIHN0YXRpYyBpbnQgbWVzb25fdWFydF9wcm9iZShzdHJ1Y3QgCj4+IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPj4gwqDCoMKgwqDCoCBpZiAoIXBvcnQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT01FTTsKPj4gK8KgwqDCoCBwb3J0LT5tZW1iYXNlID0gZGV2bV9pb3JlbWFwX3Jl
c291cmNlKCZwZGV2LT5kZXYsIHJlc19tZW0pOwo+PiArwqDCoMKgIGlmIChJU19FUlIocG9ydC0+
bWVtYmFzZSkpCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihwb3J0LT5tZW1iYXNl
KTsKPj4gKwo+PiDCoMKgwqDCoMKgIHJldCA9IG1lc29uX3VhcnRfcHJvYmVfY2xvY2tzKHBkZXYs
IHBvcnQpOwo+PiDCoMKgwqDCoMKgIGlmIChyZXQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gcmV0Owo+PiBAQCAtNzU0LDEwICs3NDUsNyBAQCBzdGF0aWMgaW50IG1lc29uX3VhcnRfcHJv
YmUoc3RydWN0IAo+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgwqDCoMKgwqAgcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgcG9ydCk7Cj4+IMKgwqDCoMKgwqAgLyogcmVzZXQgcG9ydCBi
ZWZvcmUgcmVnaXN0ZXJpbmcgKGFuZCBwb3NzaWJseSByZWdpc3RlcmluZyAKPj4gY29uc29sZSkg
Ki8KPj4gLcKgwqDCoCBpZiAobWVzb25fdWFydF9yZXF1ZXN0X3BvcnQocG9ydCkgPj0gMCkgewo+
PiAtwqDCoMKgwqDCoMKgwqAgbWVzb25fdWFydF9yZXNldChwb3J0KTsKPj4gLcKgwqDCoMKgwqDC
oMKgIG1lc29uX3VhcnRfcmVsZWFzZV9wb3J0KHBvcnQpOwo+PiAtwqDCoMKgIH0KPj4gK8KgwqDC
oCBtZXNvbl91YXJ0X3Jlc2V0KHBvcnQpOwo+PiDCoMKgwqDCoMKgIHJldCA9IHVhcnRfYWRkX29u
ZV9wb3J0KCZtZXNvbl91YXJ0X2RyaXZlciwgcG9ydCk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkK
PiAKPiB0aGFua3MsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
