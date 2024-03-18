Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D82C54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 15:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYsUnJ1Cz6f/t8FlS0cNaJUUxy2Ueo4IY65ZJ654BIA=; b=IGvMCwSvzmbPFG
	98dwHpjd62u9SiaIMEuze7hPtG/JyTZ5/BfwTDSP7J2+2HnMluXy3u3dfRElYYmeikgYNIEe+RnmG
	C+ahHFlvZ/5CkIL3lvN8dkXYFv1K9FN9oGPljrvbWtShOAM0vajxCDgouaeUyyChl4Y0LdyPpovlH
	hb+lX2Oa7zJnV3eMOt7P/80t4Fwxc7GkdoUIJb/L5dMm5Dgd6TZjVqZmcEDDq2hoJdxqD+eTd8YBh
	4BYJFtfc+gPNKS5d0I1zjX7/vNBgQ+FFi8DCeZj2NRYm3KqhyPVzrnhRait7Q4fF5cIeUDOhpCnEM
	Y6N8O5Xkv32IdwSoOIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmETk-00000008tbh-1oru;
	Mon, 18 Mar 2024 15:00:44 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmETY-00000008tTq-1xQd;
	Mon, 18 Mar 2024 15:00:33 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609fb19ae76so47584447b3.2;
        Mon, 18 Mar 2024 08:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710774030; x=1711378830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXPz6+0togvKFnM43qr9sOSa8N0BWel3JsRydDrzDrc=;
        b=nK+/o25gR3R9NKQPuc6/RUbSgAiaiVXYT3cezA17xbwvab0IH/vaCTyaqjgtmqJuom
         fkgGFc9RgV0oYqZCNnKymhxkwID1DhBMDY75vAEr7ae5wj3JdeWdrppi5uU+dLI1ZQIW
         J0tOqj7RaGH/tkGPxl0/D8H5AJK53YiFFjOPv8a+bW9kuay0kVdzuH+tbjHdu49jUY3g
         fQs+L2So0nWjKYVHX1Xx7rndDoiw891J0yvK2zXLq7ELKX/zzEovPils+yUgFqNy47m2
         EUjZ+HPkn+NiwP41Qqm2uEW+jti7BKQ54xRCPXbbjK9tXpVJCr6MAnPJSdxGQN69yIEq
         jOqA==
X-Forwarded-Encrypted: i=1; AJvYcCXjEnSLGEsCnBSiEXstXszbKYmRin1ZhnfRbNTEIRSWlTDOSgzykUem2jifJHT7MkfKI7c5029tH/5n3q3GxEVmcIaOBQmwF70PrjihuSQjmszoR+QL8/S3g7c2tAWkDBZYE4xW7caSBN1S6zAUiCXm3zfNBEepdQ==
X-Gm-Message-State: AOJu0Yy+W+WMVGpiZf1i9WhYjj7m74CQNOB3sgwIa48sz/0WS4jjdC/R
	YriwDQf9AorLWxzme9K9q2xox39H6eiErPaxxX4k+RkOwUuc2yzWtHsMZyKoW6Cs9A==
X-Google-Smtp-Source: AGHT+IFnMclfxLgeYd6GAGsdLsncAN6OAewJ2wU1USZV3HhOVMTciO5JmlIy7QQwXL8/DIcLG3WU3A==
X-Received: by 2002:a81:9253:0:b0:608:e694:ffcd with SMTP id j80-20020a819253000000b00608e694ffcdmr11271535ywg.43.1710774030287;
        Mon, 18 Mar 2024 08:00:30 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id ex8-20020a05690c2fc800b00609efea8f69sm1876258ywb.105.2024.03.18.08.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 08:00:30 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dcc71031680so3878239276.2;
        Mon, 18 Mar 2024 08:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUfNTiF/9LzTUYaJYmzvMF4GtawY739dGtoeLCQYcxY+lFh7qhKFOV+FTziaKedN2UglhKYPzc7df8xjj8VCZHwe57ryS5UJbRA8oivlxHMgpGKPXVXI2L1GgY2qHfh5jSt3NbZrJGHvs9ArMMNDpm4G7KZsoa7g==
X-Received: by 2002:a05:6902:389:b0:dc7:4b43:db3f with SMTP id
 f9-20020a056902038900b00dc74b43db3fmr7205706ybs.21.1710774029683; Mon, 18 Mar
 2024 08:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240318114346.112935-1-tanure@linux.com> <20240318114346.112935-2-tanure@linux.com>
 <20240318145423.GA3993342-robh@kernel.org>
In-Reply-To: <20240318145423.GA3993342-robh@kernel.org>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 18 Mar 2024 15:00:17 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+26Of3uwKMufDrngj5ciioqt0ne8gXD-jdmEdWTs4Ag+g@mail.gmail.com>
Message-ID: <CAJX_Q+26Of3uwKMufDrngj5ciioqt0ne8gXD-jdmEdWTs4Ag+g@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] clk: meson: T7: add support for Amlogic T7 SoC
 PLL clock driver
