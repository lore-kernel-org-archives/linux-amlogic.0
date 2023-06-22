Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976FDEB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 08:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56S0lsvfUfgRBgf6YsHmznVEdUB/ar7QkzvjFjnmEec=; b=n0OOrJ2Xxo4ep0
	mqKhnCVWpORy3Jg7wxJAOMxB+QU228wJp2WjQAgD3MmFyA3eBVZlFhb754rfp/2Ep9SDpUCewIunw
	K/rOJkEv8jx9qrpEzU1LLUHkKO1ZOxfBZnYJmojuE/e/XmwUwMnVOPw6WzOeUFYLiHGO2nl37vym5
	uMGzH4CRR9a8yp1sjriu5l06eoPGqzYxj4NqXYCNrBAlSBXlYsNWcb3rnVzZWXhihKVCskAq1hei7
	tM3OLJgsmUgaiVK4XM8Zv5WOAzYiapv55icj8Hsdz8pCVIcDppkXqVHo5SCLES4/k5SYecVrmHunP
	H4m2rO8a9D3zzpv5uxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFdy-00HPeg-2e;
	Thu, 22 Jun 2023 08:26:18 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFdw-00HPdK-17;
	Thu, 22 Jun 2023 08:26:18 +0000
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bad0c4f6f50so583969276.1;
        Thu, 22 Jun 2023 01:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687422375; x=1690014375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JD5wRAEZM58Yir8EBgxb+4GGarUcKUmd8dxXVjzMK/E=;
        b=QrAeY8c6A5F/2d5P4r1aBq1Qwv4cFZScn93cr75thMX7pa6HxGC5/JKfJH2T7iz3R9
         1+knPBaOTq8usXInep6BejXVkRDTKBaCoSsnToTSyscljWcWVvrbKEEjIMxznS2X5Gmb
         M3MR+CkoQbaFoeaFw9844d7bCCYbbw1BneppENTdocf75vRxVlvQ1wWxOTn82gHSxkjU
         0qRJftf++fC++cwvlolatTO2Rw7kA8+7KxGLRiwIEEPMjOALlBLKeABzDy+DdpAaxc1B
         o/xeLdaSbVnC6cBkbTVFVZiBYHJB7S2pnpucSH8E8yVvXGArn6ay9JT878bfwNe9K1lA
         UMSA==
X-Gm-Message-State: AC+VfDw87FDjKsI0McQWqUyv4V+W7VEJdFU79W3TRJFzyCWxz4/K7m3U
	SF9PukCCHN6ysbYZlxatE+DT2mfDrVEiLPvJ
X-Google-Smtp-Source: ACHHUZ5wQI/TzPrUjwqVg5G1/tl6GE3fslsZEb/p11tAjhumz9vsTRDSZSFJx4idXp5eosvpDcYd7w==
X-Received: by 2002:a25:8046:0:b0:ba7:4c49:95e with SMTP id a6-20020a258046000000b00ba74c49095emr17429036ybn.7.1687422374506;
        Thu, 22 Jun 2023 01:26:14 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id g2-20020a25db02000000b00bebeeacb19fsm1437929ybf.22.2023.06.22.01.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 01:26:14 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5707b429540so5825537b3.1;
        Thu, 22 Jun 2023 01:26:13 -0700 (PDT)
X-Received: by 2002:a0d:dd05:0:b0:56d:1a06:8ba0 with SMTP id
 g5-20020a0ddd05000000b0056d1a068ba0mr27215280ywe.9.1687422373700; Thu, 22 Jun
 2023 01:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230621133215.109254-1-tanure@linux.com> <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org> <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
 <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
 <e4c993e1-8409-1ec0-c1b2-175603052e46@linaro.org> <CAJX_Q+09WLqmnWwOL7QESEuDzwZvVVzbtg9Upd5j2LOAYs=vmA@mail.gmail.com>
 <20230622-hardhat-elitism-26f0d0df204f@wendy> <CAJX_Q+3+bdXd-NrsQymXerpWZuj3zb8CKHcZRNM_iLSZcp2Mfg@mail.gmail.com>
 <2fe41e89-9a26-e7ba-6ef6-2c9262bda43d@linaro.org>
