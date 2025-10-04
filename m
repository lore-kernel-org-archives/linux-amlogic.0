Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E156CAC5BB
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Oct 2025 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04u6KeqTp9l3kQFs4hOQ6RdOQCNXkpeSB8Nx6muuCII=; b=AYV5tpJeYe7u7F
	uxKPF9yBD2q9NeNUPu+rd+ItRRtsEa9xX/S789XW2KLbuVoSjpYprn5QWWw28WOOKK8Rw0XCXqMHb
	k5aX8x8xdyylgwHSAzhXDolMSJnx/xzNsBu0W8PW5cSH2jc25CpNCfgaOudgYhE0ETUBKZZwMnmtW
	BAfKDD8GicExNnP8DkF8KyuGTLo3t4hlhZPn6TO3Tm5y3ddS54YoCytfE0kHTY3TIJOzq3BkoK2cp
	q8BAUPOezIzJzHfiVsVhFujVpgOie1dRaWFcrdMDwP0vPbLBCVPW/dN+oIihkURPsourVlFJZexBA
	IOvk8GU7UBpXTYCGi6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58Qb-0000000DyvX-34La;
	Sat, 04 Oct 2025 20:00:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58QZ-0000000Dytc-2b9G
	for linux-amlogic@lists.infradead.org;
	Sat, 04 Oct 2025 20:00:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-27d69771e3eso23463405ad.3
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Oct 2025 13:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759608023; x=1760212823; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7aP5ANWHznsHRPpXqT15itWt6xDKWtsAwFYNj6Ecek=;
        b=UGJAoCt84z/ChgyVyda6K1OOXyUy3vzfnCRYoGrn031/v1pKDx2syJGMzp+aos/isO
         uHqLysfoNd1fD/eaGvTvnarfr7GDHhJHtjPLb6r/V22hntAkSDdT7x8MXt0KTNBUPoyF
         74j8Ng3grlJ2O/+oiPb0fjGkF8odxbo26wQlQkC6IPzovFJjb2qLIamEWYlhbG6tl1Ak
         xKcQO2+963wt9Tb70wXzjdycO5c8iO1EbKFVWo9fKdNvESNlHGlTdSEE7UbktiW34nb8
         PjQhtRjTqfpUwM61+77luhQxGbp+uo0CWGUPL90qIIaF3J+uygq5BBkPszDvqB9v2zjG
         kM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759608023; x=1760212823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7aP5ANWHznsHRPpXqT15itWt6xDKWtsAwFYNj6Ecek=;
        b=kcwPgFrTFen1ACL5rcaUXUr1PleWWzYh6iTxaLcSV3uKJ0InUjsOqfioPkZeXQcv0E
         +36PjX0OZYt3cLhShwewG692kAzug7KKnaUrE6MmIa01+2S1x0gvefCtVBUcIeesvRhm
         PFCi5MNsJqbVXtHBdXwYnsgwCoDys3YEZ7JozxHQAaPvPXL/qlrBz4RMU9rU/Mqg8gZv
         vp+0rR97tWxaJqk8Jg9irG9zee4eht6pe581udNTO/XbCzaIQep9pGBloow9ndtnVrKm
         OR4cbck+2NPPcmePG/rDm8xI6AJ3g79XL86qTB42Iquhks+bW5cPLXoREd5Uj0WO/a1R
         vDhw==
X-Forwarded-Encrypted: i=1; AJvYcCUm6iRQ1LXq3rnPV0q5qHVaOz+LJsfwbRRg7mdmRCwUDOUyFVSDvX6AbCxm43Xt4OT+oiFiE4BFee5HI7GM@lists.infradead.org
X-Gm-Message-State: AOJu0YzP7TjMc7BJ8DSWTvLIMW7WfMTfEuFsCeDp3ND/pY0rMjqTV+wz
	k1JEftGEUC/usj7HnpmFCHcJOpYcriG2LR5Qlji6ScJOpZNXrd1jH+lcIcLhcg4UPSZo/cLx/N4
	zhJVHJD22KwmrMAgwcOMKMiG0XVmZYCo=
X-Gm-Gg: ASbGncv7nGZu2u5FkHF2+n91BDx3jA0Myt3QmWbTPDkWt0EowP6O8OPEDc4UWfWzwSr
	wvGXGp+foM9i2LSBY2IdcElo3cNIk826fdMG2cspbJSDijioU0SxjjCcKLdYk/eRGerkvbuuJ1C
	xDP1Y+2xHaWk5lqs/GdfbGfq8Ul8CIygUUDHfpVZHVJMkdWuK5IBhGR9k9Bm/nUU40z/7NrKdRy
	wTcVXtJSPbhq2YXx0mPnFLttOFWir6kTy54cS1nO1xSdtuV8rW4fPQpB6s7ZWZO
X-Google-Smtp-Source: AGHT+IGt39Nt9p5q066AwuwZ4TSsvdBdT0kbd0QVrdYOaUXToPuPqoewdXCA9vnV1UglZ/I0nfi7H/q2TLlH53BiA4k=
X-Received: by 2002:a17:903:b8c:b0:276:76e1:2e84 with SMTP id
 d9443c01a7336-28e9a542c2bmr87291145ad.3.1759608022835; Sat, 04 Oct 2025
 13:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com>
In-Reply-To: <20250927125006.824293-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 22:00:11 +0200
X-Gm-Features: AS18NWCuGwewacgkM0Ab0HEEi4QG9Szb0DHvCKwfduJRn9-rG355CymOveg6Dfw
Message-ID: <CAFBinCD9qq0_ppwt9gbyKW3kcSr8PTX+rnVPbrM33YOABxSoGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for Tanix TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_130023_655843_FDAC01FF 
X-CRM114-Status: UNSURE (   7.30  )
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

T24gU2F0LCBTZXAgMjcsIDIwMjUgYXQgMjo1MOKAr1BNIENocmlzdGlhbiBIZXdpdHQKPGNocmlz
dGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBPcmFudGggVGFuaXggVFg5IFBy
byBpcyBhbiBBbmRyb2lkIFNUQiB1c2luZyB0aGUgQW1sb2dpYyBTOTEyIGNoaXAKPgo+IFNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgpS
ZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
