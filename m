Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F3C77B61
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Apr 2023 11:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4sJldB2ciTPUU/o50ggm5tZZaOelSou1anwfAW4/Gg=; b=SV81Cgc2OuI418
	Zb17HgcYeWLj5tnjeSP7uuM2v8eL1Uz6a4lip1cqXWWDfHDOB6MPjq9Zu9tg57qGVo6sRK4wg2rkJ
	MwvQNZeVWrm7W8Zk/9MDkuR/zelhjktk7LX9QkOiDqmYL8Rqf/wgqG0y/qVq/2BfCwgsIe1xKC4rB
	4ArQsAAB6oKIRnj33eQ8StjZEFMx/cuN7FOzPp4BsreKwn0rvlhvUrt+/tpIhIg4soV+Ztg/U8cXd
	EHkBsPLEo4Tn/fF6sqXOJ+5YsT1In916mU3DxshWiQqT6GMqyURI7CN+aOgxu1PR4rVWTQgAJ7COK
	nptSFMA1hIUn+/f6UjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prGV0-000vT2-0d;
	Tue, 25 Apr 2023 11:06:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prGUx-000vRv-1A;
	Tue, 25 Apr 2023 11:06:17 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4E56F5FD3E;
	Tue, 25 Apr 2023 14:06:12 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1682420772;
	bh=jORapi60saGb6s8dqt0Qj/N+jnHOySKoftd9srjwQEs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=rRc5dU1h7elVVrLMdQ68XUElEEtq7bwWwUgtV6+mOM9NJnSZxUU/TIdyE5cVikw02
	 vK6EdxY2XsJi0G+50e30/FWNBX4dJvX2zdD5NT24ll6uDNdCBmrhUFCQBh+ie+U4VI
	 sP15RdoSlG29gtUtuThXm4SWxwId9ahah4GRv5/B+GartSYov43VR8WMd8aIwpGLEi
	 /lzZU2VSNpCJuz9Sk2Hzxfn4FfLudJ6OhkrygOpPcR5nnivQMbkcCs/VnclwXOWEG7
	 OO6qz+mZzjfy4tHqjYueG+s+azXsSKtWSO0egJxufitROVUXABrZoX/zAIU+1zkBJX
	 zi+nTaA/xqwZA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 25 Apr 2023 14:06:10 +0300 (MSK)
Date: Tue, 25 Apr 2023 14:06:10 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>, <mturquette@baylibre.com>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <hminas@synopsys.com>,
	<Thinh.Nguyen@synopsys.com>, <yue.wang@amlogic.com>,
	<hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: meson: a1: support USB controller in
 OTG mode
Message-ID: <20230425110610.ezhhz2vauc6o4nu2@CAB-WSD-L081021>
References: <20230418111612.19479-1-ddrokosov@sberdevices.ru>
 <20230418111612.19479-6-ddrokosov@sberdevices.ru>
 <CAFBinCDvyweC-m=nKw+FZFYvASDE2x3e-Vt=JkSzBifu87cnNw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDvyweC-m=nKw+FZFYvASDE2x3e-Vt=JkSzBifu87cnNw@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/25 07:55:00 #21159618
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_040615_743276_24F18111 
X-CRM114-Status: GOOD (  16.37  )
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

