Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC36C369AB
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Apr 2025 21:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvwtzHrriayMKSCSBll6FhG4Ta+3x9oykO6RnmLkZLQ=; b=z8ZeQW6VSPN8FP
	ZyMnoBlc2cSsjkT486gvpwWrhp5Bo7n9EN4FFZOJ8CKpomUQ3atRRs6jd+Nsc2lVpCow8nn0ROSx4
	LAs+81U8t9KoOEedxmuwM8CBJK1aMp9TbkglVYThRhobrg5yHJSzc3M5l1i3bhnBLJj1wlfeq9Zif
	Dxg5Gf2C0RBeXm8h/a2h7NNtT3eV0kzjkfsoccnxeJ4jAzaKXf57v5Ps9VMbMveDnKFmcGKBZb40d
	GIg8goaW6uE+C3/ByzG02YgxEgr+kF5/BZF848d6XuC2L4Zp9STe4fZRkNivFsW7AZxokP1c/zKdR
	UKEieRCNCmyadO7ua/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4o9J-00000007EXN-0nv8;
	Tue, 15 Apr 2025 21:48:57 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4o9G-00000007EVs-25JC
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Apr 2025 21:48:55 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-54acc04516cso1374195e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Apr 2025 14:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753732; x=1745358532; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=IPD8k/N6g/v3ha5yCyDSoHm5pb5WPLt87oMT34Wm5uhgA5O/CNtgtowy3X3JrHEybb
         2Xao50cSLVdS+1VULJxZ3t7/M2QTaOzEz87qzTeb0R+anzUyTYpQgZO9iiI1MLvr0gUc
         /5aCF+IWqet/DXDWWcV4+bDOSjizsQPjji5Ox6pgUpoqvxGVRnkLIfgIqnMlFRKB5brh
         /4qfWbYh3DEcrv5JYKeTx3C0gag3hKJMV3JsU9E2uKg9OdZWPdeoE63eQ7c9lUhIPcFS
         uRQWvcd4qKcpAmyTGfgQSWdmzKzW71l4pUVSegK+iww+Xe3+DfEAgioL+WurVTyQLCTG
         0Myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753732; x=1745358532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/GU520f/3jBAe24+ir+D2COnHV2dCfaPkORIPMWF9U=;
        b=mHO3DQcCwTQDjBT3xsdLIqq9/lBDWK4T/hCIrjDEs0EFD9gtxe5ZuMGfI/QLkFI8mi
         ni5t4eq4s6vL/ZDaq7LxJEb3YE3Y9ALTlrlsppCbxrB+K/fEOGtpWoe6xAuMOvkNhBE3
         D4uYIsmsXZ0BtUfa5nEE/XRV3tvFuBYHbQNhPtJYMVlfuM5LEc/we+bx+HANpM5Ftsuh
         piYo9ajbGqYXjJhQvHSDwLw8TyvnivWKAsZNsTaYl7bMJNk1hlDsPdE3qxweTiDvmmec
         NxUGBg5NgW61nbPPIPQXvOygN9F8nU4Me+k6fsyuylvji4fIuEczuDvkJXPv/tS1vI6E
         O9SA==
X-Forwarded-Encrypted: i=1; AJvYcCW8bUFGirzHNP5hvg0iSr7ftCW3KqtJf1NYvIuCLx/fGjDOObmTTwVb2/qjcO7qlU8Odv4Cq4wdm8bq9Hsz@lists.infradead.org
X-Gm-Message-State: AOJu0YybB1lw/LuSU23Nf8uPSxOWUxo6RWMeubQnpFCnP0zrLpafTtqM
	GDyKYvLSZ4KHpaavmK8O7drOsdLoATtSMHLY9R68bHOmMqjDTfcgfnBhDMh0cZ8oNmaNLed+ymN
	f+cFEDCm1eiD0vA/10sTHhDTGVdoO7SWrmS7IOQ==
X-Gm-Gg: ASbGncs9XZrAFQ9JntSZluO8hP+WugcJnw+Z+MAtaNr3TBaY/OF4OAjgBVfp2RToy9+
	pbSC6YC65B3ibePHPZZJ1uyu/riUzdPCCqzK/UBnMwyK8bswwcCjwJyb9eAb2843Ouroien4Pqf
	mYWLX1aum3l+FZQdLGDACQww==
X-Google-Smtp-Source: AGHT+IFSu+OKLB2VNur9Dle83J6HMvG4kflsWZSu9S8S6IR4G67eFIhSB0oS7wnO/q/UzPPA34KfjLwXTtDj9Vzih0s=
X-Received: by 2002:a05:6512:1328:b0:54b:f04:59e8 with SMTP id
 2adb3069b0e04-54d60517c07mr145437e87.23.1744753732331; Tue, 15 Apr 2025
 14:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:48:40 +0200
X-Gm-Features: ATxdqUHvlNdtzl3Q_1xgpiYLVxVG4W9MxWXBnWdrebvCbvJB7NiLnFtisrLsjeo
Message-ID: <CACRpkdZGmHqS=Ln=YF26aCLcuJOB-Zx3AUA8sSyf+Z_LJiC2Uw@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: convert GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_144854_529900_B6F44CDD 
X-CRM114-Status: UNSURE (   9.12  )
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

T24gVHVlLCBBcHIgOCwgMjAyNSBhdCA5OjE34oCvQU0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJn
bEBiZ2Rldi5wbD4gd3JvdGU6Cgo+IHN0cnVjdCBncGlvX2NoaXAgbm93IGhhcyBjYWxsYmFja3Mg
Zm9yIHNldHRpbmcgbGluZSB2YWx1ZXMgdGhhdCByZXR1cm4KPiBhbiBpbnRlZ2VyLCBhbGxvd2lu
ZyB0byBpbmRpY2F0ZSBmYWlsdXJlcy4gV2UncmUgaW4gdGhlIHByb2Nlc3Mgb2YKPiBjb252ZXJ0
aW5nIGFsbCBHUElPIGRyaXZlcnMgdG8gdXNpbmcgdGhlIG5ldyBBUEkuIFRoaXMgc2VyaWVzIGNv
bnZlcnRzCj4gdGhlIGZpcnN0IHBhcnQgb2YgcGluY3RybCBHUElPIGNvbnRyb2xsZXJzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBs
aW5hcm8ub3JnPgoKQWxsIHBhdGNoZXMgYXBwbGllZCBmb3IgbmV4dCEKCllvdXJzLApMaW51cyBX
YWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
