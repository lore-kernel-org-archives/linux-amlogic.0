Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCADC64EC4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDYZkel82ChczsGmoXHvUFBsJVm7jql5R1IelIi1utI=; b=Q8LMTrBhMmdkT0
	ZECRFKVVTE1X1jsk7t86+bqYxWY+jjxdaQDpuSn9ueOloiXV1WGb3c8c6x0FVoXpl4y3Hbr8Jc7Bw
	Hi+v98VFPNlDGcwDJsGbD9KbkC3UgviD9LWAi0GZ24zocK+6OdFeFYtGZnhcOY3gIDEz0jyxBnd1n
	vT9k4+QUcYHGvPu5So7rJEDU+zByHQDbJvxVFg3Y6XfR+5rVmWGnLjPPjlLJBA6vfiqfDLzTOyiHJ
	tR5H1YmNE5KUnM+EZsJVad5zu+hXiASj1NAhQ9rtl4dy2fQ5E8f4HrTAF2hHOpIL2sL/yaXxyl3lQ
	OyPk8bRsus6SyUR1UoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZFyH-00EQ6I-W5; Mon, 06 Mar 2023 18:54:06 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZFyD-00EQ5D-TG; Mon, 06 Mar 2023 18:54:04 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 67EBA5FD0A;
	Mon,  6 Mar 2023 21:53:54 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1678128834;
	bh=DBAxHW4F3m3jlrgYwBiCU5dDtVa0huLSFWaR9cqGTRs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=lfAPjKXwtBgFoS4HZh2/2mc2A2jy4eQRXk93RoqpihXA0iCEC1Y0tpfZauzFzBpS5
	 yak3/vd5y4PIMROJz/27NsAI6ef8lydzbI8vY8VA5utcJDX6LkZ9edaRGZoooxT6Uq
	 MMRzfD42KDHwXrA2J7aPVB4X0CpOQ5gp9W9C/3VQaN/3/rlCAsNfypBtdhJnn3HsPP
	 9p0i1oFyFkhLXJ4xIf+UT7Gv9dCsHjnx0ROICcbMCHeMEh7euIf2PaKdlk24s60jzf
	 P9mxssoVa298PruybjgUgc0ATMhAYakHY5zRULTfTAeIV1jxqxAmATv+NTyJANte1d
	 gn7p2gq84C3EA==
Received: from S-MS-EXCH02.sberdevices.ru (S-MS-EXCH02.sberdevices.ru [172.16.1.5])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon,  6 Mar 2023 21:53:52 +0300 (MSK)
From: Alexey Romanov <AVRomanov@sberdevices.ru>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "martin.blumenstingl@googlemail.com"
	<martin.blumenstingl@googlemail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Thread-Topic: [PATCH v1 1/2] arm64: dts: meson-a1: add gpio_intc node
Thread-Index: AQHZNxDMFNGdYZWqIECM18Y2pLjN2K7E0tUAgClGs4A=
Date: Mon, 6 Mar 2023 18:53:52 +0000
Message-ID: <20230306185324.2n65uw3uqgtnc5vx@cab-wsm-0029881.sigma.sbrf.ru>
References: <20230202141520.40003-1-avromanov@sberdevices.ru>
 <3a06d80c-7f52-2c5c-840e-09a0a08400f4@linaro.org>
In-Reply-To: <3a06d80c-7f52-2c5c-840e-09a0a08400f4@linaro.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.25]
Content-ID: <D18ECF9035574649BCC96986028AD074@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/06 16:19:00 #20919562
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_105402_667103_AA62C4B4 
X-CRM114-Status: GOOD (  15.31  )
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

SGVsbG8sIE5laWwhDQoNCk9uIFdlZCwgRmViIDA4LCAyMDIzIGF0IDAxOjM0OjA0UE0gKzAxMDAs
IE5laWwgQXJtc3Ryb25nIHdyb3RlOg0KPiBMZSAwMi8wMi8yMDIzIMOgIDE1OjE1LCBBbGV4ZXkg
Um9tYW5vdiBhIMOpY3JpdMKgOg0KPiA+IEFkZCBncGlvIGludGVycnVwdCBjb250cm9sbGVyIG5v
ZGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGV5IFJvbWFub3YgPGF2cm9tYW5vdkBz
YmVyZGV2aWNlcy5ydT4NCj4gPiAtLS0NCj4gPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1hMS5kdHNpIHwgMTAgKysrKysrKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWExLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVz
b24tYTEuZHRzaQ0KPiA+IGluZGV4IDYyNjhjMzIzYTgxMC4uYTA0ZGRmMGY0Y2QzIDEwMDY0NA0K
PiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1hMS5kdHNpDQo+ID4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWExLmR0c2kNCj4gPiBAQCAt
MTU4LDYgKzE1OCwxNiBAQCBjbGtjX3BsbDogcGxsLWNsb2NrLWNvbnRyb2xsZXJAN2M4MCB7DQo+
ID4gICAJCQkJCSA8JmNsa2NfcGVyaXBocyBDTEtJRF9YVEFMX0hJRklQTEw+Ow0KPiA+ICAgCQkJ
CWNsb2NrLW5hbWVzID0gInh0YWxfZml4cGxsIiwgInh0YWxfaGlmaXBsbCI7DQo+ID4gICAJCQl9
Ow0KPiA+ICsNCj4gPiArCQkJZ3Bpb19pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlckAwNDQwIHsN
Cj4gPiArCQkJCWNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1hMS1ncGlvLWludGMiLA0KPiA+
ICsJCQkJCSAgICAgImFtbG9naWMsbWVzb24tZ3Bpby1pbnRjIjsNCj4gPiArCQkJCXJlZyA9IDww
eDAgMHgwNDQwIDB4MCAweDE0PjsNCj4gPiArCQkJCWludGVycnVwdC1jb250cm9sbGVyOw0KPiA+
ICsJCQkJI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCj4gPiArCQkJCWFtbG9naWMsY2hhbm5lbC1p
bnRlcnJ1cHRzID0NCj4gPiArCQkJCQk8NDkgNTAgNTEgNTIgNTMgNTQgNTUgNTY+Ow0KPiA+ICsJ
CQl9Ow0KPiA+ICAgCQl9Ow0KPiA+ICAgCQlnaWM6IGludGVycnVwdC1jb250cm9sbGVyQGZmOTAx
MDAwIHsNCj4gDQo+IFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdA
bGluYXJvLm9yZz4NCj4gDQo+IA0KPiBJJ2xsIHRha2UgaXQgb25jZSB2Ni4zLXJjMSBpcyB0YWdn
ZWQuDQo+IA0KPiANCj4gVGhhbmtzLA0KPiANCj4gTmVpbA0KDQp2Ni4zIGlzIHRhZ2dlZCwgYnV0
IHdlIGRpZG4ndCBmaW5kIG15IHBhdGNoIGluIEFtbG9naWMgYnJhbmNoLg0KDQpEaWQgeW91IGhh
cHBlbiB0byBmb3JnZXQgYWJvdXQgaGltPw0KDQotLSANClRoYW5rIHlvdSwNCkFsZXhleQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
