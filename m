Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A81EC77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 20:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awyabkoxX5uXbQy0E60m7NGrEo35Cph8k/8R9rm8cME=; b=t5L9siXZje1lma
	CiuBa9ii9PX9Z7J9GRBM60XBUvBIX9Z8Wxq5ap3wrixjTAwUgANCmRRlbIrBokLfAoVXLNoDb2JT5
	r9tlux022wP/5dq6hjzWMnVm6QAtt6B7ZdWqlhvVPRmZjJXBJnfRlWIixEW6xH8PUSjsRjIeGpxBt
	QOSrwWBnct4qQaDyPbwHc2paPxY+K4qFHwkR+T5etn6HJZnZYZoTjmjHJSZ70AbAxko540oUjfzSr
	0n5kCBeujSb5Jz+Ja9/ciegDUpuINyIphb4yHEsX4SfTqnLoNDmdJIigGQqf3IIJx1vfB86UdO0SX
	pRhUsX5nAkelq3WOaxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqIn-006vV3-0y;
	Wed, 10 May 2023 20:20:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqIk-006vUN-1h;
	Wed, 10 May 2023 20:20:43 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc3088b7aso14645432a12.3;
        Wed, 10 May 2023 13:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683750039; x=1686342039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAFo2QD9kP26+xLj7IQr31EYTyjtIOLhJ8ql3Ihcx00=;
        b=jxsmsS+gHVUJhyrdUSU1l6POO30DFjZvAUNL7ax2bs6B5GU/IFC6aC0LnwQX5zkrsx
         W/Nq0Z94IY3UyyadUsWpZDyLAaoy6pShR7AuyoznoXCXHVN5UKu4x+ioQKDdITW2GNPc
         am7MyjesHZcpOOaqtnKHkUegZ067hpj3saeOs31fcyOy4bdkWEEsFgtU21ZKYafg6bA2
         KL8lx28r5i1xZKrEjTbNYpjGDQmvISJNTGbQ9JKIjCUdI4ga/FhA03iXfRBXYhJnyvhj
         HEK+xU8GfzC47XnMA/+qWhX9uFByXx9EpBqLKRtLLQzwoEAruSlpkbA2YDasiHGldroa
         YHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683750039; x=1686342039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAFo2QD9kP26+xLj7IQr31EYTyjtIOLhJ8ql3Ihcx00=;
        b=YO47wlsQHd7Y2Bbj2yrJk3xvftAvzWrg967FhbZPGZJFPtknn3JpudkRyM6HMSFSlu
         AfbJx1Dvyf8eD5oLwyj5OWkpojdQXiON234fX/s7gqvXvwdC8hlvwVsq4+fprfHDMGIk
         pxi/EyhGf9IxU4NryrjvJ/87wzK/GUCF8o+JQI10jYTvwZttZG9ZS2cXF/lLNiwtgMam
         wmI0WnGKVt+PMeef/XPQXrFJTrAzvxtWRJ9SCihNTn52F2YbKm3AG6yt8RzlgCHrB8KH
         yplyuyySMh1NfL39hIOkOBt/ZTgZtdRYJdIPnr3dZj2gedKonBu2iOn/UWBw9MUi1Zc1
         15rQ==
X-Gm-Message-State: AC+VfDxNuIFuwoUUZW4tIAfBoGiSTpiiemW6k1JvJdSy2+qprC280TkI
	/LueQ3+88dJ9d6eAQqtw/ZTApCGkDrmoF72NPFk=
X-Google-Smtp-Source: ACHHUZ6ZV3iLr3PUKpv3GxOStpEC4A5BOulRxZkBK+cDqBdXIdfnSBRtdzFLtvH4Qa3W8mSFyCCg+/4QeyJCLh7yU4g=
X-Received: by 2002:a17:907:e8b:b0:94f:764e:e310 with SMTP id
 ho11-20020a1709070e8b00b0094f764ee310mr19539753ejc.37.1683750038942; Wed, 10
 May 2023 13:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
In-Reply-To: <20230510-mmc-sdhci-msm-function-cast-v1-1-5ae634b24fbd@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 May 2023 22:20:28 +0200
Message-ID: <CAFBinCBjvfNHUX5X=4jJ0Gtx1Z9MABMv7FioEabjvtbkOrTEkQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Avoid cast to incompatible function type
To: Simon Horman <horms@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_132042_586453_A44D617E 
X-CRM114-Status: GOOD (  10.61  )
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

T24gV2VkLCBNYXkgMTAsIDIwMjMgYXQgMjozOeKAr1BNIFNpbW9uIEhvcm1hbiA8aG9ybXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBSYXRoZXIgdGhhbiBjYXN0aW5nIG1tY19mcmVlX2hvc3QgdG8g
YW4gaW5jb21wYXRpYmxlIGZ1bmN0aW9uIHR5cGUsCj4gcHJvdmlkZSBhIHRyaXZpYWwgd3JhcHBl
ciB3aXRoIHRoZSBjb3JyZWN0IHNpZ25hdHVyZSBmb3IgdGhlIHVzZS1jYXNlLgo+Cj4gUmVwb3J0
ZWQgYnkgY2xhbmctMTYgd2l0aCBXPTE6Cj4KPiAgLi4uL21lc29uLW14LXNkaGMtbW1jLmM6Nzkx
OjM4OiBlcnJvcjogY2FzdCBmcm9tICd2b2lkICgqKShzdHJ1Y3QgbW1jX2hvc3QgKiknIHRvICd2
b2lkICgqKSh2b2lkICopJyBjb252ZXJ0cyB0byBpbmNvbXBhdGlibGUgZnVuY3Rpb24gdHlwZSBb
LVdlcnJvciwtV2Nhc3QtZnVuY3Rpb24tdHlwZS1zdHJpY3RdCj4gICAgICAgICAgcmV0ID0gZGV2
bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgKHZvaWQoKikodm9pZCAqKSltbWNfZnJlZV9ob3N0
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIC4vaW5jbHVkZS9saW51eC9kZXZpY2UuaDoyNjU6Mzg6
IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ2Rldm1fYWRkX2FjdGlvbl9vcl9yZXNldCcKPiAg
ICAgICAgICBfX2Rldm1fYWRkX2FjdGlvbl9vcl9yZXNldChyZWxlYXNlLCBhY3Rpb24sIGRhdGEs
ICNhY3Rpb24pCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
fn5+fn4KPgo+IFRoZSBzYW1lIGFwcHJvYWNoIGlzIHRha2VuIGluIGxpdGV4X21tYy5jIHdpdGgg
dGhlIGZ1bmN0aW9uCj4gbGl0ZXhfbW1jX2ZyZWVfaG9zdF93cmFwcGVyKCkuIFRoZXJlIG1heSBi
ZSBzY29wZSBmb3IgY29uc29saWRhdGlvbi4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVu
ZGVkLgo+IENvbXBpbGUgdGVzdGVkIG9ubHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBIb3Jt
YW4gPGhvcm1zQGtlcm5lbC5vcmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
