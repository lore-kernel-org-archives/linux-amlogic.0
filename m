Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9209C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 07:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7U+lbAz28KGdaFa73wulZu51g0M1RfmJJSLoxP7umfw=; b=kjSe64MX/SRRpH
	daU7qnDmCeWC7WjbUsM12X3BZrHzViSNrFKs7T03kc+HJ8AjreX9PJrT08mTsWIctv4+w6PS/VELV
	N6vVZwqBEa0qfe3XfjbcEMWynUw5v3sbmTtMdP/3/Z2HD+Z6CiQpyNAxFwz89ZBkZHb1YIL6PWdr5
	BoYOdvts5Hs1QWWaeV86eEjGkY49ITfrvo6npD19oDFDeM3wU+LkOGggtyzG/y0QAoAguKhMoUhkT
	gymJwkWHKxh9epb15vTrn1cks5+7Ue7YelMj91lq9Zk0kRJd2VhF4L6lgh//VRcqzAZrVe7Hz6hG5
	lttqwrtuc57Yp9E4BLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXVi-00000003BB5-3wiu;
	Wed, 24 Apr 2024 07:57:46 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXVd-00000003B8b-3xdv;
	Wed, 24 Apr 2024 07:57:45 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 73A87100014;
	Wed, 24 Apr 2024 10:57:35 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 73A87100014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713945455;
	bh=MMX6QiCqy4Wkoh4oQ7dRjKfmKsrE2YLbEXXPVkHkon4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=knpp7o+rlSmXPXWuf4/yNNp4X85+CfGDCqeqeTc/IUKAVW90Kc80z8RRcRYbcRpWu
	 GbB3ujXyBOWT3ORfzPNjenLJe4gJ6FXgHZnTo/BN64T0LUlHOD6mAad9nuRtIZWK8J
	 XNIXSOAHiUu+3/jhnR4K74raRpTobcrxVFHTjyRNAgjbkDHwoiFh75X6RTRCv1Cl5N
	 +VaAJU6wgM91mECx5nc9PcqY4Edlh8Pd4Z0NqIHbKifxDsCQfy3p5ehI1X2HgbrDo1
	 GbiGwlGweiNmkH46e2JYvLqixEjoD66BANg10YJa1cbPJRCXRMxlzaqvsKGkRAfqCJ
	 1JjZPFbyUHivA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 24 Apr 2024 10:57:35 +0300 (MSK)
Received: from [172.28.226.27] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 24 Apr 2024 10:57:34 +0300
Message-ID: <6d34b236-4067-42bf-a6f7-d2f3b3270e3b@salutedevices.com>
Date: Wed, 24 Apr 2024 10:57:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pwm: meson: drop unneeded check in get_state callback
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<thierry.reding@gmail.com>, <hkallweit1@gmail.com>,
	<linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, Dmitry Rokosov <ddrokosov@salutedevices.com>
References: <20240423161356.2522636-1-gnstark@salutedevices.com>
 <20240423161356.2522636-2-gnstark@salutedevices.com>
 <wkn6ybnnlco7vrqbpclfxaajt5cvywpr633au7qcr6vpjihabq@kb7q6y4khh2k>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <wkn6ybnnlco7vrqbpclfxaajt5cvywpr633au7qcr6vpjihabq@kb7q6y4khh2k>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184892 [Apr 24 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/24 05:07:00 #24952670
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_005742_682282_DF0C2077 
X-CRM114-Status: GOOD (  14.25  )
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

SGVsbG8gVXdlCgpUaGFua3MgZm9yIHRoZSByZXZpZXcKCk9uIDQvMjQvMjQgMTA6MTksIFV3ZSBL
bGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvIEdlb3JnZSwKPiAKPiBPbiBUdWUsIEFwciAyMywg
MjAyNCBhdCAwNzoxMzo1NVBNICswMzAwLCBHZW9yZ2UgU3Rhcmsgd3JvdGU6Cj4+IERyb3AgY2hl
Y2tpbmcgc3RhdGUgYXJndW1lbnQgZm9yIG51bGwgcG9pbnRlciBpbiBtZXNvbl9wd21fZ2V0X3N0
YXRlKCkKPj4gZHVlIHRvIGl0IGlzIGNhbGxlZCBvbmx5IGZyb20gcHdtIGNvcmUgd2l0aCBhbHdh
eXMgdmFsaWQgYXJndW1lbnRzLgo+Pgo+PiBGaXhlczogMjExZWQ2MzA3NTNkICgicHdtOiBBZGQg
c3VwcG9ydCBmb3IgTWVzb24gUFdNIENvbnRyb2xsZXIiKQo+PiBTaWduZWQtb2ZmLWJ5OiBHZW9y
Z2UgU3RhcmsgPGduc3RhcmtAc2FsdXRlZGV2aWNlcy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IERt
aXRyeSBSb2tvc292IDxkZHJva29zb3ZAc2FsdXRlZGV2aWNlcy5jb20+Cj4gCj4gSSdkIGFwcGx5
IHRoaXMgb25lIHdpdGggdGhlIGZvbGxvd2luZyBjaGFuZ2VzIGlmIHlvdSBhZ3JlZToKPiAKPiAg
IC0gY2FwaXRhbGl6ZSAiZHJvcCIgaW4gdGhlIFN1YmplY3QgbGluZQo+ICAgLSBzL2dldF9zdGF0
ZS8uZ2V0X3N0YXRlKCkvCj4gICAtIG1ha2UgIm51bGwiIGFsbCBjYXBzIChpLmUuICJOVUxMIikK
PiAgIC0gc3dhcCB0aGUgb3JkZXIgb2YgU2lnbmVkLW9mZi1ieSBsaW5lcyB0byBoYXZlIHlvdXJz
IGxhc3QuCj4gCj4gQWx0ZXJuYXRpdmVseSBzZW5kIGl0IGluIGEgdjIgdG9nZXRoZXIgd2l0aCBh
ZGRyZXNzaW5nIHRoZSBjb21tZW50IGluCj4gdGhlIHNlY29uZCBwYXRjaC4KCkkgYWdyZWUgd2l0
aCB0aGUgcHJvcG9zZWQgY2hhbmdlcyBhbmQKSSdsbCBjbGVhbiBpdCB1cCBhZnRlciBteXNlbGYg
aW4gdjIKCj4gQmVzdCByZWdhcmRzCj4gVXdlCj4gCgotLSAKQmVzdCByZWdhcmRzCkdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
