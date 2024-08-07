Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAC1C52D6F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRQNpjoIyqzzddfSzH8UHg49xIvaxuH2+jI2wAgvUyU=; b=oBeuiNcpiEuK1n
	0R6tatwBAAo2UeqRO3mJswx5kG788sNIS+ft+l81OsVBtwyb5DTF7q0NLKr2nfnsNOzyEvSvaexXI
	i708sMldHE/OcKB2YTnGuiy+STjl9kx4nDj0f7iJ3t56PaXC7VXpdJ6+oaNfJTv0wlGMbzQxeJq3c
	ZZLGHbYXdqK+nqYmQy304hNINnw3X3+dyYX9CDTcha/3/pzi7uVliCO8FqGRXxHK12GSSC1hpOcp6
	u87vBLEBgBopKiYYADuqHo6rtZzIRuUsvhXgLfLIJqL2/hwDGCyhNDk3aVL4i5T/DwEOPoY1QqSeg
	QILUSsIAb3nzvtzhgVnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbZn-00000004I2u-3HMl;
	Wed, 07 Aug 2024 07:59:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbbZk-00000004I23-1g8m
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 07:59:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4281c164408so9692755e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2024 00:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723017555; x=1723622355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZRyH1wZ8UABMYeIFk4r7hWP8ATe10mkdDCBs15OCtE=;
        b=y5L8ETSXOEfRiGGJKvL+E/yPuGTUrmG8BX5n4R5aF4hGCRKnlhaQ9nq/KFLRAHoevj
         sLdUwPD+73pBLBuj8+P+wyAJfpYB8OpYMt+zg384LqKXkCAcZ43V2r3jzZiarV9OrsVW
         zN+ytKPP32MusbrpOE9au+Y/J8xICkyvgt78DWqKeycj7qoWzeNLwYZwWI8LBL1U+q4E
         fdwaFElSu8geWqA1G/SoqqaEJgAA9/kQHOU7XwnkOOQPT00x6rikKyrSbvbtTomTDlzc
         iEAwwDD90wVZmD7iK2/JO8flIdVmg2/1YT94lu3Zt5PDQJ7sojI6BDNCmaGp3LJ05lWg
         uCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723017555; x=1723622355;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZRyH1wZ8UABMYeIFk4r7hWP8ATe10mkdDCBs15OCtE=;
        b=VJyqrOg6NevxLQoBGXcDPUg489kL+bATp4ZO61N4fSBL7PxR+pUqaica8S+Tem0PlF
         hH4wUWNf4QFq7Qh7jFXbMTT/QD3TEz+ybpU2Fd3iX9O4qK8xlLUdwt8nawRLIRXYbhsQ
         WI7YRbSFH8VSSdYe1z54EBQ90+AKYPyc70FKyrS5eo/tcc+tFD4uLKPlu6iB/pAqaBLs
         twU/uc0k8T21nVjeT3w+uFL/7pPv15YXa0pKqTjAMaLxprJSCph75t3CT4xVa+LBcL6F
         1lTakLlKP53eAYZHFTqsYLCQ9nZZXCEjSG0lAYuBvJEph6X1+yMXf2X44JjeseAO3C+T
         Np+w==
X-Forwarded-Encrypted: i=1; AJvYcCUvVas6RsrphgYjuoFHga4xEUdOgAvUEYC4m9lsYJvY8WnAxNLOnoiEFtjZHj4GzpgdQOFPwh78ybBXOj+w/yDc9+p96KKVBVfFUrtzfxb0W54=
X-Gm-Message-State: AOJu0Yxs67ExI5eCPTQJNmuY/bylTOI6JTY506gD0BnD3nIz/IWlZKzj
	9FwS5iqjllISBhCyv1Hz8U0QBtP2mSCyol1VkP1fKOkrt0DhcHSJQTdj45t/HMY=
X-Google-Smtp-Source: AGHT+IEWEBDIMErakCRpWAkvv/5YGsQlzUNSq19w3HIbKjzjEPjUi7r2MOgifYzImGGtUTOKZi13Ag==
X-Received: by 2002:a05:600c:4ed1:b0:427:ff7a:794 with SMTP id 5b1f17b1804b1-428e6af1d48mr117202915e9.4.1723017554278;
        Wed, 07 Aug 2024 00:59:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429057966ffsm17007505e9.3.2024.08.07.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 00:59:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Kevin Hilman
 <khilman@baylibre.com>,  dri-devel@lists.freedesktop.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] drm/meson: dw-hdmi: use generic clock helpers
In-Reply-To: <CAFBinCCW9bNtHLRaJNBvqLXN_vCm4mFSVhhV6OcrUb+j-0x3kg@mail.gmail.com>
	(Martin Blumenstingl's message of "Tue, 6 Aug 2024 22:28:10 +0200")
References: <20240730125023.710237-1-jbrunet@baylibre.com>
	<20240730125023.710237-4-jbrunet@baylibre.com>
	<CAFBinCCW9bNtHLRaJNBvqLXN_vCm4mFSVhhV6OcrUb+j-0x3kg@mail.gmail.com>
Date: Wed, 07 Aug 2024 09:59:13 +0200
Message-ID: <1jed70zru6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_005916_458340_E04DE283 
X-CRM114-Status: GOOD (  10.53  )
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

T24gVHVlIDA2IEF1ZyAyMDI0IGF0IDIyOjI4LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4u
Ymx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKCj4gT24gVHVlLCBKdWwgMzAsIDIw
MjQgYXQgMjo1MOKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiB3cm90
ZToKPj4KPj4gVGhlIEFtbG9naWMgSERNSSBwaHkgZHJpdmVyIGlzIG5vdCBkb2luZyBhbnl0aGlu
ZyB3aXRoIHRoZSBjbG9ja3MKPj4gYmVzaWRlcyBlbmFibGluZyBvbiBwcm9iZS4gQ0NGIHByb3Zp
ZGVzIGdlbmVyaWMgaGVscGVycyB0byBkbyB0aGF0Lgo+Pgo+PiBVc2UgdGhlIGdlbmVyaWMgY2xv
Y2sgaGVscGVycyByYXRoZXIgdGhhbiB1c2luZyBhIGN1c3RvbSBvbmUgdG8gZ2V0IGFuZAo+PiBl
bmFibGUgY2xvY2tzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0
QGJheWxpYnJlLmNvbT4KPiBSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPgo+IG5vdGUgdG8gc2VsZjogZXZlbiBpZiB3
ZSBuZWVkIHRvIG1hbmFnZSBvbmUgb2YgdGhlIGNsb2NrcyBzcGVjaWZpY2FsbHkKPiB3ZSBjYW4g
ZG8gaXQgd2l0aCBjbGtfYnVsa19kYXRhCgpIb25lc3RseSBJJ3ZlIGdvbmUgZm9yIGJ1bGsgdmFy
aWFudCBvbmx5IGJlY2F1c2UgY2FsbGluZwpkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIDMgdGltZXMg
aW4gcm93IGFuZCBkbyBub3RoaW5nIHdpdGggdGhlIGNsb2Nrcwpsb29rcyBvZGQuCgpJbiBJIGhh
ZCB0byBkbyBzb21ldGhpbmcgc3BlY2lmaWMgd2l0aCBhIGNsb2NrIGxhdGVyIG9uLCBwZXJzb25u
YWx5IEkKd291bGQgYmFjayB0byBwbGFpbiAnc3RydWN0IGNsaycgYW5kIHVzZSBkZXZtX2Nsa19n
ZXRfZW5hYmxlZCgpCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
