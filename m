Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1017CC36010
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 21:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cq08IcDtZ1Bd81DTjNSeA5pnlDGrAOWHhsAgdCwrMhQ=; b=XfCRKptynk5rkj
	h0b8qZeMvfloZHoWX4xRGJfis6cm3iV6f5XHYOfWbouOAiInGnATO5XVeCM9jpq1RrcEpUQdJHHIq
	102H901PNsMPfQvneLhWWmpRIx+t7IFlr6gtPrcEMAdK4kWbsS2JLr8djv3bDenVeWJA2NCI4YJCH
	wASrPj/XGFqO9iFkT/U4Xwmja56GtkjOe0fYACJF4yp690Ita2cS6PlvLPBKcGmBxiSMOFkJJb0YY
	Ay11DI0/n2rvvyausZVNz6dkZu+C0nBC+JIdsbuS9jM4bTDiqAsyeUFKsPqHvq9YWyiUEHYBOgMyI
	WcvKxJDj54ShckvfKiBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GhZ-00000005Sxy-0CKY;
	Tue, 08 Apr 2025 21:41:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GeY-00000005SZg-3NWN;
	Tue, 08 Apr 2025 21:38:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223fb0f619dso61702605ad.1;
        Tue, 08 Apr 2025 14:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744148322; x=1744753122; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhWMPbyYndeNm1NHRZ9Pdb3C62NE+jGntpBEcNTlT7o=;
        b=Ixo0Hc2BBYogV8j3pNkh76GYGkG1Na1j/Dyq1dwFjp9WJ6FbXfjLWWtgumYBKDjp8A
         GCaYXtecD1pXRLDq9xdT+VSwRd/SitpZurFDZX2dnK6lF/TmiNUlJ1MplbDtZy/bpMBu
         3dTyzns3PEyR9gGRZmQhr5FMqsS9VUR48RLNWBkIYcD8bfSULli49/Qg+xxGit8ewzkG
         /4vQBxyPULsnCvEYJZjpTl9+/bV56aijdd7RU6jIrW69HU6u6lD4hkXjHJp28QcLMxAe
         2NEqYrPYGhKFqSfgWG/N58R2Rmo+gFA2fpAmpG8WIvjhx+utBBl9vJl0JMQCkAgwqzWL
         CzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744148322; x=1744753122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhWMPbyYndeNm1NHRZ9Pdb3C62NE+jGntpBEcNTlT7o=;
        b=Q8RDmeu6vq08mROKyAsZnC4hdzjGr76D48vSElsf92bWzKJO6V9GOV2Y9UHWmsxpXD
         DJNXQekbEJmYHRbfTc3TC3+PJpsVuCcPoPcPlkkw4nHoSAsG/fryP1swlzRDn1pGIX6S
         rICi5abqOo2kjZyeNdu2NFBo3kjs7sB5JmQuV4wqv3XwX1GYzIQtSjOqfsGfUX+cDslI
         gDYvMFsLMK+hd7A9mvC5FNodBwvn6CBT3mALZRQVirCSBLhjIWYzY0l72g0d2QFjPy8z
         r5aSqL+ptAOxOQn/tv9lRsSWFiMfJ6G2DTCPYiDNmgmBKST6AEisdl3LY/cLA13dryj7
         UsMw==
X-Forwarded-Encrypted: i=1; AJvYcCUtWD5fWNFNkDIl2GXjQVVbI1fpZ2Z2efPqzHwzexR9Ys2cJ03qLfUJ/FUEmfRffjLtayDZPMsWP/f+JCgI@lists.infradead.org, AJvYcCVS9rQgIskP2MIuQr/V3kkY4FhVRA5CSiw8NakH8mkugw4JwlG1VaYPCshiu8ZrLGbtxgh7QqQuNYmtzisTjfSKlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyBXzmifXplOaxAJOVuR31pnqdWeACnmoxax88ZMurMBRoUqT6
	w8CD0HM6th8+pJ6psQckWwgbhutr/Pw9RSytKAN7MhquPr64w6CMcO2Ew8c/LZyvD13sFSAXI91
	JKIdxjz01tbvUN0mv7pIEQ1Wh2/k=
X-Gm-Gg: ASbGncuJbrTd0+Nm/HGdi/9muKyw9zBhcphN9wWb+DBaiGqVFKphLg4zdkaAribGRjK
	xVBSIaTxwGm9HlEVBu9y49j8nYRmfVbSQEFX7cBSpLnf+bZpTpYTj3IjIX9gFdn1AeVtP1JSFpA
	nrjtTnGeAOMSqkF5FmSGhMgSrVtm+uN0gkQi91wYeC
X-Google-Smtp-Source: AGHT+IFMZotDtWWAJlBzYOHbY6eZuROd8g46qqXTeR8HSTz+D0BC75aZwtJWVAGQnGX5SFSxfBqUCvgcV0HR+ALG1Sk=
X-Received: by 2002:a17:902:ec86:b0:223:5e6a:57ab with SMTP id
 d9443c01a7336-22ac2a2993cmr9011395ad.39.1744148322097; Tue, 08 Apr 2025
 14:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Apr 2025 23:38:30 +0200
X-Gm-Features: ATxdqUFqmoWg6ZQUVk7ZN8EWhyXPDuE43IZRW9OybjmWPW4EA1wKzp3juxP0OpY
Message-ID: <CAFBinCCCH_=Ji4qu_pF_umDhJp3m_osk62gFH5_1bRRvgOx7-g@mail.gmail.com>
Subject: Re: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_143842_842624_753F029B 
X-CRM114-Status: UNSURE (   8.52  )
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

T24gVHVlLCBBcHIgOCwgMjAyNSBhdCA5OjI04oCvQU0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cj4KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+Cj4KPiBzdHJ1Y3QgZ3Bpb19jaGlwIG5vdyBoYXMgY2Fs
bGJhY2tzIGZvciBzZXR0aW5nIGxpbmUgdmFsdWVzIHRoYXQgcmV0dXJuCj4gYW4gaW50ZWdlciwg
YWxsb3dpbmcgdG8gaW5kaWNhdGUgZmFpbHVyZXMuIENvbnZlcnQgdGhlIGRyaXZlciB0byB1c2lu
Zwo+IHRoZW0uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6
LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
