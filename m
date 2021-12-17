Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B31C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Dec 2021 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHFtjqAw4/ngKMZoUO0XSLkuy9mQfkwpV6V0Q+1tpnM=; b=IarbiRTHyQT1QxDVo1UaWi7LWm
	5tsp71Sj9p74h5LAAj91uHyDhtl+R1QV0hraBBZM5PEL4gF7l3OpB845OOeoaa47peK6RZWP3w3cE
	A0VCiRjHETTi5hiUrvZpLSRP3p0HD0NlRbpde5UWzlHwhGgmmu53N/Ug82TYKBW9Viw+io2jPImuC
	EaYie6pgGFQtNMPn87DJBjOns375K9cWDHHKzljC9ERVBhclFj6na9Cp4DF7Ikl9nnzxQHKMlxYm3
	A66D/i75BXBqMJTsNavGnzmMHSLjPb+wSQTcf5VJGzlpQSsNdh8e12BoEi+wxiQ9cq6a3MutYn3ZY
	t+gosFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9Rr-0098qm-Fn; Fri, 17 Dec 2021 09:22:43 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9Rp-0098pB-56; Fri, 17 Dec 2021 09:22:42 +0000
Received: from [10.28.39.221] (10.28.39.221) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 17 Dec
 2021 17:22:31 +0800
Subject: Re: [PATCH 3/3] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>
CC: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
 <20211214022100.14841-4-qianggui.song@amlogic.com>
 <1j35mv31c1.fsf@starbuckisacylon.baylibre.com>
 <0a3efa6f-f048-ee04-a2d6-30f337f3d484@amlogic.com>
 <1jczlwaoqj.fsf@starbuckisacylon.baylibre.com>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <82883627-558c-a02e-f5c6-93a46e39e6b7@amlogic.com>
Date: Fri, 17 Dec 2021 17:23:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1jczlwaoqj.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.221]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_012241_405685_4FC710AF 
X-CRM114-Status: GOOD (  14.30  )
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

