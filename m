Return-Path: <SRS0=CFuo=ZI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CAFC432C3
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Nov 2019 09:43:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD0C20723
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Nov 2019 09:43:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X976wIWI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD0C20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dgyYJpHrkJEjVdqGVyfOGxythbb9/I9rtDvVYKCUwQw=; b=X976wIWIxH1oCB8P9XplE79sjY
	QE2NIweQRAIkm5AKpjpX+TrXpBTaxJjSBnYAxsSMsZoC3EZp0ZC6ya0exHK0miOQ6m0yLArVYwl5s
	VSnZzdyEUqvDp4FVNeDQ3nUD5AcS460zsIpyhE+5iZ6eogAN/nISCfWinoYsfTcgJ7GWHcMteSyOl
	HgsAt7W+jQjeaHJR8lYpfU72q4RiQCqK9Yv05Q6k+p2tZgxWtQhjPyer9xzgqMpdrfQQwZLd6IjGB
	R7UR+iZCXKnp4TTnJUDhDT8iPzsl47IQqNf5MxqMf2TzOcaOys/ix/995N6CDVLACaq3Qr0Du+7yI
	5jBayomg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVucP-0000bb-4d; Sat, 16 Nov 2019 09:43:49 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVucM-0000au-IB
 for linux-amlogic@lists.infradead.org; Sat, 16 Nov 2019 09:43:47 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF09FAFA7;
 Sat, 16 Nov 2019 09:43:42 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] Add entry for BCM4335A0 UART bluetooth
To: Mohammad Rasim <mohammad.rasim96@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-bluetooth@vger.kernel.org,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>
References: <20191115165026.19376-1-mohammad.rasim96@gmail.com>
 <20191115165026.19376-2-mohammad.rasim96@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <b22e57eb-978f-9ec8-9ca6-06c0f5e7b9f6@suse.de>
Date: Sat, 16 Nov 2019 10:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191115165026.19376-2-mohammad.rasim96@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191116_014346_745799_BF25161B 
X-CRM114-Status: GOOD (  15.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QW0gMTUuMTEuMTkgdW0gMTc6NTAgc2NocmllYiBNb2hhbW1hZCBSYXNpbToKPiBTaWduZWQtb2Zm
LWJ5OiBNb2hhbW1hZCBSYXNpbSA8bW9oYW1tYWQucmFzaW05NkBnbWFpbC5jb20+CgpMYWNraW5n
IGEgY29tbWl0IGRlc2NyaXB0aW9uLiBQbGVhc2UgYWRkIGEgc2VudGVuY2UuCgo+IC0tLQo+ICBk
cml2ZXJzL2JsdWV0b290aC9idGJjbS5jICAgfCAxICsKPiAgZHJpdmVycy9ibHVldG9vdGgvaGNp
X2JjbS5jIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0YmNtLmMgYi9kcml2ZXJzL2JsdWV0b290aC9i
dGJjbS5jCj4gaW5kZXggMmQyZTZkODYyMDY4Li4yMjQ2NGJmOGNkYTMgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ibHVldG9vdGgvYnRiY20uYwo+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0YmNt
LmMKPiBAQCAtMzM5LDYgKzMzOSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYmNtX3N1YnZlcl90
YWJsZSBiY21fdWFydF9zdWJ2ZXJfdGFibGVbXSA9IHsKPiAgCXsgMHgyMjBlLCAiQkNNMjA3MDJB
MSIgIH0sCS8qIDAwMS4wMDIuMDE0ICovCj4gIAl7IDB4NDIxNywgIkJDTTQzMjlCMSIgICB9LAkv
KiAwMDIuMDAyLjAyMyAqLwo+ICAJeyAweDYxMDYsICJCQ000MzU5QzAiCX0sCS8qIDAwMy4wMDEu
MDA2ICovCj4gKwl7IDB4NDEwNiwgIkJDTTQzMzVBMCIJfSwJLyogMDAyLjAwMS4wMDYgKi8KPiAg
CXsgfQo+ICB9OwoKQmV5b25kIHRoaXMgcGF0Y2g6IFRoZXJlIGFwcGVhcnMgdG8gYmUgbm8gb3Jk
ZXIgaW4gdGhpcyB0YWJsZSBhdCBhbGw/Ck5vdCBhbHBoYWJldGljYWxseSwgbm90IG51bWVyaWNh
bGx5LCBub3QgYnkgY29tbWVudC4KCj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2JsdWV0b290
aC9oY2lfYmNtLmMgYi9kcml2ZXJzL2JsdWV0b290aC9oY2lfYmNtLmMKPiBpbmRleCA3NjQ2NjM2
ZjJkMTguLjdiNGJiNWRiZWExZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2JsdWV0b290aC9oY2lf
YmNtLmMKPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9oY2lfYmNtLmMKPiBAQCAtMTQyMiw2ICsx
NDIyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYmNtX2JsdWV0b290aF9v
Zl9tYXRjaFtdID0gewo+ICAJeyAuY29tcGF0aWJsZSA9ICJicmNtLGJjbTQzNDVjNSIgfSwKPiAg
CXsgLmNvbXBhdGlibGUgPSAiYnJjbSxiY200MzMwLWJ0IiB9LAo+ICAJeyAuY29tcGF0aWJsZSA9
ICJicmNtLGJjbTQzNDM4LWJ0IiB9LAo+ICsJeyAuY29tcGF0aWJsZSA9ICJicmNtLGJjbTQzMzVB
MCIgfSwKCllvdSBjYW4ndCB1c2UgY29tcGF0aWJsZSBzdHJpbmdzIHdpdGhvdXQgZGVmaW5pbmcg
dGhlIGJpbmRpbmcgZmlyc3QuIFdoeQpkbyB5b3UgbmVlZCBpdD8gSWYgeW91IGRvLCB1c2UgbG93
ZXJjYXNlIG5hbWVzLgoKPiAgCXsgfSwKPiAgfTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
YmNtX2JsdWV0b290aF9vZl9tYXRjaCk7CgpSZWdhcmRzLApBbmRyZWFzCgotLSAKU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQpHRjogRmVsaXggSW1lbmTDtnJmZmVyCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJn
KQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
