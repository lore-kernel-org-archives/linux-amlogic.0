Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1FDD29FE5
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV3gYdrURciBK8hbOpG5miOWZQ+Q0qi0V4KpBDntFlI=; b=G4JQrNO4j1iFCT
	kKvm+qiIawjNEQvJLdz8hfC7qYTKlIsrDNuo/YJDVMhmqJNwyuISwohM3gSYfFn1AFDMNl9pkEaKr
	LRSRp3CkhQuTBRCgC5sYmceuHBPdVf7+9jbq6ZQ3oPyv3BeJo4gBsn8RzTycN8g1/qW6M+ENYeRoN
	rHOzpWrf9FwFSnFcsWNwYoISsZmHZDZqo7F7pQrVogoz+NVf7daneHKSqGDcfxajK4Repg1MrcbMR
	OgyuFM/XSu7qJPH86PhqgfQarkWSSc+8s4rivrAkRmrawltgR0fLlXb7BbTRoNPM1wmlFq/Ln1tzC
	z1q1iszHOAzmwRACYxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyC3-00000008o7M-1oxD;
	Wed, 14 Jan 2026 10:33:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyBx-00000008o5J-1vVY;
	Wed, 14 Jan 2026 10:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 81D5260123;
	Wed, 14 Jan 2026 10:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA1BC16AAE;
	Wed, 14 Jan 2026 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768386812;
	bh=2ZiLyAKqaZ48YVIn7VvFsZOXbZKEr36Pyd+9rE9cSlo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vg6D8f7fpiwoLuuQYzYq0/07ebXpKlmOgJ6F5fs90/fxuaHUeYjNKDCnO0TIsufpD
	 cRHbs5SjDbGgTpZx9F4KK47aJ/3wGYjYtQJ46OinicypOvqVBMH57d8Kp5eAPAm3Nl
	 7UZOOwbFf7tqZKmlvUXvCoO2b3jyl0flRaY7CP0FqDQ0mndGF1LPPsDIH1h2yI9bW8
	 6SXs6/IP3RtykcZmzCNl2hkGaKFxdHXYqsb7PPTrV0ZrM5rpAbS5f+bb3sQQEGUq18
	 e7Jigg6TMJWIRTNIuZ1Thamt3Al4B4v9VRW0Rfat7ZwMQ7DMbJGiT6Tfrtjq22sfNR
	 NzWaf/WVhhYMw==
Message-ID: <39bb1820-6e4d-4f50-87e0-93844d779f6c@kernel.org>
Date: Wed, 14 Jan 2026 11:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S
 binding
To: Nick Xie <xieqinick@gmail.com>
References: <20260114062549.68954-1-nick@khadas.com>
 <20260114062549.68954-2-nick@khadas.com>
 <20260114-slick-passionate-mink-216a3a@quoll>
 <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAP4nuTXeC1-6ktwLpDt_1ZRHxPSiNAoDKTxLzqEYJUfcnVogcQ@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, linux-kernel@vger.kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTQvMDEvMjAyNiAxMTowNywgTmljayBYaWUgd3JvdGU6Cj4gS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPiDkuo4yMDI25bm0MeaciDE05pel5ZGo5LiJIDE2OjUx5YaZ6YGT
77yaCj4+Cj4+IE9uIFdlZCwgSmFuIDE0LCAyMDI2IGF0IDAyOjI1OjQ4UE0gKzA4MDAsIE5pY2sg
WGllIHdyb3RlOgo+Pj4gQWRkIGRldmljZXRyZWUgYmluZGluZyBmb3IgS2hhZGFzIFZJTTFTIGJv
YXJkIGJhc2VkIG9uCj4+PiBBbWxvZ2ljIFM0IFM5MDVZNCBTb0MuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KPj4KPj4gWW91IHN0aWxsIGhhdmUgdGhl
IHNhbWUgRnJvbS9Tb0IgbWlzbWF0Y2guCj4gCj4gT0ssICBJIHdpbGwgZml4IGl0IGluIG5leHQg
dmVyc2lvbi4KPiAKPj4KPj4+IC0tLQo+Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYW1sb2dpYy55YW1sIHwgNiArKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPj4+IGluZGV4IDA4ZDk5NjNmZTkyNTkuLjU1NjYzZTBm
N2Y5MTUgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FtbG9naWMueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9hbWxvZ2ljLnlhbWwKPj4+IEBAIC0yNDcsNiArMjQ3LDEyIEBAIHByb3BlcnRpZXM6
Cj4+PiAgICAgICAgICAgICAgICAtIGFtbG9naWMsYXEyMjIKPj4+ICAgICAgICAgICAgLSBjb25z
dDogYW1sb2dpYyxzNAoKTG9vayBoZXJlCgo+Pj4KPj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBC
b2FyZHMgd2l0aCB0aGUgQW1sb2dpYyBNZXNvbiBTNCBTOTA1WTQgU29DCj4+PiArICAgICAgICBp
dGVtczoKPj4+ICsgICAgICAgICAgLSBlbnVtOgo+Pgo+PiBZb3B1IGFscmVhZHkgaGF2ZSBleGFj
dGx5IHN1Y2ggZW51bSB3aXRoIHN1Y2ggZGVzY3JpcHRpb24sIHNvIHlvdXIKPj4gY29tcGF0aWJs
ZSBnb2VzIHRoZXJlLiBMb29rIC0gaXQgaXMgY2FsbGVkICJCb2FyZHMiIC0gcGx1cmFsLgo+IAo+
IFRoZSBleGlzdCBib2FyZCBhcTIyMiBpcyBiYXNlZCBvbiBTb0MgUzkwNVgyLCBidXQgdGhlIG5l
dyBib2FyZCB2aW0xcwo+IGlzIGJhZWQgb24gUzkwNVk0LAo+IHRoZXkgYXJlIGRpZmZlcmVudCBT
b0MsIHNvIHdlIG5lZWQgdG8gcHV0IFM5MDVZNCB1bmRlciBTODA1WDIgPwoKV2hhdCBpcyB0aGUg
cG9pbnQgb2YgaGF2aW5nIHR3byBzZXBhcmF0ZSBsaXN0cyB3aXRoIGVudW1zIGVuZGluZyB0aGUK
c2FtZSBTb0MgY29tcGF0aWJsZT8KCj4gCj4+Cj4+PiArICAgICAgICAgICAgICAtIGtoYWRhcyx2
aW0xcwo+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM0CgpBbmQgaGVyZS4KCj4+Cj4+
IEJlc3QgcmVnYXJkcywKPj4gS3J6eXN6dG9mCj4+CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
