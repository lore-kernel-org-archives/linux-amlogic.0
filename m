Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9174EB64DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jun 2023 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyDTLkrBJU8bvqb6sAMHVZ3IfukklIPJ7KBXqrtj46E=; b=tCpsISDuvOrTSD
	zBLoVcH6ckhUZdALnZGzOrvYRT29l+cW4Sp9eQBhcuVkKMF57+PbNvIVAxhzsVoJ6ugiQTPN5fyRz
	TAHxWXS9rYS2W5gXtz6ZfyES3bQKCAysNa4T7V+X9awr5elm5zRACdIKmag1scatEvRfqheKNxdQN
	2UFLo3vp4xbJgoU8MKAYakg6Xjc0Y5gJin+Hl3po3DdodZWrTEd0ZEQmQ44adeSVih+4rUmVvd0ZA
	BLqlEEEDzxwt4Bv5xda3ZxoFUY4C/cJkqjnne8cXjpr8UJNeRzsg92FygkBxe2unsyIJpVmzUgpix
	aqFhh1kXfDehau4xIHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwO4-006PH0-1B;
	Sun, 18 Jun 2023 17:40:28 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwO1-006PGI-2F;
	Sun, 18 Jun 2023 17:40:27 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5701e8f2b79so32807567b3.0;
        Sun, 18 Jun 2023 10:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687110024; x=1689702024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=amJGUKjp5oGz/tKayl+1XivBm6hIlBGrgnz6eQlEOCU=;
        b=iiQN2q7QpU3//KDIw1N7+/O5UBFfRNQRemZfMoMAqWDT1IFvgrvF2IO0D5AHeU9urP
         bmo04LyH7KT2NgeEqUiPGU3ywUdMuIIqSuoK6iejLVwjLdEoXFyiseYZhy7KXWfH/Cm2
         4wik2lu11CB95ThEPkn4Uk8x4vvNiCoNAB5gupBWEyHvC1I3P7+qNlcukHuc+NfDgX3+
         MsjITm/1HX1wldKEYnRRUprKhtCUnSI2BZGSiYMDawzGgZpNMaD87rsI6rrtY8V8OIJN
         InzQmBwXZyN9hKuCUZFP+7amSOVot6PL7noSyXjPWx6tY2evCVoSO94KiUxH1DsYsQZW
         Wiow==
X-Gm-Message-State: AC+VfDzxfT4IJcma0uaVkKZdNXVWAGkB402z8gwCUU3GIANCly7q/wwU
	uTy6e+Ng7xhMuQyXfZO5noQAHzriuXwEJq2F
X-Google-Smtp-Source: ACHHUZ691gK0SeZwoY3F53jxj6WbHWFzKr7DJeX5fLsGaVRNky/d0T/rWtWfKP2pVLj8Jy3A/1lS8A==
X-Received: by 2002:a81:a0d1:0:b0:56d:3d8d:4f63 with SMTP id x200-20020a81a0d1000000b0056d3d8d4f63mr8822374ywg.12.1687110024262;
        Sun, 18 Jun 2023 10:40:24 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id g188-20020a0dc4c5000000b0055a7c2375dfsm6106593ywd.101.2023.06.18.10.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 10:40:23 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-570284c7e61so32720397b3.1;
        Sun, 18 Jun 2023 10:40:23 -0700 (PDT)
X-Received: by 2002:a81:bf46:0:b0:56f:f890:3149 with SMTP id
 s6-20020a81bf46000000b0056ff8903149mr9364206ywk.16.1687110023119; Sun, 18 Jun
 2023 10:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230615182938.18487-1-tanure@linux.com> <20230615182938.18487-6-tanure@linux.com>
 <ZIufK7uK0ZrsVTZ3@ofant>