To: Rob Herring <robh@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_080032_560994_B00D1066 
X-CRM114-Status: GOOD (  21.22  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTgsIDIwMjQgYXQgMjo1NOKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMTgsIDIwMjQgYXQgMTE6NDM6NDVBTSArMDAw
MCwgTHVjYXMgVGFudXJlIHdyb3RlOgo+ID4gQWRkIHRoZSBUNyBQTEwgY2xvY2sgY29udHJvbGxl
ciBkcml2ZXIgaW4gdGhlIFQ3IFNvQyBmYW1pbHkuCj4gPgo+ID4gVGhpcyBpcyBSRkMgcGF0Y2gg
dGhhdCBlbmFibGVzIFNEQ2FyZCwgRXRoZXJuZXQgYW5kIENsb2NraW5nCj4gPiBmb3IgQW1sb2dp
YyBUNyBzb2MuCj4gPiBJbiB0aGlzIGN1cnJlbnQgc3RhdGUgdGhlIHBhdGNoIGRvZXNuJ3Qgd29y
ayBhbmQgZ2l2ZXMgYSBrZXJuZWwKPiA+IHBhbmljIHdoZW4gcHJvYmluZyB0aGUgbWVzb24tYXhn
LW1tYyBmb3IgdGhlIFNEQ2FyZC4KPiA+IERPIE5PVCBNRVJHRS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJz
L2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgIDI1ICsKPiA+ICBkcml2
ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgICAyICsKPiA+ICBk
cml2ZXJzL2Nsay9tZXNvbi90Ny1wZXJpcGhlcmFscy5jICAgICAgICAgICAgfCA2MzY4ICsrKysr
KysrKysrKysrKysrCj4gPiAgZHJpdmVycy9jbGsvbWVzb24vdDctcGVyaXBoZXJhbHMuaCAgICAg
ICAgICAgIHwgIDEzMSArCj4gPiAgZHJpdmVycy9jbGsvbWVzb24vdDctcGxsLmMgICAgICAgICAg
ICAgICAgICAgIHwgMTU0MyArKysrCj4gPiAgZHJpdmVycy9jbGsvbWVzb24vdDctcGxsLmggICAg
ICAgICAgICAgICAgICAgIHwgICA4MyArCj4gPiAgLi4uL2Nsb2NrL2FtbG9naWMsdDctcGVyaXBo
ZXJhbHMtY2xrYy5oICAgICAgIHwgIDQxMCArKwo+ID4gIC4uLi9kdC1iaW5kaW5ncy9jbG9jay9h
bWxvZ2ljLHQ3LXBsbC1jbGtjLmggICB8ICAgNjkgKwo+ID4gIDggZmlsZXMgY2hhbmdlZCwgODYz
MSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lc29u
L3Q3LXBlcmlwaGVyYWxzLmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVz
b24vdDctcGVyaXBoZXJhbHMuaAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9t
ZXNvbi90Ny1wbGwuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZXNvbi90
Ny1wbGwuaAo+Cj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xv
Y2svYW1sb2dpYyx0Ny1wZXJpcGhlcmFscy1jbGtjLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
aW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLHQ3LXBsbC1jbGtjLmgKPgo+IEknbSBh
c3N1bWluZyBzaW5jZSB0aGlzIGlzIGFuIFJGQyB5b3Uga25vdyB0aGVzZSBnbyBpbiBhIHNlcGFy
YXRlIHBhdGNoCj4gd2l0aCB0aGUgRFQgYmluZGluZyBzY2hlbWEgd2hpY2ggaXMgbWlzc2luZy4K
Pgo+IFJvYgoKWWVzLCBUaGlzIHdvdWxkIGJlIGEgZmV3IHBhdGNoZXMgYXQgbGVhc3QuIFRoZSB0
aGluZyByaWdodCBub3cgaXMgdG8KZ2V0IGl0IHRvIHdvcmsuCkkgdGhpbmsgc29tZSBvYnNjdXJl
IHRoaW5nIGlzIG1pc3Npbmcgd2hlbiBzZXR0aW5nIHVwIHRoZXNlIGNsb2NrcywKYW5kIG9ubHkg
QW1sb2dpYyBrbm93cy4KCkFmdGVyIEkgaGF2ZSBhIHdvcmtpbmcgZHJpdmVyLCBJIHdpbGwgc3Vi
bWl0IGEgcHJvcGVyIHBhdGNoIHNlcmllcwp3aXRoIGRvY3VtZW50YXRpb24gZm9yIHRoZSBkcml2
ZXJzIGFuZCBkZXZpY2UgdHJlZXMuCgpUaGFua3MKTHVjYXMgVGFudXJlCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
