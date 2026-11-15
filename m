Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB97606A332
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kAUZNO1w;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vg6HCweu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Me5NBVbAqHJ8/buaT94iWiTBHyqIZ68FQV5k1+ZffUI=; b=kAUZNO1wvejwceG3VuUanUCOhh
	NWuXyI9M3AS45leLNgOMxWgCXFqKCLrr0+TS+VG9+ZKrNohzkehcub8qYoFyljNad85jgLNvP0iAk
	r3f82n2dhnee8yk+sUkxws/kbureRdzh8QVnpSoJwJVd+pGIrax5qL6kbtax/DAkIs0+UuFR4d6Rc
	vpXNhJds3ET32hvQT0Yp7fLns9hJKdzVuuZg5gZGa0lF+WwYLRtOHHWzwbIeuf9dAVB3/3DqMf5kl
	K53V8QcEAqbuontJym4lGUm4AyxhbfP5XM8b+pWwWjpjQBFpdaNJXPYjmzKgSpYymwJINqBbyKdKa
	h1FFEmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiax-00000000d20-38Nk;
	Sun, 15 Nov 2026 22:21:07 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiav-00000000d09-3akP
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 22:21:07 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67db5e13b0cso340645d50.3
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 14:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794781264; cv=none;
        d=google.com; s=arc-20260327;
        b=Lo6Q6GxxGdt+GKXJElN4nADuZQTha59nLndMeLMc77pmDHkRvf0yUFYbPu8e8Mizgv
         PTJqxbqGHVj4PDQ/DUjtW/CZyb6cjQQw2O/5j4ZoZ5BACILcWMXaCXQto9UsY4XeQnoH
         AGHdT2ZGGtEniBjL9KHd5qo23dLi/Ryfxpm8sC1byo52KPT7qXhNkDFDVppZdZUdhRDM
         xA6BWIrqotVocziJ1Beli5sII8HWi+xTAJ5UUoJPgeiWw+K0ZbPRnsOE7ZDwuI2QnvkZ
         OjAfG0vQUE85O78slM+BFSA2CZYiueoWxfx66+P+IVTr0U3iL8kcMXDMoX7nFhq1rGcR
         oGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        fh=5PcTEGxnawEietm23l4JKwfOP/YZxfPk5l3Wpu919k4=;
        b=P+iTrR2gmB87wSS+MhGZN39mmY5yeKzTOWL/gVqtkSn0O7oQjddc0VYnCjl3lVMH8Z
         faX1fmUlGt9xSqNx4khQWPCF4Hmr3p12947x53gZrQ67xhDds1w2vXVTeEmLhbIJZDGd
         5iI5xg92DC20lYqwfJUa/v8byBEne8gY6c1tNtNeb4okqH8kLEghjIyfvlvH2D3CIyE6
         kfHCpVDZgGyhidFv8XL7KUFJQhQLedsxz0HZ5jDkDZ+9t9vg+89mFVCjWyd3TA9494ml
         8u4cVrm/smXmS1wPg85vGkwHZWK0iWryiOd8lEFY56pfGoyzLtWPAl8zNisQVhlFZH+Z
         0gDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794781264; x=1795386064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=vg6HCweuP4dJANoh9E9f/1R8JdfT92tZhJLDagKqQOwf7HAyxsUA+T3sbv3Dpp6XGU
         3iE/kfHVL2Uz3ZJDZBaFPFgNw860vesasXxHqfntvh/I6r33HMj7duYuDt+oeSobQ7qt
         WteU3uPo8JC8oXUYu+yKGt3QuHcXLCJaQCMOILWQDB3PPslUOfTZ2KLXXV3+Ndy1B7CC
         cgyxJmpYmOAolH+uUVL6hqR+dVELjgNrGoLAD3G+EQ11v6r/Hjc7rHfTeBW93pZNcPck
         zTrymyc/BNjwqyGbDLGrdwTuWWZpuq7xPwQ3Qou8YNibkLvO/Mp6URpXWb2/4aYTRg+S
         TiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794781264; x=1795386064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAFY3cUder3qW+PINYFFGIewRXLP/J/NJFjtZaZIdPQ=;
        b=T8ddh+pmDEu/AvcfxezkD7IhAJmCUbp2TJLmlhQTm0HmUOuRFvZxgJssNdUJn6/vBD
         iXQxUkGFxbUDBw2vX+k+pdi+U/k8/VgRz3up1MhgXiiKn5lhyId35n5m12SYPfkJnlMd
         OJv261NtAB81VR1SBmKP/OUltw81I7EI6+LIlCdD6gNwHdx5Rjp7kZ0u1Y4zsrH67rds
         /v0B7bM9MqYd4Lq/wEHfRQdgHyCZBtcJelIDYWY5fmh/g3FIE/4ktxzWtUQ/SWJDoU6E
         KZPgAj9tycX/t2TG3l8xtj4I5Z7W9C1KiijMtjTXaq/N2LVoKENeJDuxui/yab9mAu2x
         o3BA==
