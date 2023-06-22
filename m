Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF70EB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 05:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYCD5JLQIzxvhn+nYo7juapDThnlPhYqmTGKXu+ZQEQ=; b=Mkq7jEvevd7jpH
	hwkLi8gDHPeSligxU7ChIi83IyOzrZOFJftGxKo6rx5i7p0xDQ6/YvkFro1V9nPcv++layUY04H5i
	lkZljSFqn1DJEq5aje4w8FIoOMzu8P47wcntz3hFpEZlNw7WuGKgnip8EsygPzz0M3Gh6toFylFeS
	B67NmNI8RjwSo3Hu4+o6GpZx7JDY2ddXo5yPPm9TyZ1MEP7JFLHIGLdu/U+W824wJw6i9v9KEHGnh
	y9zQIFYb44LIrmRSTv8sBd6xOyKOXJNBG29yU31cNYX+2V+0E74ptUEWoaLYLkGSivGygG5pXoByC
	pa6V0bReIdyeOvgWuQ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCCw5-00GuNT-06;
	Thu, 22 Jun 2023 05:32:49 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCCw1-00GuME-1V;
	Thu, 22 Jun 2023 05:32:46 +0000
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-3ff29d0dd1eso28056821cf.2;
        Wed, 21 Jun 2023 22:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687411961; x=1690003961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nrcyGT7ymU1XVYwyjlMrGW0IAiKkeL72CA1S1fw36WM=;
        b=cAueNZCo52Wwcj276QvLghCENaQ4+ugxl6qKLEJo6zoaHwbXDduloRycp8yCqJZXE2
         Omva1iFJCtwQOBIeVr+ufAQoBHvKSIOj0fvAAyzxE8F8zqjhw3hchLpD08wN04lFibXM
         Q20ANX0/KcwBn1GUbOBw2/wh7v8F72doF7m++LIOWZDixvsBEaG2OGHns93GbmaoFYRD
         yV6UdNHBi0I+22jf/ezBAh1jxInJew8wGlHVuGX5HHirEr9+YnY6e16/lD3SdefGeHzv
         BBajJuUFqvhxkHJAguIND0Xc33jzZKH3FZsOgWAoTMUG71CY7kqfGd3OL3+CpJ7OTIfN
         1cXQ==
X-Gm-Message-State: AC+VfDxf0Pt9a9N2C2AQ78yQqPLhriAa1u8vfZZq6mqJN2Sh1/7JaB+S
	8tVo5VpHIMRFX+HO+RXX+21Bo8GNwhr0tNS3
X-Google-Smtp-Source: ACHHUZ7JUBw3m8AnqaTZYkHyH4/e3ZEch81F7qNEOBQWIhSPvmjOZoxAHmoEaLQ9AHH4YwS28mmIlg==
X-Received: by 2002:a05:622a:13cf:b0:3fd:def3:4c38 with SMTP id p15-20020a05622a13cf00b003fddef34c38mr20227638qtk.4.1687411960908;
        Wed, 21 Jun 2023 22:32:40 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id s6-20020ac85ec6000000b003e635f80e72sm3223283qtx.48.2023.06.21.22.32.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 22:32:40 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-763d86856fdso114994085a.3;
        Wed, 21 Jun 2023 22:32:40 -0700 (PDT)
X-Received: by 2002:a05:6214:d63:b0:632:1c72:c379 with SMTP id
 3-20020a0562140d6300b006321c72c379mr3440084qvs.51.1687411960027; Wed, 21 Jun
 2023 22:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230621133215.109254-1-tanure@linux.com> <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org> <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
