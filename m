Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDEDC3DA5D
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHiuCstxqo4nB+2XFbwAtl4bkpPZLPyIUPqbSDCGpeQ=; b=2UTgZkqxBSGaUY
	yWJwVkRc5eoDy9h4437hIvCSCva271JWfh6b/i1ThCDK4xUnkgNJig+y1Bcm0VlP97gRmyPG1BWP5
	AaURBFyl944T1PI31F1fn6l85ak72hUo1AdtKU0mQt0L3dpcvkZBu07J7slcNzs8oZG0SZEcratML
	8ngzMY+zTLHOxaoET6/DUfulhPg/P3od/ai9xw+vNM8ilTdQZhuhf6XokYRzDZ5IdjFtDupZHf1VK
	syPzY4OloQ4TM7CGGFVqZxPEfqJ/s1riceMlgVbqqqCmiat1PgXW/ybUOSszjvyEKKECC22XaZbKF
	NIH00AIvBtq84gbGPtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUlgy-00000002V6Q-3YsS;
	Fri, 19 Jul 2024 11:22:28 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUlgv-00000002V5q-2mQt;
	Fri, 19 Jul 2024 11:22:28 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 259E7100004;
	Fri, 19 Jul 2024 14:22:21 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 259E7100004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721388141;
	bh=llE/44dMTNKnUSBmsfPJUwp9Lmbr3Wo7lWfPjeUVyzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=QTTQpw/go/CMBjRenn7SNcC23QGqsmSYiuUPI8srwMrN8+2P0zG2EUB5hJxOGbrmV
	 7KhTiw486GV1jubtq7EO5aQ7HFhWLRoVppGn6NiQqQA2t7eCcOnJcNyvReNjQBmq90
	 3TUqsbL9mRLWXECK0eQFw6tIwLi64vLdEQ/hhCs2wjG3g9L7xgeSWSyiVN6djx6nhP
	 2j/exCVIRf5SK+TjMxg+Z0qKjFNYUid0Vlvx+gsCZC/2Pxqfez75R7RzWX+4NNbVMB
	 nC903xNilBhW6Rn08tnib6G93bKjl4FLhS5T5yThA0SMJR8VghD3lucHdpkExQ1QAn
	 ZWcYzscBCgnEA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 19 Jul 2024 14:22:20 +0300 (MSK)
Received: from [192.168.1.143] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 19 Jul 2024 14:22:20 +0300
Message-ID: <dbb4be50-4793-40ab-b362-6c9a6dd87324@salutedevices.com>
Date: Fri, 19 Jul 2024 14:22:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] pwm: meson: add pwm support for A1
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <linux-pwm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <martin.blumenstingl@googlemail.com>,
	<jbrunet@baylibre.com>, <khilman@baylibre.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@salutedevices.com>,
	<hkallweit1@gmail.com>
References: <20240710234116.2370655-1-gnstark@salutedevices.com>
 <52e2e211-a0b7-47b1-a451-34c304028097@salutedevices.com>
 <bp3hbxl6zs6lwomfdj6edhq35pde3gr5i2qizgdf2varke2eai@weeodo6gacd7>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <bp3hbxl6zs6lwomfdj6edhq35pde3gr5i2qizgdf2varke2eai@weeodo6gacd7>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186588 [Jul 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_arrow_text}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/07/18 08:50:00
X-KSMG-LinksScanning: Clean, bases: 2024/07/18 08:50:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/18 08:29:00 #26061289
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_042226_069771_F2600D44 
X-CRM114-Status: GOOD (  12.19  )
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

CgpPbiA3LzE5LzI0IDEwOjIwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBHZW9y
Z2UsCj4gCj4gT24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgMDQ6MDk6MDRQTSArMDMwMCwgR2Vvcmdl
IFN0YXJrIHdyb3RlOgo+PiBFeGN1c2UgbWUsIHNob3VsZCBJIGZpeC9pbXByb3ZlIGFueXRoaW5n
IG9uIHRoaXMgc2VyaWVzPwo+IAo+IFRoZSBrbm93biBpc3N1ZSB3aXRoIHRoaXMgc2VyaWVzIGlz
IGp1c3QgdGhhdCBpdCdzIG9uZSBvZiBzZXZlcmFsIHBhdGNoCj4gc2VyaWVzIHRoYXQgSSBkaWRu
J3QgY29tZSBhcm91bmQgdG8gcmV2aWV3IHlldC4gSSB0YWNrbGUgdGhlbSBvbmUgYXQgYQo+IHRp
bWUsIHVzdWFsbHkgaW4gYSBGSUZPIG9yZGVyIGFzIGxpc3RlZCBvbgo+IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1wd20vbGlzdC8gLgo+IAo+IEJlc3QgcmVnYXJk
cwo+IFV3ZQoKSGVsbG8gVXdlCgpPaywgbm8gcHJvYmxlbS4gVGhhbmtzIGZvciBsZXR0aW5nIG1l
IGtub3cuCgotLSAKQmVzdCByZWdhcmRzCkdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
