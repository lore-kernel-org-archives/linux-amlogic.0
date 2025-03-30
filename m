Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F6C36011
	for <linux-amlogic@archiver.kernel.org>; Sun, 30 Mar 2025 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaJTJIxE/a3hY3ZJcCTTvM53k5ZSPNCQu8HtlYCJlgU=; b=myGVe5u8AscYQ5
	nwi71d/0X2BizHP1e7qkqpFJKM8xCbnYAcgnalp5uSWALvLnMHSJpa2ETqMm/nJqSInziUgb7nuob
	zJRWFQYewF3Gkg/PujFWQJ2J8hiRvesvtF/Wzp/D68P8ArY4UPD/zR763Sm17Wxn3Z9Fke+XgSoGP
	elRDFgcxkayDUWNfuHPJf2YRF7s4Kwb7bU9d/9CfYEAMgho+S1qvLb+y53i+YGwXOuZAPwq3ocL6O
	t7OGWh83vb2OOF+U7iCZS60wOsTKRfqO01lkPbRbEZZRjIij7bfnpUMCQperKUI6X7W86y9ZAV90L
	iH8lXIJhHwyaQXfgSQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzxD-0000000GhsN-1mW8;
	Sun, 30 Mar 2025 21:12:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzvT-0000000GhWo-2zDP;
	Sun, 30 Mar 2025 21:10:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-227a8cdd241so38909315ad.3;
        Sun, 30 Mar 2025 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743369039; x=1743973839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um1wOWHml/UzYVpawVxxwTUXJz9obh5pK6O3uqssEdc=;
        b=cJXXyEhHhoLOG4bsjZ7a6CYBJo3/ss3Ac1x8pFsbuNfP1kFgp+C9cy+uqTAmVl4bfz
         Ra7/b8DxwJ44hjUBu44v+IiZiFNfUGijMS3PN03oEyeno8IpBgckLg469aSEBKFjfxkE
         Uw8IFdl7rytJXJS/fAzhCcwx/WiFY88NeFRAVUIxjxj8bnnXRr3RXyNPdyE3nFX1vI9V
         I9YWaCFdyE/3OTNLBMrfkhRP/y3X1X6C+pVaGc9raQFxGn/y9jyx4iJC5mD+JLW89eTC
         U+cel2WeyWYPZEcphiey8ofE56Bxx0dXG6+ONMN8JGP1+M/fk7H2V5NZvqbCwONyD0IY
         O7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743369039; x=1743973839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um1wOWHml/UzYVpawVxxwTUXJz9obh5pK6O3uqssEdc=;
        b=SjbzxR4aa+uZ00Qzs+71dOxf1Ydflgp1wV4SztovUGlHj6SBuhbaikc3YWpUkANxu3
         riXL7pTmTpfARdrtMuNspNd8zZXaBhaTN6vDrAn97Kr9/tonjpLaFz3B7NmlPS4+yy/e
         8/vLdsUHEL2sImQp1bHIaRVzHDrOlql3gWVZqbc4FPvFcC79sq2HrmAOdVLpeLmT4gdx
         acOhcrk4Cwk3d/qmxWFFf2SDkgfDICk1XEbEEfDboOWRbPGJwkX4Gm5AnhX9HwsSJQ3/
         x9BZL96VCs/88I7PNvkACp5GEXDGb1oyJ207IFk3luJ8za+OGMh5i0VPtkDxeZKlyyL4
         Nxaw==
X-Forwarded-Encrypted: i=1; AJvYcCV52EOFUnw+mYvzbQCHkdHAXMZusQ33i3NzoS0fyZldTuXQf1djvxj5nuAt0kJ4Kl0KczRfZKIsHej7Ddy4@lists.infradead.org, AJvYcCXH7Cm52Tpdx7tLr1Ehr1uY4UMSiltNR+SO/zSyl3kewtPNFcFuJm9CfoJo8RlZhC1RIv3kmxfz/GEQQAZc2sKFNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHAD9XFbm4fnvw2YXFB7BojhZB2W1LuullyrqcE5nBZHG7BYZ0
	DYm3y8SncinkagrqUzKlzCWx+FFbxmHwt/TIH0Og8S87YTXiU8Cv6AqOgpYgRrC64qhGk5H4bZR
	diZlw3crodcb/s34SlPUHtEzKuyU=
X-Gm-Gg: ASbGncsESwidM/Fz5eWaYg4meLp3H2KYvXzh3WdZmWB7HzUlVNYQnvmCACEPR8UY9WP
	qoPgBqrdLmRzh7FeWqSKeUCdkOB6pk7g9gv1BlHAdXTC2ophX/eMjDRZMnqyUbipeNjbRBFQw+A
	G8SfX35ueHRGa1cGfHC5cU3SvvyGW0G4KuwLi2vet/enxmyXeuIZmFjiaJCMg=
X-Google-Smtp-Source: AGHT+IGG8TQ/aML9NKHr9fatF2KsYLKFfgoL9nDkVZai2+M8OApdKY34UCov5OwIf2Xe/caQxnERpRKq31UEig1iKE4=
X-Received: by 2002:a17:903:19ee:b0:224:10a2:cad5 with SMTP id
 d9443c01a7336-2292f942a6amr130079115ad.10.1743369038858; Sun, 30 Mar 2025
 14:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net> <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 23:10:28 +0200