In-Reply-To: <ZIufK7uK0ZrsVTZ3@ofant>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 18 Jun 2023 18:40:12 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3_UME4xigEU+_dXrdLi+YkL0+TC-Y552LBcuTii4=V5w@mail.gmail.com>
Message-ID: <CAJX_Q+3_UME4xigEU+_dXrdLi+YkL0+TC-Y552LBcuTii4=V5w@mail.gmail.com>
Subject: Re: [PATCH 5/6] tty: serial: meson: Added T7 SOC compatibility
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_104025_738692_6FF521A1 
X-CRM114-Status: GOOD (  21.92  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTI6MzHigK9BTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBMdWNhczoKPgo+IE9uIDE5OjI5IFRodSAxNSBKdW4gICAgICwg
THVjYXMgVGFudXJlIHdyb3RlOgo+ID4gTWFrZSBVQVJUIGRyaXZlciBjb21wYXRpYmxlIHdpdGgg
VDcgU09DIFVBUlQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVA
bGludXguY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyB8
IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYyBiL2RyaXZlcnMvdHR5L3Nl
cmlhbC9tZXNvbl91YXJ0LmMKPiA+IGluZGV4IDI1MDFkYjVhN2FhZi4uMDIwOGY5YTZiYTdlIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4gKysrIGIv
ZHJpdmVycy90dHkvc2VyaWFsL21lc29uX3VhcnQuYwo+ID4gQEAgLTc5Niw2ICs3OTYsMTAgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25fdWFydF9kdF9tYXRjaFtdID0g
ewo+ID4gICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLXM0LXVhcnQi
LAo+ID4gICAgICAgICAgICAgICAuZGF0YSA9ICh2b2lkICopJm1lc29uX2cxMmFfdWFydF9kYXRh
LAo+ID4gICAgICAgfSwKPiA+ICsgICAgIHsKPiA+ICsgICAgICAgICAgICAgLmNvbXBhdGlibGUg
PSAiYW1sb2dpYyxtZXNvbi10Ny11YXJ0IiwKPiA+ICsgICAgICAgICAgICAgLmRhdGEgPSAodm9p
ZCAqKSZtZXNvbl9nMTJhX3VhcnRfZGF0YSwKPiBJIHRoaW5rIHlvdSBhcmUgdHJ5aW5nIHRvIGZv
bGxvdyBwcmV2aW91cyBzNCBzY2hlbWUgLSB0byBpbnRyb2R1Y2UgYSBuZXcKPiBjb21wYXRpYmxl
IHN0cmluZywgd2hpbGUgSSB0aGluayBpdCdzIG5vdCBuZWNlc3Nhcnkgb3IgZXZlbiB3cm9uZywg
dGhpcyB3aWxsIGp1c3QKPiBtYWtlIHRoZSBkdF9tYXRjaF9saXN0IGxvbmdlciBidXQgd2l0aG91
dCBvYnZpb3VzIGJlbmVmaXRzLi4KPgo+IGFzIENvbm9yIGFscmVhZHkgcmFpc2VkIHRoaXMgcXVl
c3Rpb24gaW4gcHJldmlvdXMgZHQtYmluZGluZyBwYXRjaFs0LzZdLAo+IGhvdyBhYm91dCBqdXN0
IHVzaW5nICdhbWxvZ2ljLG1lc29uLWcxMmEtdWFydCcgd2hpY2ggaXMgdGhlIGZpcnN0IGNvbXBh
dGlibGUKPiBpbnRyb2R1Y2VkLgo+Cj4gaWYgcGVvcGxlIGFncmVlLCB3ZSBjb3VsZCBhbHNvIGRy
b3AgJ2FtbG9naWMsbWVzb24tczQtdWFydCcgc2luY2UgaXQgdXNlIHNhbWUKPiBjb21wYXRpYmxl
IGRhdGEgYXMgZ2wxMmEsIGFueXdheSBpdCBzaG91bGQgYmUgc2VwYXJhdGVkIGludG8gYW5vdGhl
ciBwYXRjaC4uCj4KPiA+ICsgICAgIH0sCj4gPiAgICAgICB7IC8qIHNlbnRpbmVsICovIH0sCj4K
Pgo+ID4gIH07Cj4gPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbWVzb25fdWFydF9kdF9tYXRj
aCk7Cj4gPiAtLQo+ID4gMi40MS4wCj4gPgo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+
ID4gbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPgo+IC0tCj4gWWl4dW4g
TGFuIChkbGFuKQo+IEdlbnRvbyBMaW51eCBEZXZlbG9wZXIKPiBHUEcgS2V5IElEIEFBQkVGRDU1
CgpZZXMsIEkgYW0gZHJvcHBpbmcgdGhpcyBwYXRjaCBhbmQgdXNpbmcgczQgYW5kIGcxMmEgY29t
cGF0aWJsZSBsaW5lcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
