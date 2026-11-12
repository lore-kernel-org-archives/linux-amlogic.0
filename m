Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEB5606A331
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2026 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kSABLeRX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=JCx5HzQB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JO1zrRXywrGqQh2ooYxie0/FCKmlkUKUsPgQXJYz1Kc=; b=kSABLeRXhzZJu92CsAeAMDlyvT
	s5bp+DiP3whoFeKR7h3/kfqTOOVs3fTYFExWSiOoZwLxSkMmgHpi7M0GBiA3KEQkPN3IbZ6ad6lAH
	iYUBUrkaa7ELdbjahlRs4YyXg3syWzCzpv2ZoX7y5lay0SgdeIe5qhnDotsu2KaGz9oylMrwM/34f
	rPDr4vQTWNHB8QM31hkM7b5KaniQ6ODYKncmKn+wRfCDqMlRJhzF2Ausg/Av1reBoquBrxvhztvfA
	clbtdFlQxv6DSSxSAuRdFbry/AbsH21riUvDzazbV5IkQqFnQmaBffw5X3BU0mfp5vg56aPVqIcme
	lm+QX1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdlY-0000000BDei-2ZUt;
	Thu, 12 Nov 2026 22:59:36 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdlV-0000000BDdP-2LDZ
	for linux-amlogic@lists.infradead.org;
	Thu, 12 Nov 2026 22:59:35 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-67c02c106e6so307044d50.1
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2026 14:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524371; cv=none;
        d=google.com; s=arc-20260327;
        b=W3/CvIJRA4oChx7ZFLeHCr2l1qukrQXMHsNUu3ZCUDIttZtUsj/BKIwuRDCgy4kgeF
         FRGlq/fg8lbXk9SUYimth8RQzoHZqYE7m8hb43vnaJBHwQoauI1Ng6mjNnm9EMgygCKX
         7KYo8u0ziBVTKBnCqvnvmXgG2VahMdJKmst1fG6P1Bn9c7Fl9BtroZeH7IBO67GWxxdr
         1uWFw1Kv7VbIB6jgaLZHQuzXR8/4mZ78KshkWIu43LAkb2UXZYgFNBUd35KriZCmyT6U
         lBjX0HGYahxIP19r/4iQrfHTFH19yudGltn8bXRH5xLQhV9iZ99oyi8REEXSm7/USbhp
         GZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        fh=724j1LQI7LAQByiyBlFw4oxybgpoOPc5UIcLyseoO9g=;
        b=Ro5zkzNyy6acQ7BfzwbtN+ZAcAxEB8m4BpgjsXf23OPCV/s5KIeCkZxaKPTsRtG2TD
         KmtqggOms1IZ2PjKeXb9wl7pjwL4LGV5WpbUjWEEX9qb2vQ7Ywq/arAl2qKQ2KrMqee+
         Ch6YuAbIMs6gpiREgtPwNbUsNtblJuHMryuZpfIipVcxxBcoUuIcs9AMFMDEa/whq6c7
         pfORn9Zo5b+vgvMu1Fu8JSLIb9COq9yzyxe+wWbkE7G+ERPBwg11FgwBM6dLKuvwegVL
         pnjPCyMwozczRhjp71lhckJq+U9R5URQkg8dGOuOqBlGY5BG5fCfxEST+SorYVVotVav
         SS8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524371; x=1795129171; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=JCx5HzQBz6705+i2l3H3pkv90UGiH3JxBS95FHC/HNujq/6ec1S/AJ/nPo+70QPlRC
         sFvPFx5okoOJ6+keQROKHgKjJM/IfF3hpESqi+v5uoTRlsPIgfNauuawdvwgSFw+zumm
         UZYMHje2CyNun724TuvjYQB0hMIMKZXhFXS34fPLmWM8TZ/D/GTgESbRMC2SzLWHK5JU
         JFe0DIqN7Uncs63ht/6aYwyIB7j07nizJRpW6uzOYvj3/nsT2tncN9kXJRHmA+MSxVdE
         Noc8NL8z0euJ2eM7/Kcr/3BeKySTw5nYl7EaKH3CQ9jrw/GwEP/kBX27UOrYR+dkzcih
         wmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524371; x=1795129171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EopehRq5ikgbdAiXlBfLUoKgyr9SSArgqvetpz1gLic=;
        b=sU5ZI2BXsTjBzdTI4sbnd4ur9k0WMqP0EBQR43pcVFtmCtxZAHS3L5o54H8O0wqW4e
         xv1v5EAuA5n0zs4jO6OjoM+0vd0XWp121nGxqPjtMt7owOrAQVnmNPtjGyQK0EaHd1K0
         Qvhc0NtIp+NbK6YqdnJOGBxzecErkcmJPq2W+QrSCB83S1zONzhHR79LXtseG/jQYOOE
         qCZ+kzLc87ZRAER2LWS44XoKpSGaC3uQEjydvT+7osNjsDSM6YhDk6c3PjwR+u6XY4qF
         ZPGPdwVhax0Zy/WZ9x/gj2txPiV7pFkWvSRQGbt+oLjbOUentV86ub1w1Z9Wbd1aQmzy
         QLMw==
