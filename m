Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB9CD1F9C6
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 20:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNUYdrn6OLk1YLA2+d4XCCog78KcWxaJY9uNeuYZnPE=; b=cFrK01fLEE5Fa2
	IVUrmp1xQLoKKBN8JEmcbllsNsvl5ghkz0sPSdDk9EAtMUFlBG7Fe7x3+TH0USbujy1BClK98gKis
	pUEVziR1U5i3VNTUPwYTEeTP0dqmQ0oDuQqSLLHdoVuob1bUMR1+sDwZStF8O5s8IXDqNa6g/pG+J
	+nojUDPJh/CP+kFK5MWmGu0GPW1PMJzEdpVJC/IP3Up/SDayRjEuipXJY22mtXuxcTSvWfIYqNiTh
	R2hlQ4QClOgU7pI6xl7cjRSlLYduz0bsq/lzGEQQNnwSX1GIDnV3m7m16N4AYiK3UqxbiL9Crep9J
	fzwZGU+Nek+aWrKngrvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0nnm-00000009TWK-38fp;
	Tue, 15 Oct 2024 20:05:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0niY-00000009SIb-2CxR;
	Tue, 15 Oct 2024 20:00:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20ce5e3b116so21503605ad.1;
        Tue, 15 Oct 2024 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1729022429; x=1729627229; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dHOqgbqxbhUKjFC8jI1isYQT2Cb7uH2nwkpTlgXvmE=;
        b=kqZPaIiIEwUHCK9Rg00CEXTDtoJtuWsChLivCxVEr6ZxCqlxX9p1S9QlyK/lGMxvm9
         HOYFiRbbusjKssgsi8lU7FSr4Ll5qcW8s5DAXgj0w/Nddl7nJ4mDclGNPPyX3sp1R841
         Kh9TAffZaUamM2hApTtQg9R9i+2Kfug4K5mvIl1giTUdXSQvYS3UY2LeBrhjrPF+t4Yh
         YsTW/zzd+nxygH+x+jUz8NzJRspSFytox/9BYVJfBCAKge/iU3lCackbq0su85zDG5zi
         Cn2fx6wMwR/DOWzS5eWG9/l7QZVHl2l6Gy2/B72rjantloKvIrVx9mBw5YQ+7OfX46Lf
         fZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022429; x=1729627229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dHOqgbqxbhUKjFC8jI1isYQT2Cb7uH2nwkpTlgXvmE=;
        b=SmnmW/ipN9THJLej7kU0mO0Y2qWbHvgG2jaekzLmDkE4oq++ABjrqzJfL7m0Qk3knb
         uSx1LsyMHNfAe8tJMKEzQYLFftQttc7yLVQoe6QnFhEEPgCaZRkvOLzoL4lzIYe1BJIG
         XmGkhMvPSMv2DpEH8mJEo4Ha7/VSpltVinhg3OaxB9I9RuqId8/PYPkT4goDjfATFCoa
         69JZ69FTwq+scOA47FXQewpZqd74FnMYSaPIDWbYOSmiZQNba9JqT8TqaosHt9GKrC9T
         8u6lMqjmHusumDdHBS4vAj//LvElniCh1p+Vx5Iyfohr+bj/+VmkbwxUeHBAsczUjIUl
         J9Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWQdzE+SL13wtGEOYzHjBvraenClrgQgqkMWxvZhUmPwEvTxdlBSrqQOYN8uhcs8Osxhi5byPmmVfcit4ScjR79KQ==@lists.infradead.org, AJvYcCWv4E1SYq20wcG4dj3Zjd8t29Ilnqgvcnzs3odNXUvtWYEMPahHxvmQr0tG86eEDl86BobejP9uXasGmm5D@lists.infradead.org
X-Gm-Message-State: AOJu0YxI96sl7GQisxV60vYyjbgQGq+h2PUD05fZifYjs48+Oj41Sfcs
	NBV9Mdy5JgWHWeqq3m3+Rp80v7FhER2K6Jzzpj+Cb1me1SQ4bUPrKv7rw4uJxtZDIWTZsSfp17Q
	xaBqxosev6lJYqGPOaESIwNdQoCH/nNoR
X-Google-Smtp-Source: AGHT+IGRAmeBaacGPitE5Lu93QMjwbYqZHTlRNrjzryAWT2uMOuhpeBjdQ1lgbAhAtrQkdLy8DPNtWJJOKrbkKNNLyA=
X-Received: by 2002:a17:903:2342:b0:202:13ca:d73e with SMTP id
 d9443c01a7336-20cbb1a967emr211133625ad.28.1729022429235; Tue, 15 Oct 2024
 13:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-v1-1-896b24e6c3c8@linaro.org>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-v1-1-896b24e6c3c8@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 15 Oct 2024 22:00:18 +0200
Message-ID: <CAFBinCDyfLC5uF2X0DHazPq1hwA7qZ2yjLO9awcDgHcUbYVECQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document
 the System Control registers found on early Meson SoC
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_130030_610196_1C408FBE 
X-CRM114-Status: UNSURE (   8.52  )
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

T24gTW9uLCBPY3QgNywgMjAyNCBhdCA0OjA54oCvUE0gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJt
c3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gVGhlIGVhcmx5IEFtbG9naWMgU29DcyBhbHNv
IGhhcyBhIFN5c3RlbSBDb250cm9sIHJlZ2lzdGVycyByZWdpc3RlciBzZXQsCj4gZG9jdW1lbnQg
aXQgaW4gdGhlIGFtbG9naWMsbWVzb24tZ3gtaGhpLXN5c2N0cmwgbm93IHRoZSBjbG9jayBjb250
cm9sbGVyCj4gaGFzIGJlZW4gY29udmVydGVkIHRvIHlhbWwgZHQtc2NoZW1hLgo+Cj4gU2lnbmVk
LW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClJldmll
d2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
