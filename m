Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE020606A327
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2026 22:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OnL7fcSG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=cSX82FWk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1/wAwiei8uNt2Li3neF0Y7ECRvpsh4Qk/iozHzVwAY0=; b=OnL7fcSG5xlQuJUR75ZOMlMAtb
	1C/oQ4RmvJR/Q9NNfwNjKvfJs5pAD3CTmz7F60KygZQVcLgNQfvvIcq/YKCN/ac60eHAbFJ3SbKjv
	fPTwCrtbSzBddZQu0CASmbiLVLnCpeqDk9+AtUacX7w+sSCE9NtGO5fFKEvCzF6tfp3x297jtXcfc
	7H8xgGAIqNKOV1jCHVACLPIgXHnKdXWVhL0FdfHcHTUX9VAB/SpUCyt2jCljW5DtUE03joUja+rUQ
	VPVtWsWJ0fMYixH7JK89PENYB1sjh/uGrUvfuq7Uab60/hHaWKSqB2Qk47QhThWsdFH9ZZN21j5Hc
	ONPy9QBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePS-0000000FBEI-2qfx;
	Sun, 01 Nov 2026 22:52:18 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNePQ-0000000FBC7-1C1d
	for linux-amlogic@lists.infradead.org;
	Sun, 01 Nov 2026 22:52:17 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-67a6b2a2259so1611836d50.1
        for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2026 14:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793573535; cv=none;
        d=google.com; s=arc-20260327;
        b=lcWA7kuc3P3i3Ic5IwHZHCnwLslmJu62Pa3uO2FcvNVous0CM1ZVE6CCRgeL/t5BfM
         WRmpyRiz/21YMcr+2Vmq6IdaqujjxnLhzv/cUmIO17dBBHkC8/6k1HnQkqchFV3qSPLg
         8n9FInwPG5Kb/S3kYtGv5ZZqDJgZg6YLB2hFNACJrqsm2xCTSupZuIxhvoSfnTZZ+5EA
         FaRv2CVEtphqZNN4zhZB2PYJ6VE33MtRODPTm8sH0cr55j2ens8m1G6dNDP6MQgPZ3TO
         TyTUHKb2lmu6JT13vTeEHdMrZN0Ch8Ii4xnH1SKse0zrIj8NUQnOtMj2k9rRRkFeo0Ja
         z4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        fh=BOdAEipMtTg4igNdAbQXuR7jXjxL+e2o9Yt5gm9Bd4c=;
        b=ShKnnEuBszF3Uk+V0SjK+rbZgt0NBB0JM9zaR9ucYusGowOli5rbEkcRRfIth5vUVS
         cXTgUPaceBGkje6nI14g7bceNvTatB8JghAVs68l5WkTK+Fk5DC38tywWZFQx6g8RA/i
         PETUWWuzhRr0fh0jlmKWDcTXxYHoEv3p63hIyak1kuFr0tEDpuV4tL+YnZELsUm87SnB
         kUE26rUgNNId/i7gRNNCaJucAPuo48LnoFSnYHYY1pjJUk5SGsHP7NO3hEQoRGLk359R
         rzGBTTT/wEf8wvLtwTVjMmpUvY6zFTg7uV5by/b1Sl6iq/huu85cNSLCz8L5E3fp3Yd6
         H0XA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793573535; x=1794178335; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        b=cSX82FWkr0oGZrXLIDn8Zi9L50+S6MoQB6GwuKD3O2aKcfGK8jMtH3QEzOdY7pn4N7
         i6gRjRkNKW7vlh3DPSKrYsEwjhzLfDiPCLzrXvfusSPzCpk0a+NSYM/NyUXssmaOp31v
         OruSh/BiQejYnBh/uzgpQhOhyLT1PycUu6jEx08Gd59enTVYkWi8AQbcIAZLnlmPbuih
         sySnUvN3Ed6puGuk2WwOp/VsrKdzyHz2EATZKkC1kbMmhxBYKHx4zHyEnMZTY74NVEKY
         IbiCHWSYIvOqsQ1ivMGZgp9x5D4dSvkRPTp6YFIcDNrq7FZifHLqKfT+2H34LQe7MMKp
         KjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793573535; x=1794178335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eu5PeOoH37NAfd6nk+CLB2nF31owU+T7GEbEN3ieYFk=;
        b=oMIBjVtjrgMx/ouxV26DaSl3FA2ib6ifVIUDJFV8OHEi+Re8N1lQIY0k+3YJhVeJaS
         xoKHDGAN+QWpTQ+wtqFqbtiojEmmUnOu9PbXNfQJeEPuF6wiY/YzVYN5QiPARAVEhnhT
         +qQxFec0yjn3nYnxBzGen7fw4cGad7+P4Wup2nfYsjDB9tFZybqrPOLI9prNQwVtQYN+
         H/jp09lnRwJED1cWn0L1quso6A4sGDL+g5h5+ETQ6tjGQ0Do+NwnOPh5Mky93Pc3E7+c
         5ydvzoDZ/Kb9chwLzA85SpRJvGq/yu1bAzgRz8D8zq7+k0CfJjmz4lHIBqWvcTOI2bBo
         xPKQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7JkjIza9aqkI3asinhlINd3q0a8rDbrzh4iQpUR3q1X4hW4ot7mapom0KJQo1sL/9pUKXhXWGr9Uo5INF@lists.infradead.org
