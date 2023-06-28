Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC0FEB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqoJ0e7DK6mRQae4blEhwHiMunCE9ODueXx9iYoG+N4=; b=p7k3ZFAwO3qye4
	HRsAph89vXQCEdNtoQrjZP6e/58iElaEoOUZom6aqlZXl2V5q+yjQVNnJGH0/34le4SZnFNjeuhIz
	j4E1EsxJFnvBsQHH4okL1bzMQLzU1iRZ2G+slqjv/l47hPqWgqD447pHt+2gf9lJQNHejNgjtudI6
	+MEbQq7ubQ/FShkfuSiJb1aAIs2M91V2hwFpui1wCwH8/wpVM/1H0Ft3dHNL5UmxGsyGw6dfPeTe9
	gME1PWMQ1ezsO9P7mIvdUylpmQjxMb0fDkELLCe98qO+6YN3oZMVlkQbWauTXZImUMQmkW2RjvCMS
	keMihMy3kY3nt3UbDAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW1h-00FrNv-3D;
	Wed, 28 Jun 2023 14:20:10 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEW1f-00FrMn-0i;
	Wed, 28 Jun 2023 14:20:08 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 2A969100010;
	Wed, 28 Jun 2023 17:20:04 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 2A969100010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1687962004;
	bh=Lk3qB4uYxKXyPUp5kolLvL3qgFw7FLaRDeOgiAkPfaY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=XKNMDmCfB+n/eT0axZCuc6oQTuSbQOU9CWCpZg3JV0ziwt+BBWjeCZAVJ9IC1uxrw
	 sRE6kjI493+xNLexts6m1cYfL+uz3mOoeh1QecFzgqhXyVHd17g0nNcrCgfIFVRZ89
	 nw33wnuz6sPUsdeB/Bq6ksjlCYvKk7yadqQzxMDHpBERTN3O8+tHYpveU4xWdc78Q6
	 vKQ75c1iAE1f/KtfhXyw9SoQGiOeW3ek2OtKbpLxmilImnZB/nTG0Mn6uuA9DbYEXD
	 OJBekE9eY4QqP2qx9lsbssaG6XzgPC2tYWc6cVe+X9YSjDmkUrRTiAO3jrI3tOCj6T
	 zWDTRG4G9xbNA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 28 Jun 2023 17:20:04 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 28 Jun
 2023 17:19:06 +0300
Date: Wed, 28 Jun 2023 17:20:03 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<conor+dt@kernel.org>, <kernel@sberdevices.ru>,
	<sdfw_system_team@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Alexey Romanov
	<avromanov@sberdevices.ru>
Subject: Re: [PATCH v1 3/6] arm64: dts: meson: a1: enable efuse controller
 and setup its clk
Message-ID: <20230628142003.ggqbxkvuzn6noupc@CAB-WSD-L081021>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-4-ddrokosov@sberdevices.ru>
 <CAFBinCC0F4gaW1eFkJvf=oSkmAMmjbJ-ZFbVhpnrcGZPOX2sYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCC0F4gaW1eFkJvf=oSkmAMmjbJ-ZFbVhpnrcGZPOX2sYg@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178314 [Jun 28 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/28 08:00:00 #21591748
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_072007_620575_E3D05925 
X-CRM114-Status: GOOD (  12.57  )
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

T24gU3VuLCBKdW4gMjUsIDIwMjMgYXQgMTA6NTA6MzdQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDEwOjE24oCvUE0gRG1pdHJ5IFJv
a29zb3YgPGRkcm9rb3NvdkBzYmVyZGV2aWNlcy5ydT4gd3JvdGU6Cj4gWy4uLl0KPiA+ICsgICAg
ICAgZWZ1c2U6IGVmdXNlIHsKPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9n
aWMsbWVzb24tZ3hiYi1lZnVzZSI7Cj4gPiArICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjbGtj
X3BlcmlwaHMgQ0xLSURfT1RQPjsKPiA+ICsgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsKPiA+ICsgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKPiA+ICsgICAgICAg
ICAgICAgICBzZWN1cmUtbW9uaXRvciA9IDwmc20+Owo+ID4gKyAgICAgICAgICAgICAgIHBvd2Vy
LWRvbWFpbnMgPSA8JnB3cmMgUFdSQ19PVFBfSUQ+Owo+ID4gKyAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJva2F5IjsKPiBJZiBlRnVzZSBpcyBhbHdheXMgZW5hYmxlZCB0aGVuIHdlIGNhbiBqdXN0
IGRyb3Agc3RhdHVzID0gIm9rYXkiIGFzCj4gdGhhdCdzIHRoZSBkZWZhdWx0LgoKQWhoLCBva2F5
LiBJIHdhc24ndCBhd2FyZSBvZiB0aGF0IGJlaGF2aW9yLiBUaGFuayB5b3UgZm9yIHBvaW50aW5n
IGl0Cm91dCEKCi0tIApUaGFuayB5b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