SGksIGplcm9tZQoKT24gMjAyMS8xMi8xNiDkuIvljYg1OjIwLCBKZXJvbWUgQnJ1bmV0IHdyb3Rl
Ogo+IAo+IAo+IE9uIFRodSAxNiBEZWMgMjAyMSBhdCAxNDowNywgcWlhbmdndWkuc29uZyA8UWlh
bmdndWkuU29uZ0BhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4gCj4+Pj4gK3N0YXRpYyBjb25zdCB1bnNp
Z25lZCBpbnQgY2xrMTJfMjRfcGluc1tdCQk9IHsgR1BJT0RfMTAgfTsKPj4+PiArc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCBwd21fZ19oaXpfcGluc1tdCQk9IHsgR1BJT0RfMTEgfTsKPj4+PiAr
Cj4+PiBbLi4uXQo+Pj4KPj4+PiArCj4+Pj4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgdGRt
X2dyb3Vwc1tdID0gewo+Pj4+ICsJInRkbV9kMl9jIiwgInRkbV9kM19jIiwgInRkbV9mczFfYyIs
ICJ0ZG1fZDRfYyIsICJ0ZG1fZDVfYyIsCj4+Pj4gKwkidGRtX2ZzMV9kIiwgInRkbV9kNF9kIiwg
InRkbV9kM19kIiwgInRkbV9kMl9kIiwgInRkbV9zY2xrMV9kIiwKPj4+PiArCSJ0ZG1fc2NsazFf
aCIsICJ0ZG1fZnMxX2giLCAidGRtX2QyX2giLCAidGRtX2QzX2giLCAidGRtX2Q0X2giLAo+Pj4+
ICsJInRkbV9kMSIsICJ0ZG1fZDAiLCAidGRtX2ZzMCIsICJ0ZG1fc2NsazAiLCAidGRtX2ZzMiIs
ICJ0ZG1fc2NsazIiLAo+Pj4+ICsJInRkbV9kNF96IiwgInRkbV9kNV96IiwgInRkbV9kNiIsICJ0
ZG1fZDciCj4+Pj4gK307Cj4+PiBPbiBwcmV2aW91cyBjaGlwLCB0aGVyZSB3ZXJlIHBpbiBhc3Np
Z25lZCB0byB0ZG0gQSwgQiBvciBDLgo+Pj4gT24gdGhpcyBnZW5lcmF0aW9uLCBpdCBzZWVtcyB5
b3UgaGF2ZSBhZGRlZCBhIHNlY29uZCBsZXZlbCBvbiBwaW5tdXhpbmcKPj4+IHRvIHJlLXJvdXRl
IHRoZSBhdWRpbyBwaW5zIHRvIGRpZmZlcmVudCBjb250cm9sbGVycwo+Pj4gSW4gc3VjaCBjYXNl
LCBJIGRvbid0IHRoaW5rIHRoZXkgYmVsb25nIGluIHRoZSBzYW1lIGdyb3VwLgo+Pj4gRGVwZW5k
aW5nIG9uIHNldHRpbnMsIEQyIGFuZCBEMyBjb3VsZCBiZSB1bnJlbGF0ZWQKPj4+IEkgdGhpbmsg
ZWFjaCBhdWRpbyBwaW4gc2hvdWxkIGhhdmUgaXRzIG93biBncm91cCAob25lIGdyb3VwIGZvciBE
Mywgb25lCj4+PiBENCwgZXRjIC4uLikKPj4+Cj4+IEFjY29yZGluZyB0byBvdXIgYXVkaW8gY29s
bGVhZ3VlLCBvbiB0aGlzIGNoaXAsIHRkbSBBL0IvQyBjYW4gY2hvb3NlIHdoaWNoCj4+IHBpbnMg
YXJlIHJvdXRlZCB0byB0aGVpciBjb250cm9sbGVycyBmcmVlbHkgYnkgd3JpdGluZyBzcGVjaWFs
IHJlZ2lzdGVycywKPj4gc2F5LCB0ZG1fZDJfYyBjYW4gYmUgYXNzaWduZWQgdG8gYW55IG9mIHRk
bSBhLCBiIGFuZCBjIGJ5IGRlbWFuZCwgc28gbm8KPj4gbmVlZCB0byBzcGVjaWZ5IGEvYi9jIHdv
cmRzIGFueSBtb3JlLgo+IAo+IFRoYXQncyBiYXNpY2FsbHkgbXkgY29tbWVudCBhYm92ZS4gQ29t
bWVudCBzdGlsbCBzdGFuZHMKPiBFYWNoIEQgYW5kIEZTIHBpbiBjb3VsZCBiZSByZWxhdGVkIHRv
IGRpZmZlcmVudCBpbnRlcmZhY2UgYW5kIHNob3VsZCBiZQo+IGluIGRpZmZlcmVudCBncm91cHMK
PiAKPiAKPiAKU28gSSBndWVzcyBiZWxvdyBzaG91bGQgbWF0Y2ggYWJvdmUgY29tbWVudCwgY29y
cmVjdCBtZSBpZiBJ4oCZbSB3cm9uZwoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0ZG1fZDBf
Z3JvdXBzIHsKICAgICAgIC4uLgp9OwogIC4uLgoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0
ZG1fZDdfZ3JvdXBzIHsKICAgICAgIC4uLgp9OwoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0
ZG1fZnMwX2dyb3VwcyB7CiAgICAgIC4uLgp9OwoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0
ZG1fZnMyX2dyb3VwcyB7CiAgICAgIC4uLgp9OwoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0
ZG1fc2NsazBfZ3JvdXBzIHsKICAgICAgLi4uCn07CiAgICAgLi4uCnN0YXRpYyBjb25zdCBjaGFy
ICogY29uc3QgdGRtX3NjbGsyX2dyb3VwcyB7CiAgICAgIC4uLgp9OwoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