T24gU3VuLCBBcHIgMjMsIDIwMjMgYXQgMDc6NTE6MzFQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBUdWUsIEFwciAxOCwgMjAyMyBhdCAxOjE24oCvUE0gRG1pdHJ5IFJv
a29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gWy4uLl0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHVzYjJfcGh5MTogcGh5QDQwMDAgewo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYTEtdXNiMi1waHkiOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsa2MgQ0xLSURf
VVNCX1BIWV9JTj47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5h
bWVzID0gInh0YWwiOwo+IE91dCBvZiBjdXJpb3NpdHkgc2luY2UgdGhlcmUncyBhbHNvIGEgQ0xL
SURfVVNCX1BIWSBjbG9jayAod2hpY2ggaXMKPiB1c2VkIGZvciB0aGUgZHdjMyBjb250cm9sbGVy
IGJlbG93KToKPiBEbyB3ZSBrbm93IHRoYXQgdGhpcyBwYXJ0IG9mIHRoZSBjbG9jayBoaWVyYXJj
aHkgaXMgY29ycmVjdD8gSSBoYXZlIG5vCj4gd2F5IHRvIGNoZWNrIHRoaXMgbXlzZWxmLCBzbyBJ
J20gY3VyaW91cyBpZiB5b3UgY291bGQgdmVyaWZ5IHRoaXMKPiBzb21laG93Lgo+IAo+IFsuLi5d
CgpJJ3ZlIGRldmVsb3BlZCBhIGNsb2NrIGRyaXZlciBmb3IgQTEgYW5kIHZlcmlmaWVkIGl0IGFn
YWluc3QgdGhlIEFtbG9naWMKY3VzdG9tIGRyaXZlciBhbmQgZGF0YXNoZWV0LiBBcyB5b3UgcG9p
bnRlZCBvdXQsIHRoZXJlIGFyZSBpbmRlZWQgdHdvClVTQiBwaHkgY2xvY2tzLgpUaGV5IGFyZSBs
YWJlbGVkIGFzIGZvbGxvd3MgaW4gbXkgY2xvY2sgZHJpdmVyOgogICAgKiBDTEtJRF9VU0JfUEhZ
X0lOICh4dGFsIC0+IHVzYl9waHkgZ2F0ZWQgY2xvY2spIC0gdGhlIHBoeSBpbnB1dCBjbG9jawog
ICAgKiBDTEtJRF9VU0JfUEhZIChTWVNfQ0xLX0VOIGJhc2VkIGdhdGUpIC0gdGhlIHN5bm9wc3lz
IElQIGdhdGVkIGNsb2NrCgpUaGUgY3VycmVudCByZXByZXNlbnRhdGlvbiBvZiB0aGUgVVNCIHBo
eSBjbG9ja3MgaXMgc29sZWx5IGJhc2VkIG9uCm15IHRlY2huaWNhbCBvcGluaW9uLCBhcyB0aGUg
ZGF0YXNoZWV0IGRvZXMgbm90IHByb3ZpZGUgYW55IGRldGFpbGVkCmluZm9ybWF0aW9uIGFib3V0
IHRoZW0uCgpDbG9jayBkcml2ZXI6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDQw
NTE5NTkyNy4xMzQ4Ny0xLWRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydS8KCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBkd2MyOiB1c2JAZmY1MDAwMDAgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYTEtdXNiIiwgInNucHMs
ZHdjMiI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhm
ZjUwMDAwMCAweDAgMHg0MDAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludGVycnVwdHMgPSA8R0lDX1NQSSA4OSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5cyA9IDwmdXNiMl9waHkxPjsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5LW5hbWVzID0gInVzYjJfcGh5IjsKPiBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzIueWFtbCBvbmx5IGFsbG93cyBh
Cj4gInVzYjItcGh5IiAoZGFzaCBpbnN0ZWFkIG9mIHVuZGVyc2NvcmUpLgo+IAo+IFsuLi5dCgpB
aCwgbXkgZmF1bHQuLgoKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGR3YzM6IHVzYkBmZjQw
MDAwMCB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
c25wcyxkd2MzIjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
MCAweGZmNDAwMDAwIDB4MCAweDEwMDAwMD47Cj4gTm90ZSB0byBzZWxmOiBpbnRlcmVzdGluZyB0
aGF0IEFtbG9naWMgc3dhcHBlZCB0aGUgcmVnaXN0ZXIgbG9jYXRpb24KPiBvZiB0aGUgZHdjMiBh
bmQgZHdjMyBjb250cm9sbGVycyBzaW5jZSB0aGUgRzEyIGdlbmVyYXRpb24uCgpJbmRlZWQsIGR1
cmluZyB0aGUgYnJpbmd1cCBwcm9jZXNzLCBJIHdhcyBzdXJwcmlzZWQgdG8gZGlzY292ZXIgdGhh
dAp0aGUgZHdjMiBlbmdpbmUgd2Fzbid0IHN0YXJ0aW5nIHByb3Blcmx5LiBJdCB3YXMgcXVpdGUg
dW5leHBlY3RlZCwgYnV0CmFsc28gYWRtaXR0ZWRseSBpbnRyaWd1aW5nIGFzIEkgZGVsdmVkIGlu
dG8gdGhlIGlzc3VlIGFuZCB0cmllZCB0bwp1bmRlcnN0YW5kIHRoZSByb290IGNhdXNlLgoKLS0g
ClRoYW5rIHlvdSwKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
