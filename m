Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A823DC4707B
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jan 2024 15:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGYdA4R/nkxHE3NQuOF2vmCIZJUJif3D/pGZdqOnXjo=; b=PQgwQJTRoHnAoM
	C8GhZq8B2xNCbU/t8mXyva0DlFSF7UtirvjdxGEenqgkGvPfb7j6/pev0FJpUeMepZ5qme92dV3G+
	WcUmtUgmJUgDFyZhM5oUb+5O6QR7MVe/IC6tNKeLVQRhlexAnCQUYx6tUikSriSeDvaRWpZnaVPd9
	GU4aw1OD4hYD1bx9Dt9l4FJj5+wC/WK5+emP+wMaM8xxnKMXWlvn2pnREw/k/7ENNdn6T/y8YGwrW
	Fg8wwL0T2hOWwq+wcLc/FCzPNYMXoYS4LIbh74v8SPaH8w24JT0DQh+tSa5asawEq3u2VrQt+j9sY
	En3dO+M8Zn+c0XHj3r9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNah4-00Ce4x-01;
	Wed, 10 Jan 2024 15:40:38 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNah1-00Ce2j-1Z
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jan 2024 15:40:36 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-dbed5d1ffb0so3557340276.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jan 2024 07:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1704901232; x=1705506032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPGs8xHU/Ucg5Eh2JZyutJ+LL1G8nkiyKu0z2j3NLks=;
        b=Y89CBft23XqySzhYLzc38GkjXZtN3WL9RmVjyDuS16fJZgiMBfwFa8biu+XnaRVTyo
         Z/rO0LQ79EfkeVDoXvVsnh8jz6GOp2uzxfqFPnyFabBMXpzQ1C5BYpP2frwSwmyWL8zY
         +qzUGZpBsECY2Z9uTCYL6wtYKzf4f/1LaYFgQIKPPeiQKPft61DrViMtDojLlObYbDNp
         oT5uz072amgn8kG847OXURVtArbOiQniqKlCbSwCupVBHEC7S/1swfAl1+Ul+LVKMMVm
         HfiwYNuOmsBTKkxcmnPhoU/AGXTkWQllYu58DXLK8Au49CL4W00poT55L8wxLoOzkAU9
         qPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704901232; x=1705506032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LPGs8xHU/Ucg5Eh2JZyutJ+LL1G8nkiyKu0z2j3NLks=;
        b=njQXviXAcTJT4GIrZ5W80rCn7SCEgb/sy1yrQNLBHVJElbv6idKZeGRkJhdXDM7CFM
         nLthDRlrgVkG0fREM0LxSAF2uXt+//3xijnaJ95EgqvdCXmMm1HhjBRbm/V9OIgAT+Pf
         lNtMKrbLFZH3sSeodSJbKAYtmMzPBx5a5w89xt4lZlWaAukOvgESIqDHRXSmWMu+fRXl
         Ux4Cq4uhLVeQnXJige6v0iEbU/jCPfALcVLSVsCMkxYiHuKPjbLO08rtVoA5gIbeD5og
         Vah7+DRrGlcnEd+uY5QIPAkJbbBLJxBAw8QC77kkvSNsQzfx/HG0OTVvKh33QZ69wgGa
         gQ9g==
X-Gm-Message-State: AOJu0YzBKWp8xh2At32/8vWVt+ui38KU53qsMPcWMNsXZGF5XKoIT7CY
	r+HMFSYGwU0bkvFPHBp1+hlUEQTeh9jDklutj5zu9heJi/syig==
X-Google-Smtp-Source: AGHT+IEX+X8GtmZlWQlrM+7/qEgiYwUwILCmDxI/lmDjfRvkAckj7vGhjP3lmjcGBJ4VZF5WWN/BsQ==
X-Received: by 2002:a25:d354:0:b0:dbe:9de7:df10 with SMTP id e81-20020a25d354000000b00dbe9de7df10mr982295ybf.29.1704901231983;
        Wed, 10 Jan 2024 07:40:31 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id e14-20020a056902034e00b00db3fa34142bsm1420924ybs.49.2024.01.10.07.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 07:40:31 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5f254d1a6daso41774647b3.2;
        Wed, 10 Jan 2024 07:40:31 -0800 (PST)
