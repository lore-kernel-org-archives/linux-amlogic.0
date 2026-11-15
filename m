Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB67606A31A
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 18:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSBxl4+R;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=NLnQVbmK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pI6cNgE8C9EcsEWHnR8+fF/rPf2xFUuFfG+ir43nnoo=; b=XSBxl4+RO5s7vXGYi2iel4CTpu
	/lD2iLzaNcUJZOA9bbExTG310bsdGx0S30HYzxsBtzH62glx9mPE6Ir40JAjfp6rdhXNVFM12OdLg
	0t57sIawlYzFIdKxGCgtPIfZTBKcI4Y19rGOaT6wgAMX8bnh2K9FZ+pV8pvfApSlO8+0dWiOsNC4d
	26KCfJbGH7ZgLvgZUwEIjGdLJ0u1A/yHQXsM5i8shJCwSGdJC7JSaz4vLq5NV68qUx2En7XTDlBXG
	pBNf7Vn7+cnjfniURWmNljnIFNtgxyCOKdch3POi09i0zKRCQtjn96NOTk76+ECFlSt4XKRRIIOBA
	uoGNt7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeeg-00000000Jc6-3vj9;
	Sun, 15 Nov 2026 18:08:42 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSeed-00000000Jax-2bZ0
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 18:08:41 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-67c24619b19so1765410d50.2
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 10:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794766118; cv=none;
        d=google.com; s=arc-20260327;
        b=fpttk3+s/1XXpHZgiXSspxYpb96eRPQGQxJUkmuJlALR6F/U+GDTqqgT36xRXKixu2
         rJckjtGHOQVdGoXqiAJl5RWcRgMW7PRNhR30Li08LO+IHXM2LYzC/zNqZs34Y/M9Ak8J
         VREMtIktAKZyHKE0msbg/31ljWeq1dlaT5ZHDSz0w7ck3vvFvBqfmQGvyu+HpFet4O/M
         Y9CQcUhPmPwjkK2CGlo8EHUTLWPSIB0m31cIr1P6EmMJzsA/cNvTE9paDoT9Qf84Wb7r
         sREA+pDacDtyVt0kHa0XeMLmGI3l3hq7jdNoP8Tuvq2g0ksZH77IY2bsNP2fx1ZD4t96
         mmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        fh=ZrzZQANbK16Os2UFvBuaj+dE1B3WNC07FA96LWwUeUE=;
        b=VJlQfoUSBFYCWXe8jww0WBr8tRJ2QEWkYUU1bvSnUAo9TJrlAZsjdNlB2M0RwwB8dG
         058zFFEqcRb7vJQdcJkUwfL6m0SYNnFTaxWOOekYRYuuQEgilDno+QEYNmPJML5+UvZ1
         5hgjNhe6rTJAepo6NabtBX8fEFFwnhv0tYxNAXOaypjvB8Me9Xblktq4PQOeMaS717o4
         U4TpHSLope69gc6BJswt4vkNrAzgovN743GcvOVGTcS+10wV0ewzXOa3dH3YNu4bXr9X
         9sghh/Ws2l8/7w5Ijq7eVM/20pC6CJ4kpdF6uMhebYrMFL2kAsxhw0flJEj89/7/YNhR
         aaig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794766118; x=1795370918; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=NLnQVbmKvLNOzt+d/d0RKY4gbO6C8krQ23sU9OlhOWZ//2Y6WCja3AOTyzYsEPvsYf
         fJuajdKxED/OUZprvGxm8sbdNQxfjYFfSXg6J0h+rZNJMSgDQE6yNaWE8af8URlXSf83
         TlV++MQdCT+yYkGiWYj00mCE3CHf8dWSZ6B+xd+dgnVGjQJn3SyLoDlW3oHyttQuRk8K
         K9qZ+/TSFctQs80T5Bxb713b41UTS2kWDrDr/9w4AP66N+XmTALBHlnKRZ5FM9ePizgF
         TBqB32kvxjLUouZsHGjTLWapYR8qwFjNTIzd9IIgV8m60164lGArS4i87UDCkfOIiRTq
         ztgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794766118; x=1795370918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQ6SxbpYlEMvJGXsYYF4IK1woLYsWMG6CmUYzgyb/v8=;
        b=Q+IGYe7w3/czgA5NUr87+VgwbzkO99mv95uBUV+iyOu29Kh8AvFXO1xTp7aeiJmf0a
         ViFEyzhTcgQ1NV83lCV78eGKncSFMiKjVOPui15/rWKPIr6YPk+reZF9/ceW4XFX5vi0
         5HlLDadkWRKr5t5NGrOrG1+lKkrtBogQc1KE08wynUu1ljtL0F3iiRWQWx9tlO93g241
         +I0X6bql+QmHRfYh+jJ3zgJbr7rFbb4SODxUiANf09nshesJZe4BUgiaPmmj8TsbrRPy
         rO1AiWM2DLUb8Tco9YNcJ8TFcfpcvcMiMvLH1dd/iWx7tvrWwG/OIQlC3RUfwvfZYEqH
         skPQ==
