Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9604DCEB2FD
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2024 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcNu2AosN1MspgYj99nNPh1iD23SAMwc7wBqRSCFTEM=; b=ANmOZnivI2eqN4
	RlHjaVn+IOqIMwscQkui3uZqfFticBDIdkbhaDvdV4mjbnqQmTnp+dI38HMCMt35q4Kc5IgERcFWG
	oZs6KOHN6bKbyvOxxKYZsoQ6B7k7MqunHQTiHhp4liRvwuvz0DR4VmQKW1gTrRM+gmb68rO/rZj4O
	A6fLjKV6lslz3Tr+99gYuMtcUSBn/IbLOQAp28H2Tr2Rr6mbQlwHHAOrRiIyhNjE8lIJ+RMtOfhwk
	WTVhCKA04xSTYEhwzR4pwRp/iMEHpLffjZMNp7+m8fFwqGJRR4n4eFVBH6frTVSei/xPdwoXsQ/Ay
	BrCmMMId9I+ty1umV+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcqR-00000002vI9-04lK;
	Tue, 01 Oct 2024 13:23:15 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svcpB-00000002v3y-1E5a
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Oct 2024 13:21:58 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e25cb262769so4854840276.0
        for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2024 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727788915; x=1728393715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyEcKeEaGeyjn3FmCQILe/HAvSQ7EjvyAoQhRa/81EQ=;
        b=OvcKZ3yWABxACt8QWh86rpUrXOeLVKIqePKpmsuldevDxlc0WfoLbblLtrPyU3S1+M
         xXQnXPqLaq2k/Fi1vab/ZXYFcyqLdhgpENmcE/UV1eODCGWnsosiPDHVQxUXcU/cA/W6
         b4oHmxrNvsAoaJYtRVKUL7Rp+E6h50tRV21duhQ4kbi5MYybFdA+aC42v/XDM3nhF5zT
         6KTVZUGta2JliU5ya2zBn+9NEX7/eaZm6cZkPguxaBY+ElkOS2YghFoU1FsrO5A3wobw
         XZ7yb7y5MQBDdR7GlYD3S9pvd4aoxc+KvL6W0gbb+Zvy6/dXSJSqGsEeAT4wH2tgYes3
         Sp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788915; x=1728393715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyEcKeEaGeyjn3FmCQILe/HAvSQ7EjvyAoQhRa/81EQ=;
        b=NmUa6ssXa0kMsXOijcSkSetUr09ePdJqvSf6It3gKipvR3+C5DI+a4iz+hIyvU9VH5
         tQUfDhlV3buxgrbjFEC+QLyo0FpusLrC3zfMhcYHnUryitdhRRdy4YVSUaG61PvneWdb
         izWjPKp/nLeMd68QI+ZTIl84pib9HJ5aZ/ZJuBQnhAMX3FJgBVNl2TqU1+FVRkzv1SQx
         ZQ2LZ2pJio2YuJ3cdrdNUqBgSmkpO0nUqBtY8f7ORuB1Fr1gsO4swEApc71pGQffZ/op
         HDkXlluGnLFMoJ9Rym3XOQnIS4TAb1nIdfcud20CbOSzoDo5zK7nLqMqwhmiGFIDbm+h
         EV6w==
X-Forwarded-Encrypted: i=1; AJvYcCUtA9PcDdGJF8dPjBWzJb16dDsCYcCu7djdivrXNvfLbdNZWAH3pHukbogSBiV7NPlA0UWzvNYYEAwxqvqq@lists.infradead.org
X-Gm-Message-State: AOJu0YwkG3QJ99dNjSgWztX9MkC4hbuYZ6nv2jW5n8fC6mgASN5g8YA4
	J5T8PIlrxLHx7KOicstUjTy8a/UPM2k7+mWmATTlAdtoHp7LAuylAohtQMbQqnsqIdEQrhD3YYd
	KaZH6M9e6pp9tIFy+f45yfYEAoBoKQ+eglc/r3g==
X-Google-Smtp-Source: AGHT+IFX+RG9oTFLQI1ImSBKJqO6cvjvCh73Pi/+D7i6lN9FLnM4YRXO332XYCzrUNg6/1KlbELqPZKC4ieZWZ8y//E=
X-Received: by 2002:a05:6902:15c3:b0:e26:3659:577c with SMTP id
 3f1490d57ef6-e26365959acmr260283276.49.1727788915541; Tue, 01 Oct 2024
 06:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Oct 2024 15:21:40 +0200
Message-ID: <CACRpkdau=4jrL5zWCwDOtcggm05XSXCjUrCr0t2MtAUC8TdR3w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,meson-pinctrl: lower
 gpio-line-names minItems for meson8b
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_062157_338231_63874786 
X-CRM114-Status: UNSURE (   8.13  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgNToyNOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gVGhlIEFtbG9naWMgTWVzb244YiBTb0MgaGFz
IDgzIENCVVMgR1BJT3MsIHRodXMgbG93ZXIgdGhlIG1pbkl0ZW1zCj4gZm9yIGdwaW8tbGluZS1u
YW1lcyB0byBhY2NvdW50IGZvciBpdCwgZml4aW5nIERUQnMgY2hlY2sgb24gTWVzb244Ygo+IGJh
c2VkIGJvYXJkcy4KPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPgoKUGF0Y2ggYXBwbGllZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
