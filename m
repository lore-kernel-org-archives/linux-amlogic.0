Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB400606A31F
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 21:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o6wAB7gl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=vG9O9wNl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rDkkQHs2nYhDS84Bh6ThBk5Oyyi7idwBysymr3fqAiY=; b=o6wAB7gl128m9jqENYU1TQNs1K
	7AUKelThgVxcGF7H6YHDPAn7XESFZvpZk4PocvTPXXCrBlsxS3sKeXa0kVXUe/XKzsBjMIoujzOyD
	6QU/J+F6itU6PIkgtcnrnizyDTzTF/Z4926C1RVrMpUDjIa1Giesth1DAIMjLi0bFHZfem3v7slgX
	iJjHGZ2vHYEDcubbpphrP+q8Mm94oClxhkdB+uiG4INH6DibMwv+Dl8XM88nW/sWrPdGmMDXSJydp
	zm3P47qgPNtBJqt+5diKq8G9beMy92cqw5ZareRxSZFc0k1WPO+gyZ2rKFxBJzcvYkIR/y8Okzazd
	lYymwp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShkm-00000000VM0-2sBc;
	Sun, 15 Nov 2026 21:27:12 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShkj-00000000VJZ-1u3L
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 21:27:11 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b0d126f631so24352147b3.2
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 13:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778028; cv=none;
        d=google.com; s=arc-20260327;
        b=r7ANqxW/mVBQ1xC5VsLrfyMPuSdO4AcYcAwcusuxzAG/ZwSr8nbriiswc9wX6yW+tl
         Hm0P5NJ2/SH3lWBz2TmXZeu4xzt0QcSgee9n/kcsw8hk4GgXF6Gw6waMPfyTACY8BnOz
         w6EUTFXGpkmZ9XAAwqcXNIb09qr59y3esvnzxkuudBwzPiceduJgWhdaE411w1Xvezhm
         IKPUbbaEhuY9jcWhiVfA7972uPdXwIQGNZVfY+8A9I+k7SS0wQCFLtsKSTKwbC/uDe0q
         sDLYo9bhkitJoxlwjnyEOY2wxeZ/uFXlu/f9aagj/RFa4p3jTq0ppn84/hY8zaiawXHp
         XyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        fh=FwNjvhT/4LUJ4/I3M6QIqtritQrblBD8kvdwtRF5gq4=;
        b=TB+kneirP0go9ZmWVY4j+F1xd/XqUGqoL2cFyLvnnIxXJYwclefxEepyhkp66IaYLZ
         6wQV5A+2awYvBI1rDtRcVFVx/yxGJV1OgADv0LeQ7LbpZGN9nV/WFzOYVLhsbdotxeBu
         BQasdlxevGlBEUUVW4BM7xgxHMfRJPM+yYYJoKuiMLNm5fTNJG1Rsa+DMsKy2AQYl119
         rBKGcg4EN2+RPcSdi2STXdljzvfHxn/0j0y2WIaw7pc1IoHBBJlCYoX0YS18DssFZaYk
         dQeNaajfHaG0rJcjSoc8KVPeQmnmo4aYS2EtotV9i8fERWHZ79mRi/R3hKdIuNKV3VRm
         V8Wg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794778028; x=1795382828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=vG9O9wNlBKGQxUuLdAnelF856Wd++h3GweoOOxNzlwbvIHt2xTA9nf7hJPAWnOD0dE
         sUIOEZ7SsXgpZsgSfvOKl1KAN7ghde97RTshorCWM3qlC64TtZlS89nId1GqXUfGCtIZ
         z6fItn2jVkmQl1YMpFAJN+h+RW5+RT3gb0APye5/AZZXh4W1UkIPkTUJE2pbExKstE/t
         4soUODxeDJo/vh8o34qzBKBn+6j2/7VolsWiwGa+WqdvgyWjlGmCa5II1k51+8OD3mC1
         iBlYdTFuS0gDpQBzYmPZDBzQm59m4f4bpWqv3B8Y7Lk7d8zrgARpPcOw7rTysIxTPeC4
         e5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778028; x=1795382828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOfqkFPGSOelYxZ9WwfJkudZeQDw/mHaOk7izfGVzlk=;
        b=WMHh/fJqitPvj5bPKMOdN5jJ2V7/Adh1XN4pmSL1je02TbfSjsVES/dWbUgZKMps/w
         r1UCCm5KBjbANTgudo+WesNutEsrRl7ABv5vBUJd8uWyWDdFvLEQveABbq5/cSOIDSjo
         YUO6HE2WBTgxt4TG4PR2RWnwVUuvHMMkN+iiClWABI+awa1lwA5wA70xLsddjvsEB/Fc
         3DVExIgWJWg2esB3+G9oOkDIG6l1tWSREy0Q8FbJRGGzYitmw4ioRxCDQk2wMRfO6Tir
         um6yUxeWA3a6zDbxsYk7ZXEbr/K70ujpAd47ktTODHd/LQ3z9FUFXwKJ1l2gTbsVs4Zs
         VkFg==
