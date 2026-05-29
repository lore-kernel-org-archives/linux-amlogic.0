Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41E3CD6E49
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJqWWPBP6rCq05xx5e/1D3ukYKhZlIvm5NPVPFZxxXk=; b=RB1Pqesb2dANDj
	CEfmY8Wtj1cUAO/Ii9OwnakavL5jVI5QHUMdc/LCB8Atuu/efo7cKpTLbLsQMHk/dYgJ1V34NxUHN
	YIT00XvhGt3qAWXb/w+D372A8A39xQlc1rZW2RiVOSqRMQwq9mtgUxNwDSeWqxshzGxKxQy7uNfjP
	0gkT6dL5xk6gCkxsSnB/f8gR9oaMW5kN6kyNLwLqAnom4jawrfoPqeJzlyUgF+aYQEq85hYKt2WVj
	v2X5SDzYK8uWoI62/co2BkeTxNCA+Merb+JR5/kh5r8hOOFxR8N1bnK38l6oeT5h7wfJ9lPJQFwaM
	v2ClQ5iG/vuvTJeeXzwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3rP-00000008DxV-1XPe;
	Fri, 29 May 2026 20:31:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3rM-00000008Dwc-3DtE
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 20:31:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 266934464F
	for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 20:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A40D1F008A0
	for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 20:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780086672;
	bh=flVuTYQMPE98WVvZ/bed+lF6Q3W4uYVMMxpgyqZY3FQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DzPGRoQRXxlO98kzFknnqbv66lXJDatBV8P/Lq4TYfX/dNnQJMZjv4WACrC0jbVPU
	 zxkN3U0VJqrhcGuKfCjHhdaYxUFVgAR01hNVk2UkbxBDd0DYUzVBVAmHy1GVfcQ2HV
	 rtY4oDMuklf3/2WvilxspzK8DMcoDlmOZWbpX/3Zwjh8boReF6r6477PqozAsJiRLc
	 2Dy1vbj33sTW40HLvQh71b2bjgCrDCbWf1MuDhAOF1oH+eW9ah96R7uNucNZP1J47H
	 z7JT7hh+hHdZfSHc+wk3OhCFdHuqc8kfVhmu+7cCLq9RZO9MZFFZsnp8xS0QjCRG9Z
	 +RFiqrhPom70A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa5f11deb2so621337e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 13:31:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+R4zgmJizKy3x+OOQLlQXtHFD+w6B1JCT0daTet4BNVqtavJZ0flUzCnyul9f9M2himdS43Mtoj8YD91nr@lists.infradead.org
X-Gm-Message-State: AOJu0YxPgU4jIipXvFPxmdDsFXKOLDTmF8+7jcpho4AsuJ+4thUIQLGP
	52zFHUvgvmXxJEq3tO9/wtBNTAjpzxSAAgiute/6DolX4pNAwnyn1xORqZCAS2KIyhCej5gPR1M
	6TOWY3GOO3siaPE76prK1ruRaHmFxTwQ=
X-Received: by 2002:a05:6512:3f07:b0:5a8:fbe0:bc53 with SMTP id
 2adb3069b0e04-5aa608ef062mr483883e87.24.1780086670800; Fri, 29 May 2026
 13:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
 <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com> <36cdfa84-1e83-4a44-a529-653d476778fd@amlogic.com>
In-Reply-To: <36cdfa84-1e83-4a44-a529-653d476778fd@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:30:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLntffpfwtjD16SHD79W-tQKJTMwmjP5y1+0rgNS31yv-w@mail.gmail.com>
X-Gm-Features: AVHnY4JiTwG2IVBsAlj_GioMQiqlf8ek1E0ZiI_k3UEBuzhsFkAe-cqsDu5gZBw
Message-ID: <CAD++jLntffpfwtjD16SHD79W-tQKJTMwmjP5y1+0rgNS31yv-w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: add support amlogic a9
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_133112_844201_CD3FD50A 
X-CRM114-Status: UNSURE (   8.95  )
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

T24gRnJpLCBNYXkgMjksIDIwMjYgYXQgNTowMuKAr0FNIFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPiB3cm90ZToKCj4gSGkgTGludXMsCj4gICAgIEkgZG9uJ3Qgc2VlIHRo
ZXNlIHBhdGNoZXMgaW4gdGhlIGZvci1uZXh0IGJyYW5jaCB5ZXQuIFdlcmUgdGhleQo+IGludGVu
dGlvbmFsbHkgbGVmdCBvdXQ/CgpIbSBJIHdvbmRlciB3aGF0IGhhcHBlbmVkLiBJIHByb2JhYmx5
IHRob3VnaHQgSSBhcHBsaWVkCml0IGFuZCBkaWRuJ3QuCgpJIGFwcGxpZWQgaXQgbm93IQoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
