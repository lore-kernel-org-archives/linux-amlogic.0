Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B8EC001B3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 08:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i02JPRR2x4fJzYFBCrCnTeYT4pGFPOhaavCrLxv4vvQ=; b=ymKvgo1d5cE/xg
	7jNBLhvdRhTMGE9zmbVX17idUZatV5PVJgpAUs4xxfs46O+eDcCgMJO5zKHk4Rfk6rs+UuR0c0ROO
	h8hJhKCYZotvR5gmZg58mSTBfKCP2ox0Y5CawY5kJrAhDI8b/V9zpMZ5udZrGrEa8BYe3mgw6rWBS
	Yv769LY4a9LwAu29GhsWlWHhF40bOhznulDddO3O4ONzQqIZ0IHPtzOIl2IS34c9wOR4sOQudVhTC
	1dXW1LSzTUY07r0SXxdbN/0KHfUWbwHZK0RFUFuQcuYUncaExri/ANPhD04/AsRxuRR4YZXlcuX2M
	ZWvhTvPSpcWhFK9kXIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4Q4-00CbzM-0C;
	Tue, 27 Jun 2023 08:51:28 +0000
Received: from mail-yw1-f169.google.com ([209.85.128.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4Pz-00CbyE-3A;
	Tue, 27 Jun 2023 08:51:26 +0000
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5700b15c12fso44889977b3.1;
        Tue, 27 Jun 2023 01:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687855882; x=1690447882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xP6wkKdVTdDwoYQc7PHGzeZpIcm2xdCM8uEJq+8Vkio=;
        b=HzaEt3TzylvJvD709raQu0TrxZu5JhYP0iIskWX5NoMi9Wfw8GRBIyA0hTiHjNSJnl
         6ifCWIwtUVkGtC5IcAUALtSwz4AD+yan5m8PHsR1TR8R+IYyeMk/In1f3AFs30dgifE3
         pdDDNqQmsoHrH/T601oP3XgBIi6sz7eyo6AykBDLzWUPIb6QrDQVLS8ainEr2Zof6L8e
         +mHBp0RGBohPYG85c4h7EiyGykeMAPZP0pq8A+0rr3BVVHO7JdtSozSxbNqPBDhGaFMr
         9LN0VBQNO+luHjFqgq8yI1wiRSyMZAW1n2fNOLEVF7VazSm2r1YPgX1Ge9UBBT9TnIKB
         +Xzg==
X-Gm-Message-State: AC+VfDwkt0/Yv/mUCu/VRTRhnJk0eFHt+v+ZVx3P/RgApLgjgDi72G6i
	UAhJ9JQQRHgxfzlzxPlnL/2W7fkZaY91Gyyo
X-Google-Smtp-Source: ACHHUZ4n0r9m34CmGPtVpaPQGVr8kUCnmvEUg9MJdOJt1HEzFKRZyLSjuGL/jUS6WdOaGPOOmcaM3Q==
X-Received: by 2002:a81:5211:0:b0:570:88a8:9862 with SMTP id g17-20020a815211000000b0057088a89862mr32707187ywb.38.1687855881880;
        Tue, 27 Jun 2023 01:51:21 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id k63-20020a0dc842000000b0056cd3e598d8sm1715544ywd.114.2023.06.27.01.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 01:51:21 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-bd6d9d7da35so4403908276.0;
        Tue, 27 Jun 2023 01:51:21 -0700 (PDT)
X-Received: by 2002:a25:29c6:0:b0:c1b:2fab:b802 with SMTP id
 p189-20020a2529c6000000b00c1b2fabb802mr6022656ybp.17.1687855881181; Tue, 27
 Jun 2023 01:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230623081242.109131-1-tanure@linux.com> <20230623081242.109131-3-tanure@linux.com>
 <a885b97e-aaf0-cb72-f25b-71054d6d3fe2@linaro.org> <CAJX_Q+2qZg+RuwxmnM3rzs_akt_UMJRx+=aMxf72P-sGNjm9uw@mail.gmail.com>
 <4fba1603-5741-ec1b-122f-d6a92803f49a@linaro.org>
In-Reply-To: <4fba1603-5741-ec1b-122f-d6a92803f49a@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 27 Jun 2023 09:51:09 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3GX5NEtx7DA-vapU45dVooTpXxrwUZsNVAKd9JN2kKXA@mail.gmail.com>
Message-ID: <CAJX_Q+3GX5NEtx7DA-vapU45dVooTpXxrwUZsNVAKd9JN2kKXA@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_015124_016325_49A2645A 
X-CRM114-Status: GOOD (  30.83  )
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

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgNjo1NuKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMy8wNi8yMDIzIDE5
OjUzLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAyMywgMjAyMyBhdCA5OjUx
4oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo+ID4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJv
Lm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiAyMy8wNi8yMDIzIDEwOjEyLCBMdWNhcyBUYW51cmUg
d3JvdGU6Cj4gPj4+IEFtbG9naWMgVDcgU29DcyB1c2VzIHRoZSBzYW1lIFVBUlQgY29udHJvbGxl
ciBhcyBTNCBTb0NzIGFuZCBHMTJBLgo+ID4+PiBUaGVyZSBpcyBubyBuZWVkIGZvciBhbiBleHRy
YSBjb21wYXRpYmxlIGxpbmUgaW4gdGhlIGRyaXZlciwgYnV0Cj4gPj4+IGFkZCBUNyBjb21wYXRp
YmxlIGxpbmUgZm9yIGRvY3VtZW50YXRpb24uCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEx1
Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgICAgICAgIHwgNCAr
KysrCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPj4+Cj4gPj4+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9n
aWMsbWVzb24tdWFydC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4+PiBpbmRleCAwMWVjNDViM2I0MDYuLmFk
OTcwYzllZDFjNyAxMDA2NDQKPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1s
Cj4gPj4+IEBAIC01MCw2ICs1MCwxMCBAQCBwcm9wZXJ0aWVzOgo+ID4+PiAgICAgICAgICBpdGVt
czoKPiA+Pj4gICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWcxMmEtdWFydAo+ID4+
PiAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tZ3gtdWFydAo+ID4+PiArICAgICAg
LSBkZXNjcmlwdGlvbjogVUFSVCBjb250cm9sbGVyIG9uIFQ3IGNvbXBhdGlibGUgU29Dcwo+ID4+
Cj4gPj4gWW91ciBkZXNjcmlwdGlvbiBpcyByYXRoZXIgaW5jb3JyZWN0LiBUaGlzIGlzIFVBUlQg
b24gU29DcyBjb21wYXRpYmxlCj4gPj4gd2l0aCBTNCwgbm90IHdpdGggVDcuIE90aGVyd2lzZSB3
aGF0IGRvIHlvdSBleHBlY3QgdG8gZ3JvdyBsYXRlciB3aGVuCj4gPj4gYWRkaW5nIG1vcmUgY29t
cGF0aWJsZSBkZXZpY2VzPyBKdXN0IGRyb3AgdGhlIGRlc2NyaXB0aW9uLCBpdCdzIGtpbmQgb2YK
PiA+PiBvYnZpb3VzIHdoZW4gZG9uZSBjb3JyZWN0bHkgKGJ1dCBjYW4gYmUgbWlzbGVhZGluZyBp
ZiBkb25lIHdyb25nKS4KPiA+Pgo+ID4+IEFja2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gPj4KPiA+IFNvcnJ5LCBidXQgUzQgaXMg
YWxyZWFkeSBhZGRlZCBpbiBhbm90aGVyIHdheSwgd2hpY2ggYWNjZXB0cyBqdXN0IGFuCj4gPiBT
NCBjb21wYXRpYmxlIHN0cmluZy4KPiA+IEJ1dCBmb3IgVDcgd2UgbmVlZCBhIGZhbGxiYWNrLgo+
ID4gQ291bGQgeW91IGxldCBtZSBrbm93IHdoYXQgeW91J3JlIGFza2luZyBoZXJlPyBSZWRvIFM0
IGFuZCBhZGQgVDc/IE9yCj4gPiBkbyBUNyBpbiBhbm90aGVyIGRpZmZlcmVudCB3YXkgdGhhdCBJ
IGRpZG4ndCBnZXQ/Cj4KPiBJIGNvbW1lbnQgb25seSBhYm91dCB0aGUgZGVzY3JpcHRpb24sIHNv
IHdoeSB0b3VjaGluZyBhbnl0aGluZyBlbHNlPyBZb3UKPiBkaWQgbm90IGFkZCBoZXJlIFQ3IGNv
bXBhdGlibGUgU29Dcy4gWW91IGFkZGVkIGhlcmUgUzQgY29tcGF0aWJsZSBTb0NzLgo+Cj4gPiBE
byB5b3Ugd2FudCBhIHY2IHBhdGNoIHNlcmllcz8gSWYgeWVzLCBjb3VsZCB5b3UgYmUgbW9yZSBj
bGVhciBhYm91dAo+ID4gaG93IHlvdSB3YW50IGl0Pwo+Cj4gTm8gbmVlZC4gSWYgeW91IGFyZSBn
b2luZyB0byBzZW5kIHY2LCB5b3UgY2FuIGFzIHdlbGwgZHJvcCB0aGUgZGVzY3JpcHRpb24uCj4K
SSBjYW4ndCBqdXN0IHJlbW92ZSB0aGF0IGxpbmUsIGFzIGl0IGRvZXNuJ3QgcGFzcyB0aGUgY2hl
Y2tzLgpJIHdpbGwgY2hhbmdlIGl0IHRvIFM0LgoKPgo+IC0tLQo+Cj4gVGhpcyBpcyBhbiBhdXRv
bWF0ZWQgaW5zdHJ1Y3Rpb24sIGp1c3QgaW4gY2FzZSwgYmVjYXVzZSBtYW55IHJldmlldyB0YWdz
Cj4gYXJlIGJlaW5nIGlnbm9yZWQuIElmIHlvdSBkbyBub3Qga25vdyB0aGUgcHJvY2VzcywgaGVy
ZSBpcyBhIHNob3J0Cj4gZXhwbGFuYXRpb246Cj4KPiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmll
d2VkLWJ5L1Rlc3RlZC1ieSB0YWdzIHdoZW4gcG9zdGluZyBuZXcKPiB2ZXJzaW9ucywgdW5kZXIg
b3IgYWJvdmUgeW91ciBTaWduZWQtb2ZmLWJ5IHRhZy4gVG9vbHMgbGlrZSBiNCBjYW4gaGVscAo+
IGhlcmUuIEhvd2V2ZXIsIHRoZXJlJ3Mgbm8gbmVlZCB0byByZXBvc3QgcGF0Y2hlcyAqb25seSog
dG8gYWRkIHRoZSB0YWdzLgo+IFRoZSB1cHN0cmVhbSBtYWludGFpbmVyIHdpbGwgZG8gdGhhdCBm
b3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbgo+IHRoZXkgYXBwbHkuCj4KPiBodHRwczov
L2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xNy9zb3VyY2UvRG9jdW1lbnRhdGlvbi9wcm9j
ZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDU0MAo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlz
enRvZgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
