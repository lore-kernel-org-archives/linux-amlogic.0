Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA9BC77B7C
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 22:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0kM1dZnZXguHFw6fahkdsMz+ZtoxQ9d0SNwuuPKls0=; b=lB9DY70BjZr2EI
	roAHWdXfqwQ+RNUav01+wFXwCSrWd32NmsTXS23C7xptxhy9qfyYUbCyfrme4e0xZQFEzTvVsYPCK
	bpn4mt18/qi9pvJ38jHh4OZq9jJk1bPMB73tzIZtGeLKLfCyXRRsr/AgbJo+/gxr/vTstSn/zEuaq
	OBP2R2y/MsglpxQo6RtaUu1pKVTc5rr4lD2I9nDOHHua38NmfqOS8MQi3nWtthyuwVOwoYu4ra9+S
	ZDp8vzfUV8IktbNMPWCbAwCRP0U8eomlSfbotI0tcudRp3rP23nD2PrI6vEnmmCeYtAzkt4f+SYNg
	PU6U+7Y0Q1APtYHSWOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3OzZ-008ZB3-22;
	Sun, 28 May 2023 22:36:01 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3OzW-008Z9m-1g;
	Sun, 28 May 2023 22:36:00 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 26F795FD05;
	Mon, 29 May 2023 01:35:55 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685313355;
	bh=PDk2TqIX07e40FKKbuuGyZQC6PVJSh481bsLGg5lsrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=huBcCseI7xOjEJMql0TsijO+TP6MUcW4Vt1Ex2qbtZVE9x11m91rlUe47KUyqNfdA
	 Wts+ja+neWyjJst9rkjXq8dop63uJtMyCeBh3lApKP4hoXQVc56U+JGxdBpGHfvDKu
	 h44vRWjAsH7mb4yg7j8XLJ6r+SvjRPJ0rBxyzU5UgwJh4gpia/Q7Shdjhf+h++L75+
	 feiqOPlZBorqHAwoVlovgJjDFl9bDGGwrW9lRFYkLgPnh9+WoGiTANQz94xqoC18xM
	 QmhhsMMAHULwZ7xcO5UVniage4u0T3IkFLLzXlck//bIGzuGe/Oi/7O0b8XDJgPCe9
	 rv9BzQh88XYpQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 29 May 2023 01:35:52 +0300 (MSK)
Message-ID: <9df82b13-7594-a8f0-f27e-87bce5a38b74@sberdevices.ru>
Date: Mon, 29 May 2023 01:31:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch channel
 7 mux
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "jic23@kernel.org" <jic23@kernel.org>, "lars@metafoo.de"
	<lars@metafoo.de>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "martin.blumenstingl@googlemail.com"
	<martin.blumenstingl@googlemail.com>, "nuno.sa@analog.com"
	<nuno.sa@analog.com>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, kernel <kernel@sberdevices.ru>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
 <ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/28 19:12:00 #21364717
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_153558_914949_6BC84B2D 
X-CRM114-Status: GOOD (  22.52  )
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