X-Gm-Message-State: APuU4Z9clSUdGSEsKEHYhuDZoAXJPPB3Oaql35RwNjqgvEgLptnt46+C
	QkARqT/gXgNtOe6hxaui4EIVrSun2tTvQrpgWbyTJ87lQAMILfMq0AuTuI0Y4sW7rU/MYaOC6KO
	m7ZmywiPAqXIiADPEbtyBsRi6CEw8lqE=
X-Gm-Gg: AYBFou3W0hN0H/ugRThwwNNwFFFpkP5yWfQntISCbMU3lcyBujjMKf89XEgIckcRWlV
	EDuDVaDqCbmL9qXLIoFmcR5sT2FMqwDxTLqJkDWkEtsy4Rr6q2iL5+c3nPkR44GPU0ToBHvCtJC
	E+GCKwJbLB+pgaJHaDIHYJGggQTqQ0xFbFeyVDC1WdNoB0E4SxNli+iQDojoZeE2vSUr5aS98cU
	0EE/HJmmzK5Dn5HUzQcPPv5sA/cEBPW1XDluYazmPIbehKhpbBxuvMC2fzhdhpPZPLCeRZfvjSm
	viB4GRx5Hj67OnQLOkaEbSB1DxHrrv3zRk9olAwiNNJY6hI6AFTF8WbN0cuuu1jz7Fs/XjAVSTY
	pC9O0Ya2RXGnHrl/264eUsi1m3SC7qR41lJqQleA49/asFMew1AWR4dKCkJo2jM+iMFxYoA==
X-Received: by 2002:a05:690e:b8d:b0:679:98dc:b39c with SMTP id
 956f58d0204a3-67ba501901amr5094827d50.125.1793573534917; Sun, 01 Nov 2026
 14:52:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031200925.3364-1-yuanzhenpeng210@gmail.com>
 <CAFBinCBo0C=KABcg5ueDTRSJhF9vmWnPwYHbaMGTOYppOsabwA@mail.gmail.com>
 <CAEDN0nDjYLE5hy7gVLQ3hv1WESVJQWgc7T_8aLqzRui036A-_A@mail.gmail.com> <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
In-Reply-To: <CAEDN0nBEK5PvkV-eC11XHYG04Occgs6o9_9K67OZn+xtkh68yQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Nov 2026 23:52:04 +0100
X-Gm-Features: AclHuK-R3xNv9qpm1VWMmHjI05K4ugJP9l_pkjDrq2qiEZoGQf-7YzD1L0LqP9c
Message-ID: <CAFBinCCxfp65Fe0D1UnupghgiOkTB0-m=+L0kNSOUm7DzRFKcQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: meson-mx-sdhc: add DMA bounce buffer support
To: HELPMEEADICE <yuanzhenpeng210@gmail.com>
Cc: linux-mmc@vger.kernel.org, ulfh@kernel.org, neil.armstrong@linaro.org, 
	khilman@baylibre.com, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_145216_328585_52CCC849 
X-CRM114-Status: GOOD (  14.83  )
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

