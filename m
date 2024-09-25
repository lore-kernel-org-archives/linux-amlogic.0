Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0DCCCF9E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5a6N6fCnUi+g0Ec0nH9RjNOeLitOm2RmfRD8YYeLLZg=; b=OQAA0ZI1YjpLW/
	eryMdyBeeDbdXOP7ahBDK8yarYh2sNWqxskaPYTd2GrtvuEbeFzA04wEm1LzL8t8mInkPQTNVAoz0
	fieQzS/p5dTN36nbDzX4qHNvGkZHIV/8P4ECFKrF2HkTv3j57Ux9ljs9WWcEyOLzhUVkiL0kbPARK
	8a9p4zapWl6pGVaCjS8dzsbjlHU/2ueSS43VVSyf7QJXXLy/aY6al0IIbqBkrlhP3MmFLxJUP/BXh
	TGV86iNC/s7d83psdzjCqEz4FEP21hhyO4Wl5AswR6owl/EDXxl9j8gnj8UcVBLcQgJteJs8xDo9C
	G6Na80BU05A94xcbL8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stVql-00000006Bl9-1Wm7;
	Wed, 25 Sep 2024 17:30:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVpZ-00000006BVR-2w9o;
	Wed, 25 Sep 2024 17:29:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2068acc8a4fso353425ad.1;
        Wed, 25 Sep 2024 10:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727285377; x=1727890177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76c1gfIJ44N/4frQpedFLzuDh4DDf4ytBF5LgFjIvvY=;
        b=nPD4acUJjebgPYSdHlTsDyeGW1fzR+l34b3vbr6nm64OO7V5G7kDPwsN/9V1uZEJmL
         DwBVh++zlDoHQHeJtMx/zq+hbfe7Thx47J28KoaKUQR8oQtmCao5F8YleSL9n2v3ZBOF
         FOGezcqg2kYwQ08n+gbfVMPjssypJdX/E1vDEUrcrMNJWDTUBOfv3NImUqmhJ5iCLtfW
         7fIZwVOnRPzMk9Lz04NqoIAaPWlT4QhSonrx33A8Lwf4Tf9xRuuSSfsMYarofUAWD0Dk
         6xnxDP76teHJcrLUutZt3KlzsZ0lw0ACFQDYNkL1r0OKhDawX9SwC9vpURhpUMMZS1A+
         7uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285377; x=1727890177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76c1gfIJ44N/4frQpedFLzuDh4DDf4ytBF5LgFjIvvY=;
        b=GJfO6w84uglniB4tBQ7fSDp5372B2go5t5zI7IOIwQpPL4xla/DKDElqVsmbTEIfoP
         UbfgXhaVDxwhKJqcA6JNLczvNns0IeHtTHuZ2XndPtkTvxVcv6nlMfpfccQ3GCJGHjnq
         6oSZQAZAgawtk5wgh8dO984gO6qYNZjxTmb1fRc4XZ7P0LffesN0mSShTaaUnbP7B5UH
         CM3v+UrOK9bjUIV2NX8pew8X20k7AxheLV3bKgicIlmETSLaGTxDEiwkmwPnpzHqaCIP
         X4bS5Uga4cZhexgupkMzXiurtW875iFtKpVXeACoqLHN5l/Jbg2qC10KcmdzZfB2konK
         J7EA==
X-Forwarded-Encrypted: i=1; AJvYcCVETIsb6vm/qDR4N6wxM1w88695HATRZgWQcxym0t5MtcVizQXpQ6C8FzvwiGAyV88G3i7z9IEU1vgzUbRY@lists.infradead.org, AJvYcCVFBrBSRJsT6RJfPK8LDk3NNUDLWqMRnt67svjLUR6c11PK4BrZRP+zGAc+/oUdIYsTKSicpXorAUi4EFjUlx2Gaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt0Ua9ndc4aLvyNXfiMu0OUlHrAQszefbeMapkbDGKw4oQp/QS
	ow0UhDChMr7wJucQwWc2UwPFcuaNk6B1cqtqK0iE6kFzIxW9nrUYgcz1uvfG0TUUWxsqAsNl0Kj
	837N2oClkXMKnIHWKID6RmnjqDzAZOEBb
