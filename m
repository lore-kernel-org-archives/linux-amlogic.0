Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19634FF885D
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Apr 2026 15:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjOrl6LmPurM5/QvzUH3P2Bibu6omKVcOzfL+hlJW0U=; b=vnqCjO8MmUNUZS
	kuArRxv8Af923K5CtWlPQzcuS23KKugeXYmpqKObsNsna3wmKD/37teVdqeY7+HaoU+yo/jhTGW3h
	XLzni/VGU69ss35c2ih6O91dSQ+yhwA3o2yEXpiQAHaIX9zjcmKFZiykWtpYs77UNc+04CABuc2xD
	4ccA7fQEJ06t7iAGIJ5zNeFoMgtkxrxQgyHcDi1JM4vXuwwn1AXK5lmWVkKkHGktxOjzmm2Wcdw1j
	C4v0JX4Vq8lOpbbKek2j3A3por92206QplUZLm7TCtBljN/QJ5sVlltDwPtEmOBtfFDmppMBU7R61
	8vLOmruBvSBMR57Gq1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1Ng-0000000FfJw-2Vz1;
	Sun, 26 Apr 2026 15:26:48 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH1Nd-0000000FfIk-15dn
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Apr 2026 15:26:46 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c76b994f7a8so3658981a12.3
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Apr 2026 08:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777217204; cv=none;
        d=google.com; s=arc-20240605;
        b=KztXkPH/yYqfk3SZD1PqdyrEf8KbzCbUZxM4tPPnUMxyaJif7u+vrQ6+IcR3jCImh5
         9F1NgZygbqx3HgyTciV5UQ+aP4SFBY0I0p4vQHOFunBQmo+inhNAstfJx0K41aubPY+x
         kt/eFDlaAE4dVki2n3i7TDyWz+cnEr/7VG+2LnU3mChVIxAD0SRSQqosvvKWjisZqFVf
         yr1EzLoYA+iDXoJvJL+JykbBPUc7oLq7s9hiemTIZijaoA6/cucylh73rIS/uqZloMeU
         aSs3EmsBNVft7mI8+Gos4J1iM24wuX4/gIsByCjY5wbrtVE/zd8faQFOf1HwSX/zDItO
         zkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oPUu0Cm27qIygZI4ma0gwbXy+SSkhZVphR3VJlTtVS8=;
        fh=fLhGRBdkfIWqWGm1jZ/kCKtNNHyEhr4fcLJ9fTOywt4=;
        b=jF/0ZKHZB+ilVniFzReqfeki7OPNMwq6qSd7ASlUAF1j86bobw7C04MQEuI1nys+y3
         cV6tYyHzv8TWyBHukoZQggT1rUelrLBQpimLefM5pUsu5l5rh0zdXWeZZntaXylKCkP3
         e5zZDdVvr+HpSUJcd94vrYETnXNecCZCoKV4B2RVSujkPoClH0IQ/GRHZ3Zw7q3L10k5
         nIU8Y5TPqQfAzzHMO7/KgPiJ5pC5CY4YgEYKBPZJ8heWIfBWJw813JYpuRfs5kR8dYsA
         Nyc46KUgDaxoudqeuuKG1GwFJwvywWq+9KLeOorUJJC3wmqxLieOOXy0b0kX0LG9nD2g
         u8HQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777217204; x=1777822004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPUu0Cm27qIygZI4ma0gwbXy+SSkhZVphR3VJlTtVS8=;
        b=UQr2Drtus9Z0ZeIjP2W7yzEUW9aNA/BvN/fHQcScRP0GH2KvasLiqmQGqoDgrdT/mY
         CmbTx4QsufTiqQ7wGyrjk+4DOMgoAjdNTU7G0gCmYuEYJZ+t1qZSFwvc+jzFUJ54ogfU
         LlBw3jTCmzCerKYs0IC4NolQJGoUCKvCbZbB7X2U33bXTbYDQxdcpeHoQ/FGK8vOYD/x
         sxXcQz6Q3JVhPsHj1xFpme522zdxxfaddV2tSLOtpnzzKnVx7ZW+xoyqzt6Q+MJJA3Rv
         UUGQELgPgiEeOqB8p9EGl3WvRSIXKKzQ5ERlEUk2xI/biJMHNs591R1AlJvF3nH+watT
         WmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777217204; x=1777822004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oPUu0Cm27qIygZI4ma0gwbXy+SSkhZVphR3VJlTtVS8=;
        b=lvbluiHZDhlH7Tv10LkZhdeSGNtm7BenO1/OnWyiDdoaJcZaQfpzmUqhr8zfYO32vl
         16GASRxXh8a0YA4KNJ+sVvn4b2+MxeKnU4MY6XHsuATuYfja1USeIRAbtAc2WkZj6P0v
         9/3PAtpL1oaiF2RHIWcPaMHufFMxbFeEWGEaH6XW9SXn4eeipunD7vdDSITJl/2YooY4
         OaaUX7Tz/1ZPsOh7sbURUL/1FEPTZ1KSuYqV6RHW6mDXk2DZeIqRGiYAlD+lqXBpQ4Dl
         G9ytkUbiYy8GYuKMJfUGoy/iD4Da1yKoH1FMY4EONVKyz5AtYZr4Rv6R9h6lXH3Sqtkm
         aUiw==
