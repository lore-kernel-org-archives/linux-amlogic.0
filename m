Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8EE606A330
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CVuNbLqb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=XysbLgkp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7Np9gEKtgTLSHBPmlEGJlfG4TsS6HU4Nn82I7r3iGWU=; b=CVuNbLqbzgCmB6LBKWT4ZwheHX
	hqYR9oUzg17jeXxbUYMfdBeyDRmJIDtcMedKTtxSQzsUkn4FuU6mvudXK3QHJIeitUs5TxIrHIOYt
	NrTJ58rJSB1K9L6r4Xlmc5+iJ/b00cxKjUyL+vH4RBGmRmZ97QhQOlMzcTfZh+ndKjqsmRNRpYM6c
	cPKXOkgd97bjPsVJRT1D1+2XuFRzwkSzAL1hLwVewYnFGcmOi9AzdNjqxHCgv+3gt2m7SzZbIzPln
	FKAdK+1zkhJ0MVxonAN08266UBm3u10kuZbSwCBWFVztHTWp9bEgQoHJJVJwbucuiXCI/EBzWwGbb
	gdDhXnFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShP6-00000000TZM-1wjL;
	Sun, 15 Nov 2026 21:04:48 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShP2-00000000TXw-3XtN
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 21:04:46 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-67db35e7953so424716d50.0
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 13:04:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794776683; cv=none;
        d=google.com; s=arc-20260327;
        b=pi0LGsuceatYtTfjVBqNcFIT5qCOZ4svpy+m5/Yrrkclhsqk3gJSNGYP5GJM16L1TX
         yRFFuFZNfNtX5ByecMAn8XEGjxjqafFBQyow+yONEyPxrJHQXwupnq+cxxO1XkL6dPHi
         t4/6MIuTFbSogI4M0kx83oB3uhe+cS2v40NjCIbI9zFsypKGiJWcsJ7dUaW1BTg1+4mR
         dYbBC9/GkpiM8IZCuQ96vCYDqrugigR08GLbpbSjv0KdKB8h1p5IpgUR95Dw22WDmzKR
         YW+f/N4kb7L7KlbeWRAD325V+Y+IT5WLpqlqVdbW1Yyq+W6KyeBr4TE8ES7Ql7Kg8ENg
         PFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        fh=N9yp4uQC8eRR+Z2sH/qMqBtK8I2qccSz6b5WJ1Mzi54=;
        b=U8CBTgWshdFYlGii139EC11aDqulLTrYUqcPoAzeBfJ5hB8EFQKm4whb2yIxrbz0IR
         Q1fCOSgyeVgjSAVARTjLUsUwRWNtPR9GfacAgPWPGKgYFFscNhiOrEhEi5mAEnHzmiyI
         pTQ3CR+FUaeTwS1QWlGPCZI3n8mRV11kJRdLvfcfie4pCQNwkUqtaBsoYpA2kdU6cpjp
         uCLiYqW692nlBv8PlaVWHEdlXifTrEtEbvi6DFVVDv6ccTqqzQDlWUcWCi0cMbL+jnBA
         PbanlFsd8jJKaTzqrvxDwayt0sNT23geq1yT88ebN/Lihyn8bHA4xtnDmqfgWp+WV+ou
         Rehg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794776683; x=1795381483; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=XysbLgkpzdRqhsIkUk72Ux092aL/o5gjo+QmD28f+eBdPiBuzzK7dnmfxnoVcZGdEV
         n+E3r0zcmbpQDQgfsDzG//xg9zFtaR0QpAy7GNKI0IX8t+WmkXBuHwRiVcnBGeh0BrIb
         5WiN+klAQsFZd/leFSbONrHtTe2AUehAx95hJ14qBvQbBG0bYobPg7DhroTzRujM+lpA
         cBdqN2YrF/m6ZpI/B4mOQ9wutjo9ucOIFNysuAyOy/564vpFMOQZg7WQE0gQU/JU0bUo
         r0ONElvp+lbV+CDgDLhN9gFIkwHzcwdeRsO00mx9hh7S8U5LFTmpwlPwZyQciWPuDiPG
         H/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776683; x=1795381483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIHnyJgJC+IXkahXP+z0qF28x1WEe7IYoK+ZV519Rug=;
        b=CD0zUWlhW69SsWFhvLgb305X8tpk+qNkxJDMw6FszZ0fuPw06kOPqfdp7Tj5pCP/OI
         usKSPZnVde6z41uW8DoLpCMoKJKHApnBtNdo1Xn5T0RAtrRAtXIwMSSN2fBxy97AIuUe
         bI/RrCGnA8oIZ3NrpqX1Be3t4zX0GhO+iFuRjB8qKlVsicyRPPBDaREmDcHQYG1BzAVc
         /bsPiWg5Mw3ocmxWy92BdMn727WL/z7Ps1zeNEt1AAoEOGA4eVmYDLc0ZMDUtGptZHH3
         XAVx/jWZRZqJg28h/cgqkbyxkqAvc4IwZmCi/VCKKQW6FMos+kSV5nODCoXEvEJSY4jx
         RzlA==
