Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150F3D39410
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Apr 2026 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBQHynVHmAUcE2CNviCdaATCyfylF75fQfMcRhBt2EQ=; b=fHTruMFv6EMqgJ
	Tohg+pYQU7HdYX4B6+QcZh9B+MSLpcLnnV8b/teZZgabJqBcq12QRcZJ1n58HqzuH8hx7/kYs9oM0
	jVwW8zpQQ9TmC9xU9EA77ZBrI2ZvOKrthV2PskuYGwJOHI4l6uWA3jvcd9ZAiKHBGVaFRD9pp3dMu
	UzQs7N24wwLNfoNYytvXAGOxrJgKtKB8VwzpoRr/icciDR7E6INM/9rcDI8lngs6qoVKwWERuBh6F
	NW2BUTbDN6Q3r6UKlhtlkIOXtGNCUYVQZmR7zQ+pZmy8sGQyAh0CCR/zJeCFRB2zywNKBRaiDvuVS
	H2YxsIEOMPF1zterohLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GVp-0000000HXlj-3kAR;
	Thu, 02 Apr 2026 11:47:01 +0000
Received: from mx5.sberdevices.ru ([95.181.183.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8GVl-0000000HXkQ-4489;
	Thu, 02 Apr 2026 11:46:59 +0000
Received: from p-antispam-ksmg-gc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx5.sberdevices.ru (Postfix) with ESMTP id 05B9A240005;
	Thu,  2 Apr 2026 14:46:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx5.sberdevices.ru 05B9A240005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1775130402;
	bh=LS4xrv2sD/iCCx4NjkrxG3qRMXJ6P8C3NNJ6hNqyLu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=N+YMWDi2qhINcmzCHNSXhp6ERUeAKq0p2KdXHod7x7aVtTbW/R2sG6vjo9+SsWIbZ
	 +SnIEKHalDH9insT3IKFn0q3um+WvBs1BIOBKgrf/74KweMlOZJiwd3jMQKCTdCAVu
	 Yt6B8OfNaXdDzH/6PxXFTFdHOIZyQjv7m6GshOjzuprKb4+MEHiOI0an8KSrDh3KsU
	 dmSqbyp6pjRjkcXYclMWN1Gig69RoIZt5jZwjNd2Hh5OHqeNtCMOPtfA/7et9dAzYf
	 +ZkVcpDBQDt7oZJG8SuFp7UUVJU9YcnnHGFtm0sklPjSiLJyDYiWIe01oIpU/qXOkh
	 /AGFJPh0taGDw==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (not verified))
	by mx5.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  2 Apr 2026 14:46:41 +0300 (MSK)
Message-ID: <6fd5f5a8-dd60-48ad-be29-d263578e6b0a@salutedevices.com>
Date: Thu, 2 Apr 2026 14:46:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error]Re: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, <linux-pwm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Junyi Zhao <junyi.zhao@amlogic.com>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
 <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
 <70a637b1-a76a-470c-9a97-0b4599a40a1c@amlogic.com>
 <4a9c726a-d580-4b0b-9530-228b58389c80@salutedevices.com>
 <78e05060-6f25-4d78-8b0d-35b8fca0cecb@amlogic.com>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <78e05060-6f25-4d78-8b0d-35b8fca0cecb@amlogic.com>
