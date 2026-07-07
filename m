Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B45C44503
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PapYHC7l8veBygyRU6pR9MUssQgowxxcqpkILn/M98=; b=QxjYvF3EaqKCfm
	SwHXdvuj6n/3w9JPNwUpqNbZhUXdPDM66fm+7380V/xFZ0enL+GdBXMuvJhblh9GLAl72gQ94pxNs
	F2O/Uv2psWSBEdy7YvPD6051krij/X4TsBgkcmjqWncVGpoOG+cvER/IA7H6jIoN5eg6GYc1cw6mJ
	8TNTNdtGaT7MAd7GL9o0sHG5TsLkblo4Ct28K4Bo5zjyzCLjI25LXjbl/pyq+s1RrzokPvk70pyYH
	Uq+f0E00lzkBGsGhm27NQ7k1iQRxsREbHcD3oN3bs7GOPgADiLQ/eXNlbPW2E4NvewNbUuGafw1RX
	bAl+kLDjLfjlhW2fERQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBir-0000000FnV1-0SNQ;
	Tue, 07 Jul 2026 19:44:49 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBii-0000000FnMq-0Qxr
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:44:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cad4170e8eso55229635ad.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783453479; cv=none;
        d=google.com; s=arc-20260327;
        b=dLgfakYdAu4o4x/76hoJe5BT4VDxToHN+8yGgQk9gNQePNUFp5FHVGBGmp83CRGx5S
         gx1VEPh3HVW5B7Xkphllu8qzRxcWFTBmvEIim2QWTcHRwIi4PeVGTt0PJsQxrzcfEBUZ
         65pm9H9SIPQqrWZ94W6XhbbZjRtHl1RUo8vylX8ex6mgJ5tj3X75qQIH/Q6b/rqgtPJm
         r9Ump+4tFEQ1vVX+1sxONSYBf7s/FDB9tyHAh42ysHyGyGquInEoUS55uPj9elj53/hd
         2KxaNMtJpZLA80aSwxRptFJ9ZEdD0ENLeJuZppl0pyEf6T1bQnPQC2rMumQd7oPRI7YR
         PfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HtfrFM7rpGnX8vGtZgY4JOSL1xoMsykPlMzTpKQpNPs=;
        fh=AkW1VsPVqBn49VMz0dUAVCe1RUAoxRN/IiELOTDbIYw=;
        b=o+LR4SXJ6Rbg3koNafh0I9Y7mqwyMwAekuF2sLnDLuDazznrzBu5qwhxkdL0wt30j1
         5OzUT5dgGkpnGt9QvKuugbjImzyIfTBOgBchWRoF9/y1RQoKMKf0birlf7iuKB1V8IsA
         kYS+kNpmZzrn/ij5w8x3nbRkxGeDp9NpfVY2Sn++kJmQsulizJhOpKOgXGZ4OuctPtz8
         9sRGYbubc0+uv6AcHT4lHpu7ofiQrEdOtyIwSx6KKNMCfAVwTDEbLZXRVVdTsQzLtfyb
         AJJYgvgtTi4+EnkMJY3xnUvlVDmAsSIHVM6nDduMrlO5UnsNDFbLqER6HWgHvwAHXiFr
         epaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783453479; x=1784058279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtfrFM7rpGnX8vGtZgY4JOSL1xoMsykPlMzTpKQpNPs=;
        b=T2D0UUO83VDVSE4QeR/24xezCkfm22A8fLiEK0EwMi4c6pd03zzTGTspEYcfsUPpir
         R744gE0UvhjUtURof3k0Zw25OEHkgKLEIuj7eXghI1Gw4iSbMynW15p1xnr9VJJad6pH
         onHhGICD6teAmglB1IgNrdDJyn1q+tZf7oU581aE6bBnOqMr9C5Ob0aKqWaxhPrWNoR/
         ADALF7BHCOJ4g8p0i3qnoQFcmoAlQBIGkZ0K9GXXxKUpdaUsP34graINBLn/es0i8NGn
         59mwt27DTxAVd0dfxPTGyYaZPTVvfYJmegQEpaS6XCKkw24Iiv5wJA6tSyBWh5+F3T45
         JXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453479; x=1784058279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HtfrFM7rpGnX8vGtZgY4JOSL1xoMsykPlMzTpKQpNPs=;
        b=KameU+71TfTQetxcovVp0O5ARY8E65sivjvkfjCGYYih3fni6RtceKWGAxL7CxFJyQ
         SBXjwd1bdRTIlUWUAkV6FM2ysbGQPuN5aNAXNxq/y2q7slNVJTWrWzJLxcmIoIgFjM5H
         IXYBrvKv5LsG/owxkDEFVCnb8EgGR8gMKD0JvOech+1geZh+gBTmzIL3xCqArpX7eB9b
         b0wcVkYRZH8hvUSNCv6GMMbHyzGzf8uP12IH3nQRMY4if6Zy7yl68m5iSTRxKNBP8UBW
         yu7Mf4YQPzbkUlyQ5UeUcIULKpJ+8VgWshCpL1XHmxl+xI+PhN1ucT1LbUSL143lAWy/
         FClg==