X-Forwarded-Encrypted: i=1; AL+hErEX/naSbHuwwy9WLiy9bmYg+Jh92fXK3dgtJn0wH0fUriLjKLUMMKJPEb4avUZKSO+T7VPzx9FELnCqEfgf@lists.infradead.org
X-Gm-Message-State: APuU4Z8HZxWWErXRVzQc/6bGb3ep/E1N7bhuNdsAWrDGvQ4ng7oD8uCm
	Vd7iiGQ181ye/TjFOAelKAje2K2P2Z7olB+5biYXaGHfwdntmAxcNTiurq6r182LYFN6WyRq/dU
	J7SAZ8CRDXFApmR3bW5TRQRYbrpIREfU=
X-Gm-Gg: AYBFou1/TsQrcEbF2M1X2IyoLaimmI8Xkp8QyK8M7nvesL3A0SzjXofBm8BU+GWQFkg
	DqhTNfyvJmmH9TPESVQnosHgfCbzqms862WNVtXIfLykUcqhH7yklNoaB0L515SZqwLjy2u8OL3
	Keex4jUKtewFmj1iK+oaly3JOhW2utNBufyiCKJYsQW6qjpH5yWAOnZFXr2f7B6b6weUgY3jMt6
	5aoUJJ1r0TXE8kT7X0H/bPh/wdpisX17tH2MuzQ9L31vQKjdk6wNj+GU8G8gGQVGu/tW/+mmIAe
	ISsS7MoUpYoAh7mE0U6Xee4Meag++SQbiBm0gQuFXb7EIeFuexjjtK45FeG0TM0nQifFzz2vegf
	dK15IKCcFkkRB9j3k6flFXX7TSAMJt28jhQp+KLRS+nzHRvRd+ZrlUpzVMqM2PCS2sos96aswCP
	ZuVA5vERFY6Nf6zSA=
X-Received: by 2002:a05:690e:d83:b0:67b:f64e:b323 with SMTP id
 956f58d0204a3-67d897f316emr491608d50.87.1794524371234; Thu, 12 Nov 2026
 14:59:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 12 Nov 2026 23:59:20 +0100
X-Gm-Features: AclHuK86E7RwyUwDuKN1XBLuFvJlmfcg53qNUpHMBnQ5zRn_8wYfmQuNj2Yj5C0
Message-ID: <CAFBinCCdqpb-d4wEThYCLLEa89eqUNycxn7BYHMq9a6nTVPL=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_145933_602945_21DFBAD4 
X-CRM114-Status: GOOD (  17.49  )
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

