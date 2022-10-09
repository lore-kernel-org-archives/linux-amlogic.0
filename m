Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCA5C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Oct 2022 12:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y16JkdAIOA0jzszp28RytjvwlM1opjQWq3Z+U+KKUok=; b=A4HO91FTslAgj4
	vt7noB9xTlCg0WJder+PQTirndy+xwxTfrk9qJbuFnLCNkCp6We2s0WrZrH2zn5OQBVuG6SeS2nnl
	ncB8Ks7ZkV4fj0cqUpdsGeyBMCEN4+fGZp7j+FMHb/jw+LyHB7zVsAkB8qr1Jhv+V7/eeQerQYPE5
	BjscQMJkTtTttCUg7Xh+iKp1kJuBIk0JhzaDB1D/wzxG3LMSTvJyMG0djpfiXxp4Y7euGv+SKcSwU
	udC/x1gUgEGd0qsc5+tYjy2h+lsc1KbQmzVyaqyS857vzMxRTyt96R+yAVZrNSoVI9Avs8KZUV4Eg
	gkGCKzw2950ehQZv0Xog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVEF-00FXEm-FH; Sun, 09 Oct 2022 12:16:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohVEB-00FXD4-G8; Sun, 09 Oct 2022 12:16:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 58EDFCE0AAD;
	Sun,  9 Oct 2022 12:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBF9C433D6;
	Sun,  9 Oct 2022 12:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665317775;
	bh=b62qZ/wRsncRtD4d6NTTlOS81wG617HjE3oXMVJXJyw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UspNBuaqbI2pPkxbCJ4BP1yMgPfxpbpHLTWm7QXzeUgK/5h2F3ZZrNfCme+dussU4
	 Z03/2XCobXlADxRr5Tv7m1loDYV8gRfsDjoamwwH2Qrsg87kdlry+KN2a87u6NbZa7
	 duJKkLW2wpG9K90k1iFyL+Rw9ZK6GomCxlTQS3B7nRF4xHCxIk0yDj0d7xE/skjLm9
	 tHgLIsIIyRJiirXLtO9XBHQ+ksHCr607PSE6HXdknb0VXNLNTxGzWko4vpWV++aUnG
	 BILxz/e6jF1W7dgizLogP9Pmgx2h/FLxolv1SSqHuEXtB6oT34vxTsBrfmAcqAfFNz
	 F3tjPEmW4qR2w==
Date: Sun, 9 Oct 2022 13:16:31 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, linux-amlogic@lists.infradead.org, linux-imx@nxp.com,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Lars-Peter
 Clausen <lars@metafoo.de>, Jyoti Bhayana <jbhayana@google.com>, Hans de
 Goede <hdegoede@redhat.com>, Andriy Tryshnivskyy
 <andriy.tryshnivskyy@opensynergy.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Cixi
 Geng <cixi.geng1@unisoc.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ciprian Regus <ciprian.regus@analog.com>, Fabio Estevam
 <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Alexandru
 Ardelean <aardelean@deviqon.com>, Florian Boor
 <florian.boor@kernelconcepts.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Orson Zhai <orsonzhai@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>, Chunyan Zhang <zhang.lyra@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Jerome Brunet <jbrunet@baylibre.com>, Haibo Chen
 <haibo.chen@nxp.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 15/16] iio: health: max30102: do not use internal
 iio_dev lock
Message-ID: <20221009131631.6dcfe842@jic23-huawei>
In-Reply-To: <20221009124440.71adf505@jic23-huawei>
References: <20221004134909.1692021-1-nuno.sa@analog.com>
	<20221004134909.1692021-16-nuno.sa@analog.com>
	<CAHp75VdiAzOUNMB3wD5og-uZi1W_7UWkqV6+s7jCxpaBs1VWRQ@mail.gmail.com>
	<428661431e54744064946ced681cc0351d51d698.camel@gmail.com>
	<20221009124440.71adf505@jic23-huawei>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_051619_919414_CD86F029 
X-CRM114-Status: GOOD (  39.55  )
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