X-Forwarded-Encrypted: i=1; AHgh+RrtZA6wB8IGOqvEjMhG4kwaZdl8MQZ/8Vs6eyVoq5AqEneZjrzb91Jbip3h3v7/WJpBilxM6aPTVd03sNwV@lists.infradead.org
X-Gm-Message-State: AOJu0YwSuqyTPEV20ohQx8GdNdgBjptGHpqoqQvVI801GAUOZu3xOPwv
	eOtUuNtmKr29C0wVuCdcweGOUoY709LsteFVA2N5TMDnqiVJQsWGEKQ1+Sb/+uT+FrwwlaWIeWR
	o9AeU3cmhcOcr4SYZ8AVIKLZb8R9RvT8=
X-Gm-Gg: AfdE7cn/Bq/nOpVCCG1oVvMJFuEoUQUPqN+tdIwjr/IlkT3gHZx0PlBzq4bhAJtZZGp
	OmPOyAhNjT5sjIZkkEDxUp/P9PiORMSnHCrHMRtNA9W5ojODNAcxmrwof03cU1ox2QWMjtXeiEj
	pdd2JgWD7z5717NTPCIDEcIf8lUXmf8FZpCXm2ifgQg7QYwPtVzLLjQEFr3ezWtg3JdOdSFLiBq
	PbTzjzbYV3j3c8w5YyVgTwNlmF1lnHKpV1ThBBKHhBg8kUoaX5PqZknNab5duQfqkIayZotaXOm
	kTFIGCw9GFCv9/GziWzH6pDBlQ==
X-Received: by 2002:a17:902:f645:b0:2ca:9d5a:8b6c with SMTP id
 d9443c01a7336-2ccbe3fcc82mr64122445ad.5.1783453479150; Tue, 07 Jul 2026
 12:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr> <20260702-add-mcu-fan-khadas-vim4-v8-8-244feee91a36@aliel.fr>
In-Reply-To: <20260702-add-mcu-fan-khadas-vim4-v8-8-244feee91a36@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:44:28 +0200
X-Gm-Features: AVVi8CdKrhqOEXxfOyDGizCGSCM2_7htBspGi7RIbYxEuj_pMgbN59CYzvH2GP4
Message-ID: <CAFBinCCkpgta_QfqDzye2cD46_Wad=2FO=oBcw9_zkxzQp3OAA@mail.gmail.com>
Subject: Re: [PATCH v8 8/8] arm64: dts: amlogic: t7: khadas-vim4: Add i2c MCU
 fan node
To: linux-kernel-dev@aliel.fr
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Beniamino Galvani <b.galvani@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_124440_208973_EB62908C 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBKdWwgMiwgMjAyNiBhdCAxMTo1N+KAr0FNIFJvbmFsZCBDbGF2ZWF1IHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCtsaW51eC1rZXJuZWwtZGV2LmFsaWVsLmZyQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gRnJvbTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4K
PiBFbmFibGUgYW5kIGNvbmZpZ3VyZSBpMmMgTUNVIG5vZGUgdG8gZ2V0IGZhbiB3b3JraW5nIG9u
IEtoYWRhcyBWSU00Lgo+Cj4gUmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1r
ZXJuZWwtZGV2QGFsaWVsLmZyPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