SGksCgpPbiBTdW4sIE5vdiAxLCAyMDI2IGF0IDk6NTXigK9BTSBIRUxQTUVFQURJQ0UgPHl1YW56
aGVucGVuZzIxMEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgTWFydGluLAo+Cj4gVGhhbmsgeW91
IGFnYWluIGZvciB5b3VyIGZlZWRiYWNrIQo+Cj4gSSd2ZSBjb21wbGV0ZWQgdGhlIGNvbXBhcmlz
b24gYmV0d2VlbiB0aGUgb3JpZ2luYWwgZHJpdmVyLAo+IE1NQ19DQVAyX01FUkdFX0NBUEFCTEUs
IGFuZCB0aGUgMTI4IEtpQiBib3VuY2UgYnVmZmVyIGltcGxlbWVudGF0aW9uCj4gb24gbXkgWHVu
bGVpIE9uZUNsb3VkIChBbWxvZ2ljIFM4MDUpLgo+Cj4gVGhlIHJlc3VsdHMgc2hvdyB0aGF0IE1N
Q19DQVAyX01FUkdFX0NBUEFCTEUgYWxvbmUgZG9lcyBub3QgaW1wcm92ZQo+IHBlcmZvcm1hbmNl
IG9uIHRoaXMgcGxhdGZvcm0uCj4KPiBSdW50aW1lIGluc3RydW1lbnRhdGlvbiBjb25maXJtZWQg
dGhhdDoKPgo+IC0gZG1hX2dldF9tZXJnZV9ib3VuZGFyeSgpIHJldHVybnMgMC4KPiAtIGhvc3Qt
PmNhbl9kbWFfbWFwX21lcmdlIHJlbWFpbnMgMC4KSSBzZWUsIHNvIHRoYXQgd2lsbCBwcmV2ZW50
IGl0IGZyb20gZG9pbmcgYW55dGhpbmcuCgo+IC0gVGhlIGJsb2NrIHF1ZXVlJ3MgbWF4X3NlZ21l
bnRzIHJlbWFpbnMgMS4KPiAtIFRoZSBtZXJnZS1vbmx5IHZhcmlhbnQgYmVoYXZlcyBlc3NlbnRp
YWxseSB0aGUgc2FtZSBhcyB0aGUgb3JpZ2luYWwgZHJpdmVyLgo+Cj4gSGVyZSBhcmUgdGhlIHNl
cXVlbnRpYWwgcmVhZCByZXN1bHRzIChNaUIvcywgbWVhbiBvZiA1IHJ1bnMpOgo+Cj4gICAgICAg
ICAgICAgICAgICBCYXNlbGluZSAgIE1lcmdlLW9ubHkgICBCb3VuY2UKPiAgICAgNCBLaUIgICAg
ICAgICAgMTEuODEgICAgICAgMTIuMjAgICAgICAxMy4wMQo+ICAgIDY0IEtpQiAgICAgICAgICAx
Mi44OCAgICAgICAxMi44MCAgICAgIDU3LjUyCj4gICAxMjggS2lCICAgICAgICAgIDEyLjk3ICAg
ICAgIDEyLjgwICAgICAgNjcuNjgKPiAgICAgMSBNaUIgICAgICAgICAgMTMuMTEgICAgICAgMTMu
MDUgICAgICA2OS40Mwo+Cj4gVGhlIGJvdW5jZSBidWZmZXIgaW1wcm92ZXMgc2VxdWVudGlhbCBy
ZWFkIHRocm91Z2hwdXQgYnkgdXAgdG8gNS4zeAo+IGFuZCBzZXF1ZW50aWFsIHdyaXRlIHRocm91
Z2hwdXQgYnkgdXAgdG8gMi4xeC4KTGV0J3Mgd2FpdCBmb3IgVWxmJ3MgZmVlZGJhY2sgaW4gdGhl
IG5leHQgZmV3IGRheXMgaWYgaXQncyBzb21ldGhpbmcKdGhhdCBzaG91bGQgZ28gaW50byBNTUMg
Y29yZSAoZWl0aGVyIGJ5IGRlZmF1bHQgb3Igb3B0LWluKSBvciBpZiB3ZQpzaG91bGQga2VlcCBp
dCBkcml2ZXIgc3BlY2lmaWMuCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
