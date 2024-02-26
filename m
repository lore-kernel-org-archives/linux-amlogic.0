Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE56C48BF6
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 22:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1k4xx1/P7OhSrmvP6BhSsGGDFV1mkFzzYGlBU084Ls=; b=D4Kyv2VSuyv8zJ
	hyQESPuFLJtMxsUByVndxxmcHXRZfy0EzdALu6p6RqNF+8x9w69y7uDl7vbJY6RaJrr3GjA74CcTw
	ecDLL+ugKMiHIFItQ7GOp6xBs0CKM0wG8lpUORNq7ZMFdApsicQXWRJy/MpfL++2BUcnc5sk/qZex
	7Po1dMjinnOUzQcPfbVtIQnKNVkvxnnqgLvzpN9lVR92yJudjy3usfvJauUyi3fjkTlwAccZRwUAn
	D4ahp378UjMF2dCWMBpSV4e9Ls3xZ8lAnC9JCzcF0bxpL89rrPCf3Bm+BLXxgnBP/jRo0stgRFsnc
	44sp2pVpILmu62r3SGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rej68-00000002n3s-3hEM;
	Mon, 26 Feb 2024 22:05:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rej66-00000002n3G-1LIx
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 22:05:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc5d0162bcso30580105ad.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Feb 2024 14:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708985116; x=1709589916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/3wyl8Jo2S9QJLB6T+6NCzPxPyNA7mOUdaRW8YuZWw=;
        b=bBlFzmis+6eOFewBcrFeJtwybWQ58+bSDExG4/+AxWV7dfU2ucn6CXwheeOW2av04v
         RGmNr4XrnpwqtVmeEI5f07Wuf43OyBaPEPjS0o83i+hGnOw8P8XhUBlrV1/sXsI0jcCs
         VGGgizSIvVhmB0/3JtcuMbiBiZAHSdb1aRQQ/Oslz0E/+abK0y3Gec4lnRg8wyf7D0k8
         YV82I2CtwxwDmJ0tcqh/3u/tTvm2/zX2H9S6HUMCrLcgfG8Iw7MsCh4LZwUdslvVcgbg
         3UBYFA5EqQblvS2LwJb+/erCpm9PTRxQzHqUxK6D5q2G3S5Ljqr/fAaUxO0zrqnI3oR5
         TuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708985116; x=1709589916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/3wyl8Jo2S9QJLB6T+6NCzPxPyNA7mOUdaRW8YuZWw=;
        b=nK1N70UWtum7yNcSoTl/U/xUlEQcXmCwoXGvpOvMKsRfdfC9/mdSfbyYenJRo2dyaI
         eTZKe/ZUsofc0Sk+QVkayC3HzfML14vjpLUQVNQksUEAwvtvrQN5B/xlYPx9ICPWshc5
         opsJTrDFTN7PUJfdBU0PP7HYFil96RwvntOIE6S6VHax7pqD0gbtV54h6VV/1E0FEdoF
         8xkxxE8dNydHbFio9p/jm+FyqKR0TZA8BZ2cf3ITP+7OdAp4Qs4m+gM9GWHouKFkDxNW
         R7nFoCgxVxi54tJxbd6FNGsSX9CPz13iW3zIWEj3nTxrZZiZmVRn/l7rFLwwIT5Kydua
         hg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSIsIBV8EUBKs9dC6DF6ktjqs4lrGvUrCn/p6Zuzn/UJ8szNBLllfUINgTs+nuiPIVD2pW5GD9YNlJ9EMeXSkl49/skzflTtF7W9srUWVY4FA=
X-Gm-Message-State: AOJu0YxewPUA4xhfeuc7hb6cBByjBo1pGkRKvUD/aT45k3M3F3LA5pqi
	VQgIOwc9ah8IO2nBa8ySgXp4N/Fwr0EamKemmVCVaEIf7NDip+aq9HfpD0jg8axt0tQRlDeErWF
	MATng/FGNhs2rKJ/qFTDyxj5ZZik=
X-Google-Smtp-Source: AGHT+IF/GAOdaVYQdXJhgPE9e+g37fsL94g20U51TnMoE/5craeH10xNbQkGDkY7uYATSqOuqeXz+FrRGZ5PzyVFXo8=
X-Received: by 2002:a17:902:ea08:b0:1dc:1ff2:c6d6 with SMTP id
 s8-20020a170902ea0800b001dc1ff2c6d6mr8707132plg.22.1708985116478; Mon, 26 Feb
 2024 14:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20240224084030.5867-1-krzysztof.kozlowski@linaro.org>
 <20240224084030.5867-2-krzysztof.kozlowski@linaro.org> <e2cda8f8-4250-4ac5-b7ba-6069f37c1b98@linaro.org>
In-Reply-To: <e2cda8f8-4250-4ac5-b7ba-6069f37c1b98@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 26 Feb 2024 23:05:05 +0100
Message-ID: <CAFBinCAymkEJycdvBeumMVL04_7mNCdr7yGz9pKxh__-Uo3rrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm: amlogic: add Neil, Martin and
 Jerome as maintainers
To: neil.armstrong@linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140518_382903_F5DAD31B 
X-CRM114-Status: UNSURE (   7.45  )
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

T24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgOToyMeKAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+ICsgbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCj4KPiBPbiAyNC8wMi8yMDI0IDA5OjQwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+ID4gQWRkIHJlc3Qgb2YgTGludXggQW1sb2dpYyBNZXNvbiBTb0MgbWFpbnRhaW5lcnMg
YW5kIHJldmlld2VycyB0byB0aGUKPiA+IEFtbG9naWMgYm9hcmQvU29DIGJpbmRpbmcgbWFpbnRh
aW5lcnMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8
bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
