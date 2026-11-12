Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C00606A31C
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2026 23:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XO/g9SsW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=0XGdx+t+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cY+PXhd6RyKUaxUkhxC0FWqjAFdjokGLvp3uLTuQKjA=; b=XO/g9SsWkLg+4oJguflFqffRmv
	Tk/6KgH4ag9PEYxYgjRSeLPkbsmamglEGxsbuemrOZNGUbi0ycpQciHVfPdQXtcbNC8Agz50OUqeI
	J6jr4Sf1JXK7215FVP8T2umP+b6W615TQAS+4HKqTmOlBpxtWD83s6lhc6bKELgRpcopVKA3jrFKG
	TDFAte1JYb/tIeLaK616pbD8aNk1uVtbHz8tWyldOIOFaKn6wWOGI46dGLf2P4bxLpVVmz67ONNCF
	/gcUj00IlB2oVbv6jW9i3SdZG8gvZVBARFqRqI7bBs24GEiyVJ6ZVmwStp8pu3A9Syi3PAL/v4rqo
	+BSX9DtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdrU-0000000BE9G-2oO6;
	Thu, 12 Nov 2026 23:05:44 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdrR-0000000BE8P-2zUo
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Nov 2026 23:05:43 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-677af43eed4so324904d50.0
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2026 15:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524740; cv=none;
        d=google.com; s=arc-20260327;
        b=mUDKyyRN9LR+ubW1Xq88ew7GRzUqPEdCu0KC3+ojKYj4rnMTmbPXAg8sBbeTvm7cVo
         kDEGmr9De97i3h+kN+jRXh93Ze44SIE4kcTbG5B/TSfAQzyTEQjWlBRK/JSBR3YlO3bZ
         y8GAfc2zebYm71dGBpzwBPK2Q1/Lt7I9oe9lUNHWJZLk4adwHt6BazQkjbpp/DfU5OaT
         eogMsabeXv20F0GT4rMZ1otTFFbzufLSgSQKH+ecZJJF9+9yBVnYegfw2SBdDvE17auY
         Lp2lP/F9YkXujxU6EgYOOSYozamioeMi6heA8HjzPFNetlTGvw3lRijJC+R800LSCFeP
         zYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        fh=urBSr8OO03p/41Aeh8g4FRVkJPG7T2s/5XaV9n66zU0=;
        b=VqZ9tzHrB+/6merR7CWHHbvwVA0/lLCBr2dhW5OFyoadDdQ/miG3ohQWgouoY7/mji
         QXAYdofSBiCS2C2Ud3Jue+wkudzRLHnBuQP4Ce1TLfC43BzoDXpElACcTLBgyAkQHDxE
         Pv0D8vBCiLGiyRqCBX1p2M9fNRnM+Lt7k+TFgOd5CfSVAmKTOKcR88b3pIN9SjjAbicf
         lCrdAhpopSPMpeGp5rjyatN4eMwh+emSLjX+J9u+SDN58OjV0srLxQMYERAYOD1dTu96
         NFM5aC3ZPeZaWx/xZYakvzMUGBXzjDV4Sk2N+/1nI8XKB8ASW1mcxUy3b1abMj0Tda82
         i6uA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524740; x=1795129540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=0XGdx+t+5PrWiml9QXk7mP04rDUHuOhn9QZvLJgcj9XvC20Pxx/OZ/s4AQksOjYBJf
         UQdpiQJzS7degLCvKE4dS3DsGwec3C69ZXl1SoA1iVxTMrJ8lkzYL8HvQ+ouqCcUzZv9
         DaqgGybBM0eOiRGk8NBFohSVoHxn/YMfu7m5md0yFncMq5segiwtH5R/vZBJawhEJhy5
         zL8rngHZ/P8DW2W9aMBL6jWyWOnkRB/r1ZFFUCMxTtQhdL4tnml5rWAZAPBWHNGDxSZ4
         rhK5nbSaumIPXNmXNw4YZQ3Y9BfIGhvRY4IAyZj384qEElBBbB93jRLLh+hXYfp7z4o7
         kKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524740; x=1795129540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3lRYJaSOF/Piz7YAKasak+99H1rHlRMQKrkdBErHvo=;
        b=qOiGCvqWTWvaoFI+foUCeN8RVwfhwhBIgGsNJ0iy+8fXUjkV+j38HJiRF1w11Warj3
         4uL8SGmUwY3D09xphCWDuWxCiLKe8NvOvJzlfvWk0u+fsqQgPLooB81UjL5rnv6FB4R+
         hzzt1fBnt+Y7H48hAuix6t5w63cGURvhcImVxvYNp6YqUrLgA4Vo8S8A7pqLxeaYgl3c
         lvkFxRLKAwHELPBiYyK1nGdHq/m30cVUUgJ1wRaAFHtJTuvodLWiWdoPUC54esRVKWLq
         iOyG0R/dFV0/tz+2wYP8E8fp4mvEx2pFun24auaBMQMZYbJh6jCdAvGpjCHf0bK0kp1B
         Tb3w==
