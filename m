Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7912260A262F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 07:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ev+ydeAl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=kdmBm0AO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EYpdzLNEVZq+OILlNUZ9I/FjfZNaddL/hQFZ8p2vIx4=; b=ev+ydeAlHdJxy7h7uEHWgSuJGv
	Qfrhzz733HqP1gBS+222j4CteCduYl9pQWVhlR2nZV9v5NKzF09KchdQEYZ482VeflOewgn6QzXI4
	zW9VGXbEpnRid3pvXM9Dng3Afh5gIWpCf90Q4QK4c21zIHY41QKcZOe/beiuZqIbJy231i8QCWckc
	xE4X73jSE1fISTT7jnQ9AvG5fuN95ybhPriZa3IlOemQJEijzV4YYgUf0neUhvveASY8qd91JnGI1
	0iyRLihzoF1hhWfIsXxMuFFs50ufYNEhuoWHN0l+HNB8KpV7v+PtzHhA3V3qJBMQZUrBb2e/kuBy7
	Yqf9rHGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1r-00000002n3g-0nQx;
	Tue, 10 Nov 2026 07:12:27 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1k-00000002mxY-3Dm6
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 07:12:26 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6767d92cde6so1841872d50.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 23:12:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294739; cv=none;
        d=google.com; s=arc-20260327;
        b=O7xJdlDn40GF2Z2MkaAxAhxBP5XcRFUJ8yddikrcO9bDChAMbxCHdKL4V5ua76tFGD
         Se7JDQKEnVndLItoMubjI/NDJszSueBR8bKMIWJc430+Anh0XDLdxWBsqlrOtuY91G1O
         5tsiEsFRCqrX0xo60eevkDTS3inXtOWkir6Cl1aOJYkw0+gjD/hUagh5cABiaCW/aNWz
         ap+BJPtn+RFgOljNOrO4zY3kfjCM1pXgZer0N6sJ9kJH3AbMdRIh3X8fQ893oKm0gLhZ
         2kw96uZnMhHfFPHDv1m6r+C3vnUlD0rwX+vLEYIjfgcSqnfaUuCmPe8MOUYBFKlRiKT1
         yiFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        fh=KuvvoDUvOHsolfqHpgZK+/f0VBNhNNb9hVXiFXzJV0Y=;
        b=n6X2wyQZpAZ4jeBegYFNZjMQ73UEMpWZthGmP5ZweXyTTvllz09j06wrjv/FQiUgR8
         H85uiTmEDi6IoEPzZtsCscxJKobm0W/w97hVX+HrboOu3c/ler3hGE21KcAp5hGZYPkJ
         pt84oML3UU8hHSPga0jE52pra8/RcboYqS+DH+WayOPhXaGcj8N44WbRwSQR2E71RE1o
         ZSBuOxk8Mo2sM96ccQfeJchDC5YNJIEr0ymVMB5MP5SLeGjlhdkXzgn5tQpKr6KXH15d
         qNFrklADq/sFqHYj5aEyEPMtaUTqXrvKGvBE1KzWTfhe+gTWFrNcVgnOM5Ze50+sl1G5
         LRhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294739; x=1794899539; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=kdmBm0AOee6Zcy0XybgBTKm3LgNQrEmhAiIfkpGossZ32jaJyUxxuaHr5zluVVXAmv
         /zCaj4nZdBBp7sM9V+T4ql90blu0gLlW+e9qW9iCIReJxm6CFrw3vMsYPdYdQ2C+DW2J
         vwm23XFAF3OY3LwmEQkenSBh7rHAPOMEX3rfX7Ks4+rzOudeTDsk+kbNCIHVwL/Nk3Lt
         ZTTAlKsNoZ74DNrme/pOpcFNsIFbFI2a/m/FCOKZFlM3OdIPJou16QCBdsqaEpWH0h0y
         YCZYRkvumMffzG+HMUMmPhLMA08Em/1DxxOUd5Cxlz7mfng2O8Na+v3yRfI/G4C9nJ/m
         l1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294739; x=1794899539;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yWyiPml5ZX8N8f2Jc7eehCBNHyPBXlyreXyhVWMAHE=;
        b=WzsG3b45yMprMsIsT3TiLoC93Ue/8GcgjmnjpKVfD26C8EFT2sN1VwyQD4ZRNtassi
         J1lsWNYAOmCtFzqOgAVX/b/16rB5psD6rOSh50wf//ftrwdFzex1LmvyXm+rZkUFYNX2
         LIu/Kb85iuRvACmI4KP0Qo8D2DIWXAxWfD4aCnSqB755X4rn418Myop9GgOKy7nCTOSU
         qQvzjkNwVGnSN3p9Gvf/GsbpyfN4lXLAnEU8dKPvn6ddSKxK6v/ZLtPwx7LhhMTiAK/P
         Sq6b643YqK94cjM5j8v5BunKh1vjfRJ/ZcEKabNYKvgmI48UriG/Z240GA06P7ZC+H6B
         L3dQ==
