Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B3C5AE59
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 20:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VltpiQQNZN7yiGoAyq8VsfX/piazr9981Q4eqrMe5Y=; b=rAqAobagex9aX+
	HoZChMebOie+HAQV3vAZ6P1XtgoSxs0A4XwB9Qu12LL32sv2LN1D/BnEcLLZArNB1uzcaFQasL6f6
	XQgllzhrhsvVBlP09iYvmGjTklDnf/9uk6S2KVOR3k+N3/tpd3Y1Sji/uovgGPLH1+pcOWyel82nr
	fJOhV9HjELk3pPkPMSJAOMonnQyTc3zZLM3oOzDjW+rJogSVefu16Ckod/fWLD1EujzFPTq2dYqUC
	epvegXyIHbW5pk7EE7Rc1Oi2A3NJ8f6NwURxoBXQlax2dVTr0T92TfJwS9J5bfY5HD3DgNBSgdY7t
	4+nM8DN06MJ72EjmFUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXq4-0000000BkvN-46WT;
	Tue, 03 Jun 2025 20:02:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXq2-0000000Bkv4-2yhC
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 20:02:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-23228b9d684so64521775ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748980942; x=1749585742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7mYbEanim3f7HvwnSr13q0zdQduXybtOiIEIfnjJ/4=;
        b=GtZA0J85iidq1dzG1Sh6heESKjEFBVcq6HYppIwEJJRcunRP+z7z9q7xkO5yOXRf/H
         tnGFB4irp+4oeSRgdtQgLmJm/OkSGvWXaGPyqiSrLvYadoOaLg7gc52nfYop00sQD1ER
         FpCF45Hsn406lIxRWnJhYeDDfIycYQ/+5kV7oYk9b/BZ1tSYgzjnrPt4zh+AgupMe0QD
         skZ3NRlSp0sK9Z/gurOQkOSJhAjm7nygyQWWSw/5zsecmFIHm+eFBq9vmEVVopSM+4mp
         BGyRYf1MHT1DbvlefQcE9HzudwsEkOsBKQR+rXr1xel+igefKtZTfEJ2CdahzQo8oIzq
         ssSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748980942; x=1749585742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7mYbEanim3f7HvwnSr13q0zdQduXybtOiIEIfnjJ/4=;
        b=aCECpg2ldK2P4mrlqUSg0AMiZ4KlbW6HptcrVsJN7Ji0kz6DwnSUQXG5mLs7fdpAR2
         8P9WF+vF34YUWu9UAoAO0/jU4NEOwVnvatAOCFeuSNFYAVduoEFCmxWyqJwl4K1sha0y
         /XL6qS6M5KFmQNmLFhEX6M7KZBXs/XEwFIYYAXgwELHIJ1oFVMZaapIVNsBKHj0nXCoV
         BCbsZtMihS6WHypB8DungoUCqvbv27YGLYs8d6G1hY2OpI0pt9oxnRsVjs+cn7rrh506
         Jwz4IYJOvDE6vPyXhFknKshtv9xFzQdWbKFM40RoIMsyhd8d10X1GlNPo+3c4wP0v6Cf
         d8EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuWQz0XewFW7sQaShLFtG7rnfqtwQizV67Ul79dJclZNexGIBKVOej656xGu5ghhHSuTkyr58n0chuEjNQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0DIKD2Z5alXoMYMtiUnW6zNDp33zi2stYI9wEfV0hpq1IdmGz
	C4fqD9QDot6GChGQAJRxXvFRaUs3nh1VTfkc4Ge3aYeY8ZHX6//u0SSWpCrm6wf/1dq6L3O/FoA
	EEqh47DogZqI3bcTLVkkzinNt32FnlDo=
X-Gm-Gg: ASbGncuBt4ElT8RQpLwh9oRkp1GYceuGfGvTxklZAbLF4K6X34ruD9hS0aJ6mUVTcHP
	BPy07kn0/vidLZZ+tOHJ6HdQnuRbN3JBumi2OyKgDGyLMs8Pej3G50Hh/97WuT0d078hypZpUG6
	UCGftsVj50uzq2PaQUND3xSGhLLWoFuP4hdERepy7hkHjvyraRcvV9ldAYMcGkkM6LtA==
X-Google-Smtp-Source: AGHT+IGbCwQsYLgw99ZZfNEPT9b46Uas7cFFHBva8qR3JV9DepyWxOalQXIyM+mxa3HesqLdAmFamwLHhSjFWut5iuQ=
X-Received: by 2002:a17:902:ce03:b0:234:a139:11f0 with SMTP id
 d9443c01a7336-235e1129193mr836975ad.7.1748980941649; Tue, 03 Jun 2025
 13:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748933789.git.zhoubinbin@loongson.cn> <592c6674a83a80558e55b143c483e29dcbfef1fd.1748933789.git.zhoubinbin@loongson.cn>
In-Reply-To: <592c6674a83a80558e55b143c483e29dcbfef1fd.1748933789.git.zhoubinbin@loongson.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Jun 2025 22:02:10 +0200
X-Gm-Features: AX0GCFuw48Uhx0mbdlqHrrvpfoZrKnoWd5gzYi6VJl6U1CBZuhlEsqxmUNyYRLI
Message-ID: <CAFBinCD2-u_6M3Lq7vkusxjp0XDoaTGu1Dyq4D1dFN1dPAHgKg@mail.gmail.com>
Subject: Re: [PATCH v3 11/36] mmc: meson-mx-sdhc: Use devm_mmc_alloc_host() helper
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_130222_774666_609681D5 
X-CRM114-Status: UNSURE (   7.34  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCAyOjI24oCvUE0gQmluYmluIFpob3UgPHpob3ViaW5iaW5A
bG9vbmdzb24uY24+IHdyb3RlOgo+Cj4gVXNlIG5ldyBmdW5jdGlvbiBkZXZtX21tY19hbGxvY19o
b3N0KCkgdG8gc2ltcGxpZnkgdGhlIGNvZGUuCj4KPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5laWwu
YXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJy
ZS5jb20+Cj4gQ2M6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+IENjOiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+
IENjOiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBSZXZpZXdlZC1ieTogSHVh
Y2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gU2lnbmVkLW9mZi1ieTogQmluYmlu
IFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
