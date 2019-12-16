Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1403C43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 06:02:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08E62072B
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 06:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mePViYG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B08E62072B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2mNsu8ZwO/LjEim/1a6h1XABwaEWwK/ufjDjy++4uZs=; b=mePViYG+r/PN6L3hiFlh6WW3C
	HxM+0IHxafjXCuzbHXxr1tTc8v3/pqgjGL1rDbmxmbwzC5TZjhwPYpbV6BpdVJKrtzfZZxdCS0Ugs
	Tr1QjmRFBC5Ubvlz3KiOm+2HFehcse16a4w2UKzv/GI8U6Ml/Sqgwz/23N4bC82nitYZDJoBUTAAi
	4tVXeTnGA1NhhWoMH4FDT7IEFoHdlgrBTCAbdj5ZOVTx+Z4FLk8Z+fI5uqstpWkGAQDD3IMS74q2j
	ef5DVC/0q/s4ZfMEV9323pYfIR8QlFxx1WFt9QoXIxMXM+emGKFVhuW68UeiR2Dy/CMFjmaNq/b+o
	8ZvDM/pQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igjSw-00016x-69; Mon, 16 Dec 2019 06:02:46 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igjSt-000164-Bk; Mon, 16 Dec 2019 06:02:44 +0000
Received: from [10.28.19.135] (10.28.19.135) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 16 Dec
 2019 14:03:07 +0800
Subject: Re: [PATCH v5 2/4] dt-bindings: watchdog: add new binding for meson
 secure watchdog
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
 <robh+dt@kernel.org>
References: <1576153187-28378-1-git-send-email-xingyu.chen@amlogic.com>
 <1576153187-28378-3-git-send-email-xingyu.chen@amlogic.com>
 <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
From: Xingyu Chen <xingyu.chen@amlogic.com>
Message-ID: <f7b0afe7-e317-2422-de7e-878837f9f238@amlogic.com>
Date: Mon, 16 Dec 2019 14:03:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBHLqgPExPsVaSWdSOr0Oj-jeYa4Z82U-pJ=fS+D1wGnA@mail.gmail.com>
Content-Language: en-GB
X-Originating-IP: [10.28.19.135]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_220243_401544_157B4FD8 
X-CRM114-Status: GOOD (  11.61  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksIE1hcnRpbgoKU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LgoKT24gMjAxOS8xMi8xMyA0OjA1
LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IEhpIFhpbmd5dSBhbmQgUm9iLAo+Cj4gT24g
VGh1LCBEZWMgMTIsIDIwMTkgYXQgMToyMCBQTSBYaW5neXUgQ2hlbiA8eGluZ3l1LmNoZW5AYW1s
b2dpYy5jb20+IHdyb3RlOgo+IFsuLi5dCj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+ICsgICAg
d2F0Y2hkb2cgewo+PiArICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW1sb2dpYyxtZXNvbi1zZWMt
d2R0IjsKPj4gKyAgICAgICAgICB0aW1lb3V0LXNlYyA9IDw2MD47Cj4+ICsgICAgfTsKPiBpbiB2
MyBvZiB0aGlzIHBhdGNoIFJvYiBjb21tZW50ZWQgdGhhdCB0aGVyZSBzaG91bGRuJ3QgYmUgYW4g
T0Ygbm9kZQo+IGlmIHRoZXJlIGFyZSBubyBhZGRpdGlvbmFsIHByb3BlcnRpZXMKPiB3aXRoIHRp
bWVvdXQtc2VjIHRoZXJlJ3Mgbm93IGFuIGFkZGl0aW9uYWwgcHJvcGVydHkgc28gbXkKPiB1bmRl
cnN0YW5kaW5nIGlzIHRoYXQgaXQncyBmaW5lIHRvIGhhdmUgYW4gT0Ygbm9kZQpZb3VyIHVuZGVy
c3RhbmRpbmcgaXMgY29ycmVjdC4KPgo+IHdoYXQgSSBkb24ndCB1bmRlcnN0YW5kIHlldCBpcyB3
aGVyZSB0aGlzIG5vZGUgc2hvdWxkIGJlIHBsYWNlZC4KPiBpcyBpdCBzdXBwb3NlZCB0byBiZSBh
IGNoaWxkIG5vZGUgb2YgdGhlIHNlY3VyZSBtb25pdG9yIG5vZGUgKGZvcgo+IHdoaWNoIHdlIGFs
cmVhZHkgaGF2ZSBhIGJpbmRpbmcgaGVyZToKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZmlybXdhcmUvbWVzb24vbWVzb25fc20udHh0KSBvcgo+IHdoZXJlIGVsc2Ugd291bGQg
d2UgcGxhY2UgaXQgaW5zaWRlIHRoZSAuZHRzPwpJTU8swqAgQWx0aG91Z2ggdGhlIHdhdGNoZG9n
IG5vZGUgbmVlZCB0byByZWZlcmVuY2UgdGhlIG1lc29uX3NtIG5vZGUsIAp0aGVyZSBpcyBubwpi
dXMtbGlrZSBkZXBlbmRlbmNpZXMgYmV0d2VlbiB0aGUgZGV2aWNlcyB3aGljaCB0aGUgdHdvIG5v
ZGVzIApjb3JyZXNwb25kaW5nIHRvLgpzbyBpIHRoaW5rIHRoYXQgdGhlIHdhdGNoZG9nIG5vZGUg
YXMgY2hpbGQgbm9kZSBvZiBtZXNvbl9zbSBtYXliZSBub3QgCmFwcHJvcHJpYXRlLgo+Cj4KPiBN
YXJ0aW4KPgo+Cj4gWzBdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEyMTEz
OTkvCj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