In-Reply-To: <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
From: Lucas Tanure <tanure@linux.com>
Date: Thu, 22 Jun 2023 06:32:28 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
Message-ID: <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_223245_531753_858B7778 
X-CRM114-Status: GOOD (  20.61  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNzoxMuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBMdWNhcywKPgo+IE9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDAz
OjUzOjA0UE0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPiBPbiAyMS8wNi8y
MDIzIDE1OjMyLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiA+IEFtbG9naWMgVDcgU29DcyB1c2Vz
IHRoZSBzYW1lIFVBUlQgY29udHJvbGxlciBhcyBTNCBTb0NzIGFuZCBHMTJBLgo+ID4gPiBUaGVy
ZSBpcyBubyBuZWVkIGZvciBhbiBleHRyYSBjb21wYXRpYmxlIGxpbmUgaW4gdGhlIGRyaXZlciwg
YnV0Cj4gPiA+IGFkZCBUNyBjb21wYXRpYmxlIGxpbmUgZm9yIGRvY3VtZW50YXRpb24uCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxpbnV4LmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvYW1sb2dpYyxtZXNv
bi11YXJ0LnlhbWwgICAgICAgICAgfCAyICsrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4g
PiBpbmRleCAwMWVjNDViM2I0MDYuLjg2MGFiNThkODdiMCAxMDA2NDQKPiA+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQu
eWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFs
L2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4gPiA+IEBAIC0zMyw2ICszMyw3IEBAIHByb3BlcnRp
ZXM6Cj4gPiA+ICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhiLXVhcnQKPiA+ID4gICAg
ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4LXVhcnQKPiA+ID4gICAgICAgICAgICAgICAg
LSBhbWxvZ2ljLG1lc29uLXM0LXVhcnQKPiA+ID4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uLXQ3LXVhcnQKPiA+ID4gICAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLG1lc29uLWFvLXVh
cnQKPiA+ID4gICAgICAgIC0gZGVzY3JpcHRpb246IEFsd2F5cy1vbiBwb3dlciBkb21haW4gVUFS
VCBjb250cm9sbGVyIG9uIEcxMkEgU29Dcwo+ID4gPiAgICAgICAgICBpdGVtczoKPiA+ID4gQEAg
LTQ2LDYgKzQ3LDcgQEAgcHJvcGVydGllczoKPiA+ID4gICAgICAgICAgICAtIGFtbG9naWMsbWVz
b244Yi11YXJ0Cj4gPiA+ICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4LXVhcnQKPiA+ID4g
ICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tczQtdWFydAo+ID4gPiArICAgICAgICAgIC0gYW1s
b2dpYyxtZXNvbi10Ny11YXJ0Cj4gPgo+ID4gSXQgZG9lcyBub3QgbG9vayBsaWtlIHlvdSB0ZXN0
ZWQgdGhlIERUUyBhZ2FpbnN0IGJpbmRpbmdzLiBQbGVhc2UgcnVuCj4gPiBgbWFrZSBkdGJzX2No
ZWNrYCAoc2VlCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd3JpdGluZy1z
Y2hlbWEucnN0IG9yCj4gPiBodHRwczovL3d3dy5saW5hcm8ub3JnL2Jsb2cvdGlwcy1hbmQtdHJp
Y2tzLWZvci12YWxpZGF0aW5nLWRldmljZXRyZWUtc291cmNlcy13aXRoLXRoZS1kZXZpY2V0cmVl
LXNjaGVtYS8KPiA+IGZvciBpbnN0cnVjdGlvbnMpLgo+Cj4gQ2hlY2sgYmFjayBvbiB0aGUgcHJl
dmlvdXMgdmVyc2lvbiwgSSBzaG91bGQndmUgcG9zdGVkIGFuIHVudGVzdGVkCj4gdmVyc2lvbiBv
ZiB3aGF0IHlvdSBuZWVkIHRvIGFkZC4KSSBzYXcgdGhhdCwgYnV0IGFkZGluZyBhIFM0IGRvZXNu
J3QgbWFrZSBzZW5zZSB0byBtZS4gQW5kIHlvdSBkaWRuJ3QKc2hvdyB0aGUgZW50aXJlIGNoYW5n
ZSwgc28gSSBjYW4ndCB1bmRlcnN0YW5kIHdoYXQgeW91IHdhbnQgdGhlcmUuCj4KPiBDaGVlcnMs
Cj4gQ29ub3IuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
