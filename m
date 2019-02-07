Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09026C282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:05:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6286217F9
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQArl2WB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WYifJ7I2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6286217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wEIqRVsx/HcsDkMBcZvMoD7udlhjNRcdve3Ui8d9sE=; b=OQArl2WBOG85mh
	Izz/m0Ncg/FxditbfDnlZm6KF055P2lQEeNAl9xS4omy6tz8QYMIlYP5iqN7+fW8kuSfzj4rQl28o
	GZsXTPXWSal4ctyGZSY4nuUr7DR/gq9tWRCIt8UdY68Gk1pmiLxW5DKb2tSZBlMQUGQQwsSczxV+2
	+mC7HSz6g/dEjpUO/KqUJiTMteG+GQ3jWXYn+PkEdslWy5IU7ckx5D0TGqMPBpU4CKsa6S1ylzl/s
	NGbaVEFtajEjbynuo1CFVJlhlk107a4IoYHrMf4P4cm+Iu2PB6P30TFcP0D80TQwY65l8ROU8oza1
	iuFsslvxMsEIvEjtMFIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grZzv-0002hk-Dc; Thu, 07 Feb 2019 03:05:07 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grZzr-0001uy-6A
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 03:05:05 +0000
Received: by mail-pg1-x544.google.com with SMTP id y4so3855203pgc.12
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 19:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xTum6iQkajVMkpV+6Qqen42mTcvEsLSgP/OYidGH6zA=;
 b=WYifJ7I2qJfvwfcpygQNA/h7gJzVgzNphSl/vGErtUSljL2zKFiDqeMFskw31ERbT9
 b5GmHOUJI3FQyhumrudU5zz2F5m4KNts8CY7MO6RrKIzvlghXbZkNCmBuji0Do25WFch
 kMU3ToRR3vAuryswY/+gC8BVlCrSiCye/7J+M4h6Ut7AGDq2JR3ZmUrQFSTZjhaKqpBV
 9O9AY4CVsYSZKgooy/9gHzKxt6JcKvVRHhV9rs5MQs+jDvgfNXN95gSVHdhxh/yAhixn
 Lp3u1GCwZGsWw501cb/UX0VD1cmt9mWQOdLtkcSZl9ue4/3rLkSBj3Vkf7rVkp+d15oG
 gCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=xTum6iQkajVMkpV+6Qqen42mTcvEsLSgP/OYidGH6zA=;
 b=p0RLRkhnb+VYNhxRL8PiV4DuFUV80MVQq7CwNygJAzBrsUIufcVAhXqW+ZJ9Qh3iKz
 JVBjqmBkh8YvXfkg1JMwyddCfkDnXrHACyf75MKvJyZxp+du9bEYOKIrxweIfI1z/I+9
 6NKASXDzgpf8dYi8xf7Lw6kKJk8jg4LHLyNXwqJpk0BuV1W4pL/c9cyJcGJxEiE6Vwef
 IgtwW25GzPUunA8FhD7wAy7Xa4GOfZhzz9MqVERd29d+x4/bYtxAPzw0e0rBL88LqgRN
 3Wpd0uwjGwNGNusSvSQPnlYEJpo+hXrXK/G6QwQNUCqHKmlEESkyWsE6UijeJUPu+IXi
 JBpQ==
X-Gm-Message-State: AHQUAuZ9Cs6EF5bwljOatZZB76RjM3fJ11rkZj7OCm5GN/a/wR1R2jCX
 CybHGbwCJs8Y1bbO29/2/0bP7Q==
X-Google-Smtp-Source: AHgI3IZO7zSRaf1dtqZbrL/RdxMlVjXN7WLVe7IlobIvWLfXLH/GTD5aj8vvRhIo26f/AdXXevpKpg==
X-Received: by 2002:a65:4381:: with SMTP id m1mr12525009pgp.358.1549508700108; 
 Wed, 06 Feb 2019 19:05:00 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id u123sm10726812pfb.1.2019.02.06.19.04.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:04:59 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: meson8b: fix the Ethernet data line
 signals in eth_rgmii_pins
In-Reply-To: <CAFBinCAJhiW0kLgEoPWZRshPAP=UaK2jOBCBeftjz9E+sP2YGA@mail.gmail.com>
References: <20181229143556.27339-1-martin.blumenstingl@googlemail.com>
 <20181229143556.27339-3-martin.blumenstingl@googlemail.com>
 <7hwoncov8k.fsf@baylibre.com>
 <CAFBinCAJhiW0kLgEoPWZRshPAP=UaK2jOBCBeftjz9E+sP2YGA@mail.gmail.com>