X-Received: by 2002:a0d:d102:0:b0:5e8:dcdd:973e with SMTP id
 t2-20020a0dd102000000b005e8dcdd973emr1186189ywd.39.1704901231212; Wed, 10 Jan
 2024 07:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20231106092202.11127-1-tomeu@tomeuvizoso.net> <569e39a0-b91c-46f1-b55d-c9324d66339b@linaro.org>
 <1jy1fb9n7d.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jy1fb9n7d.fsf@starbuckisacylon.baylibre.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 10 Jan 2024 16:40:19 +0100
X-Gmail-Original-Message-ID: <CAAObsKCnbH8nWPx0_OiZur=iXyobCpZ-9EOYkpUch48oOus0_w@mail.gmail.com>
Message-ID: <CAAObsKCnbH8nWPx0_OiZur=iXyobCpZ-9EOYkpUch48oOus0_w@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: dts: VIM3: Set the rates of the clocks for
 the NPU
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, 
	Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_074035_690930_F2EA1EEF 
X-CRM114-Status: GOOD (  15.20  )
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

T24gTW9uLCBOb3YgNiwgMjAyMyBhdCAxMTo0M+KAr0FNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+Cj4gT24gTW9uIDA2IE5vdiAyMDIzIGF0IDEwOjI2LCBO
ZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiA+IE9u
IDA2LzExLzIwMjMgMTA6MjIsIFRvbWV1IFZpem9zbyB3cm90ZToKPgo+IHBhdGNoIHRpdGxlIGlz
IG1pc2xlYWRpbmcuIEl0IGRvZXMgbm90IHRhcmdldCB0aGUgdmltMyBvbmx5IGJ1dCBhbGwgZzEy
Cj4gYW5kIHNtMSBIV3MuCj4KPiBJdCBzaG91bGQgc3RhcnQgd2l0aCAiYXJtNjQ6IGR0czogYW1s
b2dpYzogZzEyOiAiIGluc3RlYWQKClRoYW5rcywgaGF2ZSBmaXhlZCBhbmQgcmVzZW50LgoKQ2hl
ZXJzLAoKVG9tZXUKCj4gPj4gT3RoZXJ3aXNlIHRoZXkgYXJlIGxlZnQgYXQgMjRNSHogYW5kIHRo
ZSBOUFUgcnVucyB2ZXJ5IHNsb3dseS4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBUb21ldSBWaXpvc28g
PHRvbWV1QHRvbWV1dml6b3NvLm5ldD4KPiA+PiBTdWdnZXN0ZWQtYnk6IEx1Y2FzIFN0YWNoIDxs
LnN0YWNoQHBlbmd1dHJvbml4LmRlPgo+ID4+IC0tLQo+ID4+ICAgYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaSB8IDMgKysrCj4gPj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kKPiA+PiBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kKPiA+PiBpbmRleCBmZjY4YjkxMWI3Mjku
LjlkNWVhYjY1OTVkMCAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpCj4gPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaQo+ID4+IEBAIC0yNTAyLDYgKzI1MDIsOSBAQCBu
cHU6IG5wdUBmZjEwMDAwMCB7Cj4gPj4gICAgICAgICAgICAgIGNsb2NrcyA9IDwmY2xrYyBDTEtJ
RF9OTkFfQ09SRV9DTEs+LAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICA8JmNsa2MgQ0xLSURf
Tk5BX0FYSV9DTEs+Owo+ID4+ICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJjb3JlIiwgImJ1
cyI7Cj4gPj4gKyAgICAgICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrYyBDTEtJRF9OTkFf
Q09SRV9DTEs+LAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsa2MgQ0xL
SURfTk5BX0FYSV9DTEs+Owo+ID4+ICsgICAgICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRlcyA9
IDw4MDAwMDAwMDA+LCA8ODAwMDAwMDAwPjsKPiA+PiAgICAgICAgICAgICAgcmVzZXRzID0gPCZy
ZXNldCBSRVNFVF9OTkE+Owo+ID4+ICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+
ID4+ICAgICAgfTsKPiA+Cj4gPiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