X-Originating-IP: [172.28.2.68]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 96 0.3.96 f0df504111d78c4fb91ce829559989c2d1ddd192, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 201900 [Apr 02 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.22
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/04/02 09:00:00 #28364014
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_044658_518757_9EFBF6FA 
X-CRM114-Status: GOOD (  17.45  )
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

SGVsbG8gWGlhbndlaSBaaGFvCgpPbiAzLzMxLzI2IDEwOjU5LCBYaWFud2VpIFpoYW8gd3JvdGU6
Cj4gSGkgR2VvcmdlLAo+IAo+IE9uIDIwMjYvMy8zMSAxNTozMywgR2VvcmdlIFN0YXJrIHdyb3Rl
Ogo+PiBIZWxsbyBNYXJ0aW4sIFhpYW53ZWkKPj4KPj4KPj4gT24gMy8zMS8yNiAxMDoxMCwgWGlh
bndlaSBaaGFvIHdyb3RlOgo+Pj4gSGkgTWFydGluLAo+Pj4gwqDCoMKgwqAgSSBjb25maXJtZWQg
d2l0aCBKdW55aSBaaGFvIHRoYXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gY291bnRzCj4+
PiBmcm9tIHplcm8sIHNvIHRoaXMgc3VibWlzc2lvbiBpcyBjb3JyZWN0Lgo+Pj4gV2UgYWdyZWUg
dGhpcyBzaG91bGQgYmUgZml4ZWQgYW5kIHdpbGwgYWRkcmVzcyBpdCBpbiBhIGZvbGxvdy11cCBw
YXRjaC4KPj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0Lgo+Pj4KPj4+IE9uIDIwMjYvMy8z
MSAwNTo1NCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPj4+PiBIaSBYaWFud2VpIFpoYW8s
Cj4+Pj4KPj4+PiB0aGFua3MgZm9yIHlvdXIgY29udHJpYnV0aW9uIQo+Pj4+Cj4+Pj4gT24gVGh1
LCBNYXIgMjYsIDIwMjYgYXQgNzozNeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVsYXkKPj4+
PiA8ZGV2bnVsbCt4aWFud2VpLnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz7CoCB3cm90ZToK
Pj4+Pj4gQWRkIGJpbmRpbmdzIGFuZCBkcml2ZXIgc3VwcG9ydCBBbWxvZ2ljIFM3L1M3RC9TNiBT
b0NzLgo+Pj4+IFRoZXJlIGlzIGFuIG9sZCByZXBvcnQgdGhhdCBnb3QgbG9zdCwgc3RhdGluZyB0
aGF0IHRoZSBjdXJyZW50Cj4+Cj4+IFhpYW53ZWkgWmhhbyB0aGFua3MgZm9yIHRoZSBjb25maXJt
YXRpb24uCj4+IEkgYW0gdGhlIGF1dGhvciBvZiB0aGUgb2xkIHJlcG9ydCBhbmQgdGhlIGNvcnJl
c3BvbmRpbmcgcGF0Y2ggYW5kIGl0J3MKPj4gbm90IGxvc3QuIFNvIGlmIHRoZSBwYXRjaCBpcyBj
b3JyZWN0IEknbGwgYmUgZ2xhZCB0byBhZGQgcmVsZXZhbnQKPj4gdGVzdGVkLWJ5IHRhZ3MuCj4+
Cj4gCj4gSSB3aWxsIHVzZSB5b3VyIHBhdGNoIGFuZCB3b24ndCBzZW5kIGEgc2VwYXJhdGUgb25l
Lgo+IERvIHlvdSBtZWFuIEkgc2hvdWxkIGFkZCBhIFRlc3RlZC1ieSB0YWcgdG8geW91ciBwYXRj
aD8KClllcyBzaW5jZSB5b3UndmUgY29uZmlybWVkIHRoZSBwcm9ibGVtIGV4aXN0cyB0aGVuIHlv
dXIgdGVzdGVkLWJ5IHRhZyAKd291bGQgYmUgYXBwcm9wcmlhdGUuIEFuZCBJJ20gb2sgaWYgeW91
IHJlc2VuZCB0aGUgcGF0Y2guIFRoYW5rcy4KCj4+Pj4gcHdtLW1lc29uIGRyaXZlciBoYXMgYW4g
b2ZmLWJ5LW9uZSBlcnJvciB3aXRoIHRoZSBoaSBhbmQgbG8gZmllbGRzOgo+Pj4+IFswXQo+Pj4+
IFNpbmNlIHlvdSBhcmUgd29ya2luZyBvbiBicmluZ2luZyB1cCBhIG5ldyBwbGF0Zm9ybTogaXMg
dGhpcyBzb21ldGhpbmcKPj4+PiB5b3UgY2FuIHZlcmlmeSBpbiB5b3VyIGxhYj8KPj4+PiBUbyBi
ZSBjbGVhcjogSSdtIG5vdCBleHBlY3RpbmcgeW91IHRvIHdvcmsgb24gdGhpcyBhZC1ob2Mgb3Ig
YnJpbmcgYQo+Pj4+IHBhdGNoIGludG8gdGhpcyBzZXJpZXMuIEhvd2V2ZXIsIGl0IHdvdWxkIGJl
IGdyZWF0IGlmIHlvdSBjb3VsZCB2ZXJpZnkKPj4+PiBpZiB0aGUgZmluZGluZ3MgZnJvbSBbMF0g
YXJlIGNvcnJlY3QgYW5kIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBpbgo+Pj4+IGZ1dHVyZS4KPj4+
Pgo+Pj4+IFRoYW5rIHlvdSBhbmQgYmVzdCByZWdhcmRzCj4+Pj4gTWFydGluIAoKLS0gCkJlc3Qg
cmVnYXJkcwpHZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