Date: Wed, 06 Feb 2019 19:04:58 -0800
Message-ID: <7hd0o4i9id.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_190503_361527_DE7676AC 
X-CRM114-Status: GOOD (  16.66  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 jianxin.pan@amlogic.com, ingrassia@epigenesys.com, linus.luessing@c0d3.blue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4g
d3JpdGVzOgoKPiBIaSBLZXZpbiwKPgo+IE9uIEZyaSwgSmFuIDExLCAyMDE5IGF0IDI6MDkgQU0g
S2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4+Cj4+IE1hcnRpbiBC
bHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyaXRlczoK
Pj4KPj4gPiBBY2NvcmRpbmcgdG8gdGhlIE9kcm9pZC1DMSsgc2NoZW1hdGljcyB0aGUgRXRoZXJu
ZXQgVFhEMSBzaWduYWwgaXMKPj4gPiByb3V0ZWQgdG8gR1BJT0hfNSBhbmQgdGhlIFRYRDAgc2ln
bmFsIGlzIHJvdXRlZCB0byBHUElPSF82Lgo+PiA+IFRoZSBwdWJsaWMgUzgwNSBkYXRhc2hlZXQg
c2hvd3MgdGhhdCBUWEQwIGNhbiBiZSByb3V0ZWQgdG8gRElGXzJfUCBhbmQKPj4gPiBUWEQxIGNh
biBiZSByb3V0ZWQgdG8gRElGXzJfTiBpbnN0ZWFkLgo+PiA+Cj4+ID4gVGhlIHBpbiBncm91cHMg
ZXRoX3R4ZDBfMCAoR1BJT0hfNikgYW5kIGV0aF90eGQwXzEgKERJRl8yX1ApIGFyZSBib3RoCj4+
ID4gY29uZmlndXJlZCBhcyBFdGhlcm5ldCBUWEQwIGFuZCBUWEQxIGRhdGEgbGluZXMgaW4gbWVz
b244Yi5kdHNpLiBBdCB0aGUKPj4gPiBzYW1lIHRpbWUgZXRoX3R4ZDFfMCAoR1BJT0hfNSkgYW5k
IGV0aF90eGQxXzEgKERJRl8yX04pIGFyZSBjb25maWd1cmVkCj4+ID4gYXMgVFhEMCBhbmQgVFhE
MSBkYXRhIGxpbmVzIGFzIHdlbGwuCj4+ID4gVGhpcyByZXN1bHRzIGluIGEgYmFkIEV0aGVybmV0
IHJlY2VpdmUgcGVyZm9ybWFuY2UuIFByZXN1bWFibHkgdGhpcyBpcwo+PiA+IGR1ZSB0byB0aGUg
ZXRoX3R4ZDAgYW5kIGV0aF90eGQxIHNpZ25hbCBiZWluZyByb3V0ZWQgdG8gdGhlIHdyb25nIHBp
bnMuCj4+ID4gQXMgYSByZXN1bHQgb2YgdGhhdCBkYXRhIGNhbiBvbmx5IGJlIHRyYW5zbWl0dGVk
IG9uIGV0aF90eGQyIGFuZAo+PiA+IGV0aF90eGQzLiBIb3dldmVyLCBJIGhhdmUgbm8gc2NvcGUg
dG8gZnVsbHkgY29uZmlybSB0aGlzIGFzc3VtcHRpb24uCj4+ID4KPj4gPiBUaGUgdmVuZG9yIHUt
Ym9vdCBzb3VyY2VzIGZvciBPZHJvaWQtQzEgdXNlIHRoZSBmb2xsb3dpbmcgRXRoZXJuZXQKPj4g
PiBwaW5tdXggY29uZmlndXJhdGlvbjoKPj4gPiAgIFNFVF9DQlVTX1JFR19NQVNLKFBFUklQSFNf
UElOX01VWF82LCAweDNmNGYpOwo+PiA+ICAgU0VUX0NCVVNfUkVHX01BU0soUEVSSVBIU19QSU5f
TVVYXzcsIDB4ZjAwMDAwKTsKPj4gPiBUaGlzIHRyYW5zbGF0ZXMgdG8gdGhlIGZvbGxvd2luZyBw
aW4gZ3JvdXBzIGluIHRoZSBtYWlubGluZSBrZXJuZWw6Cj4+ID4gLSByZWdpc3RlciA2IGJpdCAg
MDogZXRoX3J4ZDEgKERJRl8wX1ApCj4+ID4gLSByZWdpc3RlciA2IGJpdCAgMTogZXRoX3J4ZDAg
KERJRl8wX04pCj4+ID4gLSByZWdpc3RlciA2IGJpdCAgMjogZXRoX3J4X2R2IChESUZfMV9QKQo+
PiA+IC0gcmVnaXN0ZXIgNiBiaXQgIDM6IGV0aF9yeF9jbGsgKERJRl8xX04pCj4+ID4gLSByZWdp
c3RlciA2IGJpdCAgNjogZXRoX3R4X2VuIChESUZfM19QKQo+PiA+IC0gcmVnaXN0ZXIgNiBiaXQg
IDg6IGV0aF9yZWZfY2xrIChESUZfM19OKQo+PiA+IC0gcmVnaXN0ZXIgNiBiaXQgIDk6IGV0aF9t
ZGMgKERJRl80X1ApCj4+ID4gLSByZWdpc3RlciA2IGJpdCAxMDogZXRoX21kaW9fZW4gKERJRl80
X04pCj4+ID4gLSByZWdpc3RlciA2IGJpdCAxMTogZXRoX3R4X2NsayAoR1BJT0hfOSkKPj4gPiAt
IHJlZ2lzdGVyIDYgYml0IDEyOiBldGhfdHhkMiAoR1BJT0hfOCkKPj4gPiAtIHJlZ2lzdGVyIDYg
Yml0IDEzOiBldGhfdHhkMyAoR1BJT0hfNykKPj4gPiAtIHJlZ2lzdGVyIDcgYml0IDIwOiBldGhf
dHhkMF8wIChHUElPSF82KQo+PiA+IC0gcmVnaXN0ZXIgNyBiaXQgMjE6IGV0aF90eGQxXzAgKEdQ
SU9IXzUpCj4+ID4gLSByZWdpc3RlciA3IGJpdCAyMjogZXRoX3J4ZDMgKERJRl8yX1ApCj4+ID4g
LSByZWdpc3RlciA3IGJpdCAyMzogZXRoX3J4ZDIgKERJRl8yX04pCj4+ID4KPj4gPiBEcm9wIHRo
ZSBldGhfdHhkMF8xIGFuZCBldGhfdHhkMV8xIGdyb3VwcyBmcm9tIGV0aF9yZ21paV9waW5zIHRv
IGZpeCB0aGUKPj4gPiBFdGhlcm5ldCB0cmFuc21pdCBwZXJmb3JtYW5jZSBvbiBPZHJvaWQtQzEu
IEFsc28gYWRkIHRoZSBldGhfcnhkMiBhbmQKPj4gPiBldGhfcnhkMyBncm91cHMgc28gd2UgZG9u
J3QgcmVseSBvbiB0aGUgYm9vdGxvYWRlciB0byBzZXQgdGhlbSB1cC4KPj4gPgo+PiA+IGlwZXJm
MyBzdGF0aXN0aWNzIGJlZm9yZSB0aGlzIGNoYW5nZToKPj4gPiAtIHRyYW5zbWl0dGluZyBmcm9t
IE9kcm9pZC1DMTogNzQxIE1iaXRzL3NlYyAoMCByZXRyaWVzKQo+PiA+IC0gcmVjZWl2aW5nIG9u
IE9kcm9pZC1DMTogMTk5IE1iaXRzL3NlYyAoMTcxMyByZXRyaWVzKQo+PiA+Cj4+ID4gaXBlcmYz
IHN0YXRpc3RpY3MgYWZ0ZXIgdGhpcyBjaGFuZ2U6Cj4+ID4gLSB0cmFuc21pdHRpbmcgZnJvbSBP
ZHJvaWQtQzE6IDY2NyBNYml0cy9zZWMgKDAgcmV0cmllcykKPj4gPiAtIHJlY2VpdmluZyBvbiBP
ZHJvaWQtQzE6IDc1MCBNYml0cy9zZWMgKDAgcmV0cmllcykKPj4gPgo+PiA+IEZpeGVzOiBiOTY0
NDY1NDFkODM5MCAoIkFSTTogZHRzOiBtZXNvbjhiOiBleHRlbmQgZXRoZXJuZXQgY29udHJvbGxl
ciBkZXNjcmlwdGlvbiIpCj4+ID4gU2lnbmVkLW9mZi1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8
bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPj4gPiBDYzogRW1pbGlhbm8gSW5n
cmFzc2lhIDxpbmdyYXNzaWFAZXBpZ2VuZXN5cy5jb20+Cj4+ID4gQ2M6IExpbnVzIEzDvHNzaW5n
IDxsaW51cy5sdWVzc2luZ0BjMGQzLmJsdWU+Cj4+Cj4+IFF1ZXVlZCBmb3IgdjUuMSAoYnJhbmNo
OiB2NS4xL2R0KQo+IGRvIHlvdSBrbm93IHdoYXQgaGFwcGVuZWQgdG8gdGhpcyBwYXRjaD8gSSBj
YW4ndCBmaW5kIGl0IGluIHY1LjEvZHQKCkhtbSwgSSdtIG5vdCBzdXJlIHdoYXQgaGFwcGVuZWQg
dG8gaXQsIGJ1dCBJIChyZSlhZGRlZCBpdCB0byB2NS4xL2R0Cmp1c3Qgbm93LgoKS2V2aW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