X-Google-Smtp-Source: AGHT+IGL8Tarnw4aOxyngiyyJMw2bFTvc8HSfobctrnuSaGxAiJN+XPoCfQJeAeS5waKELhDrIf1ZNEdC7ArTM2uMQA=
X-Received: by 2002:a17:902:f707:b0:206:8f25:a3e with SMTP id
 d9443c01a7336-20afc60958amr46716805ad.53.1727285376595; Wed, 25 Sep 2024
 10:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
 <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-3-5aa8bdfe01af@linaro.org>
 <mbc2cacow73vmwn3w42aucq6x6xijbpgustkv3v6etgv35xih7@truf2rbgf3vo>
In-Reply-To: <mbc2cacow73vmwn3w42aucq6x6xijbpgustkv3v6etgv35xih7@truf2rbgf3vo>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:29:25 +0200
Message-ID: <CAFBinCDu0P8QEvxrUdXXSVCn-1061fjyhYd2nve9QCCvXmoe5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt
 to dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_102937_779834_9C0B7406 
X-CRM114-Status: GOOD (  14.15  )
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

SGkgS3J6eXN6dG9mLAoKT24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMTE6MTjigK9BTSBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgpbLi4uXQo+ID4gKyAgICAgICAg
ZW51bTogWzAsIDEsIDJdCj4gPiArCj4gPiArICAgICAgYnVzLXdpZHRoOgo+ID4gKyAgICAgICAg
ZW51bTogWzEsIDRdCj4gPiArCj4gPiArICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UK
Pgo+IEhtLCBJIHdvbmRlciB3aHkgbm90IGFsbCBzbG90cyBhcmUgZGVmaW5lZCBpbiB5b3VyIERU
Uz8gV2h5IG5vdCBhbGwgb2YKPiB0aGVtIGFyZSByZXF1aXJlZD8gSSBhc3N1bWUgdGhlIHNsb3Rz
IGFyZSB0aGVyZSBhbHdheXMsIGFzIHBhcnQgb2YgdGhlCj4gY29udHJvbGxlci4KPgo+IElzIHRo
aXMgYmVjYXVzZSBvZiBkcml2ZXIgbGltaXRhdGlvbiBtZW50aW9uZWQgaW4gdGhlIG9sZCBiaW5k
aW5nPwpUaGUgTU1DIGNvcmUgKHN0aWxsKSBoYXMgYSBsaW1pdGF0aW9uIG9mIG9ubHkgc3VwcG9y
dGluZyBvbmUgc2xvdCBwZXIKY29udHJvbGxlciAtIHNvIGEgbGltaXRhdGlvbiB3aWxsIHN0YXkg
aW4gcGxhY2UuCgpIb3dldmVyLCB0aGUgZHJpdmVyIChkcml2ZXJzL21tYy9ob3N0L21lc29uLW14
LXNkaW8uYykgdXNlcwpvZl9nZXRfY29tcGF0aWJsZV9jaGlsZCgpLCBtZWFuaW5nIGl0IHdpbGwg
YWxzbyBwaWNrIHRoZSBmaXJzdCBjaGlsZApub2RlIHdpdGggdGhlIGNvcnJlY3QgY29tcGF0aWJs
ZSBzdHJpbmcsIGV2ZW4gaWYgaXQgaGFzIHN0YXR1cyA9CiJkaXNhYmxlZCIuCkkgY2FuIHNlbmQg
YSBwYXRjaCB0byByZWR1Y2UgdGhlIHNjb3BlIG9mIHRoaXMgbGltaXRhdGlvbjogYWxsIHNsb3Rz
CmNhbiBiZSBkZWZpbmVkIGJ1dCBvbmx5IHRoZSBmaXJzdCBlbmFibGVkIG9uZSBpcyB1c2VkLgpX
aGF0IGRvIHlvdSB0aGluaz8KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
