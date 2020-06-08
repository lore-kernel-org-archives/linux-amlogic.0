Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8F6C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 11:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9EA206C3
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 11:32:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pw31S7jC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTnOMmB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9EA206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhVD1fTsYAucpY4Odz3Ng2nO8H2LenBL72uxwIqO20w=; b=Pw31S7jCr5ozh/
	ji1pAUSutV1mrY65kh8BPDOLe2beh/tib+2HBNW44nGlmEAWHAYDvZ4GqdvFIQZMv9DQS8JIX4ZCw
	96mjhdrA4KvUn8SPwFfV1XHySgPPh4MqQ3znP+9R9QQO42OWa+Ly/KVQqas7ISVqJWBjbOWvUX9vB
	nJl2GCo85XABtKGY/imoy1IYpim6a7YL2fdoigj0UNmYEMsgXxZZmdP93fxVZpTwPnKV/uHXoYUB8
	meL5W48FEwSjrVnwLYANXqMspOl6Bot91dyMqH4fRD6dfD2LIxsQOOTT08nmV6W/HiMVWCZfaSaxg
	Ex4fy8SDA1PIdd/zCDVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiG0v-0007Xu-4U; Mon, 08 Jun 2020 11:32:25 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiG0k-0007Pi-M5; Mon, 08 Jun 2020 11:32:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id p5so16971622wrw.9;
 Mon, 08 Jun 2020 04:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xSWNJpoj9Q+cfvAowlT8L7DGalgysWzhUfSm0eMm4Aw=;
 b=YTnOMmB4tb7Dp7ULkcGrEQ2H44bPw8oI8UxeG8wLRrUOFOX9HKqGiFjpA/+2yyikWg
 TYOAL5M7vN2hsz83LGl5LjLejxt2SDIQED5YjCaeZSRfy6ePf9Rg+2ToMG9xszGpujSr
 7hX8fQU3sC74EfkKhAk1TEt+a17drdUeJLH3eYolZX5+1X9XUSgLbZG7quo+lVq4y8yH
 zIP/6831snBBGt/NRhjDe28Nu28zeDxb4jDCoiML9lrYQAdf/4HgcuyMKjX4UxwTb2ba
 HThTClKTaH1kCL2k02fzgWTmHn9nTrwDG2JUB1l30ZRmO6xk/G+S4UIwjOjaOdChobvR
 sZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xSWNJpoj9Q+cfvAowlT8L7DGalgysWzhUfSm0eMm4Aw=;
 b=Tm5cRLW3k1s83O1DaGvVxfkRM7eIgs130kb59x4poyWoCVBaMW42+vHNVQoGKdm9Jl
 U/yW6WTd7oGFRsVEJdn/OHxOWlB+IAZjP+UQWTiskY/KutvVV3E61CkrJZC06Xc482Lb
 mexs+HDhbS/dmssL2AqKp3bnjn99Q8J6GE71yAfyBz36D961kkAgp05Df3zVbSj3zwqL
 1WNBCrlF10FWFsPK7WCcD5i6DQHcuIQRQkUquzRDd7k76/4IkWXoYOc8dHQOVviEP7Tc
 InF8ZHtCcYcbi8gJ7Q1grY1bhUaNnAwB0nFaOOHWdTvomjcZXiXA9ZpAsIrc/qlFKY30
 iExQ==
X-Gm-Message-State: AOAM531GyxzeHY889nm0bTXryF7W+dG0K9elTe0NePthqCUJ/bTfNRCs
 j4Kj+CkpCWEulBGCTASPkSc=
