Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1001CC3ABA3
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nazoSaOTl3AkAP+21cabP7DZye6KuvPxPJgR88Urnok=; b=NZiKRm8hq2KlVk
	Aj4kAn13MrU/zBxUFHpqnjmlyJ9yw8ROFwdB1Hc3qWi+ifpq3sUtapFK7xmT3OVIHtGHJ17+9dwe7
	10k/LjiT0fgYAG+Uwly101ltfhYRTAgma3jovNb9QDMyWWA0k3f6MOX/QAbRgGdD0EsSyy3mtbPth
	eZoJivvUmDLc84flpFigMLT+Z6eEzqgriIXt9+E/VGseJjyHI8bHllM4ur6qrfzrzl4YQ9CBKXdih
	KJpLueLVRTYHIt/Y5RB/hru6MJEkot+7O6Irkyg9q148vW5pW2S5RXfzK/6M68q3nM+lfZGPoGZlI
	bgy6yPEi6ig1DLLX5XOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spuZ1-00000002XQX-3167;
	Sun, 15 Sep 2024 19:05:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spuWP-00000002WtV-395w;
	Sun, 15 Sep 2024 19:02:59 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20792913262so16165245ad.3;
        Sun, 15 Sep 2024 12:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726426977; x=1727031777; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4UOvVGZ8GtKwRInuJIT2ch8XFkLj324WspKyPQ0xaw=;
        b=fN0Xr30h5ST2Wb4n862qbiJQIddgpTuTptZBSG0VABtS98R2qjcbM9MOaDOyToT7X/
         hWwTrCMWb5SG3VRWzXKNNeDwUZtwm5MGWxX1m0N9JEjJ1Bxnk8IXmxqu0gZsoiqMR30T
         blnzAPib2SS8KffmRbqA7yMAiv+VvkneCm/ou5XtJ7YGuIzkcR+eyQ86jEQXhOzioj0h
         Nq3rw6gvfYJKjeYbAkm7JehjPQv2MWKJ6FrnTdnmrAdjfWEh/+CGAqhgUPlev9QrWBNC
         LtqGM/iGxwELc30sXHp/X4nlPyPst+k8xxIjJPPLjoIsEpCicLk1zh0hBL8SOyEq+5cV
         uyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726426977; x=1727031777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4UOvVGZ8GtKwRInuJIT2ch8XFkLj324WspKyPQ0xaw=;
        b=uA8tQlHMxJTzuNNgUi383E5AJlO0tgqVd/cqHQ/Wb+9N56jozkTa2mwFG7McGmdxl/
         oVJLMORCn64rKKdXM2KejXU3329Ibj1WzkY9d2FzzulYjj/Nr7QlibE/iWW+kjZ6x/vc
         rnAvwzSd5s+logrNEv54m6u0jqknPFDo8y5//lnF7zEVsSyGhUwBkwDtUFPHOJMpWLtI
         XdltIRuFzyjQSV1XRlEYEbtHb8fkjfXYG3X2YabLH8nSEnX/RAiQVnweGZxWHXmV78nD
         vAkmUJ0yNMLnH5hafcdHupV9NRv/pC7eF0/Q4VqLfUG3UFnTAU+zF5FurScYYyU1lOrR
         O3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbyr4++LP6xKppx+ttMOJBqKSklQqE+s7e+D1Nz3MegbFT+q08p00XOdNq50aNZlIAIJwwrZbGtKn4+brF@lists.infradead.org, AJvYcCUtrm1M46gELR/QbDkqS1vRU2eaYQiFXVdHaVZksLqXEuCdFdO0J+kgSpfbB1iCtv38Zgk3WIcM0Mb3+atHsOtHjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRgByMdGHR+ZNC9lwOj/+erUVFdncL/nPkoackC9yeKaTkxCk5
	EmMMz8VFIPF1uLM1wJVNX+Lo04sy9V6Ten7lw/EshxOFUOf3CeoThzit1p9J5xsAHSSPYiF0say
	L9N43GmjYO4c9qbuJiljR/FpZ5pY=
X-Google-Smtp-Source: AGHT+IE7kheTN19zXbJRfYda2IivoITqgwqNICI/LYdA2vzUDioYop84RC1rbN/XaMWP5zvCukwcsh729j6RO0lWXnk=
X-Received: by 2002:a17:903:2a8e:b0:205:5582:d650 with SMTP id
 d9443c01a7336-20782b7d46dmr146275835ad.52.1726426976825; Sun, 15 Sep 2024
 12:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-5-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-5-feaabb45916b@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:02:46 +0200
Message-ID: <CAFBinCAgm+OGnxDvYAWGU-hEgBgGqJwHESR3ivT66BNvTNo5Pw@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: dts: amlogic: meson8b-odroidc1: fix invalid reset-gpio
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_120257_807072_FE5873BC 
X-CRM114-Status: UNSURE (   8.25  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMTI6MTnigK9QTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBVc2UgdGhlIHByb3BlciAiLWdwaW9zIiBw
cm9wZXJ0eSBuYW1lLCBmaXhpbmc6Cj4gaHViQDE6ICdyZXNldC1ncGlvJyBkb2VzIG5vdCBtYXRj
aCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLVswLTldKycKPiAgICAgICAgIGZyb20gc2No
ZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL2dlbmVzeXMsZ2w4NTBn
LnlhbWwjCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdA
bGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVt
ZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
