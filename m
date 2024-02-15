Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47561C48BEC
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Feb 2024 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0lgtdWlz0jdk36mS0zkMYTyo9ZX6sf3RQe3Sn7wbGw=; b=p0aREEixcjBHbM
	YX0p1oxFSGMZQ1biqbKyT1ZJuOYo7swyudrixHPIUKJjerB3t1ggxd5cIx/qMmdSok2x8ePMESgMQ
	Qx02U7y3zRHGETvixUfzsiLq9NQtp7UryYPSQ+6ZPPwXBF3WrqfOH4NTSEyPdovEM7f30amiXS0uA
	FA1uvkOaxpL95gA/O2ooEYiyQWhSULFoaquulsbZO/sbl/N+u4JySwKxV4QWiQo7nkYbgABDHy5dR
	JG6zTBpHbRXS5mLmixBqxoJd7nhLNrWF1e7xJZzEWQmEslX2Gt355TvtEQsuwAUugFFWOGFV7JM/j
	Oo9CWYMf9TOYC6KEVALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rajmQ-00000000GhM-1L8T;
	Thu, 15 Feb 2024 22:00:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rajmD-00000000Gcy-2bz2;
	Thu, 15 Feb 2024 22:00:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d780a392fdso399395ad.3;
        Thu, 15 Feb 2024 14:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708034415; x=1708639215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gs6NzoFHCnkXscwFWvqskhg9gjZlTzzaBFX4/MoY5Y=;
        b=MhZwAnmDNYAHP2qj7eLtneVSHZHmVBRgYQOw5BCj6BjDENZ4vWdhPf4CJ+z2cu3NDm
         +4SvjKXpyHSt/JVwWKeExo7CNnZI1GwT1LmH+zT7r1s0A87MymF3sGlyruXFMPf6QkIY
         mCsGLLyZRBkrkJR4uw0BWwyVOMEYxDOhgkSiVJq0e9on1dIpPBQK7U/XRSazOjC1oAWP
         VrWHFmvSevzVNwOLKJQT7oM9iEAaCxZnOE9MMoFKxD0Fn1D3s8CzaIZ9IgUb72K5ekH9
         wFAoYiEa8Dwhzp2F1mTDVxGSrqBSYZHVLQZyC7y706Mtit7GWwULFrtffmtXW7eDOf+y
         KgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708034415; x=1708639215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gs6NzoFHCnkXscwFWvqskhg9gjZlTzzaBFX4/MoY5Y=;
        b=cgrHoCRPrSs8dUmT/d5BAlNzYuVukiizdXKpAnxlBoB2C3ATipUh/TceEIurccxNDN
         haK33hwtMj4UodIkharwywBZmxlBKSnnB4VFogAiOSo7Z1NcQcDNMcm+srzMnp7Gz1v+
         rzyzKq7ugDiDpCmWmFwXnpQA0GxJWOnBZdAxfkRFQwiHxES6+XqxkYjJ7NPcQDCcvToO
         oSGSqFXACAjS0U6Te5ZhO9GjGR7FaXxwfOS60oUTxG2dvp/77lu7A+VW6IpaCzNPI7Oi
         frkwpVKFMJvDbRoG7vbxlWaZTOKC0JJzr4VvqTedgzhJFWjOWdQ7Cmvm7CAQRilc3240
         yf8A==
X-Forwarded-Encrypted: i=1; AJvYcCU2QBZ6JHqU6Kt4Pra0G/SgQYYBsbUR0wajf3HczQZzU6b21HOD2Z4EbYOvzNTsbLas1uhb75WlQvo0kPdVxKlWyIvXIw+nSNYc/t0t5wZ6YF45XvcHVADCvx60E6W3CA4NXTdiuFPix7T0GJW5i53rRk+Mh4Ubfg==
X-Gm-Message-State: AOJu0Ywibe6yjxJB0fdmSs3JWzQoO51ICK/1m8js8dhpTAS/s4wBP5fS
	DoaDx3eyfgbQI+qow30PbsPPQPT/E3/ZHFswnifGM3x4Ou8P4eITh0TNBIeLqAkHl5+vS95UOoB
	z+lPz4Q84ojaREvCs4kJ7ag0dMvQ=
X-Google-Smtp-Source: AGHT+IHUDH5HqCEHGcEyjZXHmI5Xqq2dmWkbTvIn4GOxHNF2G+rYrxFr0nbuvjQ7lPuYMA7DRSmSDmv1O7wRb/LkOIs=
X-Received: by 2002:a17:902:e5d0:b0:1db:2ab0:f3de with SMTP id
 u16-20020a170902e5d000b001db2ab0f3demr3897384plf.13.1708034414315; Thu, 15
 Feb 2024 14:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20240213142831.3069049-1-jbrunet@baylibre.com>
In-Reply-To: <20240213142831.3069049-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 15 Feb 2024 23:00:02 +0100
Message-ID: <CAFBinCCELS7ss0KBW+iHeevVWQzO4Sz6vTP4=E01u3+o73-HBw@mail.gmail.com>
Subject: Re: [PATCH v2] nvmem: meson-efuse: fix function pointer type mismatch
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_140017_828955_02D3F0D5 
X-CRM114-Status: UNSURE (   9.80  )
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMzoyOOKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IGNsYW5nLTE2IHdhcm5zIGFib3V0IGNhc3RpbmcgZnVu
Y3Rpb25zIHRvIGluY29tcGF0aWJsZSB0eXBlcywgYXMgaXMgZG9uZQo+IGhlcmUgdG8gY2FsbCBj
bGtfZGlzYWJsZV91bnByZXBhcmU6Cj4KPiBkcml2ZXJzL252bWVtL21lc29uLWVmdXNlLmM6Nzg6
MTI6IGVycm9yOiBjYXN0IGZyb20gJ3ZvaWQgKCopKHN0cnVjdCBjbGsgKiknIHRvICd2b2lkICgq
KSh2b2lkICopJyBjb252ZXJ0cyB0byBpbmNvbXBhdGlibGUgZnVuY3Rpb24gdHlwZSBbLVdlcnJv
ciwtV2Nhc3QtZnVuY3Rpb24tdHlwZS1zdHJpY3RdCj4gICAgNzggfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAodm9pZCgqKSh2b2lkICopKWNsa19kaXNhYmxlX3VucHJl
cGFyZSwKPgo+IFRoZSBwYXR0ZXJuIG9mIGdldHRpbmcsIGVuYWJsaW5nIGFuZCBzZXR0aW5nIGEg
ZGlzYWJsZSBjYWxsYmFjayBmb3IgYQo+IGNsb2NrIGNhbiBiZSByZXBsYWNlZCB3aXRoIGRldm1f
Y2xrX2dldF9lbmFibGVkKCksIHdoaWNoIGFsc28gZml4ZXMKPiB0aGlzIHdhcm5pbmcuCj4KPiBG
aXhlczogNjExZmJjYTFjODYxICgibnZtZW06IG1lc29uLWVmdXNlOiBhZGQgcGVyaXBoZXJhbCBj
bG9jayIpCj4gUmVwb3J0ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gU2ln
bmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+ClJldmlld2Vk
LWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwu
Y29tPgoKVGhhbmtzIEplcm9tZSEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
