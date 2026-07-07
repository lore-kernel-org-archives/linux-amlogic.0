Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E9C43458
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0K9y/aOWHAwfJxNEvcai+e9/b3faXuh7KGD2mJJCB8=; b=PBafN9+8OllptC
	s/PGV1cL5Ks//GTVrpNnLlFfBP1mAYe3FYs2DSwbYUgQ2+ZeRulUM8oTX1LwULN00kA8s+wlMyom/
	OS3ONm6mdHpkbhpr2EeFl9zAmx51wIHuFNI0b3OZugFdJk+UDn0lMO2l4VTlhL1r4XAyXpw29s8R2
	W87EMowwGw0QFhuMfG6QVuxkJOYMQWy/OXHq9wB6a6LMKpY2UYKxD3E6Zw4EeFnmKdHeyQWHmjZLa
	rOQCvdPigUNw62KWSuABHOAlrrT/gM+minMtlhm347C9tPGQrgfv73TtzZ3IZYP3XPeqdJtIMwMy+
	S/MJG4AhEMR+7J5djdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBZi-0000000Flzd-3EN2;
	Tue, 07 Jul 2026 19:35:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBZh-0000000FlzH-1ilL
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:35:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cab973140bso55327615ad.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452920; cv=none;
        d=google.com; s=arc-20260327;
        b=hMsiVNkggPoVhkXgCDCmW9fCq56n4aGQ2TFLPrY7/YiTsnaMHK0SeuZoXWBHDK3GTe
         pYfHnLD6p1uvFjXXpxidb4aIwmRc1tA8vspJLmHzZfohnMW+M+AhcElcKHLxar3TBJ3N
         v5K/iDbM3uh2U7pKgeXfJ1nZ7F0Ty1saQEbQl9/I4m2OyUKTA4JIX3EmhydbF9svoo49
         mORkm7yMBgWOIzr3JmeEbqWGekJNZQPvZ02v7xTwAPBgPiUkmzoUbZKW0QtElyh5lPsb
         HOUVW8jv8PI6NoJEE0K8iWH9IOyahtCMhoncX35vQdz2wx3J8HKcMk0LFbt8lMjGHNhk
         D1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aQ2ijXeVJEXOjIVphbCac0hcKGLjbJ0hFCnL+lB0n5k=;
        fh=CfT5StPvikAafm0680T2AV0es6CKKDyG8huS9lxgj2s=;
        b=f6nH6tYuVFfRktd8LMJpNIMDxv0bzijnIFnvVhRnFQEm/no0ujX5KbWIvquD5jWcJy
         WuZWxT5AQuvV6fSgytqjwK3DJpt/ndFhXTVfT7j47dJP9vQTuiMsy5yeZS1ng4sqX+Br
         crtQrZb3Y7KmrGcaw6LeSOuh5HwSvJOpJiIPviFW28o4Wf0piwwlA0TFYDoeGSZ6BAdL
         vvcZMTJ10GpawVVn401b4/xA1hgS921JZ5w9gWNUJnoTjTYhZJBK4RpByXv/qGsDlWnG
         9USWwEWdK+VAOUhqEXPnYEY6yl5XVapIvV9Prsd56EOl8cGt5gWp+mhPdn0PxXaHEEAb
         aacQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452920; x=1784057720; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQ2ijXeVJEXOjIVphbCac0hcKGLjbJ0hFCnL+lB0n5k=;
        b=rFEzQNIoZWhYPg/IL9dJ95y37/gQwE9eJXJYJW8SQ2UwDNLcvZsQn2ZXZlu55Afc8Q
         /emGjBQNFT9lx6pMm7x+LqhglDkEjtgpvWHgvP79sxADgpAKG0a2Gj0hchgmXNNONu+W
         bn20r9HEKwBmJRULxzDo5e0kUskhYm8PmBT3pbBx1HwaqVaCSB9crzIw0FC+XNOKnjz+
         cTlqpYMtIKqLv1omwyuslJzpaUWqfLA+bU3oJ3HY8lvf3CcbBY12HTD4qM3s0WDRNFN0
         Ru0T5KuWir6HalynrxJkdPc53tQoSMm51k8UHystTuuV5K7Vl74RAhqntcL1L0YD8s23
         ihZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452920; x=1784057720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQ2ijXeVJEXOjIVphbCac0hcKGLjbJ0hFCnL+lB0n5k=;
        b=WmCvj9M1yILeQvR6rq9dXjEnAU6SAkJeyqkXhDoAeBQCk6KNpjS02gcGkz7mZyvK8a
         wM+hk+z93o7VB5/i2fTriuQQFX+H++UUFL/FeArjuD2qF5oV57wXXbvuC7kxCwqHzVZs
         HIABVjepxTtUdaHLBepXo2T6cFtqyXGl9Ol7sFRJ826JgmwsgKtw9k2HPJ3q4iwbT/4Z
         xrbPTUKO8cDa0Kh9by84qaf6v32nKNfsLfrFd3qQbccTXj8Vz0DY+Yt9EGRGDGL/Msex
         5+cFeXpxTfmSImD+SNLesM51B5Eltayn2ohXVVkc0FJBf6urMjaAKr8EkpLYsE+NZc+Z
         0TPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrP3D6PW3XJ9HDt4DevzyXjYvCfuGoxF9TYSJ68J3D6N/92mecrLxyyDYORrq2h5BMHTLXkJ5Cag2rla3Tz@lists.infradead.org
