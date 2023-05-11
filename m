Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BACC7EE23
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrVp3u9kMvFFfYIpR3krfgiuDR9m17Dgm5oXNj68K8k=; b=HgVg61uqkfdvaA
	GrPuAwcZdcqT52tjS1yzHFqIEKeNgqId0Ydfgupr6cNmbCdssLQhG4roor4iVcO79oSF1NeOZiPfb
	nQHMDDFdsMQYIY++39idRGjEq6HZy4Fz9OM4rk6mLKVohe46kp33VJVy7LM7Impq/6arFZdruqU0T
	JeecHdISv7IWo9FWkS/88j1JPa+MPpa5yjUqWXVcOzwtwCiZfpDG7+u8ynb/DCjAItcDfEVane86g
	GuRT8y0RNysW0lJ0RnIApghtf0ZquTXTGRXoN9txaKCnvEVYKIlVym6DnhQnEQCLamO8fWkc1jvYw
	NDZPXJUDO02MoMONWPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6ck-008vOf-2h;
	Thu, 11 May 2023 13:46:26 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6ch-008vN0-39;
	Thu, 11 May 2023 13:46:25 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 409955FD5F;
	Thu, 11 May 2023 16:46:21 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683812781;
	bh=WC0yahayL00lp9RjVX6ifkwESNGz2I60jc5UqW7rtAw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=aaLh5SlwmrxUGQy4Nt1nFHJEK4zhWwytNo8Ovia/U9RHOOvB8RT67woDb+Sc9RVC9
	 6495ZqGXUwvDbJnctimR8g6Qc10Pv0yz0eJqlJQu7A9wHhKy/0YYWvn2OFuF+VgS3M
	 X+Id6qi0RyRHpTh0gN4smLrJ2py0xWX8mKLkPDDoOmgDdkZeLtYn0tKSrQEjIE57u+
	 WbOwdiPaUL2MqLA4YGnOSCOdva7ywE6dTH00wQkFaqvVYc25yKiQef8UdS9ncKP0FD
	 9LcQM3bN534yyvG4g3ek5lYNgohsEKWzPfiSChn7rzRAvxtyYERfiUN72EwT+t63hE
	 Wk0wKAWC/fspg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 16:46:21 +0300 (MSK)
Date: Thu, 11 May 2023 16:46:20 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Christian Hewitt <christianshewitt@gmail.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	<jian.hu@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>, AML
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>, devicetree
	<devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v14 5/6] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Message-ID: <20230511134620.iukkxnbotcjyfcyx@CAB-WSD-L081021>
References: <20230426095805.15338-1-ddrokosov@sberdevices.ru>
 <20230426095805.15338-6-ddrokosov@sberdevices.ru>
 <CAFBinCCdoaNuQymcjp5j9MHn2jpPWMqXe-+EgBo=5Ot8Bwaofw@mail.gmail.com>
 <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2F9DDB93-5EE7-4B5D-AFB5-052968081E0A@gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_064624_195387_2048D6A9 
X-CRM114-Status: GOOD (  15.04  )
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

SGVsbG8gQ2hyaXN0aWFuLAoKT24gVHVlLCBNYXkgMDIsIDIwMjMgYXQgMDI6Mzg6MjBBTSArMDEw
MCwgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiA+IE9uIDEgTWF5IDIwMjMsIGF0IDc6NTEgcG0s
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
IHdyb3RlOgo+ID4gCj4gPiBIaSBEbWl0cnksCj4gPiAKPiA+IE9uIFdlZCwgQXByIDI2LCAyMDIz
IGF0IDExOjU44oCvQU0gRG1pdHJ5IFJva29zb3YKPiA+IDxkZHJva29zb3ZAc2JlcmRldmljZXMu
cnU+IHdyb3RlOgo+ID4+IAo+ID4+IEFkZCB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgQW1sb2dpYyBB
MSBQZXJpcGhlcmFscyBjbG9jayBkcml2ZXIsCj4gPj4gYW5kIEExIFBlcmlwaGVyYWxzIGNsb2Nr
IGNvbnRyb2xsZXIgYmluZGluZ3MuCj4gPiBNYXliZSBhIG5hdGl2ZSBFbmdsaXNoIHNwZWFrZXIg
Y2FuIGNvbW1lbnQgb24gd2hldGhlciBpdCdzCj4gPiAicGVyaXBoZXJhbCIgb3IgInBlcmlwaGVy
YWxzIi4KPiAKPiBJ4oCZbSBub3QgYSBncmFtbWFyIHNwZWNpYWxpc3QsIGJ1dCBJIHdvdWxkIHdy
aXRlOgo+IAo+IOKAnEFkZCBkb2N1bWVudGF0aW9uIGFuZCBiaW5kaW5ncyBmb3IgdGhlIEFtbG9n
aWMgQTEgU29DIHBlcmlwaGVyYWxzCj4gY2xvY2sgZHJpdmVy4oCdCj4gCj4gUGVyaXBoZXJhbHMg
aXMgdGhlIGNvcnJlY3QgcGx1cmFsIGJ1dCByZWFkcyBiZXR0ZXIgd2hlbiB5b3UgYWRkCj4gY29u
dGV4dCBvbiB0aGUgdHlwZSBvZiBwZXJpcGhlcmFscy4KClRoYW5rIHlvdSBmb3IgeW91ciBzdWdn
ZXN0aW9uISBJIHdpbGwgbWFrZSB0aGUgY2hhbmdlIGluIHRoZSB2MTUuCgpbLi4uXQoKLS0gClRo
YW5rIHlvdSwKRG1pdHJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