X-Forwarded-Encrypted: i=1; AL+hErEkilf6crKvUxA2XdmrZtH5Kn9wOPlv4xL9sN/IuXX7zXjrxJMpxgDOZIY3i+5cOGC9i0YPn/5xQ0w8LRGv@lists.infradead.org
X-Gm-Message-State: APuU4Z9e5CA6iJAIYVlGZdvSi13Dxobd90/tAgyQ1Q1CBOcxGedbRtjU
	oRAGyGOd69TYUPZ7XOLU9iIOug6EcvFBUyoOKlGLwHPQAe7WBID3bbS8+xOXu4V5KMhCRnr5hX5
	eDarwmGwZKOsVbkDcyGfR95Ch87BHaYA=
X-Gm-Gg: AYBFou2JXQ40+2jkBxGWgHP0tvfFqv7LlC+v6Te8lxHqy0+wD+bwuBuxm23D06RTXti
	lUU+AduZpFyXmMEBMBK2ZSonXuAy/0YLEvaQV6ZYfbvqmQ8eESc9aJ1eIuopZLx7LfCaA8KinCy
	SaPdgVwTM4hCVmY4UTFodBegKtJS60BM3FWioqioBjmTyms22t7bQ79coEVsuNtzzfamcexlHeE
	fPakUZ9n5a4EOjBkDuS3Mh56ocqkq0XxddM1skGB3n97HDgX/OSw8AZRqf0zigHVd+KBNCrRK+R
	/WrLp7+PnIOsroxH1sW1dgUGsFrYfVyOa0G4bNwxypxJTjjeuZsOtc7nrevnDZ0DkCWalrQophP
	1iK2hoZmrU/8+RkYDjVxBCAxMDqgOofMmf5bfw3pODmBcUSaxyTFjnkYZF3kUXiviFcFnDw==
X-Received: by 2002:a05:690e:a4a:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67da6fc6d40mr1650517d50.106.1794766118350; Sun, 15 Nov 2026
 10:08:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113121852.334604-1-tanure@linux.com> <20261113121852.334604-8-tanure@linux.com>
In-Reply-To: <20261113121852.334604-8-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 19:08:27 +0100
X-Gm-Features: AclHuK_ca4Ke1rBatVDRggo6mUiIuil3NWD_1WvhT9IQ3QzVWOrT84nkfXuKy0g
Message-ID: <CAFBinCBZpruWYPrCWhRY146C9fd6ij2cOirJNORqAJFaiGZJ5Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_100839_687584_A52206A5 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTHVjYXMsCgpPbiBGcmksIE5vdiAxMywgMjAyNiBhdCAxOjE54oCvUE0gTHVjYXMgVGFudXJl
IDx0YW51cmVAbGludXguY29tPiB3cm90ZToKWy4uLl0KPiArJmV4dF9tZGlvIHsKPiArICAgICAg
IGV4dGVybmFsX3BoeTogZXRoZXJuZXQtcGh5QDAgewo+ICsgICAgICAgICAgICAgICAvKiBSZWFs
dGVrIFJUTDgyMTFGRC1DRyAqLwo+ICsgICAgICAgICAgICAgICByZWcgPSA8MD47CldlJ3ZlIGJl
ZW4gZm9sbG93aW5nIHRoaXMgZm9yIGEgbG9uZyB0aW1lIHVudGlsIHNvbWVvbmUgZm91bmQgb3V0
IHRoYXQKUlRMODIxMUYgaGFzIGEgYnJvYWRjYXN0IGZlYXR1cmUuCkNhbiB5b3UgY2hlY2sgdGhl
IHN0cmFwcGluZyByZWdpc3RlcnMgKG9yIHNpbXBseSBzZWUgaWYgdGhlIFBIWQphbnN3ZXJzIG9u
IGFkZHJlc3MgMSBhcyB3ZWxsKT8KSSdkIGFwcHJlY2lhdGUgaXQgaWYgeW91IGNvdWxkIHVwZGF0
ZSB0aGlzIHBhdGNoIHNvIHdlIGNhbiB1c2UgdGhpcwphcHByb2FjaCBhcyByZWZlcmVuY2UgZnJv
bSBub3cgb24uCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2JjOGM3YzZhLTVkNWYtNGY3Yy1hMWUyLWUxMGE2YTgyZDUwZUBsdW5uLmNoLwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
