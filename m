Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E93CA0EE6
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Aug 2025 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b4Og9QlD7ytcItZokhIYw8GNtvaw6DEqvOZ6z/w4M2w=; b=o9nCBse3/gGZLd
	IkdP/o+4Vn8lLvlSN43TohcITkyJthPXzgXzHePb+jR3/Q2yzYkcdg56rRr3rxSBo3SX1u4G3cqBx
	1E0VsUM7poNvZRZUrjcCB2454tF+0KxoNpiOktF33QmaHqJZA/vcB9vcDCwxq2FEPW6q4I7HNYdn+
	xtTTHrRgyZUoj8/09Oa4ldqMLj0+rbQbarQyziWahlQPkJJ4DdoC5mfzl4FiXvY/TsbT6uvoQWcuO
	9ZeW1bbowLbrfJYsEeGXFcD+NVZxCc/uHYBF82gUFbwG5FB7jmNlOs13PGXMs8ErW7ensdyv5I/9Y
	I4Z12YE0bPdCDiclQrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNi7-0000000AoGB-3hA5;
	Tue, 19 Aug 2025 14:53:15 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLJ3-0000000APTy-3WdC
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Aug 2025 12:19:14 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-333f8db5aedso37886671fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 19 Aug 2025 05:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605952; x=1756210752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=;
        b=KQUQjs6RxiUujNOB7qpt3C6yy8EeQ08XP96Gi2wZDUanYqRZbcsdpS+3MhN0tFgDeH
         IyEd9DVazKmMLnfDHtgFH9KmfAeKuvCeNF1xcr6it1JVlE8rwrMf+HwOpmucxKRObfEa
         jW3tDr7g9Aab9m52T6r+Q0GpWA6HEpNq0+wIsWvP1R4/T+I5kFAH4ui8IoC9uPqCzf8S
         w42zT0YzgP2EZhUq1v3tYXRjKcbqjLK275yZWcnU3G13+SnErvA5CC/peypChXBy7Ouq
         P9pJINBNbTOWVGpGdk02JTS74+KgnPtMgdHjbYziP2YvpgQhbvgJ4DBc0VclbwKUQCHn
         fcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605952; x=1756210752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2Y/gfnxlc437mpb6PhnysrCJ1QgGq/sgZI77ejaYT0=;
        b=XVsCzHtvgaVlNPicjBDbLldTqeDl+LtYQtKAnypEpJBSidHPAmyrpVQyzMj0cf/90X
         iGRKZIqry9E9dWBB65fKsZlGN8Il58fnDxSzEwNtTkqoGN490XUj3TKua8/DEduBgcsh
         mJz/MVJFDruviUiuFEt9rZ4n9dEk+oLDzaHPG/72Aglwb2KW7TF1Gf6ZuqrtKKSffiTc
         VEyAgW4osSISt42Qm+jWnw4OeSMeRvWr15ZVE1mOoIL+bGIRf3pud7ZTTf0FdXoulLKN
         4Zj7kjXTQnniK/k9vniHDuXV/xc1Nmh3UrN1zpy8hrpweRJvMkPUQE+2GEr4fa19hFDP
         WHFw==
X-Forwarded-Encrypted: i=1; AJvYcCVSdnd0FQm4PyrNkXmyRaPNo/5VMMd+5bo4zcT8sA9noDg82FwKMIZMYMvLwAFTQ0HBYMx1lLvt03gpv6Y/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5jfF3MId5tq8Hpms9n/zMSzlUX+DhE3yFsIkYoB1jtgpK9EBb
	p+fN6AuMWjrtAT8UlmGKPliBwfvDrebCFq6v24vonE2dWbugQrJdDRcRbmRw/chtq3CUhlEfb9W
	LXcEaS/b+12EngCsbvsDFXynkkTrSWwRwPfPeXyrGPQ==
X-Gm-Gg: ASbGncv1kbNeYdKWtAECSezseoZ0Ec5mYw+hNu5LDXpmuri4BDSMhBw1FdTHxrn9nb0
	j26n4Gkna/QeI0qsi/WgCjSyS33Z8wUcNNu4zmjq40KnluenHW91uJB3k5MjHG9Aesm/72Smhjo
	kXpWbCjjfLumC6eHRgLv0FFyu+F1Le7d1bGF3KvylNNE2UluCcScAF6YthXM4quXvgOWR+nmQiT
	do6L9llnijg
X-Google-Smtp-Source: AGHT+IHsaqPH9hjr7u54X1LUFS04SWJNAP7LPz98uFiQfhrqMU6MDbmAcQVfPn//Z7iM44rJEqEQbl5npay+fB7TPz8=
X-Received: by 2002:a05:651c:1503:b0:32f:45e5:df46 with SMTP id
 38308e7fff4ca-3353073c91dmr5858371fa.37.1755605952075; Tue, 19 Aug 2025
 05:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250814181236.1956731-1-da@libre.computer>
In-Reply-To: <20250814181236.1956731-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:19:00 +0200
X-Gm-Features: Ac12FXyeObfcMrouhnaGZFteU5KOKCRkIGy1hUn_EywbJRo053Gro_IOs7It1sg
Message-ID: <CACRpkdb=OTwGyz0ArKPDdcBWU3nzrBF5d6LMHgNRgVsb9zH=bw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add GPIOC_7 pcie_clkreqn pinmux
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_051913_886634_0DEA8B19 
X-CRM114-Status: UNSURE (   6.47  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgODoxMuKAr1BNIERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0
ZXI+IHdyb3RlOgoKPiBBbWxvZ2ljIEcxMiBleHBvc2VzIFBDSWUgY2xvY2sgcmVxdWVzdCBzaWdu
YWwgb24gR1BJT0NfNyBwaW5tdXggZnVuYyAxCj4KPiBBZGQgdGhlIHJlbGV2YW50IHBpbm11eCBh
bmQgcGluIGdyb3Vwcwo+Cj4gU2lnbmVkLW9mZi1ieTogRGEgWHVlIDxkYUBsaWJyZS5jb21wdXRl
cj4KClBhdGNoIGFwcGxpZWQuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
