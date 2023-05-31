Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACA4C77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNMF+9KjRJolhnmXGcM8e4zWmgbcfraFtnGMTXsp7/k=; b=i6QWd6/zgtXY1z
	E0gnyUWYBjd7ytoAwS3cbvnMCJqB8zEoC8gRKpGG/uaWYMCMxM1HGZq/BTWcdGFZPea6eJ4ofJ7yL
	vAdWRU+b7EfOj86VtN4faq40kprwApb9hnpemEK7XKFhqD2dPUerrZNxjV81foq8Fr2di4d4vIavw
	Z1ERC0Ya/aPZdxQ3gfIfzWlSfWn9ypFHF5P0g92ZDF5DGUhnT6YTq9/5c/kpQL9BSfUgF2Tg/7Vz8
	V6GwpeOPvYhjXFUL5kX5dlwX6uWTLrgUOfAPIayC6N5WXfc025R7cVyttgHQJs9YVlkXAXuFGivFk
	3i+BCnAHLl1rmtUfotrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4K8y-00HFpm-0M;
	Wed, 31 May 2023 11:37:32 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4K8t-00HFoU-2H;
	Wed, 31 May 2023 11:37:30 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 0A5605FD56;
	Wed, 31 May 2023 14:37:19 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685533039;
	bh=sbZRDG56hPIOzkNrYqptHD1M16aZFlNz8dicpHblK9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=lGO/LXW0zAg/oFZRQl6qF6g1JvO/wxAO9tqaA4tCpeWiXRuRmFlZsZpErm100gOzC
	 HB4DQD64WsksKD2W0V8IDBM053e1Nrkc3NADDTgboXzh77lw7wMz0ja6lP4T69F5Sd
	 EYF6c7U83SW2rX60lS6mifkjOBl5IHkNxsApjySWKY4EtOJJjnvmghzQHzJ/748B5o
	 4XcKfCeYYxRfnyLV8nXbavS50N0RX/sh0XP0lkT2CEr43mKnkS/xLHn806hD5Eh7My
	 dEAG7MSVM8ww9VY3FauUKhJFSQSZ2ng9CxTMoWuhlZ2C0av2BNFmKxnJ6pUI3df/Da
	 jwLtn/leQmmgA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 31 May 2023 14:37:16 +0300 (MSK)
Message-ID: <b5a6eaec-c0eb-cd52-0657-756d5136707c@sberdevices.ru>
Date: Wed, 31 May 2023 14:33:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: "jic23@kernel.org" <jic23@kernel.org>, Dmitry Rokosov
	<DDRokosov@sberdevices.ru>, "lars@metafoo.de" <lars@metafoo.de>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>, Vyacheslav
	<adeep@lexina.in>
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
 <a52335ea-6545-8ca6-d318-38b7ffc64368@lexina.in>
 <CAFBinCDmkGnD5o_rV6K73De2XmHDxRYveDwNAy3iA+Kwr5sdqg@mail.gmail.com>
 <6910550a-b025-0d97-0b39-bc89b235541e@sberdevices.ru>
 <CAFBinCCk6OziOxt2AY1A25C=9_pibhHsDK0wJNZ_AyHMd=z6SQ@mail.gmail.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <CAFBinCCk6OziOxt2AY1A25C=9_pibhHsDK0wJNZ_AyHMd=z6SQ@mail.gmail.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/31 06:02:00 #21385342
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_043728_441772_BB80BDA3 
X-CRM114-Status: GOOD (  16.24  )
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

T24gNS8yOS8yMyAyMzo0MSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBHZW9yZ2Us
Cj4KPiBPbiBNb24sIE1heSAyMiwgMjAyMyBhdCA1OjQ34oCvUE0g0KHRgtCw0YDQuiDQk9C10L7R
gNCz0LjQuSDQndC40LrQvtC70LDQtdCy0LjRhwo+IDxHTlN0YXJrQHNiZXJkZXZpY2VzLnJ1PiB3
cm90ZToKPj4gSGVsbG8gTWFydGluCj4+Cj4+IEFjdHVhbGx5IHlvdSB3ZXJlIHJpZ2h0IHRoYXQg
bXkgcGF0Y2ggYWZmZWN0cyBvbmx5IG1lc29uOCBmYW1pbHkgbm90IHRoZSBhbGwgbmV3IG9uZXMs
IG15IGJhZC4KPj4gSXQncyBjbGVhciBmcm9tIHRoZSBkcml2ZXIgY29kZSBtZXNvbl9zYXJhZGMu
YyBhbmQgZHRzIGZpbGVzLgo+PiBJJ3ZlIG1hZGUgYW4gZXhwZXJpbWVudCBvbiBhMTEzbCBzb2Mg
LSBjaGFuZ2luZ2Nsb2NrX3JhdGUgaW5tZXNvbl9zYXJfYWRjX3BhcmFtIGFuZCBtZWFzdXJpbmcg
YWRjIGNoYW5uZWwgbWFueSB0aW1lcwo+PiBhbmQgd2l0aCBsb3cgY2xvY2tmcmVxdWVuY3kgKHBy
aXYtPmFkY19jbGspIHRpbWUgb2YgbWVhc3VyZW1lbnRpcyBoaWdoCj4+IGFuZCB2aWNlIHZlcnNh
LiBBRENfQ0xLX0RJViBmaWVsZCBpbiBTQVJfQURDX1JFRzMgaXMgYWx3YXlzIHplcm8uCj4gVGhh
bmtzIGZvciBzaGFyaW5nIHlvdXIgZmluZGluZ3MhCj4KPj4gSSBuZWVkIHRvIGdldCBzODA1ICht
ZXNvbjgpIGJvYXJkIGZvciBleGFtcGxlIGFuZCBtYWRlIGV4cGVyaW1lbnQgb24gaXQuCj4gSWYg
eW91IGRvbid0IGZpbmQgYW55IE1lc29uOCAoUzgwMikvTWVzb244YiAoUzgwNSkgb3IgTWVzb244
bTIgKFM4MTIpCj4gYm9hcmQgdGhlbiBwbGVhc2UgcHJvdmlkZSB0aGUgY29kZSB0aGF0IHlvdSB1
c2VkIGZvciB5b3VyIGV4cGVyaW1lbnQKPiBhcyBhIHBhdGNoIHNvIEkgY2FuIGdpdmUgaXQgYSB0
cnkgb24gbXkgT2Ryb2lkLUMxIChNZXNvbjhiKS4KCkhlbGxvIE1hcnRpbgoKVGhhbmtzIGZvciB0
aGUgaGVscCEgSSBtYW5hZ2VkIHRvIGdldCBPZHJvaWQtQzEgbXlzZWxmLiBJIHRoaW5rIGl0J2xs
IGJlIAp1c2VmdWwgdG8gdGVzdCBmdXJ0aGVyIHBhdGNoZXMuCkJ5IHRoZSB3YXkgc2VlbXMgbGlr
ZSB0aGUgYm9hcmQgYW5kIHRoZSBzb2NrIGFyZSBub3QgcG9wdWxhciBhbnltb3JlLi4uCgpJdCBy
ZW1haW5zIG9ubHkgdG8gYnVpbGQgbWFpbmxpbmUga2VybmVsIGZvciBtZXNvbjggdG8gcGVyZm9y
bSB0ZXN0cy4gCkhvcGUgdG8gYmUgYmFjayBzb29uLgoKQmVzdCByZWdhcmRzCkdlb3JnZQoKPgo+
Cj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