In-Reply-To: <2fe41e89-9a26-e7ba-6ef6-2c9262bda43d@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 22 Jun 2023 09:26:02 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2Fc5sdp-0kHp99UEo_oiqTeO-LA95+Ak+aW0HMqDgtPw@mail.gmail.com>
Message-ID: <CAJX_Q+2Fc5sdp-0kHp99UEo_oiqTeO-LA95+Ak+aW0HMqDgtPw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: neil.armstrong@linaro.org
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, 
	Artem <art@khadas.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_012616_382143_D57C4D27 
X-CRM114-Status: GOOD (  36.31  )
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

T24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgOToxM+KAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDIyLzA2LzIwMjMgMDk6MzYsIEx1Y2Fz
IFRhbnVyZSB3cm90ZToKPiA+IE9uIFRodSwgSnVuIDIyLCAyMDIzIGF0IDg6MTLigK9BTSBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9u
IFRodSwgSnVuIDIyLCAyMDIzIGF0IDA3OjQzOjMxQU0gKzAxMDAsIEx1Y2FzIFRhbnVyZSB3cm90
ZToKPiA+Pj4gT24gVGh1LCBKdW4gMjIsIDIwMjMgYXQgNzowNeKAr0FNIEtyenlzenRvZiBLb3ps
b3dza2kKPiA+Pj4gPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4+
PiBPbiAyMi8wNi8yMDIzIDA3OjMyLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPj4+Pj4gT24gV2Vk
LCBKdW4gMjEsIDIwMjMgYXQgNzoxMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPj4+Pj4+IE9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDAzOjUzOjA0UE0gKzAy
MDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4+Pj4+PiBPbiAyMS8wNi8yMDIzIDE1
OjMyLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPj4+Pj4+Pj4gQW1sb2dpYyBUNyBTb0NzIHVzZXMg
dGhlIHNhbWUgVUFSVCBjb250cm9sbGVyIGFzIFM0IFNvQ3MgYW5kIEcxMkEuCj4gPj4+Pj4+Pj4g
VGhlcmUgaXMgbm8gbmVlZCBmb3IgYW4gZXh0cmEgY29tcGF0aWJsZSBsaW5lIGluIHRoZSBkcml2
ZXIsIGJ1dAo+ID4+Pj4+Pj4+IGFkZCBUNyBjb21wYXRpYmxlIGxpbmUgZm9yIGRvY3VtZW50YXRp
b24uCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBUYW51cmUgPHRh
bnVyZUBsaW51eC5jb20+Cj4gPj4+Pj4+Pj4gLS0tCj4gPj4+Pj4+Pj4gICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwgICAgICAgICAgfCAyICsr
Cj4gPj4+Pj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPj4+Pj4+Pj4K
PiA+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPiA+Pj4+Pj4+PiBpbmRl
eCAwMWVjNDViM2I0MDYuLjg2MGFiNThkODdiMCAxMDA2NDQKPiA+Pj4+Pj4+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55
YW1sCj4gPj4+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4+Pj4+Pj4+IEBAIC0zMyw2ICszMyw3IEBA
IHByb3BlcnRpZXM6Cj4gPj4+Pj4+Pj4gICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhi
LXVhcnQKPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4LXVhcnQK
PiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXM0LXVhcnQKPiA+Pj4+
Pj4+PiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tdDctdWFydAo+ID4+Pj4+Pj4+ICAg
ICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tYW8tdWFydAo+ID4+Pj4+Pj4+ICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogQWx3YXlzLW9uIHBvd2VyIGRvbWFpbiBVQVJUIGNvbnRyb2xsZXIg
b24gRzEyQSBTb0NzCj4gPj4+Pj4+Pj4gICAgICAgICAgIGl0ZW1zOgo+ID4+Pj4+Pj4+IEBAIC00
Niw2ICs0Nyw3IEBAIHByb3BlcnRpZXM6Cj4gPj4+Pj4+Pj4gICAgICAgICAgICAgLSBhbWxvZ2lj
LG1lc29uOGItdWFydAo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi1neC11
YXJ0Cj4gPj4+Pj4+Pj4gICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXM0LXVhcnQKPiA+Pj4+
Pj4+PiArICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbi10Ny11YXJ0Cj4gPj4+Pj4+Pgo+ID4+Pj4+
Pj4gSXQgZG9lcyBub3QgbG9vayBsaWtlIHlvdSB0ZXN0ZWQgdGhlIERUUyBhZ2FpbnN0IGJpbmRp
bmdzLiBQbGVhc2UgcnVuCj4gPj4+Pj4+PiBgbWFrZSBkdGJzX2NoZWNrYCAoc2VlCj4gPj4+Pj4+
PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1zY2hlbWEucnN0IG9y
Cj4gPj4+Pj4+PiBodHRwczovL3d3dy5saW5hcm8ub3JnL2Jsb2cvdGlwcy1hbmQtdHJpY2tzLWZv
ci12YWxpZGF0aW5nLWRldmljZXRyZWUtc291cmNlcy13aXRoLXRoZS1kZXZpY2V0cmVlLXNjaGVt
YS8KPiA+Pj4+Pj4+IGZvciBpbnN0cnVjdGlvbnMpLgo+ID4+Pj4+Pgo+ID4+Pj4+PiBDaGVjayBi
YWNrIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCBJIHNob3VsZCd2ZSBwb3N0ZWQgYW4gdW50ZXN0
ZWQKPiA+Pj4+Pj4gdmVyc2lvbiBvZiB3aGF0IHlvdSBuZWVkIHRvIGFkZC4KPiA+Pj4+PiBJIHNh
dyB0aGF0LCBidXQgYWRkaW5nIGEgUzQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lLiBBbmQgeW91
IGRpZG4ndAo+ID4+Pj4+IHNob3cgdGhlIGVudGlyZSBjaGFuZ2UsIHNvIEkgY2FuJ3QgdW5kZXJz
dGFuZCB3aGF0IHlvdSB3YW50IHRoZXJlLgo+ID4+Pj4KPiA+Pj4+IEZvciBzdXJlIHlvdSBuZWVk
IHNvbWV0aGluZyB3aGljaCBkb2VzIG5vdCB0cmlnZ2VyIGVycm9ycy4gSWYgeW91IGNsYWltCj4g
Pj4+PiBhZGRpbmcgUzQgYXMgZmFsbGJhY2sgZG9lcyBub3QgbWFrZSBzZW5zZSwgdGhlbiB3aHkg
ZGlkIHlvdSB1c2UgaXQ/Cj4gPj4+PiBTZW5kaW5nIGEgY29kZSB3aGljaCBpcyBjbGVhcmx5IGlu
Y29ycmVjdCBkb2VzIG5vdCBtYWtlIHNlbnNlLgo+ID4+Pj4KPiA+Pj4gU29ycnksIEkgdGhpbmsg
d2UgYXJlIHRhbGtpbmcgYWJvdXQgZGlmZmVyZW50IHRoaW5ncy4gSXQgZG9lcyBub3QgbWFrZQo+
ID4+PiBzZW5zZSB0byBtZSB0byBhZGQgYW4gUzQgbGluZSBpbiB0aGUgZG9jdW1lbnRhdGlvbiB3
aGVuIGl0IGlzIGFscmVhZHkKPiA+Pj4gdGhlcmUuIFNvIEkgY291bGQgbm90IHVuZGVyc3RhbmQg
b3IgbWFrZSBzZW5zZSBvZiB0aGUgcGF0Y2ggQ29ub3Igc2VudAo+ID4+PiBpbiByZXBseSB0byBt
eSBWMi4KPiA+Pgo+ID4+IFRoYXQgaXMganVzdCBob3cgaXQgd29ya3MuIFlvdSBuZWVkIHRvIHNw
ZWxsIG91dCBleGFjdGx5IHdoaWNoCj4gPj4gY29tYmluYXRpb25zIGFyZSBwZXJtaXR0ZWQuIFRo
ZSBjdXJyZW50IGVudHJ5IGZvciBzNCBzYXlzIHRoYXQgczQgaXMKPiA+PiBvbmx5IHBlcm1pdHRl
ZCBpbiBpc29sYXRpb24uCj4gPj4gU2luY2UgeW91IGFyZSBhZGRpbmcgImFtbG9naWMsbWVzb24t
dDctdWFydCIsICJhbWxvZ2ljLG1lc29uLXM0LXVhcnQiCj4gPj4geW91IG5lZWQgdG8gZXhwbGlj
aXRseSBhbGxvdyB0aGF0IGNvbWJpbmF0aW9uLiBZb3UnbGwgbm90aWNlIGlmIHlvdSBsb29rCj4g
Pj4gYXQgdGhlIGZpbGUgdGhhdCB0aGUgZ3ggdWFydCBhcHBlYXJzIG1vcmUgdGhhbiBvbmNlLgo+
ID4+Cj4gPj4gR2l2ZW4gdGhlIGcxMmEgd2FzIHRoZSBtb3N0IHJlY2VudGx5IGFkZGVkIGNvbXBh
dGlibGUsIGl0IG1pZ2h0IG1ha2UKPiA+PiBzZW5zZSB0byBmb2xsb3cgdGhlIHBhdHRlcm4gdGhh
dCBpdCBoYWQgc2V0LCBnaXZlbiB0aGUgdGhpbmcgeW91cgo+ID4+IG9yaWdpbmFsIHBhdGNoIGNv
cGllZCB0aGUgbWF0Y2ggZGF0YSBmcm9tIHdhcyB0aGUgZzEyYS4gVGhhdCBjaGFuZ2UgdG8KPiA+
PiB0aGUgZHQtYmluZGluZyB3b3VsZCBsb29rIGxpa2U6Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVz
b24tdWFydC55YW1sCj4gPj4gaW5kZXggMDFlYzQ1YjNiNDA2Li5lYWUxMWU4N2I4OGEgMTAwNjQ0
Cj4gPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxv
Z2ljLG1lc29uLXVhcnQueWFtbAo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPiA+PiBAQCAtNTAsNiArNTAs
MTMgQEAgcHJvcGVydGllczoKPiA+PiAgICAgICAgICAgaXRlbXM6Cj4gPj4gICAgICAgICAgICAg
LSBjb25zdDogYW1sb2dpYyxtZXNvbi1nMTJhLXVhcnQKPiA+PiAgICAgICAgICAgICAtIGNvbnN0
OiBhbWxvZ2ljLG1lc29uLWd4LXVhcnQKPiA+PiArICAgICAgLSBkZXNjcmlwdGlvbjoKPiA+PiAr
ICAgICAgICAgIEV2ZXJ5dGhpbmctRWxzZSBwb3dlciBkb21haW4gVUFSVCBjb250cm9sbGVyIG9u
IEcxMkEgY29tcGF0aWJsZSBTb0NzCj4gPj4gKyAgICAgICAgaXRlbXM6Cj4gPj4gKyAgICAgICAg
ICAtIGVudW06Cj4gPj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXQ3LXVhcnQKPiA+
PiArICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tZzEyYS11YXJ0Cj4gPj4gKyAgICAg
ICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWd4LXVhcnQKPiA+Pgo+ID4+ICAgICByZWc6Cj4g
Pj4gICAgICAgbWF4SXRlbXM6IDEKPiA+Pgo+ID4+IC9JLyBkb24ndCByZWFsbHkgY2FyZSB3aGV0
aGVyIHlvdSBkbyB0aGF0LCBvciBkbyB0aGUgczQgdmVyc2lvbiBvZiBpdCwKPiA+PiBidXQgZm9s
bG93aW5nIHRoZSBtb3N0IHJlY2VudCBwYXR0ZXJuIG1pZ2h0IG1ha2UgbW9yZSBzZW5zZS4gV2hl
biBJCj4gPj4gc3VnZ2VzdGVkIHM0LCBpdCB3YXMgYmVjYXVzZSBJIG9ubHkgbG9va2VkIGF0IHRo
ZSBkcml2ZXIgcGF0Y2ggcmF0aGVyCj4gPj4gdGhhbiB0aGUgY29kZSBpdHNlbGYuCj4gPj4KPiA+
Pj4gS3J6eXN6dG9mLCBJIHdpbGwgY2hlY2sgYWdhaW4gd2l0aCBkdGJzX2NoZWNrIGFuZCByZS1z
ZW5kLgo+ID4+Cj4gPj4gQ2hlZXJzLAo+ID4+IENvbm9yLgo+ID4gSSBhbSBzdHJ1Z2dsaW5nIHRv
IHVuZGVyc3RhbmQgdGhpcy4gRXZlcnl0aGluZyBJIHRyeSBmYWlscyB0aGUgY2hlY2suCj4KPiBJ
IGp1c3QgYXBwbGllZCBDb25vcidzIGNoYW5nZSBvbiB0b3Agb2YgdjYuNC1yYzEgYW5kIHJhbjoK
PiBtYWtlIGR0X2JpbmRpbmdfY2hlY2sgRFRfU0NIRU1BX0ZJTEVTPURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPgo+IGFuZCB0
aGUgY2hlY2sgd2FzIHN1Y2Nlc3NmdWwuCj4KPiBOZWlsCj4KPgpJIGFtIHNlbmRpbmcgdjQgaW4g
YSBmZXcgbWludXRlcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