X-Forwarded-Encrypted: i=1; AL+hErGLprIOATWCCb14uXpY/JPgvAulYD6XDzxxdysVGyggFjvFZi5T6zpmr2EnRJVL2/IB6ENbHjqGwhjP+GFQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/+nEhkMq/+FdPOdqS/WvYqJiV7eedwq0eK/gzukuTHjZ9DhyWa
	0rNcdtPtJcj3uP7k6qkrybnKR302/B1S4Bt5itIzlloVpO9tcDzX6xIfOStW/8L9E1ubrmtKwtT
	S3z7PUvq1QqocRq+oJufsZqFTmdkLJwQ=
X-Gm-Gg: AZFdTZderIkhzqsQ183FaKWrESEma3MkLGGYYvLwB0PrZlYQE+sDtogwYivT14MmliI
	Ie6ldwbeDtieArqvl8MQZf+MIpZpHyU4mtaHPrtijK1uGMmyA6zFL++UN8cNcNbTrQdXEM4EKB9
	zFIccpcNgl4+duDXHaU6TUwB/DYdY08ofReeLPhHbDrlRcKFcQmJ0qMjmRshxa3fuKOBTyMVxmN
	GoCLtCjfuRt7d7t1Lcp2kLYKZvotIY924Vo6n+p6sBwA2tQ79qF+rDim8gEuDOw93Ga2YokTM7L
	TtDkvp2/hoCujJsTZhqcYqOwUp/OPa7yBC/bfwvixz9OZKj233411XYPb01xLmWLfU9PZOuS37k
	+hkEZ4bq4Wi4Vdn2oRJJpQVwMlwmVXoaH0AGn33kFJHoF68r+1wvU+HuWtVyHhynIw0bcHA==
X-Received: by 2002:a05:690c:6e85:b0:8b4:c2c4:bda1 with SMTP id
 00721157ae682-8b4c2c4c026mr25492897b3.67.1794778028118; Sun, 15 Nov 2026
 13:27:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-4-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:26:57 +0100
