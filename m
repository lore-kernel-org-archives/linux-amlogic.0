Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3A3C83F10
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Aug 2023 02:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmHgbox0DaJs5BwPRRpYU6lrpQhWOcBp6PxqGJneTJg=; b=2WRHWTFgbs7MDq
	EtuN2F4rHmPPcVn+rT0d217dbjxEkzZ+zPmkZfAt6v85fnwBlS9xYyP+qEnzkVYuMknlWYD2227Tw
	dlOG67SwJCDwCJlIfJsXb42CslI3jlT8c/YE13fDq9VcliuVEectDnOhVxkbV66Bh0IJzN9Z1AxFN
	w1oeDzzWzaH39Tc7eaDHVPrAfWvfuNj5X4t48Hyb2My/mdK6GvXSMf1jC9lkzuqsJWiCYCPeigQH3
	PKpLtxo9wq9st+gay49TcEvvCpObu02ws192YG4Q8wHsznvbIfzFaH8arePu9kGec29wC2NKEcuR3
	EaMCKaZj7eBHLFvfXgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaRwW-008jvb-08;
	Mon, 28 Aug 2023 02:25:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaRwT-008jud-1G;
	Mon, 28 Aug 2023 02:25:26 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5298e43bb67so5695834a12.1;
        Sun, 27 Aug 2023 19:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693189521; x=1693794321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uCqSe5BtqveCUXWZraiTGYO03+jzgwg7ae/wj5X+p4=;
        b=Rs3o3lwnQlpCEgSLIhsuXQgDmYUY4nedQrR0H5FZ8oTW0MZRjTIwXBAPZ+XJu3G+TE
         5KjGSKsVuufTscOJKZYMJ0KS9kzz7Xyep4wKl3+TVKixZzHm9nNNmppNSYgB6pYYp8wo
         2RELcBP24h5WR7o6jlsDO44dmgK9Rx1V/rHeb5kqpg0aMZd+1c1fYnPO/kg2TIDgRiRO
         F6FsxT3p+yiDRZpYEihMKhJw4/CBMdGfU1djfnZwE5niVYTe2vjJramAzelc7971T3gV
         Ybsa3YcfCZr8kK6KmUBRZmdwfO/lSvmWuPcvibJK6pARqe0eHe8I8aasMcaQku+BGBpB
         lOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693189521; x=1693794321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uCqSe5BtqveCUXWZraiTGYO03+jzgwg7ae/wj5X+p4=;
        b=QhVpGkcLN4kUUMXjX4i5Bu1J4och6WjEm7FAwkEtUEU9VouNuO6q8o2L+fmXWtAFsu
         JQbnFMwtjB6oX165Qd3WQu0EwUPd72Z6bEAfDf90uWO/sohOVdehXQLBTN17bj3V9YTE
         tNYdAEQu7RP/QZ+4RBwOBKA8r5I3FYJrlUncoi5/G8dyelIlZ1GfUEG6+PW8+oouhbiv
         UuTzKF3BpVRr2Z8g4YDFm/it1Hf/SPkKXQ2QDxnQZpYYFk0XFCJCtro+kNBXsw9maSiP
         ySKz9ep/TGNaOD10pvW+2920Xt0dMoXTlsf27JLEykV2XDzzrr3Z6E5Wv2oT8BQhVxTy
         REzw==
X-Gm-Message-State: AOJu0YyV0iePOi1PuKQBUwyJFbNLQFHC/DxFtAl1Z55cYAN4ZFcplu6L
	QTId5v0nNhdz9lFQ5CslkHlzmX0iQIpxFU4lFYQ=
X-Google-Smtp-Source: AGHT+IFjV4c6iPT2oORQcm92nmX2L7ZxJD/Ip41JWUNWiITPNAyX6af0+kocn3phLX4sb40+kQJXCmdDRW8aRdq8dR4=
X-Received: by 2002:a05:6402:d56:b0:525:4d74:be8c with SMTP id
 ec22-20020a0564020d5600b005254d74be8cmr21355835edb.14.1693189521348; Sun, 27
 Aug 2023 19:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230822082750.27633-1-yu.tu@amlogic.com> <70b3ba82-0920-4613-9480-919a3df6833c@linux.com>
