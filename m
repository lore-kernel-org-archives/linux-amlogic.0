Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835E2C7EE32
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jun 2025 21:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iYAFqhkvRBNtl9C3GO6f+qn1vQsE+XwQBdRWsDswpA=; b=fxFs92akUup15Z
	/h05vZ+pSb67tBu8MCcM6V5TqKPYT2vmKKa90nQToJmiTGaNedaGmsPslMIlp0svvsicKmgipC9kC
	AAfHeWzjm+jbPM+o5EbRd1NdQPtXcy7UzJsBA4VKuJwsx5J7PdtaX3TsSkEOGgep3LqNWVs/lzxRC
	sG4mfGQQ37/W0GHWK8agWkgTXx6wo3xNOl87TF/YHaJk48UvmTTfSUxNivDV8NcrRzn78ZPrzn4NU
	2e/d2TMztplkBwyaVHn5ETPeGhDO8KC/MxTyZnPyW97ucz28IXa91VqkugeM4kIvD+CNg7eXGC3My
	U4N9CncJcu1LvJt/QFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBM6-00000006tOS-02GF;
	Tue, 24 Jun 2025 21:39:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9LH-00000006bWl-1NN9
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Jun 2025 19:30:04 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-553b9eb2299so193306e87.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jun 2025 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750793401; x=1751398201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=w1uSzjtUfXgsEpVcRLS8nssd2hxNF3+5SgjA4XNaMf35CnKNUlLAr2c1kEkzf9KkB7
         3vsPdG1BZp9zjV0i2VT1piyI03aJHI57jfHfAslg5OB2fBPz9ZeezaWE/SOlbPeuhK56
         ylU+8xPCkJ0dotNcGBlct7BrImD2xeF1jOnYZFOvo+w2uj1sZ08cKvS93ugrhTeQJQ4j
         S3NeE7CBzArTRHKfBB0TkwR2HiIsNKBcCNP8wqXeT/fvkDVlSXt3cjeytKvoJwdOVw9B
         W1JJc6ILahBsZvxy/lFB7LH9N8eMWeMKRLTFZF8PT25w6jdP1EfzNTI9f8KoUqMOmK3d
         HvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793401; x=1751398201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYzCynFhISNn1TpwVDZx/f3TXk/OlUcluwj7SZF10Gw=;
        b=oOdZT7qNR2f+DBCYCqN2HGcVicBWc8CV1ou5QYfM3POj2HVsnqqMJ6AfM246Fp2ztb
         Hox322Lhsn8gr7ncpTWkxciLUX2ACkxxUH1X9pIAO4ei6jNyKce6g4YqsptjUVaZ3QzH
         1j1GsDMdtcuyc+SzZcWbGMejPXK3dxvJQyz6iQDyWw5o6hrT9GFFoG2+2E+/PTMigSxK
         PiOji7Dyc4JaoyTAcx2PlyaspMp8zvy3zR8qBUI4OA/4jQiL3dTF+ob1xVA8JkS9vgTi
         XpOy1s0wlrIBx/U/7qzRN1eqQyoBtRTTr9j88IdKLhj3Wu8kgrtDzMRn0IPE+Blax0sD
         GV8A==
X-Forwarded-Encrypted: i=1; AJvYcCVnFeKzU9Y1StyMrwk+1iJ7V/tLqPrfCaJlFH5KenyNY2ATk7dutsnygUPNWrLKwgGVHmP2gGqzeeIqeb3M@lists.infradead.org
X-Gm-Message-State: AOJu0YwWtYoRWkizH/F6uJJAOyBsXZH/DGM6XeNY1m5YvtA2HEd3T/2s
	p3IOIXZ1jf08+/LBPxVK9xltgthitHTGY3RIj5CGtGePCBjNQ3xi4NRUikxHuHCMrcI9WtGqLM/
	ZXWykmXJN9l3OvLGDYbgXjT9dXroYAmtrB7csIZ7lxw==
X-Gm-Gg: ASbGncsSaLZh4KmkGO8f3pbDzR+ndAprhBaG7Krw6Z0fhc5p+Pktb9XihRYop1rk13D
	GfzvsGp+kZOmCho1K/fcq4NS2Bw0PbmVA9YfO57wUQZqAiMRxbOrlFF/WGs+ceBTnNy02RywJ/O
	hxtQapBHkVhDZtEwQtTBuG5wg2BhM8+TiElVgTxl/horg=
X-Google-Smtp-Source: AGHT+IF98ZSPZ/cGMxtHIlOFYXqQCIVwb3pGxoVI1+8dIHaRQQbONGD63qWy0teQhv/zjiwvc80I0VajZL9v8jDE+HY=
X-Received: by 2002:a05:6512:1114:b0:553:cb0b:4dc7 with SMTP id
 2adb3069b0e04-554f5c85c83mr1536330e87.9.1750793401366; Tue, 24 Jun 2025
 12:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250619022337.43900-1-da@libre.computer>
In-Reply-To: <20250619022337.43900-1-da@libre.computer>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:29:49 +0200
X-Gm-Features: AX0GCFsG5W-9LgBD5SxFAUBKe02Az2IUJvG3jsvR1-qxVNZZOZnEgYf3pYYd0gE
Message-ID: <CACRpkdbxLVncSn_=030PiDnbtOc6aBz-Et+5WPSARHj2Gc5Q+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add g12b pwm groups
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_123003_368679_9886C2E7 
X-CRM114-Status: UNSURE (   5.80  )
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

T24gVGh1LCBKdW4gMTksIDIwMjUgYXQgNDoyNOKAr0FNIERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0
ZXI+IHdyb3RlOgoKPiBnMTJiIGFuZCBzbTEgaGF2ZSBhZGRpdGlvbmFsIHB3bSBwaW5tdXhlcyBm
b3IgYiwgYywgYW5kIGQKPgo+IFNpZ25lZC1vZmYtYnk6IERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0
ZXI+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