X-Gm-Features: AclHuK-_NZa3qMznm_nhucaqssqDCKZOwFULWjo8j1EdkFI26I-pZrQxJB4Pk5w
Message-ID: <CAFBinCC6C7QD2-eYhOR6FjQ+1a1sH6E0ioUMapFkTWe6626hfQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] ASoC: meson: add AUDIN driver
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_132709_506293_184904C6 
X-CRM114-Status: GOOD (  11.41  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMTI6MTjigK9QTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKWy4uLl0KPiArc3RhdGljIGludCBhdWRpbl9maWZvX2RhaV9w
cmVwYXJlKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKPiArewo+ICsg
ICAgICAgc3RydWN0IGF1ZGluX2ZpZm9fZGFpX2RhdGEgKmRhdGEgPSBzbmRfc29jX2RhaV9kbWFf
ZGF0YV9nZXRfY2FwdHVyZShkYWkpOwo+ICsgICAgICAgc3RydWN0IHNuZF9zb2NfY29tcG9uZW50
ICpjb21wb25lbnQgPSBkYWktPmNvbXBvbmVudDsKPiArICAgICAgIHN0cnVjdCBzbmRfcGNtX3J1
bnRpbWUgKnJ1bnRpbWUgPSBzdWJzdHJlYW0tPnJ1bnRpbWU7Cj4gKyAgICAgICBkbWFfYWRkcl90
IGRtYV9lbmQgPSBydW50aW1lLT5kbWFfYWRkciArIHJ1bnRpbWUtPmRtYV9ieXRlcyAtIEFVRElO
X0ZJRk9fTEFORV9TSVpFOwo+ICsgICAgICAgdW5zaWduZWQgaW50IHZhbDsKPiArCj4gKyAgICAg
ICBkYXRhLT5sYXN0X3BvcyA9IDA7Cj4gKwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFNldHVw
IG1lbW9yeSBib3VuZGFyaWVzLgo+ICsgICAgICAgICogTm90ZTogRE1BIGhhcyBhIDMyLWJpdCBt
YXNrLCBzbyBpdCdzIE9LIHRvIHRha2UgbG93ZXIgMzIgYml0cy4KPiArICAgICAgICAqLwo+ICsg
ICAgICAgc25kX3NvY19jb21wb25lbnRfd3JpdGUoY29tcG9uZW50LCBkYWktPmRyaXZlci0+YmFz
ZSArIEFVRElOX0ZJRk9fU1RBUlQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBs
b3dlcl8zMl9iaXRzKHJ1bnRpbWUtPmRtYV9hZGRyKSk7Cj4gKyAgICAgICBzbmRfc29jX2NvbXBv
bmVudF93cml0ZShjb21wb25lbnQsIGRhaS0+ZHJpdmVyLT5iYXNlICsgQVVESU5fRklGT19QVFIs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsb3dlcl8zMl9iaXRzKHJ1bnRpbWUt
PmRtYV9hZGRyKSk7Cj4gKyAgICAgICBzbmRfc29jX2NvbXBvbmVudF93cml0ZShjb21wb25lbnQs
IGRhaS0+ZHJpdmVyLT5iYXNlICsgQVVESU5fRklGT19FTkQsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBsb3dlcl8zMl9iaXRzKGRtYV9lbmQpKTsKPiArCj4gKyAgICAgICAvKiBM
b2FkIG5ldyBhZGRyZXNzZXMgKGJvdGggTE9BRCBhbmQgVUcgYXJlIHNlbGYtY2xlYXJpbmcpLiAq
Lwo+ICsgICAgICAgdmFsID0gQVVESU5fRklGT19DVFJMX0xPQUQgfCBBVURJTl9GSUZPX0NUUkxf
VUc7Cj4gKyAgICAgICBzbmRfc29jX2NvbXBvbmVudF91cGRhdGVfYml0cyhjb21wb25lbnQsIGRh
aS0+ZHJpdmVyLT5iYXNlICsgQVVESU5fRklGT19DVFJMLCB2YWwsIHZhbCk7Cj4gKwo+ICsgICAg
ICAgLyogUmVzZXQgKFJTVCBpcyBzZWxmLWNsZWFyaW5nKS4gKi8KPiArICAgICAgIHNuZF9zb2Nf
Y29tcG9uZW50X3VwZGF0ZV9iaXRzKGNvbXBvbmVudCwgZGFpLT5kcml2ZXItPmJhc2UgKyBBVURJ
Tl9GSUZPX0NUUkwsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBVURJ
Tl9GSUZPX0NUUkxfUlNULAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
QVVESU5fRklGT19DVFJMX1JTVCk7Cm5vdCBhIHByb2JsZW0gYnV0IGEgaGludCBpbiBjYXNlIHlv
dSBleHBlcmllbmNlZCBzb21lIHdlaXJkbmVzcyBkdXJpbmcgdGVzdGluZzoKb2xkZXIgdmVuZG9y
IGtlcm5lbHMgaGF2ZSBhIGRpZmZlcmVudCByZWdpc3RlciB3cml0ZSBvcmRlciBhbmQgYWxzbyBk
bwphIHJldHJ5LXJlc2V0IGRhbmNlIHdoZW4gX1BUUiBhbmQgX1NUQVJUIGRvbid0IG1hdGNoOiBb
MF0KCgpbMF0gaHR0cHM6Ly9naXRodWIuY29tL2VuZGxlc3NtL2xpbnV4LW1lc29uL2Jsb2IvZDZl
MTNjMjIwOTMxMTEwZmU2NzZlZGU2ZGE2OWZjNjFhN2NiMDRiNi9zb3VuZC9zb2MvYW1sL204L2Ft
bF9hdWRpb19ody5jI0wzNDgtTDM1NwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
