Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15D7C5AD49
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 20:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8TAGRLZuJPSubf2EoOZt69pc3o2i2l/FCy8JYZUUOY=; b=jQcyJpRAVXeI+o
	Awlc+mBLVd3QkwEWou+jxex7GfzjFQA5OVAh5S0/OlEoHB0cbpaEOfFQgb+rBLOc1/Nodb4HrSSEf
	+g0ix5+XQGk6hL6DcW+FWQI6ZnVD7XifVoes7xc7MFR/UBIqf4l8T4UbyEkEZTOaj+b+I8zf73U0U
	2175WEGR9Z6XVnharW9zGmcE0nRlCk4KPjaQWqUQRcJ6FIM0MIDBstZrm0UD7u3QanWflBIyDBFVH
	YsNOESEcOtSiJGS2o45i6pAImE01tIAHG1cUI28RVHJ9eJK7rSFk2zFwqBA/IxXX63s5QyCLO8VMx
	qhL9FWsINHryKBNKP5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXqg-0000000Bkyt-1Tvs;
	Tue, 03 Jun 2025 20:03:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXqe-0000000Bkya-1HoD
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 20:03:01 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2352e3db62cso43547315ad.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748980979; x=1749585779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goHusBMVRCDppDDvXatzueZJ7OJjVoJkP0enqCySv1k=;
        b=DJ/X34APxYHnLo8eRnGiyD8KEnrPneTBZY2rRuck8GDBbZOtPz0BUSOEWVxrvWO9ET
         t9O3w8VR3e+si7C69DBwp73Q8V051aogsZwrilJALQqbjoedSauFps/oitz1d1gou3MZ
         GNDgerqFo+lkuhWC3yhWZoSuGlUmgZqqWVQEjJKdQHHON3g5moqSYK5xHKzeqlYxE4uG
         Mn+NipFdplnTyTEGxVm9oJuotsFgn9OubLbxDRmWrspNJAS2dKjCSS62jbpSSahhbUtU
         jxSijX99utjHkekdeNZBnIqXzcFHd/fJqn77ax7QSlFSmtKF1JEBzWWdHuLN+pHUf8R7
         uNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748980979; x=1749585779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goHusBMVRCDppDDvXatzueZJ7OJjVoJkP0enqCySv1k=;
        b=w/tcUXjldp4gE+ehFVnIsE6EpSdu/LwdHGKtogKGhswIWW440+SIr2I9j2nmpz2VJp
         5s3w+3iUVW4QcPYlww4g8eztyarERLlqOkns+Erg25K0Y0gZ2VyoJtn43c6sPOaOr0nH
         xDiTuetHGoX/bXg0I7P5DqJyGn6ERT7N1fpx9wQvmqiwyDMIlq332vC+nY8ccjCDzH2j
         7oT3HWC+r23cUQiLh834fS64HieOI6MEnGjb0Zk5KKVRo3QpKQEnrdlyV73Ms/9uAUTG
         pDKa66LUdbllukFrLVJLNLi7CxCu6YcZSL3CSXzSUuv1PYWYCMZ8bexCqrPNeQsDrwM1
         EaiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTxn8mrfxQCY4CBEaPCbTSkavLcEC2UWyBJXYOo28VmQ/nLJI7elUuV6w3+zXrlNkUTy+4sAki82ZXQ/JG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj7Jg4wQcnzXTznrG+AEN53bZV5CQX5dLHoUCjSfpUl6J7biCO
	kgQ6pU3A7qZ4Ad1hnfEBYesu4+gddSWA/vUNU43WBV4LRdvzJfrKy2apLi3qN/YlbEtgiGefdzo
	ZOWKc9PNTOLNobqyPkaUjxLfyC/REDks=
X-Gm-Gg: ASbGnctQZ9+fBjuqoU8MsSBuHRrVV2EOnagHYd7pfKX122/AiGa4MEFOerlEVLwdfSf
	Ks/J3go8yyVmzhU6is7W6Y11xMEg8sdQLmaAmhOlwoUaw4F3/Ub37xKCrVf+FwsbyzyIPne/THT
	0/00SQQMLIC3hMI9Ab5yUEHSr/Ghdy55tHjOXg1JH8ba2BNEboPzAdBTNtS9hteoREng==
X-Google-Smtp-Source: AGHT+IFtmS1mRommJ8MTkeFJwlhiYQi9DZ7pKoUkfBSjN2zupob6rpPcp2pyQ0X0juqPVddSGYKDkJlzvCZ8uMCxpFk=
X-Received: by 2002:a17:902:ce81:b0:232:1daf:6f06 with SMTP id
 d9443c01a7336-235e120c3b6mr670445ad.47.1748980979658; Tue, 03 Jun 2025
 13:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748933789.git.zhoubinbin@loongson.cn> <68e752931552e95667191c2641076a1bfaea3dc6.1748933789.git.zhoubinbin@loongson.cn>
In-Reply-To: <68e752931552e95667191c2641076a1bfaea3dc6.1748933789.git.zhoubinbin@loongson.cn>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Jun 2025 22:02:48 +0200
X-Gm-Features: AX0GCFvdsydQ2xBkD6N-_T4hQANQRAiZAoSsCIiqiOBj4-vlOTPuCE4oBrflOoc
Message-ID: <CAFBinCAOT+ZKp2CqtTBwdiwrJtJrzAHDZfOKZfOLfrwNbmJjZA@mail.gmail.com>
Subject: Re: [PATCH v3 36/36] mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Huacai Chen <chenhuacai@kernel.org>, 
	linux-mmc@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_130300_349271_1D604720 
X-CRM114-Status: UNSURE (   7.59  )
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

T24gVHVlLCBKdW4gMywgMjAyNSBhdCAyOjI44oCvUE0gQmluYmluIFpob3UgPHpob3ViaW5iaW5A
bG9vbmdzb24uY24+IHdyb3RlOgo+Cj4gVXNlIG5ldyBmdW5jdGlvbiBkZXZtX21tY19hbGxvY19o
b3N0KCkgdG8gc2ltcGxpZnkgdGhlIGNvZGUuCj4KPiBDYzogTmVpbCBBcm1zdHJvbmcgPG5laWwu
YXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gQ2M6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJy
ZS5jb20+Cj4gQ2M6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgo+IENjOiBN
YXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+
IENjOiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBSZXZpZXdlZC1ieTogSHVh
Y2FpIENoZW4gPGNoZW5odWFjYWlAbG9vbmdzb24uY24+Cj4gU2lnbmVkLW9mZi1ieTogQmluYmlu
IFpob3UgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+CnN1Y2Nlc3NmdWxseSB0ZXN0ZWQgb24gbXkg
TWVzb244YiBPZHJvaWQtQzE6ClRlc3RlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
