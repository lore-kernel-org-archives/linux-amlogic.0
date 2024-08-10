Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF761C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Aug 2024 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT5crIP6yKnD/53qUHLJ6R7cVsIUNeEZ2ZDUwUVRknk=; b=s7+8GesIS5Ltvu
	CV3nI5med1sCXZoohE9iccCq2smC/1oH9NoctnOhQgAvMFIWsK+SykuhhtN9twxYl5uLcBsEtbftV
	5lXk9zp+Q6CrKfdHeulg8xyfolbT+u87DSswqLaEIoiWr9MMrvUiOVISClD00WBuWDdpztf5fFeas
	tddLmLs3rNotDF0zOGNO6Tl6mriVRuiprRWK4mO+oK02SjPnQYXW4Hp/Rrzdt0V87IaDdsHwk+kEj
	6cmuYsmP6aaI4aTYa9fRz8CKqc9uRUh0J9mFfm2Q+Ja01FZ5DYstSSlyseFWtXoC6e4pGyx4vYM05
	KZ34Zrc1/i8ELklksfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci9w-0000000Do8R-05nM;
	Sat, 10 Aug 2024 09:13:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sci6j-0000000DmPz-1a6Y;
	Sat, 10 Aug 2024 09:09:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fd69e44596so20024575ad.1;
        Sat, 10 Aug 2024 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1723280992; x=1723885792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIhiNkZ8ivhgmM1Cc6VYiyybqghiNsm+0JIy+oF46uI=;
        b=l+zo0eZ7xmGh1NeKqu3BcquSqUAv1Ov2+ed3qN92xFiOviw2GMZzpRZBCviuWSQyjC
         18Zg8puuIDmwN5MZkR3yMSfW2fz/DkQaFahN4KDdT+q814+Gj8MXl4Ahw8gVTO1HqoEP
         fem1t2Iu/pEY+hh7UCHeZt2GDJn/GO6xeAkmWdctf/NfxsP13aleuGSqNE88ZjsPACQZ
         xxi8Rlg0clENL9BVmCF/ha8BrcOn5m9ttS7DHmYFgJtn82SRMvh6n6f04gd1j8IK491Y
         uxjoglUBRyFY+sLBuoFd8xxOcsaUC0Uu1pO/Qa6lNntEwpQTPOTjRqaj36kGBufcD4Mp
         9SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723280992; x=1723885792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIhiNkZ8ivhgmM1Cc6VYiyybqghiNsm+0JIy+oF46uI=;
        b=fzOVEjsZZyYahyCGqSmMln7sK7XduqgVuxDFig0vtuL2gP2x4Cap1ZlcnUlWW0d4jT
         qVeHk0CdCuO93xQKkDp5e22lU19qu7QItYisBNlulqSHRRklExv7URvBzNiXAmKUtlry
         InZTCjpZjHV3q4WrxQNgoWpWJKfNx8gispc4EQmOyQ0CUgW7Z4ae3nZVymrqBpulTBrk
         cdWGSSNmSBmyfcyKPn0HxTgiRR0dMm1XTwZrl6XBtQVRM8xg/xsn3kFY34Zg942Kl3Ej
         8qf6msXg4LXbUD9JRydi2JYkYQspS9O5KsJHNgyvOZS8gTi3RqWq9Ego5z37xFxKn6ft
         zwTw==
X-Forwarded-Encrypted: i=1; AJvYcCXBTNx0WUVQe8F6apd1dBu4BVy/0V7PZmmhRnbCJwGlVuNtdWrnG8tURbOU6gSotwlHfLyxIMvPbDe7kZcSzR6TT4Mng9azyCNX8jxfFhoVBqaRmHRBeoF1Gzhuqt13Hzxn+FrTVQ3S/j8PM0DWO0WazTYImcJI9Q==
X-Gm-Message-State: AOJu0YxJpjZg1TMjDHuYK2BV/yPjhXilMHZkNfaLES1FDU1r+H2h8r72
	ZfBKNZdmUHi19Pu/JVfmiXvkRL5PVZp6RYqj6Qc9ClBo1jCedELKIoVy0Bnq77Hltu3tfFh5+TF
	gEUu4QqOe0FsrxwcExLbGHm8/KCz4ekFu
