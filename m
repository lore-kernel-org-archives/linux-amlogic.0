Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E980CD11C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmAuHG0VL+Ck9kyAZiynv2Z5E0XrAPfdW1mkbCp6X7o=; b=w3tcxTReZu4BXn
	wni2ZuyazMpkbAbjSP7g82UxiyL0uL27vkT2qk14cV/+1/9eGVCaNrfSDdj4LkJvtOeGHIu/EubzC
	9hcFTry8KYq8x51jov61mWUfMbxKjgeuyAumELo6UewgAEvEMFrL5V8WdflyNIcImIOFohlQ8d19X
	xVZCmN8wiVpGraMFxLItUFqNgXP0YPlv8kDcuS9J4vqjdcsKAsFCtSM5CvvHJdI/7S/BPQKqIvO+N
	O4mnpUZkFfAo3R7mec0eeQDtaJAf5oMuLWK2YaT6/u6OWfE2xu27bSkwe5euUdeXkAB/Rs/hpawAA
	abt/ynHTCcu3ttnka2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudCY-00000008asD-2Qy2;
	Wed, 10 Apr 2024 19:01:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rudCV-00000008aqm-2A39;
	Wed, 10 Apr 2024 19:01:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e3cf5b171eso39812275ad.0;
        Wed, 10 Apr 2024 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1712775697; x=1713380497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQGIuC9fhgYKv0jGpAIt5La8/Y4BHfZvvmnOc5ODMp8=;
        b=MEYzQwNKG9BX1gGkC3Am4cg5MVUvRmNEhak0uO6EYCTCcnxQyTW7ec5veUG/Hi9FJI
         wRmEU2cYFtTPMShyeINEPkBsGAMBKCVSns+u/b6N9jKbOVaa7y4vFz+igt6G+O1fmw2H
         WAJoMKt5DF6Bpdi9p32wyx+Wm+GCTfAjunOUE7CZbD5ZJ9EGl9UOAsTa3q4m6fhH1ueY
         tXuk7SP1Tj7PFPkTC6expbu23JVz1EW3jb4scC38M4J8S3c9EjJ5+PCh9ND6zntcVgAR
         /A55h+AhO63rOgjbSpXmOYZF2ROV7W227movTBeWF8x/ekuZwTdvZ6EhOAOivT7OfZA4
         RtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712775697; x=1713380497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQGIuC9fhgYKv0jGpAIt5La8/Y4BHfZvvmnOc5ODMp8=;
        b=vRM8AZL4nweOEI3U94gs1JkopUP2GVSmda5cWiY/laW13Px4p0tQ9+nnThgVM/Q/CG
         7fvh4RnPSVvyjEtEDpfDfOavHjbiRyAZM2fRqgfTEGlzEnz3cCeGlqruB1AdbGk6wo3k
         2sjpl2ynRUixd4q5kaRIdLR73GfF+MCcGht0sEa6/QHID7wPQvF+oz9jfpyLcy0Lv/yy
         2WoPIcpypM96JDwnjzIPBviXqLUUoZ4LWmN2U6WM6Oc44LwnOsHh65RmjwS6R+J7YeTg
         8Rn+P7UrUU3RNmjvpBoWccBTtAZefF6+Xsi2zDMf2ORfK35LjHHTQx+a8AOqA0QNK5nu
         PUlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAOW1jXDkjPtFIHgxO5qHaYtq5mxliB6qqN+DwqVcUlNP/d+wabbuyFhjEClHnG+VSfQma9XWhcDmw1Q8t+HAj96d4FkJC45b3JdFL6YbjroVIFGVNNXGfxO/M3cGv6Uz5oDGk2VP5ruJZ3RcXqo+rHzsrt1XI2Q==
X-Gm-Message-State: AOJu0Yxgg5kwd6VyLhF97YsfPeU0Ng4IYVqfNjK77Z3bOItCWagwV/84
	2aC4CXMNx4NCXH325tJzZ0zIWn6JTLNvGThPahl36X7vxptQRBwX81PVldHz32E00u/arkrhO5d
	EaSTJL6stYYGFJFHZjk7jIy3KwPU=
X-Google-Smtp-Source: AGHT+IEROyQwnsZ2mJRiQBK9B8AlbdE6ckE2JKAZuRGsMr3HiSh0XYkFX2esld+9JLkEVgvtnIu/uwZKqkAMsWTRoa8=
X-Received: by 2002:a17:903:1cd:b0:1e0:b6d5:bed with SMTP id
 e13-20020a17090301cd00b001e0b6d50bedmr3490508plh.5.1712775696824; Wed, 10 Apr
 2024 12:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240410155406.224128-1-krzk@kernel.org>
In-Reply-To: <20240410155406.224128-1-krzk@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 Apr 2024 21:01:25 +0200
Message-ID: <CAFBinCDHp0r7jje9pS4u+2OgiC2LfhHBA1T6OveZhiuKX=jomg@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: s4: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_120139_663848_2DCBF04E 
X-CRM114-Status: UNSURE (   8.21  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgNTo1NOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgTU9EVUxFX0RFVklDRV9UQUJMRSgpLCBzbyBt
b2R1bGVzIGNvdWxkIGJlIHByb3Blcmx5IGF1dG9sb2FkZWQKPiBiYXNlZCBvbiB0aGUgYWxpYXMg
ZnJvbSBvZl9kZXZpY2VfaWQgdGFibGUuICBDbG9ja3MgYXJlIGNvbnNpZGVyZWQgY29yZQo+IGNv
bXBvbmVudHMsIHNvIHVzdWFsbHkgdGhleSBhcmUgYnVpbHQtaW4sIGhvd2V2ZXIgdGhlc2UgY2Fu
IGJlIGJ1aWx0IGFuZAo+IHVzZWQgYXMgbW9kdWxlcyBvbiBzb21lIGdlbmVyaWMga2VybmVsLgo+
Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgpS
ZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
