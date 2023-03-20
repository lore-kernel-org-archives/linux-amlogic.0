Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2982CC7618A
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCmptZvfcvCszPHHPEwjx2laNAL+qONxVg2No1et2VA=; b=WZSY+xqoLOtwpL
	+TYB0BVEZadkCVaS1YQbU6ob1CA1gJ1s8zxikO5k5rguAN0/avmm9i8bxsRsRDzi2t5auiPsq4Y/Z
	k76y/XZl43sIOElGBTfCGEItSp2Sz66XZTCZ7ExszHMF4azumXcEYhG8srwJMLmNkR2aWQnacbaAa
	StVm7+42udXMSi7Qhc7ZO/MV1gxkQyArPRBZmgnE/njGCLvtEDsmFZg2Q/yeHY2uoKuBE6JGXGbx2
	ysLZP6N0ghFy/KBUBLSVenGkzPobAPb5RQm+1ctI+YvfLGqu8F2ECLVAZtKX1pyqLdegEUa+vRL62
	B8AuT8HuBPzUeYzBQCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHdE-009bEj-1H;
	Mon, 20 Mar 2023 15:41:08 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHdB-009bDh-29;
	Mon, 20 Mar 2023 15:41:06 +0000
Received: by mail-ed1-x533.google.com with SMTP id r11so48448500edd.5;
        Mon, 20 Mar 2023 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679326863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Is6JeKucWy0ZXmWuzYtnHpHbkTUkmwFW9c2TBjUQtE=;
        b=ih59+sDHpbunSe1L4S7EYfu2T/PovEAeCUIwFRNPWtn+3zpzADgZIIvBGL2B6F47Yo
         wG7C+HXGcA9B/J4fMPMW9cBpIhjkMxJNtf/PYCdPm4HETADJ4pnX+bSPD6Qp0a84RMdQ
         2GGnGsfA9VauAnfzZDWzEWwtrPV7yMd13+/D90TIrqL3e43TewnCt2kTeXivQlTMBY5P
         LO4O8suLzCb/hKHrvJ3wBETqFlsDX3YHrbyLx8ys+fJDnRICwDrMcy4jFBQD2SYGE5d8
         3TGp1XPN1ct+Y138iG8v4kCxjTc14F77wcqn9Ji2/ywyD1/WoShqYD5/2sUxoVPOkZAi
         Cucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679326863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Is6JeKucWy0ZXmWuzYtnHpHbkTUkmwFW9c2TBjUQtE=;
        b=W+cibPMBy8qgVWankHADnUzFcSgbBsEvh7bFikXl73IueXW8ffoG9NqqGRwfGa7dZy
         Y1ltSEvMSz6SO/6yb7z7g2chSdF3OQOQ0zg+opXTCdHpRv95TcCMhHkHMgKLL20LalWk
         Qe7C7xSzjv44+SOPtX4X71zH49/qC7462TUSbfLro79h3BZNhdXZLnwiaWZ5nQIHJWtI
         LsoSxuYxE2rMhUwXyceLeS9+XCjY78uqxIJa9PwKWIr3VtOOsJLauByXCrU4wh/KVA6k
         sMACJ3ivC4krgAUVaZoSfDId0RoEpVh0X6HNlptdEmT80bsahB+00mtwbsPk8Fy3KyTZ
         swAw==
X-Gm-Message-State: AO0yUKXZaSUc9kaUYDTRht9AMMnfoRBCV/pvY8tB8yGPW0t0IhpinzJU
	ysQJ/R+1Ltlnnv6+8CKvZDElIXOjK5ASmP/Tzf4=
X-Google-Smtp-Source: AK7set+nu+EtMtZWpYCzYff9J7f7wH29y2sBXEKnm5Lokx+omZ1fDpaa6ftITGSCZB1lCEY3d9sVnYRI6N0Ql1c398k=
X-Received: by 2002:a17:906:4d84:b0:920:da8c:f7b0 with SMTP id
 s4-20020a1709064d8400b00920da8cf7b0mr4198081eju.6.1679326863403; Mon, 20 Mar
 2023 08:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <d846047f-b714-3fd1-d8c6-9f774902fb9f@gmail.com> <ac3b4356-d4c3-25e4-9bc2-c5b369c676b2@gmail.com>
In-Reply-To: <ac3b4356-d4c3-25e4-9bc2-c5b369c676b2@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Mar 2023 16:40:52 +0100
Message-ID: <CAFBinCBNDDP=H8s6SSGKrxrh_TVDjfEfV7T5UJ_Hxsgu-kjuJA@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: amlogic: meson-gx-socinfo: use new
 soc_device_register functionality to populate machine name
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_084105_705104_454ED556 
X-CRM114-Status: UNSURE (   9.34  )
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

T24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMTozN+KAr1BNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQSBuZXcgZmFsbGJhY2sgbWVjaGFuaXNtIGhhcyBi
ZWVuIGFkZGVkIHRvIHNvY19kZXZpY2VfcmVnaXN0ZXIgdGhhdAo+IHBvcHVsYXRlcyBtYWNoaW5l
IHdpdGggdGhlIERUIG1vZGVsIGluZm9ybWF0aW9uIGlmIG1hY2hpbmUgaXNuJ3Qgc2V0IHlldC4K
PiBUaGlzIGFsbG93cyB0byByZW1vdmUgdGhpcyBjb2RlIGhlcmUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgpBc3N1bWluZyB0aGlzIGlz
IG9ubHkgYXBwbGllZCBhZnRlci90b2dldGhlciB3aXRoIHRoZSBmaXJzdCBwYXRjaCBmcm9tCnRo
aXMgc2VyaWVzOgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
