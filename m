Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8BFC47BCB
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkZmJsM+T22DeTbdjweCsTQ4uTELJfXFmhEH/lcSgRg=; b=xYz9ibmht5ycfo
	/b7QC6YBAj7JUJ2emygdXZzo9LrY1w/2L7BBlsyLyd/FtfhTu4/LLhHLCuor/RqW12u1uUqhncSrs
	Y71AF5gUWrkPSWzMwpBhaK9H+etqxc1xlPfoOXb0PWsIJtpBQ8IlIQeRGQ0RYtbyaRpIRpz62McS4
	QaUCw9i0ticF1TJDwl8sE9qnWdG7o3xUX6Ap2X6Q2imlqHpCwA6ysLjzuqWB+OOn0Dgfs1JRrRnzL
	9i/SF/BG5A0OTQA3ufFaZxwiKvDh2h1uu7UL+flAST4MrbKuKiUWghJRLlG/9GgALEQRpqaYa8BlB
	8i5ntKS5ztBHdFqs63gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2vU-0000000Cexp-357z;
	Tue, 06 Jan 2026 09:00:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2vS-0000000Cewe-1x5S
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 09:00:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0d67f1877so10347065ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 01:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1767690026; x=1768294826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=;
        b=A+2l8YWirpiiWu+oAsf+mo7gWIiNoySbo1d7egGN0AU6fkqS6MxuUsFGFSZg6D4CZZ
         rhmBsEZ8NvXuQj3I5jyOTUfWBaxqqc+bl5UIpJi5feE6iWGPrC2sBwB/yv6EeKbX2hRg
         +FoMnUOT25N1uXJy1Mj2QWB4TKVj1dqAf2s3hluMcQojOIMyBJt4P3nbiri+FLdjCe1G
         /tFLlvdf/z9XU92cDdM5n6Y2DheU2wsbRbsQclyMYv7QJzzNgqud+eAD+mBWxLwhdAG1
         425ID6luYH+nMWOo6WVWsyaMPGar96MFSZ0JbmonclynO3iXetGlYTWF4oWuwxvy2wfa
         htmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690026; x=1768294826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwFNEOi92EKNgQwkvVK3dDTbWUcm/1bDSpbc2qb1f6E=;
        b=UhiaZq5ay25WzXEfFK9g63txUIDXBS9OXzGCVC6cT3teRUy+FJuGS32fzXZYeN94YR
         cMb+yvSAngJs1VMNdSTgbRWz47y1kYsXOsRmPOaMcRoIegAG1PWm4MeW2MGitapZ2Yav
         TG8RyQ+W1zGh32xxvRiBkPfj1jYPO/7p+yWobRvJlgzjD5FDf7xn+rtIwFj9G3usv9si
         uQN5xdLEaiiEI+Nh61Xk5zRxb/09qZXzROABmCHqvHOaNx3Y+T3PzQ9HJhXZcLQT0+TO
         bASU7ovOvAQqvy3yA5Qbp0N8cRisuj+HxDx2kvYgbU/BZP2baACGmWL0/kdqLpZr51Va
         6PNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIlFNX2MJAl7SDPZNFN4WElxJ8uKncZ1Km3a4ez+Nyilm9eJE3t1FzAKz6lJ2UaKjpPQR2TQYeduZ2sZTz@lists.infradead.org
X-Gm-Message-State: AOJu0YyoqhwkpGzMcwhSXefN0XyX6UK3VU54guAmLze6K4uXTOOCVcR1
	PfVkUb0rhsMmVSUjvNCRAc81N+0EAykXOzOu3Gg2rx1fY6F6FBIS3yNq6Dh1nEx2cjA+HaPN49A
	kAxV0IjwbTmwEucnHlDXFHiVD7khKAO4=
X-Gm-Gg: AY/fxX5Hjj1MSEzz0B7yIJBgq4HChP5/2dYojNI2bY0o/ckj22f502ZdQDpRCcRGXrY
	a11GBKh1ZOi5Sk0ALkb1oDVzV1CYqkV4sGMHmAcjySttDUUKCx8XVMKEPmUsX0kK0xf9S20TSSp
	75AFgv7Q37jyAve+IkwhOWG/96WNbXp9zkJZBb5LGqHMxnzfad/EuN1eUFqK75YzdepgSQr32Km
	XjbdvdJo3xNa5v/ERFZYTDWRxAvXbG38szOFok0AouInKWdTFNiLBKxuGttmwAhqBOpBJIVW8AW
	EVpkZtNDkRAoJb1Afnc1Mqr3ta4=
X-Google-Smtp-Source: AGHT+IFykSIhDbKg0V1WBCg3OR8KUafZJ8yy1m4E2Hl9KGFyDUM1qo6fuvxU3JjJJxoh2Jqu0ofEIeBaRu9XHRBaHZE=
X-Received: by 2002:a17:902:d491:b0:29f:b3e5:5186 with SMTP id
 d9443c01a7336-2a3e2d569b1mr20878775ad.56.1767690025591; Tue, 06 Jan 2026
 01:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085520.21129-1-bartosz.golaszewski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jan 2026 10:00:14 +0100
X-Gm-Features: AQt7F2qGoX6X_u9x7RpkJNN1v9xaEp0mgqiOs4Qpk3zn2K1E2c6w9PHm9V8_KnY
Message-ID: <CAFBinCBCxkt1F5NUaAWjWnudLvTnmEMw0sdJps3kN=ibCEicSw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: extend build coverage with COMPILE_TEST=y
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_010026_518620_9E88CF73 
X-CRM114-Status: UNSURE (   7.80  )
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCA5OjU14oCvQU0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFdlIGN1cnJlbnRs
eSBvbmx5IGJ1aWxkIHRoZXNlIGRyaXZlcnMgb24gQVJNIGJ1dCB0aGVyZSdzIG5vdGhpbmcgdGhh
dAo+IHNob3VsZCBzdG9wIHVzIGZyb20gYnVpbGRpbmcgaXQgd2l0aCBhbGxtb2Rjb25maWcgb24g
b3RoZXIKPiBhcmNoaXRlY3R1cmVzLiBFeHRlbmQgdGhlIGJ1aWxkIGNvdmVyYWdlIGZvciBhbGwg
bWVzb24gZHJpdmVycy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBC
bHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
