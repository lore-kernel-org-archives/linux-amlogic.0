Return-Path: <SRS0=CFuo=ZI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C725AC432C3
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Nov 2019 09:53:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 990752072D
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Nov 2019 09:53:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AzywbSC4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 990752072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aqjf5qUugZ0yiSOAEtoZ23oL+x2vYhJOmAoj0+LrUE=; b=AzywbSC4+rpPXk
	LOZboaRnSeqUdBRfVj55PRN9rkhR9rFc3sJnA6BeY9FDE+8NwiaJTb9Fn6WbE9QYx8DatEuI2G+iC
	XXz0LeRrBhlej+fHuUE3lGkR20z3RQedZhctEiNBskkpVay1plSGDgd49VP/OSWUEthlM8WnL35AY
	ch3fD6w9nJHzTMz/YhyTe0F+pgX52Lalt2uJpXvxdtWXAJ6MvC82TR30nPYzqTiOycxe1Nit2Acfu
	jogrnOEjhZ33kHciLRvs2Ed7d4QTfuSfbbK0FRYKNasYyPkMqIHqlElgT39NcYXT+vfvyRm2kPfgj
	NAGR/RIdaEhf6ICUGA+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVule-0004eW-7b; Sat, 16 Nov 2019 09:53:22 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVulS-0004Jj-3j
 for linux-amlogic@lists.infradead.org; Sat, 16 Nov 2019 09:53:11 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C468AAE03;
 Sat, 16 Nov 2019 09:53:08 +0000 (UTC)
Subject: Re: [RFC PATCH 2/2] Add support for Videostrong KII Pro tv box
To: Mohammad Rasim <mohammad.rasim96@gmail.com>
References: <20191115165026.19376-1-mohammad.rasim96@gmail.com>
 <20191115165026.19376-3-mohammad.rasim96@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <6fa93c06-ecab-c8da-32c4-db40533c09ec@suse.de>