X-Forwarded-Encrypted: i=1; AL+hErFtgy7WMixMVpBKaVe9w6IoBIxdSkDJaqEEsLu9tVfLzaslwM2oOLzBt0i2GueEG6GiShbKG+BkGs4qimOl@lists.infradead.org
X-Gm-Message-State: APuU4Z+Ivr9yY86OzAuRwOeRl/CYO3N1mHS/H6bO0ild87E66Ra3smfN
	DR3hAawTjAZRpsMz4/5i7mSXvZO04vFxE6SmE81rGiBpN91nM21SUwVwMRIAuHw2NaxpDnw6aKh
	2mn5cOMbb0W1MSY4HWuxTEMtvp/on238=
X-Gm-Gg: AYBFou1LAPvkmY5pLK3UD9ORtG82cEAfb8WyKKf/ABudqmHEsn8chuOGjX177qDhlP5
	RQwtG/V8XK9QoSXXHYBOlBF0oPs3y5fDLCgcE1nRVbXUBLaKNhXdTKm8Fpof4kj3oOF2oSHQJOx
	vYEfvD8gNejlsSJdOBGM7Q1JJGW6SAq9mbThU7xC9X+KUW3K9SAXobVYwI8OC5mKAeFuM0z4C5z
	LkSL2kybpzjc6NeSSRupCoz428vQBTX9vj3Oy+tn77V5z5VMCJtLySl3rk0VXPWVeXf6dCpEfrK
	pg6dE1X/dWd1k3sCGCnLIQQXefXO4Ul9yZx+iwyIWH9+WAfS+tdFLe2uOTygk77UKpbqnGQc4Uj
	W1YljxdvVxG7vupC+E6OPmrKTPhrlv9NzpN6j
X-Received: by 2002:a05:690e:c81:b0:679:96af:e306 with SMTP id
 956f58d0204a3-67c568269e8mr1104943d50.56.1794294739207; Mon, 09 Nov 2026
 23:12:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-3-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:12:07 +0100
X-Gm-Features: AclHuK-NNQu1JbIxB1uGpolHVv_SmZbveDQeysJSYIv9CiWjgRe7D4MXv9gg7C8
Message-ID: <CAFBinCD5aQ_AsNxELgUd5yzXsghUVQg1tuGtVvF-bmPx+AjaUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: rc: meson-ir: allow the receiver to wake
 the system
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_231220_836755_AB5D84DC 
X-CRM114-Status: GOOD (  13.32  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxMToyMOKAr0FNCjxjaHJpc3RpYW4ua29ldmVyLWRyYXhs
QHN0dWRlbnQudWliay5hYy5hdD4gd3JvdGU6Cj4KPiBGcm9tOiBDaHJpc3RpYW4gU3RlZmFuIEvD
tnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4KPgo+IFRoZSBzdXNwZW5kIGNhbGxiYWNr
IHN3aXRjaGVzIHRoZSBkZWNvZGVyIG9mZiwgc28gbm90aGluZyBpcyBsZWZ0IHRvCj4gbm90aWNl
IHRoZSByZW1vdGUgYW5kIHRoZSByZWNlaXZlciBjYW4gbmV2ZXIgd2FrZSB0aGUgc3lzdGVtIGZy
b20KPiBzMmlkbGUsIHdoZXJlIG9ubHkgTGludXggaW50ZXJydXB0cyBjYW4gd2FrZSB0aGUgQ1BV
cy4KPgo+IFdoZW4gdGhlIGRldmljZSBpcyBhIHdha2V1cCBzb3VyY2UsIGtlZXAgdGhlIGRlY29k
ZXIgcnVubmluZyBhbmQgYXJtCj4gaXRzIGludGVycnVwdCBhcyBhIHdha2UgaW50ZXJydXB0IGlu
c3RlYWQuIEJvYXJkcyB3aXRob3V0IHRoZQo+IHdha2V1cC1zb3VyY2UgcHJvcGVydHkga2VlcCB0
aGUgZXhpc3RpbmcgYmVoYXZpb3VyLgo+Cj4gVGhpcyBkb2VzIG5vdCBhZmZlY3Qgc3VzcGVuZCB0
byBSQU0gb24gYm9hcmRzIHdob3NlIGZpcm13YXJlIHdhdGNoZXMKPiB0aGUgSVIgcmVjZWl2ZXIg
aXRzZWxmIHdoaWxlIHRoZSBTb0MgaXMgZG93biwgYXMgb24gUzQgd2hlcmUgQkwzMSB3YWtlcwo+
IHRoZSBib2FyZCBvbiB0aGUgcmVtb3RlJ3MgcG93ZXIga2V5Lgo+Cj4gVGVzdGVkIG9uIGFuIFM5
MDVXMiBib2FyZCBpbiBzMmlkbGU6IHRoZSBwb3dlciBrZXkgb24gdGhlIHJlbW90ZSB3YWtlcwo+
IGl0OyB3aXRoIHdha2V1cCBkaXNhYmxlZCBmb3IgdGhlIHJlY2VpdmVyIGl0IGRvZXMgbm90Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVy
QG91dGxvb2suZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