X-Forwarded-Encrypted: i=1; AL+hErGCH3qBXNLlSobxnYQYN7I2oodkp0hjFgsM56/azzeF3Kggto29zH+NL6DQXsULR8I6QtdIuMQ/bWYPQBPF@lists.infradead.org
X-Gm-Message-State: APuU4Z+u8wzhTzzfJgAR7b8EZzuxIu5D1EHyCjsocL0/zk5DlqQJva0b
	H0YrRFsP8d0wx/zdQzPEjBSyPiGR26pSKI7BGVaiFfZBxQr7QWc37+LNO4nQjEARMnHsLXSgti/
	2nnL8r08AoEAXE1qox1LwrjGDVikUERs=
X-Gm-Gg: AZFdTZfGx5l1l5uQk+AaH7bODhWhlNcK7vef9AkDjYqkIFVusmLVDSpr5ujIjnTkkOr
	yjnvOyLGcXOayMraScxaAgUJ6u+bQBvi+QvvgnyjzTP3ivrowOFKU734ADxGTY6CoBP6expHdIp
	981ubo77WhtZZ6P5jPyI+tYR8u/1Q2aU/WVRZaZqR+TDDMGWScmNTsOjjkA3K9Dqu5+UY0V75Cf
	RqJ+1mfawjUBmoH2pex/VzZvhwxdJTFJFMW72lg/VR66NCl+XznbKP8bt88Jjg1K3hYEZXLTehI
	AnDCbFg1y+7m7hQkZ7KUNJgYJ2rcGVEqtGMF+rILPwpUoox1CZ1VRAC790Iu0felK2gpfvIGSjN
	r5ctdwRdr/LUrvkLCqHk/5Db9i4kTfUxnzBJ8K9zl75kvJEgpHA5FiD10smQVC/HguUn4Md78h4
	/0f9P+RHtZxsAhukE=
X-Received: by 2002:a05:690e:4086:b0:67d:a3f0:7dac with SMTP id
 956f58d0204a3-67da3f0917amr1936855d50.14.1794781264626; Sun, 15 Nov 2026
 14:21:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-add-t7-sys-pwm-clk-v4-0-8ed2b1e0cdfe@aliel.fr> <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
In-Reply-To: <20261001-add-t7-sys-pwm-clk-v4-3-8ed2b1e0cdfe@aliel.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 23:20:53 +0100
X-Gm-Features: AclHuK-51aJAWSj3WTQV4S_5nCaT5gjYIQp2CQlsLrogi8Dpichyl4UfpyRzP20
Message-ID: <CAFBinCCf2x3Ear_iOg9=KYXd5jbvAh2LdQb3uOME=Lry8Wm4HA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: amlogic: a1-c3-s4-t7: Add bus clock to
 PWM controller nodes
To: linux-kernel-dev@aliel.fr
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_142105_910015_35536C76 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCA2OjU24oCvUE0gUm9uYWxkIENsYXZlYXUgdmlhIEI0IFJl
bGF5CjxkZXZudWxsK2xpbnV4LWtlcm5lbC1kZXYuYWxpZWwuZnJAa2VybmVsLm9yZz4gd3JvdGU6
Cj4KPiBGcm9tOiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPgo+
IERlc2NyaWJlIHRoZSBzeXN0ZW0gY2xvY2sgb2YgZWFjaCBQV00gY29udHJvbGxlciBhcyBhIHRo
aXJkIGNsb2NrLAo+IGFuZCBhZGQgdGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5IGV4cGVjdGVkIGJ5
IHRoZSB1cGRhdGVkIGJpbmRpbmc6Cj4gImNoYW5uZWwtYSIsICJjaGFubmVsLWIiIGFuZCAiYnVz
Ii4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFs
aWVsLmZyPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KCj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9hbWxvZ2ljLWMzLmR0c2kgfCAyOCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kgfCAyOCArKysrKysrKysr
KysrKysrKysrKystLS0tLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1h
MS5kdHNpICAgfCAxMiArKysrKysrKystLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLXM0LmR0c2kgICB8IDIwICsrKysrKysrKysrKysrKy0tLS0tCm5vdGU6IGEgc2luZ2xl
IHBhdGNoIHBlciBTb0MgaXMgZWFzaWVyIGZvciBtZSB0byByZXZpZXcgYnV0IHdlIGRvbid0Cmhh
dmUgYSBzdHJpY3QgcnVsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