T24gU3VuLCA5IE9jdCAyMDIyIDEyOjQ0OjQwICswMTAwCkpvbmF0aGFuIENhbWVyb24gPGppYzIz
QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBXZWQsIDA1IE9jdCAyMDIyIDEwOjE3OjAwICswMjAw
Cj4gTnVubyBTw6EgPG5vbmFtZS5udW5vQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gPiBPbiBUdWUs
IDIwMjItMTAtMDQgYXQgMTc6MTUgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZTogIAo+ID4g
PiBPbiBUdWUsIE9jdCA0LCAyMDIyIGF0IDQ6NDkgUE0gTnVubyBTw6EgPG51bm8uc2FAYW5hbG9n
LmNvbT4gd3JvdGU6ICAgIAo+ID4gPiA+IAo+ID4gPiA+IFRoZSBwYXR0ZXJuIHVzZWQgaW4gdGhp
cyBkZXZpY2UgZG9lcyBub3QgcXVpdGUgZml0IGluIHRoZQo+ID4gPiA+IGlpb19kZXZpY2VfY2xh
aW1fZGlyZWN0X21vZGUoKSB0eXBpY2FsIHVzYWdlLiBJbiB0aGlzIGNhc2UsIHdlIHdhbnQKPiA+
ID4gPiB0bwo+ID4gPiA+IGtub3cgaWYgd2UgYXJlIGluIGJ1ZmZlcmVkIG1vZGUgb3Igbm90IHRv
IGtub3cgaWYgdGhlIGRldmljZSBpcwo+ID4gPiA+IHBvd2VyZWQKPiA+ID4gPiAoYnVmZmVyIG1v
ZGUpIG9yIG5vdC4gQW5kIGRlcGVuZGluZyBvbiB0aGF0IG1heDMwMTAyX2dldF90ZW1wKCkKPiA+
ID4gPiB3aWxsCj4gPiA+ID4gcG93ZXIgb24gdGhlIGRldmljZSBpZiBuZWVkZWQuIEhlbmNlLCBp
biBvcmRlciB0byBrZWVwIHRoZSBzYW1lCj4gPiA+ID4gZnVuY3Rpb25hbGl0eSwgd2UgdHJ5IHRv
Ogo+ID4gPiA+IAo+ID4gPiA+IDEuIENsYWltIEJ1ZmZlcmVkIG1vZGU7Cj4gPiA+ID4gMjogSWYg
MSkgc3VjY2VlZHMgY2FsbCBtYXgzMDEwMl9nZXRfdGVtcCgpIHdpdGhvdXQgcG93ZXJpbmcgb24g
dGhlCj4gPiA+ID4gwqDCoCBkZXZpY2U7Cj4gPiA+ID4gMzogUmVsZWFzZSBCdWZmZXJlZCBtb2Rl
Owo+ID4gPiA+IDQ6IElmIDEpIGZhaWxzLCBDbGFpbSBEaXJlY3QgbW9kZTsKPiA+ID4gPiA1OiBJ
ZiA0KSBzdWNjZWVkcyBjYWxsIG1heDMwMTAyX2dldF90ZW1wKCkgd2l0aCBwb3dlcmluZyBvbiB0
aGUKPiA+ID4gPiBkZXZpY2U7Cj4gPiA+ID4gNjogUmVsZWFzZSBEaXJlY3QgbW9kZTsKPiA+ID4g
PiA3OiBJZiA0KSBmYWlscywgZ290byB0byAxKSBhbmQgdHJ5IGFnYWluLgo+ID4gPiA+IAo+ID4g
PiA+IFRoaXMgZGFuY2UgYmV0d2VlbiBidWZmZXJlZCBhbmQgZGlyZWN0IG1vZGUgaXMgbm90IHBh
cnRpY3VsYXJseQo+ID4gPiA+IHByZXR0eQo+ID4gPiA+IChhcyB3ZWxsIGFzIHRoZSBsb29wIGlu
dHJvZHVjZWQgYnkgdGhlIGdvdG8gc3RhdGVtZW50KSBidXQgaXQgZG9lcwo+ID4gPiA+IGFsbG93
Cj4gPiA+ID4gdXMgdG8gZ2V0IHJpZCBvZiB0aGUgbWxvY2sgdXNhZ2Ugd2hpbGUga2VlcGluZyB0
aGUgc2FtZSBiZWhhdmlvci4gICAgCj4gPiA+IAo+ID4gPiAuLi4KPiA+ID4gICAgIAo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpaW9fZGV2aWNlX2NsYWltX2J1ZmZl
cl9tb2RlKGluZGlvX2RldikpIHsgICAgCj4gPiA+IAo+ID4gPiBXaHkgaXMgcmV0IG5vdCB1c2Vk
IGhlcmU/Cj4gPiA+ICAgICAKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLyoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIFRoaXMgb25lIGlzIGEgKmJpdCogaGFja3kuIElmIHdlIGNhbm5v
dAo+ID4gPiA+IGNsYWltIGJ1ZmZlcgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogbW9kZSwgdGhlbiB0cnkgZGlyZWN0IG1vZGUgc28gdGhh
dCB3ZQo+ID4gPiA+IG1ha2Ugc3VyZQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhpbmdzIGNhbm5vdCBjb25jdXJyZW50bHkgY2hhbmdl
LiBBbmQKPiA+ID4gPiB3ZSBqdXN0IGtlZXAKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRyeWluZyB1bnRpbCB3ZSBnZXQgb25lIG9mIHRo
ZSBtb2Rlcy4uLgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICovCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmCj4gPiA+ID4gKGlpb19kZXZpY2VfY2xhaW1fZGlyZWN0X21vZGUoaW5kaW9f
ZGV2KSkgICAgCj4gPiA+IAo+ID4gPiAuLi5hbmQgaGVyZT8KPiA+ID4gICAgIAo+ID4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byBhbnlfbW9kZV9yZXRyeTsgICAgCj4gPiA+ICAgICAKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UgeyAgICAKPiA+ID4gICAgIAo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gICAgCj4gPiA+IAo+ID4gPiBJLm8udy4gd2hhdCBl
cnJvciBjb2RlIHdpbGwgYmUgdmlzaWJsZSB0byB0aGUgY2FsbGVyIGFuZCB3aHkuCj4gPiA+ICAg
ICAKPiA+IAo+ID4gTm90ZSB0aGF0IHdlIGRvIG5vdCByZWFsbHkgY2FyZSBhYm91dCB0aGUgZXJy
b3IgY29kZSByZXR1cm5lZCBieSBib3RoCj4gPiBpaW9fZGV2aWNlX2NsYWltX2J1ZmZlcl9tb2Rl
KCkgYW5kIGlpb19kZXZpY2VfY2xhaW1fZGlyZWN0X21vZGUoKS4gV2UKPiA+IGp1c3QgbG9vcCB1
bnRpbCB3ZSBnZXQgb25lIG9mIHRoZSBtb2RlcyAodGh1cyByZXQgPSAwKSBzbyB0aGF0IHdlIGNh
bgo+ID4gc2FmZWx5IGNhbGwgb25lIG9mIHRoZSBtYXgzMDEwMl9nZXRfdGVtcCgpIHZhcmlhbnRz
LiBBbmQgdGhhdCB3aWxsIGJlCj4gPiB0aGUgdmlzaWJsZSBlcnJvciBjb2RlIChpZiBhbnkpLiBU
aGF0IHNhaWQsIHlvdSBjYW4gbG9vayBhdCB0aGUgZmlyc3QKPiA+IHZlcnNpb24gb2YgdGhlIHNl
cmllcyBhYm91dCB0aGlzIChhbmQgdGhlIHByZXZpb3VzIHBhdGNoKSBhbmQgd2h5IHRoaXMKPiA+
IGlzIGJlaW5nIGRvbmUgbGlrZSB0aGlzIChub3RlIHRoYXQgSSdtIGFsc28gbm90IDEwMCUgY29u
dmluY2VkIGFib3V0Cj4gPiB0aGlzIHBpbmcgcG9uZyBiZXR3ZWVuIGdldHRpbmcgb25lIG9mIHRo
ZSBJSU8gbW9kZXMgYnV0IGl0J3MgYWxzbyBub3QKPiA+IHRoYXQgYmFkIGFuZCBpZiB0aGVyZSdz
IG5vIG1ham9yIGNvbXBsYWlucywgSSdtIGZpbmUgd2l0aCBpdCkuICAKPiAKPiBUaGlzIGlzIGEg
dmFuaXNoaW5nbHkgcmFyZSBjb3JuZXIgY2FzZSBhbmQgbm90IGluIGEgcmVtb3RlbHkgaGlnaCBw
ZXJmb3JtYW5jZQo+IHBhdGggc28gSSdtIG5vdCBrZWVuIG9uIGludHJvZHVjaW5nIGEgbW9yZSBj
b21wbGV4IEFQSSBqdXN0IHRvIGhhbmRsZQo+IHRoaXMgY29ybmVyLiBJZiB3ZSBhZGRlZCBhIG1l
YW5zIHRvIGdldCB0aGUgbG9jayBpbmRlcGVuZGVudCBvZiBtb2RlCj4gd2UnZCBoYXZlIGFuIGlu
dGVyZmFjZSB0aGF0IGlzIGZhciB0byBsaWtlbHkgdG8gZ2V0IG1pc3N1c2VkLgo+IFdoYXQgeW91
IGhhdmUgaGVyZSBkb2VzIHRoZSBqb2IgYW5kIGxvb2tzIG5hc3R5IGVub3VnaCB0byBwdXQgcGVv
cGxlIG9mZgo+IGNvcHlpbmcgaXQgdW5sZXNzIHRoZXkgcmVhbGx5IG5lZWQgaXQhCj4gCj4gSm9u
YXRoYW4KPiAKSSBzaG91bGQgcHJvYmFibHkgaGF2ZSBzYWlkIGxndG0gZm9yIGhvdyB5b3UgaGF2
ZSBpdCBoZXJlLgoKSm9uYXRoYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