X-Google-Smtp-Source: ABdhPJyWGnzhV7sCJMthf69WCiVGa54Q3A42fYSaonFUzQL96QhkraYk/+8MtD6KJiYecm6g6HARww==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr22242545wrr.375.1591615928639; 
 Mon, 08 Jun 2020 04:32:08 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id d17sm25584732wrg.75.2020.06.08.04.32.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 04:32:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: Fix S905X3 ID
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <7d58e4db-2893-3675-eb93-ea14c3534b5b@baylibre.com>
Date: Mon, 8 Jun 2020 15:32:03 +0400
Message-Id: <ACA41DA3-88A4-4141-AEAD-C056C9834B6B@gmail.com>
References: <20200604044808.30995-1-christianshewitt@gmail.com>
 <7d58e4db-2893-3675-eb93-ea14c3534b5b@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_043214_729137_764A013B 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gOCBKdW4gMjAyMCwgYXQgMTI6NTggcG0sIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25n
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gCj4+IFRoZSBjdXJyZW50IHZhbHVlIGlzIHRha2VuIGZy
b20gQW1sb2dpYydzIDQuOSBic3Aga2VybmVsIHdoaWNoIGFwcGVhcnMKPj4gdG8gdXNlIHRoZSB3
cm9uZyBJRC4gRm9yIGNvbXBhcmlzb24sIGhlcmUncyBiZWZvcmUvYWZ0ZXI6Cj4+IAo+PiBbICAg
IDAuMTUyMjM3XSBzb2Mgc29jMDogQW1sb2dpYyBNZXNvbiBTTTEgKFVua25vd24pIFJldmlzaW9u
IDJiOmMgKDEwOjIpIERldGVjdGVkCj4+IFsgICAgMC4xNTI0NjNdIHNvYyBzb2MwOiBBbWxvZ2lj
IE1lc29uIFNNMSAoUzkwNVgzKSBSZXZpc2lvbiAyYjpjICgxMDoyKSBEZXRlY3RlZAo+IAo+IEZv
ciBTTTEgd2UgaGF2ZSB3ZWlyZCB2YWx1ZXMsIGhlcmUgYXJlIHRoZSBvbmUgd2UgZ2VuIG9uIEtl
cm5lbENJOgo+IFNFSTYxMCAoUzkwNUQzKToKPiBBbWxvZ2ljIE1lc29uIFNNMSAoVW5rbm93bikg
UmV2aXNpb24gMmI6YyAoNTA6MikKPiAKPiBWSU0zTCAoUzkwNUQzKQo+IEFtbG9naWMgTWVzb24g
U00xIChVbmtub3duKSBSZXZpc2lvbiAyYjpjICg0OjIpCj4gCj4gQW5kIHlvdSByZXBvcnQgbm93
Ogo+IE9kcm9pZC1DNCAoUzkwNVg0KQo+IEFtbG9naWMgTWVzb24gU00xIChVbmtub3duKSBSZXZp
c2lvbiAyYjpjICgxMDoyKQo+IAo+IEFuZCBhdCB0aGUgdGltZSB5b3UgcmVwb3J0ZWQ6Cj4gVklN
M0wgKFM5MDVEMykKPiBBbWxvZ2ljIE1lc29uIFNNMSAoUzkwNUQzKSBSZXZpc2lvbiAyYjpjIChi
MDoyKQo+IAo+IFNvIEknbSBxdWl0ZSBsb3N0IGhlcmXigKYuCgpJbiBbMV0geW91IGFkZGVkIHRo
ZSBTTTEgU29DIElEIGFuZCBTOTA1WDMgSUQgeyAiUzkwNVgzIiwgMHgyYiwgMHg1LCAweGYgfQp3
aGljaCBtYXRjaGVzIHRoZSBCU1Aga2VybmVsIHNvdXJjZS4KCkluIFsyXSBJIGFkZGVkIGEgc2Vj
b25kIFM5MDVYMyBJRCB7ICJTOTA1WDMiLCAweDJiLCAweGIwLCAweGYyIH0gZm9yIFZJTTNMLCBi
dXQKdGhpcyB3YXMgYSBtaXN0YWtlICh0aGUgY2hpcCBpcyBTOTA1RDMpIHNvIFszXSBjb3JyZWN0
ZWQgaXQgdG8geyAiUzkwNUQzIiwgMHgyYiwKMHhiMCwgMHhmMCB9IHdoaWNoIG1hdGNoZXMgbXkg
VklNM0wgYm9hcmQuIElmIHRoZSBWSU0zTOKAmXMgaW4gS2VybmVsQ0kgbm93IHNob3cKIjJiOmMg
KDQ6MinigJ0gaXQgbG9va3MgdGhlcmUgaGFzIGJlZW4gYSBwYWNrYWdlIGNoYW5nZSAoc2lsaWNv
biBmaXhlcz8pIGFuZCB3ZQpuZWVkIHRvIGFkZCBhbm90aGVyIFM5MDVEMyBwYWNrYWdlIElELgoK
SW4gdGhlIGxhc3Qgd2VlayBJIGhlbHBlZCB0aHJlZSBkaWZmZXJlbnQgdXNlcnMgaW5zdGFsbCBM
RSBvbiBTOTA1WDMgQW5kcm9pZApib3ggZGV2aWNlcywgYWxsIG9mIHdoaWNoIGRlY2xhcmUgIjJi
OmMgKDEwOjIp4oCdIGFzIHRoZSBTb0MgSUQsIHdoaWNoIG1hdGNoZXMKdGhlIG9ubHkgUzkwNVgz
IGRldmljZSBJIG93biAoT2Ryb2lkIEM0KS4gU28gSSBhc3N1bWVkIHRoZSBCU1AgaXMgd3Jvbmcg
YW5kCnNlbnQgdGhpcyBmaXggcGF0Y2guCgpJZiBTRUk2MTAgaXMgUzkwNVgzIChpbXBsaWVkIGJ5
IHRoZSBvcmlnaW5hbCBTTTEgc3VibWlzc2lvbiBmcm9tIHlvdSkgS2VybmVsQ0kKb3V0cHV0IHNo
b3dzIHRoZSBjdXJyZW50IElEIGlzIHdyb25nICjigJhVbmtub3du4oCZKSBzbyB3ZSBwcm9iYWJs
eSBuZWVkIHRvIGZpeCBpdAp3aXRoIHsgIlM5MDVYMyIsIDB4MmIsIDB4NTAsIDB4ZjAgfSB0aGVu
IGFkZCBuZXcgUzkwNUQzIChWSU0zTCkgYW5kIFM5MDVYMyAoYXMKcGVyIHRoaXMgcGF0Y2gpIElE
cy4KCklmIFNFSTYxMCBpcyBTOTA1RDMgKGFzIHN0YXRlZCBpbiB0aGlzIHRocmVhZCkgdGhlIGZp
eCBpbiB0aGlzIHBhdGNoIGlzIHN0aWxsCmNvcnJlY3QsIGJ1dCB3ZSBhbHNvIG5lZWQgdG8gc2Vu
ZCBhIHNlY29uZCBwYXRjaCB0byBhZGQgdHdvIG5ldyBTOTA1RDMgcGFja2FnZQpJRHMgKFNFSTYx
MCArIFZJTTNMKS4KCknigJlsbCBwaW5nIHlvdSBvZmYtbGlzdCB0byBkaXNjdXNzLgoKQ2hyaXN0
aWFuCgpbMV0gYzljYzliZWMzNmQwICgic29jOiBhbWxvZ2ljOiBtZXNvbi1neC1zb2NpbmZvOiBB
ZGQgU00xIGFuZCBTOTA1WDMgSUTigJ0pClsyXSAxZDdjNTQxYjhhNWIgKCJzb2M6IGFtbG9naWM6
IG1lc29uLWd4LXNvY2luZm86IEFkZCBTOTA1WDMgSUQgZm9yIFZJTTNM4oCdKQpbM10gZmRmYzY5
OTdiZDA4ICgic29jOiBhbWxvZ2ljOiBtZXNvbi1neC1zb2NpbmZvOiBGaXggUzkwNUQzIElEIGZv
ciBWSU0zTOKAnSkKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