X-Gm-Message-State: AOJu0YxfTv1VyCXmwFM4Y17DwBZ4m5lvgNBybRd1aOzEkpcUAznPLUdl
	73j1ziuUzpmcgseV48+KiTXkPkI5TUqaK5U1LSC5J4s1GeK6oKIgQHAwfS/R0SNtLrTC3xYA0zz
	nDAzpX58vxVHweC7eFap+hyH5us6YXDU=
X-Gm-Gg: AfdE7ckUsIstbL3vcTk4Bq/R3WiXMA6IqU3UppPbHulpZDLpIp8ORgdAHg4j6GUFQB7
	XQsieRcwf+Dulzewt9HxVdNWDgM+v89WYF7pdAGz4WOpXyuE3nUfCFz2Z28C7lIoAv9OPByai1H
	XD7KUcidqnTVgBbkblfMmCayNEzPvhtGnRIZATWAWSb/iHZmr8hNppZunDPA7xPGTOVtrQ3tz5l
	1rhaYYCb2otgZoHuL04+7FeS9r7TMhmid1OBQtTlaT27/UMnOkTZGVPkjqp9fPzjN1LMFzg/6Mj
	eIE0MKnhsRZoVJ3Ewt+C8Bc92A==
X-Received: by 2002:a17:903:17c5:b0:2bd:5ab:af95 with SMTP id
 d9443c01a7336-2ccbdf40961mr61157845ad.0.1783452920487; Tue, 07 Jul 2026
 12:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR05MB699278F5D7FD140310C6EED9C8ED2@VI1PR05MB6992.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR05MB699278F5D7FD140310C6EED9C8ED2@VI1PR05MB6992.eurprd05.prod.outlook.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:35:08 +0200
X-Gm-Features: AVVi8CfOnEpCq9f5wk4C5BJnlDiRggSpJTekYwjf28tRF6DPjFJ5ArY-B2eBaAM
Message-ID: <CAFBinCBm5sfOgSQnvvDOwGdGaTFfqjLX0UOOXr=k5joyFDQb6w@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: cleanup unnecessary condition in kconfig
To: Gabriel Carvalho <gabriel-n-carvalho@outlook.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Julian Braha <julianbraha@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_123521_482922_28B038B5 
X-CRM114-Status: UNSURE (   9.64  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgMTE6MzbigK9QTSBHYWJyaWVsIENhcnZhbGhvCjxnYWJy
aWVsLW4tY2FydmFsaG9Ab3V0bG9vay5jb20+IHdyb3RlOgo+Cj4gRFJNX01FU09OX0RXX0hETUkg
YW5kIERSTV9NRVNPTl9EV19NSVBJX0RTSSBib3RoIGFscmVhZHkgZGVwZW5kIG9uCj4gRFJNX01F
U09OLCBzbyB0aGUgImlmIERSTV9NRVNPTiIgb24gdGhlaXIgImRlZmF1bHQgeSIgbGluZXMgaXMK
PiByZWR1bmRhbnQuCj4KPiBUaGlzIHJlZHVuZGFudCBjb25kaXRpb24gd2FzIGZvdW5kIGJ5IGtj
b25maXJtLCBhIHN0YXRpYyBhbmFseXNpcyB0b29sCj4gZm9yIEtjb25maWcuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBHYWJyaWVsIENhcnZhbGhvIDxnYWJyaWVsLW4tY2FydmFsaG9Ab3V0bG9vay5jb20+
Cj4gUmV2aWV3ZWQtYnk6IEp1bGlhbiBCcmFoYSA8anVsaWFuYnJhaGFAZ21haWwuY29tPgpSZXZp
ZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