Date: Sat, 16 Nov 2019 10:53:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191115165026.19376-3-mohammad.rasim96@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191116_015310_341677_F32CFF84 
X-CRM114-Status: GOOD (  18.93  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

QW0gMTUuMTEuMTkgdW0gMTc6NTAgc2NocmllYiBNb2hhbW1hZCBSYXNpbToKPiBUaGlzIHBhdGNo
IGFkZHMgc3VwcG9ydCBmb3IgdGhlIFZpZGVvc3Ryb25nIEtJSSBQcm8gdHYgYm94IHdoaWNoIGlz
IGJhc2VkIG9uIHRoZSBneGJiLXAyMDEgcmVmZXJlbmNlIGRlc2lnbgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1vaGFtbWFkIFJhc2ltIDxtb2hhbW1hZC5yYXNpbTk2QGdtYWlsLmNvbT4KPiAtLS0KPiAg
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAgICAgIHwgIDEgKwo+ICAu
Li4vYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGJiLUtJSS1Qcm8uZHRzICAgfCAyNSArKysrKysr
KysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmItS0lJ
LVByby5kdHMKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01h
a2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlCj4gaW5kZXggODRh
ZmVjYmE5ZWMwLi4xZDcyZTkzNjkxZjIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL01ha2VmaWxlCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01h
a2VmaWxlCj4gQEAgLTExLDYgKzExLDcgQEAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1l
c29uLWd4YmItbmV4Ym94LWE5NXguZHRiCj4gIGR0Yi0kKENPTkZJR19BUkNIX01FU09OKSArPSBt
ZXNvbi1neGJiLW9kcm9pZGMyLmR0Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVz
b24tZ3hiYi1wMjAwLmR0Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3hi
Yi1wMjAxLmR0Ygo+ICtkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3hiYi1LSUkt
UHJvLmR0YgoKTG93ZXJjYXNlOiAta2lpLXByby5kdGIKQW5kIHBsZWFzZSBzb3J0IGFscGhhYmV0
aWNhbGx5LgoKPiAgZHRiLSQoQ09ORklHX0FSQ0hfTUVTT04pICs9IG1lc29uLWd4YmItdmVnYS1z
OTUtcHJvLmR0Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3hiYi12ZWdh
LXM5NS1tZXRhLmR0Ygo+ICBkdGItJChDT05GSUdfQVJDSF9NRVNPTikgKz0gbWVzb24tZ3hiYi12
ZWdhLXM5NS10ZWxvcy5kdGIKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWd4YmItS0lJLVByby5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZ3hiYi1LSUktUHJvLmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAw
MDAwMDAwMDAwLi5lNzlkNzViZmE4ZGQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmItS0lJLVByby5kdHMKPiBAQCAtMCwwICsxLDI1
IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgTUlUKQo+ICsv
Kgo+ICsgKi8KCldoYXQgaXMgdGhpcz8gOikgWW91IG1heSB3YW50IHRvIGFkZCBhIGNvcHlyaWdo
dCBoZXJlLgoKPiArCj4gKy9kdHMtdjEvOwo+ICsKPiArI2luY2x1ZGUgIm1lc29uLWd4YmItcDIw
MS5kdHMiCgpUaGlzIGlzIHJhdGhlciB1bnVzdWFsLCBub3JtYWxseSB5b3Ugd291bGQgaW5jbHVk
ZSB0aGUgU29DJ3MgLmR0c2ksIG5vdAphbm90aGVyIGJvYXJkLgoKPiArCj4gKy8gewo+ICsJY29t
cGF0aWJsZSA9ICJWaWRlb3N0cm9uZyxLSUktUHJvIiwiYW1sb2dpYyxwMjAxIiwgImFtbG9naWMs
czkwNSIsICJhbWxvZ2ljLG1lc29uLWd4YmIiOwoKVGhpcyBpcyBub3QgYSB2YWxpZCB2ZW5kb3Ig
cHJlZml4ICh1bmRlZmluZWQsIHNob3VsZCBiZSBsb3dlcmNhc2UpLCBzYW1lCmZvciB0aGUgY29t
cGF0aWJsZSBzdHJpbmcsIHdoaWNoIHNob3VsZCBiZSBsb3dlcmNhc2UgYXMgYWxsIG90aGVycy4K
ClBsZWFzZSBydW4gLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwsIHdoaWNoIHdvdWxkIHdhcm4geW91
IG9mIHN1Y2ggaXNzdWVzLgoKQWxzbyBhIHNwYWNlIG1pc3NpbmcgYWZ0ZXIgY29tbWEuCgoKPiAr
CW1vZGVsID0gIlZpZGVvc3Ryb25nIEtJSSBQcm8iOwoKSGVyZSB5b3UgY2FuIHNwZWxsIGl0IHRo
ZSBvcmlnaW5hbCB3YXksIGxpa2UgeW91IGRpZC4KCj4gKwo+ICsKPiArfTsKPiArCj4gKyZ1YXJ0
X0Egewo+ICsJc3RhdHVzID0gIm9rYXkiOwo+ICsJcGluY3RybC0wID0gPCZ1YXJ0X2FfcGlucz4s
IDwmdWFydF9hX2N0c19ydHNfcGlucz47Cj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+
ICsJdWFydC1oYXMtcnRzY3RzOwoKTGVhdmUgYW4gZW1wdHkgbGluZSBoZXJlIGZvciBzcGFjaW5n
LgoKPiArCWJsdWV0b290aCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJicmNtLGJjbTQzMzVBMCI7Cj4g
KwkJc2h1dGRvd24tZ3Bpb3MgPSA8JmdwaW8gR1BJT1hfMjAgR1BJT19BQ1RJVkVfSElHSD47Cj4g
Kwl9Owo+ICt9OwoKUmVnYXJkcywKQW5kcmVhcwoKLS0gClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKR0Y6
IEZlbGl4IEltZW5kw7ZyZmZlcgpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZykKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