X-Forwarded-Encrypted: i=1; AL+hErFGahK+ty60sMwWE3V1+YZznrp/CSoTPSVhCnjiyiW7vr3JDvt3/Q0BWuXpUpi/6HzNnlbFsJDvCeoGlb3n@lists.infradead.org
X-Gm-Message-State: APuU4Z9TuIelxnr99R0Fguar3C8A7CF0SAesfVmVVK2w3Abta8uP351J
	BV900Lsx1GuHbq+3wvmnOIi248bNsCd2BWzyDbqh/nbBOessP8Y8PQnw5HYhrbxzbkNuwTGqjAJ
	fl428pnMj+ydfVwuG0dUFf6jxkAraTso=
X-Gm-Gg: AYBFou3GP5Aj7DPKmOBeUxcUeVMTKh0NRN0cyZmzQWuObwCxFcT2X72jG6JspboBb3X
	b9Uo3in160453ek2Xb/2O5n6NrTciacYGRPY49Abp5Tvwr6BUmFXLL7kJCUWvu/YEks/ZXbV8TE
	93UrEjVCfYrqQBs/FNaUTpVisg1m0gjLUJg0SJLoDk9aK/+nm0NZfeUrkfX4YfyZaTmVmVTaqoJ
	duHGmvCy7PWGTOrakTlylLFdPxlddyGEttXhW7RR6D+gBfCO/jt0KZdwKfNjoJ8uWOITm+0MQ9z
	vuyd6aYXjQE1lV/zWoKBmXmBgUGaHsl+RxOSq6vjuVQlxKuIq2gcHAq0qd+9icwVZMCJb7Eqz1P
	kcqAf/ROKtSGAtmR3F99yt4b0kE0WBu1+ykIfkQ02ilRUPcJnce4PfIjjrtc3sSAWxU2eSA==
X-Received: by 2002:a05:690e:479f:20b0:67c:2b34:31a5 with SMTP id
 956f58d0204a3-67d896aa73dmr2886678d50.56.1794776683083; Sun, 15 Nov 2026
 13:04:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com> <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
In-Reply-To: <20261018-audin-v5-2-4b8cc13a1b22@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Nov 2026 22:04:32 +0100
X-Gm-Features: AclHuK9HsBcphbKQs0k8LqAA9uRq4kzQTQJzZ3MTf8At638gba0WRnCC9ExoQzo
Message-ID: <CAFBinCDtqNQM=89mQ9uw7hr1CJVGo5fHNPJd=jAyDZ3+L3wCvQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] ASoC: meson: build gx-formatter as a separate module
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_130444_889055_4F252C79 
X-CRM114-Status: UNSURE (   8.91  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMTI6MTjigK9QTSBWYWxlcmlvIFNldHRpIDx2c2V0dGlA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEluc3RlYWQgb2YgaW5jbHVkaW5nIGl0IGluICdzbmQt
c29jLW1lc29uLWFpdScsIGNyZWF0ZSBhIHNlcGFyYXRlIG1vZHVsZQo+IGZvciBpdC4gVGhpcyB3
YXkgaXQgY2FuIGJlIGluZGVwZW5kZW50bHkgc2VsZWN0ZWQgYnkgZWl0aGVyIEFJVSBvciB0aGUK
PiAodXBjb21pbmcpIEFVRElOLgo+Cj4gUmV2aWV3ZWQtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVu
ZXRAYmF5bGlicmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFZhbGVyaW8gU2V0dGkgPHZzZXR0aUBi
YXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
