Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BD5C25B10
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Apr 2024 17:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zf4wHjMgo1B1d9UpL9HJDq4nF35O5Rre3rkd2adLzI4=; b=GpbYrfzg818KUw
	mGmzf22CdVAMf4nwP2j7q97+kTtFyjhPFBTg6cVtQZ7dmBWSxP8w7h9awTYXQ9OUV/sbOnCCyh3s5
	vhFP7Gzmq8XJLKNaDJa2UzV19h4qVIbwxS0dWtbwAmSq0RpRwsds7ay02AV9rakpmdCXHmuFVtu+K
	fM9nW8uQX2d5nZTGfuDK62vOpWWYNckV4ClLj0du3SOF/8ayZQmEfFAJHQSlKmw9caLkftEWHdXmm
	8ISJam8HsmSFx4gfp/+D2uFzq0XzrbF/hOEzNKcc8lJ0iqAKagTNzM0WGIWNZ5tmL37zkFmbgyoZ3
	izCzfaCgWh2OQGF3sM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02er-00000009XRx-1QGD;
	Thu, 25 Apr 2024 17:13:17 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s02ei-00000009XKU-2gh6;
	Thu, 25 Apr 2024 17:13:12 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AEA5212000D;
	Thu, 25 Apr 2024 20:13:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AEA5212000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1714065181;
	bh=A9GpIzQZVP3rm6DjUNEFW6D9Y7ngu+Gh1hs4Mrn4JxU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=VLq7HvOhXhaz9LyhReNa/Tgut3dPhbsangs+j1NwAmTmF2zJIL5Bot/2PIhBvR+3H
	 7IKC+vDzs3R7Fr7fXvA2Svn51kNKlHHIsYNGap3fhG4nvgoYGsa5rLbAGaCG8B67Km
	 LFYXcHPMBgd/PtAfxMHqGeyqIe19EELLLfr4UNHphWQbK4K8Gb6RdmohGfCSRm7u3X
	 gDC9XGAcxJKFjpizpXvXM21T0nT+K4Baxrq9L07hVryhWNBSR9xqfnRYw3ed1z+yc7
	 9YpUq7CFSSw5O7edpiwqMNxiV2znJNwh/XB8Gb6w16TaHC/WJaURh4aZkFNWQvddIw
	 k6mYR5mNeDmag==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 25 Apr 2024 20:13:01 +0300 (MSK)
Received: from work.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Apr 2024 20:13:00 +0300
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <thierry.reding@gmail.com>,
	<hkallweit1@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v3 3/3] pwm: meson: Use mul_u64_u64_div_u64() for frequency calculating
Date: Thu, 25 Apr 2024 20:12:53 +0300
Message-ID: <20240425171253.2752877-4-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425171253.2752877-1-gnstark@salutedevices.com>
References: <20240425171253.2752877-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184930 [Apr 25 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/25 14:02:00 #24969020
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_101309_432714_572346F6 
X-CRM114-Status: GOOD (  13.00  )
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

V2hpbGUgY2FsY3VsYXRpbmcgZnJlcXVlbmN5IGZvciB0aGUgZ2l2ZW4gcGVyaW9kIHU2NCBudW1i
ZXJzIGFyZQptdWx0aXBsaWVkIGJlZm9yZSBkaXZpc2lvbiB3aGF0IGNhbiBsZWFkIHRvIG92ZXJm
bG93IGluIHRoZW9yeSBzbyB1c2UKc2VjdXJlIG11bF91NjRfdTY0X2Rpdl91NjQoKSB3aGljaCBo
YW5kbGVzIG92ZXJmbG93IGNvcnJlY3RseS4KCkZpeGVzOiAzMjlkYjEwMmEyNmQgKCJwd206IG1l
c29uOiBtYWtlIGZ1bGwgdXNlIG9mIGNvbW1vbiBjbG9jayBmcmFtZXdvcmsiKQpTdWdnZXN0ZWQt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+ClNp
Z25lZC1vZmYtYnk6IEdlb3JnZSBTdGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4KLS0t
CiBkcml2ZXJzL3B3bS9wd20tbWVzb24uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20t
bWVzb24uYyBiL2RyaXZlcnMvcHdtL3B3bS1tZXNvbi5jCmluZGV4IDRhNjUyZDUwMGRmYy4uYjJm
OTdkZmIwMWJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYworKysgYi9kcml2
ZXJzL3B3bS9wd20tbWVzb24uYwpAQCAtMTc2LDcgKzE3Niw3IEBAIHN0YXRpYyBpbnQgbWVzb25f
cHdtX2NhbGMoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAog
CiAJZGV2X2RiZyhwd21jaGlwX3BhcmVudChjaGlwKSwgImZpbl9mcmVxOiAlbGQgSHpcbiIsIGZp
bl9mcmVxKTsKIAotCWNudCA9IGRpdl91NjQoZmluX2ZyZXEgKiBwZXJpb2QsIE5TRUNfUEVSX1NF
Qyk7CisJY250ID0gbXVsX3U2NF91NjRfZGl2X3U2NChmaW5fZnJlcSwgcGVyaW9kLCBOU0VDX1BF
Ul9TRUMpOwogCWlmIChjbnQgPiAweGZmZmYpIHsKIAkJZGV2X2Vycihwd21jaGlwX3BhcmVudChj
aGlwKSwgInVuYWJsZSB0byBnZXQgcGVyaW9kIGNudFxuIik7CiAJCXJldHVybiAtRUlOVkFMOwpA
QCAtMTkxLDcgKzE5MSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fcHdtX2NhbGMoc3RydWN0IHB3bV9j
aGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCQljaGFubmVsLT5oaSA9IDA7CiAJ
CWNoYW5uZWwtPmxvID0gY250OwogCX0gZWxzZSB7Ci0JCWR1dHlfY250ID0gZGl2X3U2NChmaW5f
ZnJlcSAqIGR1dHksIE5TRUNfUEVSX1NFQyk7CisJCWR1dHlfY250ID0gbXVsX3U2NF91NjRfZGl2
X3U2NChmaW5fZnJlcSwgZHV0eSwgTlNFQ19QRVJfU0VDKTsKIAogCQlkZXZfZGJnKHB3bWNoaXBf
cGFyZW50KGNoaXApLCAiZHV0eT0lbGx1IGR1dHlfY250PSV1XG4iLCBkdXR5LCBkdXR5X2NudCk7
CiAKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