X-Google-Smtp-Source: AGHT+IF0omZAMZcq00ACjBVeu35rKGSbTQfOx1gz2tQVmuRuPcEz5qrubbYp8kV3RZnFuDT5aznCRbdgeLj6EanoUrE=
X-Received: by 2002:a17:902:d482:b0:200:97b5:dc3f with SMTP id
 d9443c01a7336-200ae5d86afmr58455285ad.21.1723280992065; Sat, 10 Aug 2024
 02:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240809124725.17956-1-abelova@astralinux.ru>
In-Reply-To: <20240809124725.17956-1-abelova@astralinux.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 10 Aug 2024 11:09:40 +0200
Message-ID: <CAFBinCATiUnR=P9VRBxWeQhf49k6PVxK+nU95G7w94f-mR2HWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: add check to prevent dereference of NULL
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_020953_454793_F7695A3B 
X-CRM114-Status: GOOD (  13.91  )
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

SGVsbG8gQW5hc3Rhc2lhLAoKVGhhbmsgeW91IGZvciB3b3JraW5nIG9uIHRoaXMhCgpPbiBGcmks
IEF1ZyA5LCAyMDI0IGF0IDI6NDjigK9QTSBBbmFzdGFzaWEgQmVsb3ZhIDxhYmVsb3ZhQGFzdHJh
bGludXgucnU+IHdyb3RlOgpbLi4uXQo+IEBAIC0zNzMsOSArMzczLDExIEBAIHN0YXRpYyBpbnQg
bWVzb25fZHJ2X2JpbmRfbWFzdGVyKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBoYXNfY29tcG9u
ZW50cykKPiAgZnJlZV9kcm06Cj4gICAgICAgICBkcm1fZGV2X3B1dChkcm0pOwo+Cj4gLSAgICAg
ICBtZXNvbl9lbmNvZGVyX2RzaV9yZW1vdmUocHJpdik7Cj4gLSAgICAgICBtZXNvbl9lbmNvZGVy
X2hkbWlfcmVtb3ZlKHByaXYpOwo+IC0gICAgICAgbWVzb25fZW5jb2Rlcl9jdmJzX3JlbW92ZShw
cml2KTsKPiArICAgICAgIGlmIChwcml2KSB7Cj4gKyAgICAgICAgICAgICAgIG1lc29uX2VuY29k
ZXJfZHNpX3JlbW92ZShwcml2KTsKPiArICAgICAgICAgICAgICAgbWVzb25fZW5jb2Rlcl9oZG1p
X3JlbW92ZShwcml2KTsKPiArICAgICAgICAgICAgICAgbWVzb25fZW5jb2Rlcl9jdmJzX3JlbW92
ZShwcml2KTsKPiArICAgICAgIH0KVGhpcyBpcyB0aGUgc3RyYWlnaHQtZm9yd2FyZCBhcHByb2Fj
aC4KClRoZXJlJ3MgYmVlbiBjb252ZXJzaW9ucyBmcm9tIG5vbi1kZXZtXyBmdW5jdGlvbnMgdG8g
dGhlaXIgZGV2bV8qCmNvdW50ZXJwYXJ0cyBpbiB0aGUgcGFzdCBpbiB2YXJpb3VzIHN1YnN5c3Rl
bXMuCkkganVzdCBmb3VuZCB0aGF0IHRoZXJlJ3MgYSBkZXZtX2RybV9kZXZfYWxsb2MoKSB3aGlj
aCBzZWVtcyB0byBiZQpjYWxsaW5nIGRybV9kZXZfcHV0KCkgYXV0b21hdGljYWxseSAtIGJ1dCBJ
IGhhdmUgbmV2ZXIgdXNlZCBpdCBteXNlbGYKYmVmb3JlLgpBcyBhbiBhbHRlcm5hdGl2ZSB0byB5
b3VyIHN1Z2dlc3RlZCBhcHByb2FjaDogY291bGQgeW91IHBsZWFzZSBsb29rCmludG8gd2hldGhl
ciBkZXZtX2RybV9kZXZfYWxsb2MoKSBpcyBhIHN1aXRhYmxlIHJlcGxhY2VtZW50IChpZiBub3Q6
Cmp1c3QgZXhwbGFpbiB3aHkgLSB0aGVuIHRoaXMgcGF0Y2ggaXMgZ29vZCB0byBiZSBtZXJnZWQp
PwoKClRoYW5rIHlvdSEKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