X-Gm-Features: AQ5f1JpHPy4BrslsaR2BuaGOJO_CEScsXGIyscHyEtnp4vipG1FtG1_j-1eqkLs
Message-ID: <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_141039_749908_B2090926 
X-CRM114-Status: GOOD (  13.54  )
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

VGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gU3VuLCBNYXIgMjMsIDIwMjUgYXQgMTozOOKAr1BN
IEouIE5ldXNjaMOkZmVyIHZpYSBCNCBSZWxheQo8ZGV2bnVsbCtqLm5lLnBvc3Rlby5uZXRAa2Vy
bmVsLm9yZz4gd3JvdGU6ClsuLi5dCj4gKyAgICAgICAgICAgICAgIGV0aF9waHkwOiBldGhlcm5l
dC1waHlAMCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyogSUMgUGx1cyBJUDEwMUEgKDB4
MDI0MzBjNTQpICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+OwpEb2VzIHJl
ZyA9IDwxPiBhbHNvIHdvcmsgb24geW91ciBib2FyZD8KMCBpcyB0aGUgYnJvYWRjYXN0IGFkZHJl
c3MuIEl0J3MgdW5mb3J0dW5hdGVseSBzb21ldGhpbmcgdGhhdCB3ZSBzdGlsbApoYXZlIGluY29y
cmVjdCBpbiBhIGxvdCBvZiAuZHRzIGZpbGVzLgoKWy4uLl0KPiArJmkyY19BTyB7Cj4gKyAgICAg
ICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICBwaW5jdHJsLTAgPSA8JmkyY19hb19waW5zPjsK
PiArICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4gKwo+ICsgICAgICAgcG1pY0Az
MiB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmljb2gscm41dDYxOCI7Cj4gKyAg
ICAgICAgICAgICAgIHJlZyA9IDwweDMyPjsKPiArICAgICAgICAgICAgICAgc3lzdGVtLXBvd2Vy
LWNvbnRyb2xsZXI7CkhlcmUgSSdtIGEgYml0IHN1cnByaXNlZDoKQXJlbid0IHNvbWUgb2YgdGhl
IG91dHB1dHMgdXNlZCB0byBkcml2ZSBWQ0NLIChDUFUgcG93ZXIgcmFpbCkgYW5kClZEREVFIChl
dmVyeXRoaW5nIGVsc2UgcG93ZXIgcmFpbCwgd2hpY2ggYWxzbyBwb3dlcnMgdGhlIEdQVSk/Cgpb
Li4uXQo+ICsmdXNiMSB7Cj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gKyAgICAgICBkcl9t
b2RlID0gImhvc3QiOwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFRoaXMgYnVzIGZlYXR1cmVz
IGEgUmVhbHRlayBSVEw4MTg4IDIuNEdIeiBXaUZpIG1vZHVsZSwgd2l0aCBhCj4gKyAgICAgICAg
KiAzLjNWIHN1cHBseSB2b2x0YWdlIHRoYXQgbXVzdCBiZSBlbmFibGVkIGJlZm9yZSB1c2UuCj4g
KyAgICAgICAgKi8KPiArICAgICAgIHZidXMtc3VwcGx5ID0gPCZ3aWZpXzN2Mz47CklmIHlvdSB3
YW50IHRvIGdvIGZvciBwZXJmZWN0aW9uIHRoZW4geW91IGNhbiB1c2UKRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3htb3MseHZmMzUwMC55YW1sIGFzCnJlZmVyZW5jZS4K
SXQncyBhbHNvIGFuICJvbmJvYXJkIiBVU0IgZGV2aWNlIHdoaWNoIHJlcXVpcmVzIHRvZ2dsaW5n
IGEgR1BJTyBhbmQgcmVndWxhdG9ycy4KVGhlIGRyaXZlciBzaWRlIGlzIHN1cGVyIGVhc3kgdG8g
bWFuYWdlIGFzIGl0J3MgZ2VuZXJpYyAobWVhbmluZzogaXQKcGFyc2VzIGFueSBHUElPIGFuZCBy
ZWd1bGF0b3IgYXMgbG9uZyBhcyB0aGUgVVNCIElEIGlzIHJlZ2lzdGVyZWQpOgpkcml2ZXJzL3Vz
Yi9taXNjL29uYm9hcmRfdXNiX2Rldi5jCgpUaGF0IHdheSB5b3UgY2FuIGp1c3QgZGVzY3JpYmUg
dGhlIFJUTDgxODggb24gdGhlIFVTQiBidXMgYW5kIGFzc2lnbgppdCdzIHZkMzMtc3VwcGx5IHdp
dGhvdXQgaGF2aW5nIHRvIChhYil1c2UgdmJ1cy1zdXBwbHkgb2YgdGhlIFVTQgpjb250cm9sbGVy
LgoKWy4uLl0KPiArICAgICAgICAgICAgICAgc2R4Y19jX3BpbnM6IHNkeGMtYyB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgbXV4IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGdyb3VwcyA9ICJzZHhjX2QwX2MiLCAic2R4Y19kMTNfYyIsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJzZHhjX2Nsa19jIiwgInNkeGNfY21kX2MiLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic2R4Y19kNDdfYyI7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmdW5jdGlvbiA9ICJzZHhjX2MiOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgYmlhc19wdWxsX3VwOwpUaGlzIGhhcyB0byBiZSBiaWFz
LXB1bGwtdXAgKGRhc2hlcyBpbnN0ZWFkIG9mIHVuZGVyc2NvcmVzKS4KCgpCZXN0IHJlZ2FyZHMs
Ck1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
