Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E868C77B72
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfhFW/mXc65si3Ynrdpk7FN8bJRHREg6fWbivLt1TYI=; b=l+eVybSSTkPX6/
	e69tUlRbCkfrpQRcixdTvO95g9VgqLfHaneZtboH+lITo4ox5aD6UW8XyT4T/A+1lpZznSiF8soQw
	wF/v/SIZn3phcINekvcXAtCbWw9XX1TM94/GEgxJRW8Zg7mAIJnPDn8nIu3/6rSG6NNhCGB2yahci
	QLHl4JUvHJl3OcIRp+YZ0X7ZTKXLiXQMvH52JJmvXeMS07KPInKhVMxQiv0bx5Wx9gkQ2fNSD4yKQ
	84LstyjqkhxaBG+LZpIIXGCnvdvFsxTCSrJWsBH4M+TGL3TjCbXESrVeCAzLLtdTuDg/RLTj5117N
	sCIShElAyhVHcmuTCpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNTw-00G3TZ-1O;
	Mon, 17 Apr 2023 11:57:16 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poNTq-00G3Rx-2w;
	Mon, 17 Apr 2023 11:57:14 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 70C3B5FD28;
	Mon, 17 Apr 2023 14:57:08 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681732628;
	bh=iw1ARucM/xufZ3PIY5MlxUVdgnsDiUvAkRlREVNWQsw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=bsIliiOemS+7Us65TsC1UYc2EnsgwRkpA1vS5+MdbvaNpSsOdTZ+uwjQVnrH6WrFX
	 gwdAzfZJBsFlXxbAW3xS3EuUh5HSqrPu9GqrQtubQ16fqCkgYrJxn1qtX5d+jgbskl
	 jHKdMkpJTHa9rqCEb7eMmxUbkrg2wdw6+V0so9+rndyj0okTIy6FzNVBEvQAhzdFTU
	 DguPVJtO3RSNDltSr/K+qEYjmtMZKeCdyxL8QoZZkPGAKUaKHxpp0HUV/aeHqEOJbf
	 1y/cE+PEYfYctE9X+zywjYa4eHYv+c65/swsh+NcMW6VzSi0ljchvhDzNqQgEdC5AB
	 epGeyRW58N/LQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 17 Apr 2023 14:57:07 +0300 (MSK)
Date: Mon, 17 Apr 2023 14:57:07 +0300
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
Subject: Re: [PATCH v1 1/5] phy: amlogic: during USB PHY clkin obtaining,
 enable it
Message-ID: <20230417115707.p5btzzg4rlyzf7ni@CAB-WSD-L081021>
References: <20230414152423.19842-1-ddrokosov@sberdevices.ru>
 <20230414152423.19842-2-ddrokosov@sberdevices.ru>
 <CAFBinCCEhobbyKHuKDWzTYCQWgNT1-e8=7hMhq1mvT6CuEOjGw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCEhobbyKHuKDWzTYCQWgNT1-e8=7hMhq1mvT6CuEOjGw@mail.gmail.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/17 09:07:00 #21118574
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_045711_128937_563ED2CC 
X-CRM114-Status: GOOD (  13.57  )
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

T24gU3VuLCBBcHIgMTYsIDIwMjMgYXQgMTA6NTQ6MTdQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBIaSBEbWl0cnksCj4gCj4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgNToy
NOKAr1BNIERtaXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+
IFsuLi5dCj4gPiAtICAgICAgIHByaXYtPmNsayA9IGRldm1fY2xrX2dldChkZXYsICJ4dGFsIik7
Cj4gPiArICAgICAgIHByaXYtPmNsayA9IGRldm1fY2xrX2dldF9lbmFibGVkKGRldiwgInh0YWwi
KTsKPiBHZW5lcmFsbHkgdGhpcyB3b3JrcyBmaW5lIGJ1dCBJIHdvdWxkbid0IHJlY29tbWVuZCB0
aGlzIGFwcHJvYWNoIGlmOgo+IC0gdGhlcmUncyBzb21lIHJlcXVpcmVkIHdhaXQgdGltZSBhZnRl
ciB0aGUgY2xvY2sgaGFzIGJlZW4gZW5hYmxlZAo+IChzZWUgcGh5X21lc29uX2cxMmFfdXNiMl9p
bml0IC0gdGhlcmUncyBhbHJlYWR5IHNvbWUgcmVxdWlyZWQgd2FpdAo+IHRpbWUgYWZ0ZXIgdHJp
Z2dlcmluZyB0aGUgcmVzZXQpCj4gLSBjbG9jayBnYXRpbmcgKGZvciBwb3dlciBzYXZpbmcpIGlz
IG5lZWRlZCB3aGVuIHRoZSBkd2MzIGRyaXZlciBpcwo+IHVubG9hZGVkIGJ5IHRoZSBQSFkgZHJp
dmVyIGlzIG5vdAo+IAo+IEluIHRoaXMgY2FzZToganVzdCBtYW51YWxseSBtYW5hZ2UgdGhlIGNs
b2NrIGluIHBoeV9tZXNvbl9nMTJhX3VzYjJfe2luaXQsZXhpdH0KCkknbSBzb3JyeSwgYnV0IEkn
bSBub3QgZnVsbHkgdW5kZXJzdGFuZGluZyB5b3VyIHBvaW50LiBDdXJyZW50bHksIG5vCnNsZWVw
cyBhcmUgcmVxdWlyZWQgZm9yIHRoaXMgY2xvY2sgYW5kIHdlIGRvbid0IGhhdmUgYW55IGxvZ2lj
IGZvcgpwb3dlciBzYXZpbmcgKGcxMmEgcGh5X29wcyBkb2Vzbid0IGhhdmUgcG93ZXJfb24oKS9w
b3dlcl9vZmYoKQppbXBsZW1lbnRhdGlvbikuCkhvd2V2ZXIsIEkgYmVsaWV2ZSBhbGwgb2YgeW91
ciBhcmd1bWVudHMgbWFrZSBzZW5zZSBmb3IgdGhlIGZ1dHVyZQpkZXZlbG9wbWVudCBvZiB0aGUg
cGh5X21lc29uX2cxMmFfdXNiMiBkcml2ZXIuIElzIHRoYXQgY29ycmVjdD8KCi0tIApUaGFuayB5
b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