T24gNS8yOC8yMyAxMzo0NiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgoKSGVsbG8gQW5keQo+IE9u
IFN1biwgTWF5IDI4LCAyMDIzIGF0IDEyOjQ4OjU0QU0gKzAzMDAsIEdlb3JnZSBTdGFyayB3cm90
ZToKPj4gUGF0Y2ggYWRkcyB0d28gc3lzZnMgbm9kZXM6IGNoYW43X211eCB0byBzZXQgbXV4IHN0
YXRlCj4+IGFuZCBjaGFuN19tdXhfYXZhaWxhYmxlIHRvIHNob3cgYXZhaWxhYmxlIG11eCBzdGF0
ZXMuCj4+IE11eCBjYW4gYmUgdXNlZCB0byBkZWJ1ZyBhbmQgY2FsaWJyYXRlIGFkYyBieQo+PiBz
d2l0Y2hpbmcgYW5kIG1lYXN1cmluZyB3ZWxsLWtub3duIGlucHV0cyBsaWtlIEdORCwgVmRkIGV0
Yy4KPiBUaGFuayB5b3UgZm9yIGFuIHVwZGF0ZSwgbXkgY29tbWVudHMgYmVsb3cuCj4KPiAuLi4K
Pgo+PiAtLS0KPiBNaXNzaW5nIGNoYW5nZWxvZywgd2hhdCBoYXMgYmVlbiBkb25lIGluIHYyLCBo
b3cgaXQncyBkaWZmZXJlbnQgdG8gdjEuCk9rIEknbGwga2VlcCBpdCBvbiBtaW5kCj4KPj4gICBk
cml2ZXJzL2lpby9hZGMvbWVzb25fc2FyYWRjLmMgfCA2NSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKykKPiAuLi4K
Pgo+PiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBjaGFuN192b2xbXSA9IHsKPj4gKwkiZ25k
IiwKPj4gKwkidmRkLzQiLAo+PiArCSJ2ZGQvMiIsCj4+ICsJInZkZCozLzQiLAo+PiArCSJ2ZGQi
LAo+PiArCSJjaDdfaW5wdXQiLAo+PiArfTsKPj4gKwo+PiArc3RhdGljIHNzaXplX3QgY2hhbjdf
bXV4X3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwKPj4gKwkJCSAgICAgIGNoYXIgKmJ1ZikKPj4gK3sKPj4gKwlzdHJ1Y3QgaWlvX2RldiAqaW5k
aW9fZGV2ID0gZGV2X3RvX2lpb19kZXYoZGV2KTsKPj4gKwlzdHJ1Y3QgbWVzb25fc2FyX2FkY19w
cml2ICpwcml2ID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKPj4gKwl1bnNpZ25lZCBpbnQgaW5kZXgg
PSBwcml2LT5jaGFuN19tdXhfc2VsOwo+PiArCj4+ICsJaWYgKGluZGV4ID49IEFSUkFZX1NJWkUo
Y2hhbjdfdm9sKSkKPj4gKwkJaW5kZXggPSBBUlJBWV9TSVpFKGNoYW43X3ZvbCkgLSAxOwo+IEkg
dGhpbmsgdGhpcyBpcyBpbmNvcnJlY3QgYW5kIHByb25lIHRvIGVycm9yIGluIHRoZSBmdXR1cmUg
aW4gY2FzZSB0aGlzIGFycmF5Cj4gd2lsbCBiZSBleHRlbmRlZC4gV2hhdCBJIHdvdWxkIGV4cGVj
dCBpcyB0byByZXR1cm4gc29tZXRoaW5nIGxpa2UgInVua25vd24iLgoKSSBhZ3JlZSB0aGlzIHBh
cnQgaXMgdW5jbGVhbi4gQWN0dWFsbHkgdGhlIHJlZ2lzdGVyJ3MgbGFzdCAzIChvdXQgb2YgOCkg
CnBvc3NpYmxlIHZhbHVlcwphcmUgc3RhbmQgZm9yIHRoZSBzYW1lIG11eCBpbnB1dCAiY2g3X2lu
cHV0Ii4gU28gdGhlb3JldGljYWxseSB3ZSBjYW4gCnJlYWQgZnJvbSByZWdpc3RlcgphIHZhbHVl
IG91dCBvZiBhcnJheSBib3VuZHMuIFRoZXJlIHNob3VsZCBiZSBhIGNvbW1lbnQgYXQgbGVhc3Qu
CgpBYm91dCB0aGUgcXVlc3Rpb24gb2YgbmFtaW5nIG11eCBpbnB1dHMgZnJvbSB0aGUgb3RoZXIg
bGV0dGVyICh2ZGQvMiB2cyAKMC41VmRkIGV0YykuCldoaWxlIEkgZnVsbHkgYWdyZWUgd2l0aCB5
b3UgdGhhdCBwb2ludCBpcyBiZXR0ZXIgdGhhbiBzbGFzaCBidXQgbWl4aW5nIApsZXR0ZXIgY2Fz
ZXMuLi4gc2hvdWxkIHdlPwoKZS5nLiB0aGlzIGlzIGhvdyBpaW9faW5mbyBvdXRwdXQgbG9va3Mg
bGlrZSBub3c6Ci4uLgogwqDCoCDCoMKgwqDCoCDCoMKgwqAgdm9sdGFnZTc6wqAgKGlucHV0KQog
wqDCoCDCoMKgwqDCoCDCoMKgwqAgMyBjaGFubmVsLXNwZWNpZmljIGF0dHJpYnV0ZXMgZm91bmQ6
CiDCoMKgIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgYXR0csKgIDA6IG1lYW5fcmF3IHZhbHVlOiAw
CiDCoMKgIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgYXR0csKgIDE6IHJhdyB2YWx1ZTogMQogwqDC
oCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIGF0dHLCoCAyOiBzY2FsZSB2YWx1ZTogMC40Mzk0NTMx
MjUKIMKgwqAgwqDCoMKgwqAgNCBkZXZpY2Utc3BlY2lmaWMgYXR0cmlidXRlcyBmb3VuZDoKIMKg
wqAgwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBhdHRywqAgMDogY2hhbjdfbXV4IHZhbHVlOiBnbmQK
IMKgwqAgwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBhdHRywqAgMTogY2hhbjdfbXV4X2F2YWlsYWJs
ZSB2YWx1ZTogZ25kIHZkZC80IHZkZC8yIAp2ZGQqMy80IHZkZCBjaDdfaW5wdXQKIMKgwqAgwqDC
oMKgwqAgwqDCoMKgIMKgwqDCoCBhdHRywqAgMjogY3VycmVudF90aW1lc3RhbXBfY2xvY2sgdmFs
dWU6IHJlYWx0aW1lCgogwqDCoCDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIGF0dHLCoCAzOiB3YWl0
aW5nX2Zvcl9zdXBwbGllciB2YWx1ZTogMAoKb3IgbmFtaW5nIHdpdGggSm9uYXRoYW4ncyBhcHBy
b2FjaAovc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2ZlMDAwMDAwLmJ1cy9mZTAwMmMwMC5hZGMv
aWlvOmRldmljZTAvaW5fdm9sdGFnZV8wLjV2ZGRfcmF3CgpCZXN0IHJlZ2FyZHMKR2VvcmdlCgo+
PiArCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVzXG4iLCBjaGFuN192b2xbaW5kZXhdKTsKPj4g
K30KPj4gKwo+PiArc3RhdGljIHNzaXplX3QgY2hhbjdfbXV4X3N0b3JlKHN0cnVjdCBkZXZpY2Ug
KmRldiwKPj4gKwkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKPj4gKwkJ
CSAgICAgICBjb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkKPj4gK3sKPj4gKwlzdHJ1Y3Qg
aWlvX2RldiAqaW5kaW9fZGV2ID0gZGV2X3RvX2lpb19kZXYoZGV2KTsKPj4gKwlpbnQgaTsKPj4g
Kwo+PiArCWkgPSBzeXNmc19tYXRjaF9zdHJpbmcoY2hhbjdfdm9sLCBidWYpOwo+PiArCWlmIChp
IDwgMCkKPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gRG8gbm90IHNoYWRvdyB0aGUgZXJyb3IgY29k
ZSBpZiBpdCdzIG5vdCBqdXN0aWZpZWQuCj4KPiAJCXJldHVybiBpOwo+Cj4+ICsJbWVzb25fc2Fy
X2FkY19zZXRfY2hhbjdfbXV4KGluZGlvX2RldiwgaSk7Cj4+ICsJcmV0dXJuIGNvdW50Owo+PiAr
fQo+PiArCj4gUmVkdW5kYW50IGJsYW5rIGxpbmUuCj4KPj4gK3N0YXRpYyBJSU9fREVWSUNFX0FU
VFJfUlcoY2hhbjdfbXV4LCAtMSk7Cj4+ICsKPj4gK3N0YXRpYyBzc2l6ZV90IGNoYW43X211eF9h
dmFpbGFibGVfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRl
ICphdHRyLAo+PiArCQkJICAgICAgY2hhciAqYnVmKQo+PiArewo+PiArCWludCBpLCBsZW4gPSAw
Owo+PiArCj4+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY2hhbjdfdm9sKTsgaSsrKQo+
PiArCQlsZW4gKz0gc3lzZnNfZW1pdF9hdChidWYsIGxlbiwgIiVzICIsIGNoYW43X3ZvbFtpXSk7
Cj4+ICsKPj4gKwlyZXR1cm4gbGVuOwo+PiArfQo+PiArCj4gRGl0dG8uCj4KPj4gK3N0YXRpYyBJ
SU9fREVWSUNFX0FUVFJfUk8oY2hhbjdfbXV4X2F2YWlsYWJsZSwgLTEpOwoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
