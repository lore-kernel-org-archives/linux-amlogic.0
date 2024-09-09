Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8E0ECE587
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nv90wo26uw0VJp1Wz/own2ghbyuMO1hXTCANQBhXG9g=; b=PcqrvzndFn9D6S
	u1V92fQf2fs3D0j3oqVf+kSQ+6zq5Jp0HnZhZHM5kPLf/GfniC0YblJRGA78MA9TWv8aNvVYnroWK
	6tiKUpN4U62c0MKKyAqqxvozAjBQ2bNoMWH2czr4IN9KF9QeNJLSG/WQ2c8Fc6YWY7yCLkH8GYgXw
	ih/bZZkbCGQt1jaP5jH6wvq4282XffN5iCaDsIBuMLXbhdcAM9x2ERWd/S2xtNKHIVe7NN2L2+fE8
	X9STZHtcxY7Tvb3SjNZAN87yrD7URITsDA8l0B1UyeLRrhzuUrQvnFk0fPHjSWfzwN4dPIDtrm9OZ
	gF65ORXXIZisoD5jBnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snkzL-00000003EBn-37U3;
	Mon, 09 Sep 2024 20:27:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snkyJ-00000003E47-2E3J;
	Mon, 09 Sep 2024 20:26:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20570b42f24so121275ad.1;
        Mon, 09 Sep 2024 13:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1725913610; x=1726518410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXtKTqdWWKPLqtm07H2cz2vpFpZqstjIAxUmUCHTUFg=;
        b=MRL6ecmRA1QsqZDAZ51RQhUXN+KJWzRjztySuM/A9TKV6XI6nUedtyuKBQrEIUuaJz
         aL4jK+0ZxebN1ia9zne/QkWs6mjZ1MMQONTSJ4R6H0BBuVd39E15sQ/ybQMT2DTlquhy
         LeLGuzZcgaYZ/bMf/RUenWEJEQk2qzV0Q5VkCiqV8XoPmmUnq1g4qXx2nQIo7kKBDy1Z
         n6PE/GOuCKCUNc4DZbcjoI+LkoAp+DERR7tHpnNgD7FM3Xb/PcZx798D3nOHabwNmglF
         BgB0IrALkstM7CqnY0gwzoWn7yaGKQbZLtmbBn4+0cdLh1iz/O93quEsymJ8oErzKGoM
         qx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725913610; x=1726518410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXtKTqdWWKPLqtm07H2cz2vpFpZqstjIAxUmUCHTUFg=;
        b=BMAyKaLijPiyIC6aSWMWGSRiIZsRKnyoCKe9kVcKc++1K0X9F3gm2pBeEvU93kFgyU
         GFsMGDNRFxJ10fTng3DxjZbe3SLpjFdIHdKU5uSY9X031AwH3w1beYN6DxMtzsrxXvTg
         +0YCtuGxeh4nx5AF0obY3g0CNLH8JPWJS7TXGjjB/q49DXl8DPwYESvl0Rqhl0SMdsXs
         DVolGW7ZMNMSmhHmC3wYELtyXhLv/KcxxRZ/vGZ5xiXCAXz2wcyk6u5opUY97OS1S7G9
         83Cu50Z+gbxLYoMdZlj3XsnT9F99sVLe8UrZE5oXM+hs46O5fy5JawHn9E5wMsC/xtxw
         EtAg==
X-Forwarded-Encrypted: i=1; AJvYcCWfT/QFmsAI4WNx71Q5htsfgMrwJwwMTCzVerpe8j/SoPr18v5yWluZnGDFc7QOuUJz2nKnTGBJmSu52kJE@lists.infradead.org, AJvYcCXV0Z645lmw3qoqKxYlb4l3mk53EurlxDhuDZKkP6vawH7WCaHmfKV02zKdrvA2D8dOQ79uqP6mGQ67AK8puDh3aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLySWtNzPa7eSXkf6XXLAVVEC8ZaWX7gRulWuK0eNRm3JPnz2V
	9i+SUlf3CuX0JN4/xGwOkUwKGFhd4+HhXUtIqK0Z26IRZpnNgJMfkGVYUR0eAWRTVOwmo0KA/1p
	g6CD69OsA4GAm28boyP7ngSfd7jSn3PJL
X-Google-Smtp-Source: AGHT+IE0yIiSNh7iLrnnnMSnuKkF/A5hQoR5M/1+7xbyC3kDdI8X1yQna/nY992WYvWyyRjnqrcI1fEZ9mQTOFlhE5Q=
X-Received: by 2002:a17:902:ce10:b0:206:928c:bfda with SMTP id
 d9443c01a7336-206f065b8demr138144815ad.56.1725913610159; Mon, 09 Sep 2024
 13:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240909172342.487675-2-robh@kernel.org>
In-Reply-To: <20240909172342.487675-2-robh@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Sep 2024 22:26:39 +0200
Message-ID: <CAFBinCDiV1yYHY6curqZ3xSEGSQok24=X6dz2PC91x5e88LRyQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: amlogic,meson-dwmac: Fix
 "amlogic,tx-delay-ns" schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_132651_605997_98838D52 
X-CRM114-Status: UNSURE (   8.63  )
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

T24gTW9uLCBTZXAgOSwgMjAyNCBhdCA3OjI04oCvUE0gUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUaGUgImFtbG9naWMsdHgtZGVsYXktbnMiIHByb3BlcnR5
IHNjaGVtYSBoYXMgdW5uZWNlc3NhcnkgdHlwZSByZWZlcmVuY2UKPiBhcyBpdCdzIGEgc3RhbmRh
cmQgdW5pdCBzdWZmaXgsIGFuZCB0aGUgY29uc3RyYWludHMgYXJlIGluIGZyZWVmb3JtCj4gdGV4
dCByYXRoZXIgdGhhbiBzY2hlbWEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyAoQXJt
KSA8cm9iaEBrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
