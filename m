Return-Path: <SRS0=Q/al=QR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB8DC282C2
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 10:59:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2690B20844
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 10:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NsyeFwKC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q1qpBOc9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2690B20844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c90ILhUckeQ9LwTmhK4JahSGBUtPHJay4rQwGjjkN8E=; b=NsyeFwKCFKeOeH
	8lMs8fdCohkkgVB7nradmYqlmI3nRymIxONwVWtcfrqvngAkbyV1bVoiUH6GSshV4IYW6oV59hXhx
	9gO1EpGQNE0APA5Ewub1IwP3tvUPR82iPAwAlDvgvLD63aJR8+XR0i0qaZg1S2Fm3qns8OXwXZ93K
	Aqyy4MvyHDUv6CP7fdfIppUfE5KlkLkoWm4jGjEk5l0ZgJqoFyv1a0QVYHgzcL6jrHtEriTyNBpzE
	N1gX2EgWojuHCAQz71aDFQI22R7Vs5tK5xEBIFnga6Ie+mV7COpRrlEvcK7Pt545niidchX9au+Cd
	/z+uwDUCPrnaHEjPFQnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsmp6-00010P-9X; Sun, 10 Feb 2019 10:58:56 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsmon-0000mT-DA
 for linux-amlogic@lists.infradead.org; Sun, 10 Feb 2019 10:58:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id v26so11384787wmh.3
 for <linux-amlogic@lists.infradead.org>; Sun, 10 Feb 2019 02:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=qnM4uoHXmMhXZ2WSd2m5FOB3LMp6OfNKdQlrbW/TTYg=;
 b=q1qpBOc9iq42xCKxoPhadGJE4WlZWXtY37GRCPtarFZEgMbYqwXMTuY9giyQF7JeXi
 7Vu1dx7df40Dv5d8/ivsYI7B6deq2hZ5AY2NBv2txEL2yAWukJwyPzf5JL9R1LObS+s5
 wk/BIcy/xc4+1RRfhfNvvhaACBnxh4ALlc+Nrq9SY+pSF1cg94OcCQ15LL9WvY3UlFgA
 R+obMAEHLPfM8d9fIQtXhNza1TdWvMvJImoTaG9IrGnF1QFR1Su8Ryj/mm7wyG8JTcKB
 TZkFaPdkGu05NbjSN08f8yLOId8Qh09JvZWz8l8brR//cKcPQk32Pv7XgwqIj6LqzuBQ
 Uu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=qnM4uoHXmMhXZ2WSd2m5FOB3LMp6OfNKdQlrbW/TTYg=;
 b=Y08r2lW0cXD+66yGb0oQJ2ysdDX4u5J0G+uib0tuea3RdsoiA/IXhcS5HDQ/JDnbm3
 XSa8wktzwNf6wHAK4eieuTdqmToNCZ8rQTHOWmZO278jxfWqWhHkfd1IJC13xf4oH+hh
 //v4k2kPf2lpt4BEck73rrRbqKeYBAfG0VGsqqY+Xi4YEY9OulI4gNw1o9nIQlcIVuCc
 GXI00hYBSMNhnAhBOzBKV0So/TSzxfSviYv73xIOxmkaOrQMadGacAwQd4ekuJZmJ/Au
 g7L19dTxkI3LIGWlidRXEpE0TqgC6Fl1O/I9N69A1eSf+lhBI5YdxtJSeLr6bvxhT00H
 nrUA==
X-Gm-Message-State: AHQUAuaezI7qY+jFOTZ7AQ/T9c51Dj7QHz8uiY0C7oVfjN5YInEZv0Qo
 nLRYGEHlKqVz61QXPGnHJRn06w==
X-Google-Smtp-Source: AHgI3IY8naheJSREpzLbfwCC8Q7sn6SOObGst4S5tOs7vDBl5g/2npVP9CruZZ3USQS6Hk5orRztZg==
X-Received: by 2002:a5d:5101:: with SMTP id s1mr23514233wrt.89.1549796315457; 
 Sun, 10 Feb 2019 02:58:35 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id a144sm13286266wmd.30.2019.02.10.02.58.34
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 10 Feb 2019 02:58:34 -0800 (PST)
Message-ID: <5C6003D9.9090304@baylibre.com>
Date: Sun, 10 Feb 2019 11:58:33 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/2] clk: meson8b: fix typo "ABP" -> "APB"
References: <20190119205121.9621-1-martin.blumenstingl@googlemail.com>
 <095d0dca-f8d5-df7c-dbd0-7c2c50fcab82@baylibre.com>
 <CAFBinCCrYrxnb6Dk-0kGwbk0ttwe+je+wKZqxe6GUASnNdAckQ@mail.gmail.com>
In-Reply-To: <CAFBinCCrYrxnb6Dk-0kGwbk0ttwe+je+wKZqxe6GUASnNdAckQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_025837_445518_6526DA0A 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, sboyd@kernel.org,
 mturquette@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKTGUgMDkvMDIvMjAxOSAwMToyNCwgTWFydGluIEJsdW1lbnN0aW5nbCBhIMOp
