Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F79FC19F32
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2025 23:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yp2SO58lYLleyBlyb/OTtVqDpV0QMUtrXBuEa2RZvEE=; b=DCec09Aob9nIsM
	L2UFvbTQLCqbzOgU9xrjI3vkYApjCWfXcSuSPS4jzPBCUZF/7wcXnTRb0Ru+DcRg4tuDzGtaK1BIN
	MXwqqSJxjXdkLD2dvE4aKZCEbpM3hZwNwFYYH7imeWpA2TkRnstEsQS8mBbZ5nxB+1O+o2GGkgFpW
	6OVU+MNXHZhYIMR+98zMTLAJqet9KOjIzxTXAmzU3bdqUmOZ4MIUuebnx3SvU0gSemJzbzZvjd49B
	YcqoVMFPU0t1EG2q8Bsp16YSEJlDC+tjvtJaPhNou6mX5S2ubWzmoZ7KrszN5Dgu8Gr0zVsiUz4l8
	lHQzdiXuWKTBeEpRYSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmyR-000000097T4-3rP0;
	Thu, 27 Feb 2025 23:07:23 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmyO-000000097QF-3XpK
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Feb 2025 23:07:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30b909f0629so3909811fa.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Feb 2025 15:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740697639; x=1741302439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frw/Kxp/v2+PP+mGe/xu93cFHbH9YYmz+7s+Ghe+Vqk=;
        b=cQutJJx0t/CKjGHEGBApDcCNak8ggrM4JETKZACyZA7iygT8G/X6Oj7huDoGH53EIa
         4FfVbm/NWma6OEFrhTyGBOnUmP1+v97MZv0nqrYSyt3rf7FqK15dkyRVdcE/G7DgvfTA
         DosA453jAoxNxPB76CFfXv7lZFketiEud/XGquxLRy8c2MxLmZ3Ii0cpj2kP7E76szWy
         B2mDKvVGY/AXERXJIYVQcPX+ShHSRHNcRY0Q6QMZg5mdYZmlkIgHOAz6uDGOdB+7CAmK
         QRuPaP5MAcAUPtKEKt/7leRMk5XfjgnhrFUqNh+7HyT1OREA2HHDTTiTFkGS1UtKVOo9
         8Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740697639; x=1741302439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frw/Kxp/v2+PP+mGe/xu93cFHbH9YYmz+7s+Ghe+Vqk=;
        b=FdS8ph7nB1i/M6vPszZzsO5wGkUpfUFXAdFJzdI9QThXXH5GS34TKELf2QtDXf7gw7
         h2eUz20wlbIoAl1EOzpdCftmop0ZLGBcVOM5jZKwoU86ZXE+yk/dRg8/CoSCxvR9/kZd
         Rmwy+r4ynmcTOr1N6f9/qt0zW4JJ5MrYOQncME6enDNHYU60bUPkxsUepzI0XR0rVxl1
         NAOKwc0btvoy7+1D6zHl8U5t/R2ADtqK9AMXCIPuPRFGx4407pQmQ+E2hQEiMKeg8VRF
         MpEiE6v+5NK1RN+87QvyiWlWYzas+1eWpPYlvcS97PCs3PsiujBth6czVg9u2JYNq6O3
         ku6w==
X-Forwarded-Encrypted: i=1; AJvYcCVV7oNkXJVDYAeg/HfK2xwCPe83Q8oZBGbGMAxX9NjjpIgWof6NGhGcpJovr7W7mJfy07f78JyM1AaT0kNn@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ+J8VeUSTwAUbzJgvaFc/MGZ1ndo6Tv5O3GN5pzbQp8YATEvj
	YvWZ/cRdueAnPRq8tDC7fXOHnpmlkETEUEAd5tHokvGkbQbn5XdEEqxesGaGlKAdKRSYvqmGHIg
	eTEw2IfFLwAfNLBz2eLOewVTaTvSqGKbU9SmmHA==
X-Gm-Gg: ASbGncvkcqusKPJQpoGW9PZ30BFzH2Bct4/AlBQPnAvRG1BdXzUEIRTiYkArtCKzYy0
	dhFtUKSj63uMbaMk2HZ6Mya+92i3CO1+ShOqzJ4ylrRgzrbDGIyhUnI67vWJpyW7d0aJ9A/4zPm
	9+xOgGtHk=
X-Google-Smtp-Source: AGHT+IFufz181XNYlSjaAjssVbP9sbOQz0B9cNRA45vok7xAon3DLgbajO4WEtqa7uIwsizRpA7u/lhxgF69lTQZ82w=
X-Received: by 2002:a05:651c:2105:b0:30a:2a8a:e4d0 with SMTP id
 38308e7fff4ca-30b90a8247cmr3926491fa.17.1740697639007; Thu, 27 Feb 2025
 15:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:07:07 +0100
X-Gm-Features: AQ5f1JqjsVFh7X8JQClBDzM8iluOtRQbPulUgXhGdh38CQTozMVRauwBZfmmZkc
Message-ID: <CACRpkdZg-9Zr3f7zG36x7jGvT46FRfRJ40khNZDdYb01-BGigw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_150720_883453_978B7ED5 
X-CRM114-Status: UNSURE (   7.02  )
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

SGkgWGlhbndlaSwKCkkgYXBwbGllZCBwYXRjaGVzIDEsIDIsIDMgYW5kIDUgdG8gdGhlIHBpbmN0
cmwgdHJlZSBvbiB0aGlzCmltbXV0YWJsZSBicmFuY2g6Cmh0dHBzOi8vd2ViLmdpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9saW51c3cvbGludXgtcGluY3RybC5naXQvbG9n
Lz9oPWliLWFtbG9naWMtYTQKCk9uIFdlZCwgRmViIDEyLCAyMDI1IGF0IDY6MjTigK9BTSBYaWFu
d2VpIFpoYW8gdmlhIEI0IFJlbGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBr
ZXJuZWwub3JnPiB3cm90ZToKCj4gICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogYTQ6IGFkZCBw
aW5jdHJsIG5vZGUKClBsZWFzZSBmdW5uZWwgdGhpcyBwYXRjaCB0aHJvdWdoIHRoZSBTb0MgdHJl
ZS4KCklmIHRoZXJlIGFyZSBkZXBlbmRlbmNpZXMsIHRoZXkgY2FuIGJlIHB1bGxlZCBpbiBmcm9t
IHRoZSBpbW11dGFibGUKYnJhbmNoLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