T24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgMTE6MTLigK9BTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSBhIG11dGV4IGlzIGJlaW5nIHVzZWQg
aW4gJ3N0cnVjdCBneF9zdHJlYW0nIHRvIHNlcmlhbGl6ZQo+IGFjY2VzcyB0byBzdHJ1Y3R1cmUg
ZGF0YS4gVGhpcyB3YXMgaW5oZXJpdGVkIGZyb20gdGhlIEFYRyBkZXNpZ24uIEFuCj4gaW1wb3J0
YW50IGRpZmZlcmVuY2UgdGhvdWdoIGlzIHRoYXQgaW4gYXhnLWNhcmQgZGFpX2xpbmtzIGFyZSBu
b25hdG9taWMKPiBzbyBjYWxsYmFjayBmdW5jdGlvbnMgbGlrZSAndHJpZ2dlcicgYXJlIGFsbG93
ZWQgdG8gc2xlZXAuIEluIEdYIGluc3RlYWQKPiBkYWlfbGlua3MgYXJlIGF0b21pYy4KPgo+IEZv
ciBleGFtcGxlLCBzdGFydGluZyBwbGF5YmFjayBmcm9tIHVzZXJzcGFjZSB3aXRoCj4gJ0NPTkZJ
R19ERUJVR19BVE9NSUNfU0xFRVA9eScgcmVzdWx0cyBpbiBhIHdhcm5pbmcgbWVzc2FnZSBsaWtl
Ogo+Cj4gWyBdIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20gaW52YWxpZCBjb250
ZXh0IGF0IGtlcm5lbC9sb2NraW5nL211dGV4LmM6MzE2Cj4gWyBdIGluX2F0b21pYygpOiAxLCBp
cnFzX2Rpc2FibGVkKCk6IDEsIG5vbl9ibG9jazogMCwgcGlkOiAyNzIsIG5hbWU6IHNwZWFrZXIt
dGVzdAo+IFsgXSBwcmVlbXB0X2NvdW50OiAxLCBleHBlY3RlZDogMAo+Cj4gZHVlIHRvIHRoZSBm
b2xsb3dpbmcgY2FsbCBzdGFjazoKPgo+IHNuZF9wY21fZG9fc3RhcnQgKGNhbGxlZCB3aXRoIHNw
aW5sb2NrIHRha2VuKQo+ICAgZHBjbV9mZV9kYWlfdHJpZ2dlcgo+ICAgICBkcGNtX2ZlX2RhaV9k
b190cmlnZ2VyCj4gICAgICAgZHBjbV9kYWlfdHJpZ2dlcl9mZV9iZQo+ICAgICAgICAgZHBjbV9i
ZV9kYWlfdHJpZ2dlcgo+ICAgICAgICAgICBzb2NfcGNtX3RyaWdnZXIKPiAgICAgICAgICAgICBz
bmRfc29jX3BjbV9kYWlfdHJpZ2dlcgo+ICAgICAgICAgICAgICAgc29jX2RhaV90cmlnZ2VyCj4g
ICAgICAgICAgICAgICAgIGFpdV9lbmNvZGVyX2kyc190cmlnZ2VyCj4gICAgICAgICAgICAgICAg
ICAgZ3hfc3RyZWFtX3N0YXJ0ICh0YWtlcyAndHMtPmxvY2snKQo+Cj4gRml4IHRoaXMgYnkgY2hh
bmdpbmcgdGhlIGxvY2sgdHlwZSBmcm9tIG11dGV4IHRvIHNwaW5sb2NrLiBUaGlzIGlzIHNhZmUK
PiBvbiBHWCBwbGF0Zm9ybSBiZWNhdXNlIGFsbCBmb3JtYXR0ZXJzJyBmdW5jdGlvbnMgb25seSBw
ZXJmb3JtIE1NSU8gcmVnbWFwCj4gY2FsbHMgdGhhdCBkbyBub3Qgc2xlZXAuCj4KPiAnc3Bpbl9s
b2NrX2lycXNhdmUnIGlzIHVzZWQgaW4gJ2d4X3N0cmVhbV9zdGFydCcvJ2d4X3N0cmVhbV9zdG9w
JyBiZWNhdXNlCj4gdHJpZ2dlciBydW5zIHdpdGggSVJRcyBhbHJlYWR5IGRpc2FibGVkIGFuZCBz
dG9wIGNhbiBhbHNvIHJ1biBpbiBJUlEKPiBjb250ZXh0IChlLmcuIGluIGNhc2Ugb2YgWFJVTiB3
aGlsZSBleGVjdXRpbmcgJ2FpdV9maWZvX2lzcicpLgo+ICdzcGluX2xvY2tfaXJxJyBpcyBpbnN0
ZWFkIHVzZWQgaW4gJ2d4X2Zvcm1hdHRlcl9hdHRhY2gnLwo+ICdneF9mb3JtYXR0ZXJfZGV0YWNo
JyBpbiBvcmRlciB0byBwcmV2ZW50IElSUXMgb24gdGhlIHNhbWUgQ1BVIHRoYXQgbWlnaHQKPiBl
bmQgdXAgY2FsbGluZyAnZ3hfc3RyZWFtX3N0b3AnIGFuZCB0aGVyZWZvcmUgZGVhZGxvY2suCj4K
PiBXaGlsZSBhdCB0aGlzIGFsc28gaW1wcm92ZSAnZ3hfZm9ybWF0dGVyX2RldGFjaCgpJyBieSBt
b3ZpbmcKPiAnZ3hfZm9ybWF0dGVyX2Rpc2FibGUoKScgdW5kZXIgdGhlIHNwaW5sb2NrIGd1YXJk
LiBUaGlzIG1ha2VzIGl0IHN5bW1ldHJpYwo+IHRvICdneF9mb3JtYXR0ZXJfYXR0YWNoKCknIGFu
ZCBlbnN1cmVzIHRoYXQgdGhlIHByZXBhcmUvZW5hYmxlL2Rpc2FibGUKPiBmb3JtYXR0ZXIgY2Fs
bGJhY2tzIGFyZSBjYWxsZWQgd2l0aCBzcGlubG9jayBoZWxkLgo+Cj4gRml4ZXM6IGEyOTViZThk
NjIxMCAoIkFTb0M6IG1lc29uOiBneDogYWRkIGd4LWZvcm1hdHRlciBhbmQgZ3gtaW50ZXJmYWNl
IikKPiBTaWduZWQtb2ZmLWJ5OiBWYWxlcmlvIFNldHRpIDx2c2V0dGlAYmF5bGlicmUuY29tPgpS
ZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