In-Reply-To: <70b3ba82-0920-4613-9480-919a3df6833c@linux.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 28 Aug 2023 10:24:45 +0800
Message-ID: <CAJhJPsWASjw-QiTocaJZCF5HYHUnF7xVf-o7Ohj0Mgjq0OpsLA@mail.gmail.com>
Subject: Re: [PATCH V10 0/4] Add S4 SoC PLLs and Peripheral clock
To: Lucas Tanure <tanure@linux.com>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, kelvin.zhang@amlogic.com, 
	qi.duan@amlogic.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_192525_455375_23B314CF 
X-CRM114-Status: GOOD (  16.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMTozNOKAr0FNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMi0wOC0yMDIzIDA5OjI3LCBZdSBUdSB3cm90ZToKPiA+
IDEuIEFkZCBTNCBTb0MgUExMcyBhbmQgUGVyaXBoZXJhbCBjbG9jayBjb250cm9sbGVyIGR0LWJp
bmRpbmdzLgo+ID4gMi4gQWRkIFBMTHMgYW5kIFBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxlciBk
cml2ZXIgZm9yIFM0IFNPQy4KPiA+Cj4gPgo+ID4gWXUgVHUgKDQpOgo+ID4gICAgZHQtYmluZGlu
Z3M6IGNsb2NrOiBkb2N1bWVudCBBbWxvZ2ljIFM0IFNvQyBQTEwgY2xvY2sgY29udHJvbGxlcgo+
ID4gICAgZHQtYmluZGluZ3M6IGNsb2NrOiBkb2N1bWVudCBBbWxvZ2ljIFM0IFNvQyBwZXJpcGhl
cmFscyBjbG9jawo+ID4gICAgICBjb250cm9sbGVyCj4gPiAgICBjbGs6IG1lc29uOiBTNDogYWRk
IHN1cHBvcnQgZm9yIEFtbG9naWMgUzQgU29DIFBMTCBjbG9jayBkcml2ZXIKPiA+ICAgIGNsazog
bWVzb246IFM0OiBhZGQgc3VwcG9ydCBmb3IgQW1sb2dpYyBTNCBTb0MgcGVyaXBoZXJhbCBjbG9j
awo+ID4gICAgICBjb250cm9sbGVyCj4gPgo+ID4gVjkgLT4gVjEwOgo+ID4gMS4gQ2hhbmdlIHRo
ZSByZWxldmFudCBTNCBDTEsgcGF0Y2ggYmFzZWQgb24gTmVpbCdzIHJlY2VudGx5IG1vZGlmaWVk
Cj4gPiBwYXRjaC4KPiA+IDIuIENoYW5nZSBwYXRjaCAwMDAzLzAwMDQgY2xvY2tzIGNvbW1lbnQs
IGZvcm1hdCBhbmQgY2xvY2sgZmxhZ3Mgc3VnZ2VzdGVkCj4gPiBieSBKZXJvbWUuCj4gPgo+ID4g
VjggLT4gVjk6IEFkZCBwYXRjaCAwMDAxLzAwMDIgZHQtYmluZGluZ3MgdGFnLiBTdWdnZXN0ZWQg
YnkgS3J6eXN6dG9mLgo+ID4gVjcgLT4gVjg6Cj4gPiAxLiBDaGFuZ2UgcGF0Y2ggMDAwMS8wMDAy
IGR0LWJpbmRpbmdzIHRpdGxlIGRlc2NyaXB0aW9uLCByZW1vdmUgIm1lc29uIi4KPiA+IFN1Z2dl
c3RlZCBieSBEbWl0cnksIE5laWwuCj4gPiAyLiBDaGFuZ2UgcGF0Y2ggMDAwMy8wMDA0IGNsb2Nr
cyBjb21tZW50LCBmb3JtYXQgYW5kIGNsb2NrIGZsYWdzIHN1Z2dlc3RlZCBieQo+ID4gRG1pdHJ5
LCBOZWlsLCBKZXJvbWUuCj4gPgo+ID4gVjYgLT4gVjc6IENoYW5nZSBzZW5kIHBhdGNoIHNlcmll
cyBhcyB3ZWxsIGNoYW5nZSBmb3JtYXQgYW5kIGNsb2NrIGZsYWdzCj4gPiBzdWdnZXN0ZWQgYnkg
SmVyb21lLiBDaGFuZ2UgZHQtYmluZGluZ3Mgc3VnZ2VzdGVkIGJ5IEtyenlzenRvZi4KPiA+IFY1
IC0+IFY2OiBDaGFuZ2Ugc2VuZCBwYXRjaCBzZXJpZXMsIGFzIHdlbGwgY2hhbmdlIGZvcm1hdCBh
bmQgY2xvY2sgZmxhZ3MuCj4gPiBWNCAtPiBWNTogY2hhbmdlIGZvcm1hdCBhbmQgY2xvY2sgZmxh
Z3MgYW5kIGFkanVzdCB0aGUgcGF0Y2ggc2VyaWVzCj4gPiBhcyBzdWdnZXN0ZWQgYnkgSmVyb21l
Lgo+ID4gVjMgLT4gVjQ6IGNoYW5nZSBmb3JtYXQgYW5kIGNsb2NrIGZsYWdzLgo+ID4gVjIgLT4g
VjM6IFVzZSB0d28gY2xvY2sgY29udHJvbGxlci4KPiA+IFYxIC0+IFYyOiBDaGFuZ2UgZm9ybWF0
IGFzIGRpc2N1c3NlZCBpbiB0aGUgZW1haWwuCj4gPgo+ID4gTGluazpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjMwNTE3MDcwMjE1LjI4NDYzLTEteXUudHVAYW1sb2dp
Yy5jb20vCj4gPgo+ID4gICAuLi4vY2xvY2svYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1jbGtjLnlh
bWwgICAgfCAgIDk2ICsKPiA+ICAgLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNs
a2MueWFtbCAgIHwgICA0OSArCj4gPiAgIGRyaXZlcnMvY2xrL21lc29uL0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICB8ICAgMjMgKwo+ID4gICBkcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgfCAgICAyICsKPiA+ICAgZHJpdmVycy9jbGsvbWVzb24vczQtcGVy
aXBoZXJhbHMuYyAgICAgICAgICAgIHwgMzc4NyArKysrKysrKysrKysrKysrKwo+ID4gICBkcml2
ZXJzL2Nsay9tZXNvbi9zNC1wZXJpcGhlcmFscy5oICAgICAgICAgICAgfCAgIDU3ICsKPiA+ICAg
ZHJpdmVycy9jbGsvbWVzb24vczQtcGxsLmMgICAgICAgICAgICAgICAgICAgIHwgIDg2NyArKysr
Cj4gPiAgIGRyaXZlcnMvY2xrL21lc29uL3M0LXBsbC5oICAgICAgICAgICAgICAgICAgICB8ICAg
MzggKwo+ID4gICAuLi4vY2xvY2svYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1jbGtjLmggICAgICAg
fCAgMjM2ICsKPiA+ICAgLi4uL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMsczQtcGxsLWNsa2Mu
aCAgIHwgICA0MyArCj4gPiAgIDEwIGZpbGVzIGNoYW5nZWQsIDUxOTggaW5zZXJ0aW9ucygrKQo+
ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nsb2NrL2FtbG9naWMsczQtcGVyaXBoZXJhbHMtY2xrYy55YW1sCj4gPiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svYW1sb2dpYyxz
NC1wbGwtY2xrYy55YW1sCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNv
bi9zNC1wZXJpcGhlcmFscy5jCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9t
ZXNvbi9zNC1wZXJpcGhlcmFscy5oCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Ns
ay9tZXNvbi9zNC1wbGwuYwo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVz
b24vczQtcGxsLmgKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3Mv
Y2xvY2svYW1sb2dpYyxzNC1wZXJpcGhlcmFscy1jbGtjLmgKPiA+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxzNC1wbGwtY2xrYy5oCj4gPgo+
ID4KPiA+IGJhc2UtY29tbWl0OiBiZDBmNmM1N2MyYjMyNGI2ZjkyY2NmZTEzYTgwMDVmZjgyOTI4
N2I4Cj4gSG93IHNpbWlsYXIgaXMgVDcgYW5kIFM0IHJlZ2FyZGluZyB0aGUgY2xvY2tzPwo+IENh
biBTNCBjbG9jayBkcml2ZXIgYmUgdXNlZCBieSBUNyB3aXRob3V0IG1vZGlmaWNhdGlvbnM/Cj4K
VW5mb3J0dW5hdGVseSBub3QuCkJ1dCBkb24ndCB3b3JyeSEgVGhlIFQ3IGNsb2NrIGRyaXZlciBp
cyBjb21pbmcgc29vbi4KCj4gVGhhbmtzCj4gTHVjYXMKCgoKLS0gCkJlc3QgcmVnYXJkcywKCktl
Z3VhbmcgWmhhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