X-Forwarded-Encrypted: i=1; AFNElJ9jDfXs4TJm/Az3kiguWmCiF8Wonn1yj8Sg6Sel/dAKzeHwX/0hhCmyPi+9kv1AUXbTkQGqu9py0uo7TbkO@lists.infradead.org
X-Gm-Message-State: AOJu0YzbWQ8Q9Y2zF/IsOSbyfS0M4Ycsja9rxNuxkaZgVAxoKLecF6Eb
	KFVj4PtHvgXyvkXAch7cWE16i7/de9CJx2/hyRvnCGRbiJP99Vrgy2So1NCcvn0y5+UllBQ2dfl
	HjlsJ44b88tF601dxD3GlLx1CKR8uapo=
X-Gm-Gg: AeBDieuiqUzSqMlRTjLyiJSmlodeYcJzOYmgoBX+SqPnuBQVQ0AQkEYHAQkuk303DTM
	NiH80Yoa1xYmr4DGKh3BO88Cfa/1okHTv5SgO7Z0tsZZxTN7GPF+GcZV+fL8pS1HPMPJV6vRs6R
	pn2oqB5BNa1V2UUQIqrBbqdJXe6zcbjG85ThoOMB6vyk9eFnZhZ2l6p40JIBqc9bJ4T0RfX2gi8
	2QfB4LTMaXh5pjWC6Q8viTMX1hOY31OZqrvc8tVLboWgioPTx1Xab4S14e0uTgR2vwFjqDEm8Qp
	qFL1Ckd5m3Sq7+O29Kc7GMZ6Bzs7U9/xZ4fL543fTTldPFcIyUhKUv6Z3Rwa21oMQhM7kdbADq5
	xdle4Xtjd9jnt50921aWmlcZKGifLHX4=
X-Received: by 2002:a17:902:ce09:b0:2b4:5d87:a1fd with SMTP id
 d9443c01a7336-2b5f9fd21c5mr414476575ad.27.1777217203962; Sun, 26 Apr 2026
 08:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
 <CAKxU2N9_Nmk_apUZLSCGssXpwxYOz9k99ggRcUM3EPGUzaVi7w@mail.gmail.com> <20260426114118.7ad8b130@jic23-huawei>
In-Reply-To: <20260426114118.7ad8b130@jic23-huawei>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 26 Apr 2026 23:26:33 +0800
X-Gm-Features: AQROBzAaYDomYsrasutwOHUKLQNNevm2fkTAMklUdCnv3oJkdjE1Eum5JhBFxZA
Message-ID: <CAN4SLj1_45OG+1AdzCfNiV7T3VX9tpQTcX8krsTDruhtYLzEGw@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on error
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_082645_300368_66DB7E56 
X-CRM114-Status: UNSURE (   7.77  )
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

T24gU3VuLCBBcHIgMjYsIDIwMjYgYXQgNjo0MeKAr1BNIEpvbmF0aGFuIENhbWVyb24gPGppYzIz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhhdCBpcyB0aGUgbWluaW1hbCBmaXgsIHNvIHdlIHNo
b3VsZCBwcm9iYWJseSBkbyB0aGF0IGZpcnN0Cj4gZXZlbiBpZiB3ZSB0aGVuIGNpcmNsZSBiYWNr
IHRvIGNvbnNpZGVyIGlmIF9fZnJlZSgpIG1hZ2ljIGlzIHdvcnRoIHVzaW5nIGhlcmUuCj4KPiBK
CgpIaSBKb25hdGhhbiwKWW91IHByZWZlciBhIG1pbmltYWwgZml4IGhlcmU/CgpCZXN0IHJlZ2Fy
ZHMsCkZlbGl4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