Y3JpdCA6Cj4gSGkgTmVpbCwKPiAKPiBPbiBNb24sIEphbiAyMSwgMjAxOSBhdCAxMTo0MCBBTSBO
ZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAx
OS8wMS8yMDE5IDIxOjUxLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+Pj4gSXQgdHVybnMg
b3V0IHRoYXQgSSdtIG5vdCBnb29kIGF0IHNwZWxsaW5nICJBUEIiLiBVbmZvcnR1bmF0ZWx5IGFu
IEFCUAo+Pj4gKGluc3RlYWQgb2YgQVBCKSB0eXBvIHNudWcgaW50byB0d28gY2xvY2tzIGluIHY1
LjAuCj4+Pgo+Pj4gQ3VycmVudGx5IHRoZXJlIGFyZSBubyB1c2VycyBvZiB0aGF0IGNsb2NrIHll
dCwgc28gZml4IGl0IG5vdwo+Pj4gYmVmb3JlIGl0J3MgdG9vIGxhdGUgKG1lYW5pbmcgYmVmb3Jl
IGl0J3MgdXNlZCBieSA8c29tZXRoaW5nPikuCj4+Pgo+Pj4gSSBkZWNpZGVkIHRvIGdvIHRoZSAi
bm9ybWFsIiByb3V0ZSB3aGVyZSB3ZSBjYW4gaGF2ZSBzZXBhcmF0ZQo+Pj4gYnJhbmNoZXMgZm9y
IHRoZSBkdC1iaW5kaW5ncyBhbmQgdGhlIGRyaXZlcnMgaW4gdGhlIGNsay1tZXNvbgo+Pj4gcmVw
by4gVGhpcyBtZWFuczoKPj4+IC0gbmV3ICh0eXBvLWZyZWUpIGNsb2NrICNkZWZpbmUKPj4+IC0g
Y2hhbmdlIHRoZSBjbG9jayBjb250cm9sbGVyIHRvIHVzZSB0aGUgbmV3ICNkZWZpbmUKPj4+IC0g
KG5leHQgZGV2ZWxvcG1lbnQgY3ljbGUpIGRyb3AgdGhlIG9sZCAjZGVmaW5lCj4+Pgo+Pj4KPj4+
IENoYW5nZXMgc2luY2UgdjEgYXQgWzBdOgo+Pj4gLSBzcGxpdCBpbnRvIGEgZHQtYmluZGluZ3Mg
YW5kIGNsb2NrIGNvbnRyb2xsZXIgZHJpdmVyIHBhdGNoCj4+Pgo+Pj4KPj4+IFswXSBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzEwNzQyMDAxLwo+Pj4KPj4+Cj4+PiBNYXJ0aW4g
Qmx1bWVuc3RpbmdsICgyKToKPj4+ICAgZHQtYmluZGluZ3M6IGNsb2NrOiBtZXNvbjhiOiBhZGQg
QVBCIGNsb2NrIGRlZmluaXRpb24KPj4+ICAgY2xrOiBtZXNvbjogbWVzb244YjogZml4IHRoZSBu
YW1pbmcgb2YgdGhlIEFQQiBjbG9ja3MKPj4+Cj4+PiAgZHJpdmVycy9jbGsvbWVzb24vbWVzb244
Yi5jICAgICAgICAgICAgICB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+Pj4gIGRyaXZl
cnMvY2xrL21lc29uL21lc29uOGIuaCAgICAgICAgICAgICAgfCAgMiArLQo+Pj4gIGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svbWVzb244Yi1jbGtjLmggfCAgMSArCj4+PiAgMyBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPj4+Cj4+Cj4+IE9uY2Ugcm9i
IGFja3MgaXQsIEknbGwgYXBwbHkgYm90aCB0byBuZXh0L2RyaXZlcnMgc2luY2UgaXQncyBub3Qg
dXNlZCAoeWV0ID8pCj4+IGFuZCBub3QgYSBjcml0aWNhbCBmaXguCj4gSSBoYXZlIGp1c3Qgbm90
aWNlZCB0aGF0IEkgZm9yZ290IHRvIENDIFJvYiBhbmQgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcuCj4gZG8geW91IHdhbnQgbWUgdG8gcmUtc2VuZCB0aGlzIHNlcmllcz8KClllcyBwbGVhc2Ug
cmUtc2VuZCAhCgpOZWlsCgo+IAo+IGFzIHlvdSBhbHJlYWR5IG5vdGljZWQgdGhpcyBpcyBub3Qg
Y3JpdGljYWwsIHNvIHRha2luZyB0aGlzIHRocm91Z2gKPiBuZXh0L2RyaXZlcnMgaXMgZmluZSBm
b3IgbWUuCj4gCj4gCj4gUmVnYXJkcwo+IE1hcnRpbgo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