X-Forwarded-Encrypted: i=1; AL+hErGl41kEGNoVUVGCjSF6AGu0boApppqpZBTY5C2030p81PaJ25hhAfTYj3+KAmtFAqWdWz2DUauw91kovKOT@lists.infradead.org
X-Gm-Message-State: APuU4Z86ok/Ula3TaplZrB1sULervt1qy6ikLJVFpJdmXcpq4L2biUrv
	00C3Js/wuMyHzq5LRvav7Hb2LhyoNWZHtapZ2/tSo2XwmccnWYUAZ8DDd5YthfAdpNkOB3Kx3gw
	UaLJ0YbzdTXxqmfD3M3TTTPICC7uQoh4=
X-Gm-Gg: AYBFou02IeIWh7i91I8zCy0NhT2/XQ8v32Fqd5o2nVqUoLC0w4HYpgEtMt1Yd3riLBN
	tc/IX/oZFBB7waF2ROKte8PVcbRI+9/84L+1NZ9N1UdTmVeFkRqVz1tFcy47MqLZPGniSe7LTeR
	hdpLwRUHLCPvxHfTDDMzvpTpSeRPWlBzHzQyVRbjPEU9pL75hu/yCHL/Gaalizm1ZaizCfNaKy0
	JsltgUc1EhEKvMRh2Fmvl/jBKbqj0VlQQhB1D26B0yi7eFxRoQb53zFD1ntVdGYCJTCSN5L0J2l
	ABqyHsvYqcQgIDwo2yljXyh2OUt93ZY4VUzjT/pxqiYAvpKfQmt0wggdhG5WsqILeBj8623ouuE
	by0DbPdqu8ye7aE/JYJVTDSyZZN9aYNgwP/oTudk/jFF7QqPW5VeSoWg71vtQynTCRjAddA==
X-Received: by 2002:a05:690e:4506:10b0:67c:1aa:2030 with SMTP id
 956f58d0204a3-67d897be561mr407000d50.67.1794524740366; Thu, 12 Nov 2026
 15:05:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
In-Reply-To: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:05:29 +0100
X-Gm-Features: AclHuK_8bTUR51TRXYpLvWTsaJ7E1LH3kcGSVltDcpyem9ID-KxpWLn-7OZxH4w
Message-ID: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is held
To: Valerio Setti <vsetti@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_150541_763790_5998CBAD 
X-CRM114-Status: UNSURE (   9.69  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgMTE6MDnigK9BTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKWy4uLl0KPiBAQCAtMzcsOCArMzgsMTEgQEAgc25kX3BjbV91
ZnJhbWVzX3QgYWl1X2ZpZm9fcG9pbnRlcihzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBv
bmVudCwKPiAgICAgICAgIHN0cnVjdCBhaXVfZmlmbyAqZmlmbyA9IHNuZF9zb2NfZGFpX2RtYV9k
YXRhX2dldF9wbGF5YmFjayhkYWkpOwo+ICAgICAgICAgc3RydWN0IHNuZF9wY21fcnVudGltZSAq
cnVudGltZSA9IHN1YnN0cmVhbS0+cnVudGltZTsKPiAgICAgICAgIHVuc2lnbmVkIGludCBhZGRy
Owo+ICsgICAgICAgaW50IHJldDsKPgo+IC0gICAgICAgYWRkciA9IHNuZF9zb2NfY29tcG9uZW50
X3JlYWQoY29tcG9uZW50LCBmaWZvLT5tZW1fb2Zmc2V0ICsgQUlVX01FTV9SRCk7Cj4gKyAgICAg
ICByZXQgPSByZWdtYXBfcmVhZChjb21wb25lbnQtPnJlZ21hcCwgZmlmby0+bWVtX29mZnNldCAr
IEFJVV9NRU1fUkQsICZhZGRyKTsKPiArICAgICAgIGlmIChyZXQgPCAwKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gc25kX3NvY19yZXQoY29tcG9uZW50LT5kZXYsIHJldCwgIkZhaWxlZCB0byBy
ZWFkIEZJRk8gcG9pbnRlciIpOwpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kOgotIHNuZF9wY21fdWZy
YW1lc190IGlzICJ1bnNpZ25lZCBsb25nIgotIHNuZF9zb2NfcmV0KCkgcmV0dXJucyBhIChzaWdu
ZWQpIGludAoKRG9lc24ndCB0aGF0IGxlYWQgdG8gYSBzaWduZWQgdG8gdW5zaWduZWQgY29udmVy
c2lvbiBlcnJvciAoaGlnaGVzdApiaXQgc2V0IC0+IGxhcmdlIHZhbHVlKT8KCmF4Zy1maWZvIHNp
bXBseSBkaXNjYXJkcyByZWdtYXBfcmVhZCdzIHJldHVybiB2YWx1ZS4KVGhhdCBzZWVtcyBvZGQg
YXQgZmlyc3QsIGJ1dCBrbm93aW5nIHRoYXQgaXRzIHJlZ21hcCBpcyBNTUlPIGJhY2tlZAooc2Ft
ZSBhcyBmb3IgQUlVKSBtZWFucyB0aGVyZSBjYW4ndCBldmVyIGJlIGFueSBlcnJvci4KCgpCZXN0
IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
