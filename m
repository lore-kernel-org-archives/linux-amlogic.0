Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD03C54E67
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlMsRaxwQCzCY57mb9EIrGVrnpCx5EBvNfRhS/ExuMo=; b=IZjBiIs8uUG4hC
	vJKxFMcpjGzPEvmyg4MyCVvmrC6g7/ZNDGyQHxKzUIBsy/WO0sshrYpuvOixMDBpjlCi4H+vVycdI
	dJ9GLg26wMI+isTO8jmxdeSbUtFi51TeZdKPMnLknDGLu0nIeNRbKAfVRQgPHh/p1yZlzJhiAbvZi
	W0BskoM+Q0P6VUWNfORGDwjAsJ6q2xe3NK+n0xka8Cnp1BW6WTrGQlI5V5EALauTJxDrBKj/lJQlU
	5iwe1/eIHLWke4/M3TMeotX5Z0eN3eW/19uTkwWpfpe8/zyVUubLJnbr2E3FNk+Fe2j9Nep6Dh65e
	kjA9UGJTDGMQG39uawdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmI6-0000000DOXz-0YGt;
	Thu, 28 Mar 2024 09:43:22 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpmI3-0000000DOVg-32rI
	for linux-amlogic@lists.infradead.org;
	Thu, 28 Mar 2024 09:43:21 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso741970276.3
        for <linux-amlogic@lists.infradead.org>; Thu, 28 Mar 2024 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711618997; x=1712223797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bC4RkEx+VkqZ7aTbIqI3D4kCHyp83VRJ0WWVsVi87U=;
        b=Zys5iMbETLo6sQqLB/vbXTubOtNZJ7HtDL/LdyDez5aK1gOSBjgxo/j0w3j8DzBp1g
         wJIxS/AeV4/TM+yqXzlvfYc+A5/e6cc4fMe/x5suXDYW8H9mIO8khInj/JBgRJqqHoDA
         VNbqdTFbfE39jbz83dhLIyGJT3uI95FKDqkGRrJ+CrfhI6HNAlmhFFJdPHOiBzGQ3aXl
         o5m23QcX18nffb6IbtMIok3Bz9Xvxo6L8V/K4e0CF5za9YDAafsMeYrTVwx4v6kqGIJQ
         vZjC92/PYfM9Rp6DpWXQTM2rFPQ4epWOoLyWL9xUvdA7GvK5oJie/3nrswKyOV9oWa/b
         TZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711618997; x=1712223797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bC4RkEx+VkqZ7aTbIqI3D4kCHyp83VRJ0WWVsVi87U=;
        b=VhnfXFxmvxBc21OYnwYMugn7G6DtVNi67z/nbCb6MQxf97q5JnoSPIHUV4wtxEvKTa
         /Ceq3uXyj6+8gTi07VVcdhVqsl1RV0vETMbqVObRburJKYhL8LI5mdmOc3VSnyAUhIrs
         N1JMFVCZNJeZmBK98YsyAy+1DIrRhGawC+4wOFHzG8qQns99RP0WJM37JLQ6G71egLum
         1gqSz6/W9sq/Xrj29Bh0AsCqa3V6wwcHSj29FiJm8uXeMCpW506LWwsNprfH/w6oCKwe
         Z31CgjPDYJw7Qbki20GopFDB1afeltdIJV8+d081hK89VebpQ1hUxzVFH1WQlhKB4rro
         ejLA==
X-Forwarded-Encrypted: i=1; AJvYcCW/HqGag+4RJZPaltn4t8UtYw8YAJ1zchyYkqo6GdyOd+L9BGdtsnYKvWweqSwveAyy0lKwHoECTcUq/o8OWqyB+me3ZPCnIL7xzW2wrpD5u0o=
X-Gm-Message-State: AOJu0Ywn5Klfa6BnO9Hr9idChjicYRxIFTYpB62fyy7xdkFWhVzivPvS
	x8EKAG7KcLVVYIUZ9FN6V/GXyjZdFc41BmKmH9IM7cGTxJxEQWJfXV/D4I+RcSTO2K3BAgJkozJ
	yZukwXSSsx9Oa686NDJEztxHMGcNqgSiOoDb5Rg==
X-Google-Smtp-Source: AGHT+IGIBgCifC94WWbmk1WL90a5JSXQTsvL9yU0DsuBNrPusLMZEBcn0E7fKCz4fiSDpZHvOK565KZ6ERPKVg6UNMQ=
X-Received: by 2002:a25:b9c3:0:b0:dcc:4b44:3377 with SMTP id
 y3-20020a25b9c3000000b00dcc4b443377mr2227810ybj.25.1711618997667; Thu, 28 Mar
 2024 02:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
In-Reply-To: <20240325113058.248022-1-jan.dakinevich@salutedevices.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2024 10:43:07 +0100
Message-ID: <CACRpkdZPVTZvjbQ19vjPWVvdW35DO2U-CgVi3r1q9jJA0OupJQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl/meson: fix typo in PDM's pin name
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_024319_792820_A8AF5B88 
X-CRM114-Status: UNSURE (   7.88  )
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

T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgMTI6MzLigK9QTSBKYW4gRGFraW5ldmljaAo8amFuLmRh
a2luZXZpY2hAc2FsdXRlZGV2aWNlcy5jb20+IHdyb3RlOgoKPiBPdGhlciBwaW5zIGhhdmUgX2Eg
b3IgX3ggc3VmZml4LCBidXQgdGhpcyBvbmUgZG9lc24ndCBoYXZlIGFueS4gTW9zdAo+IGxpa2Vs
eSB0aGlzIGlzIGEgdHlwby4KPgo+IEZpeGVzOiBkYWJhZDFmZjg1NjEgKCJwaW5jdHJsOiBtZXNv
bjogYWRkIHBpbmN0cmwgZHJpdmVyIHN1cHBvcnQgZm9yIE1lc29uLUExIFNvQyIpCj4gU2lnbmVk
LW9mZi1ieTogSmFuIERha2luZXZpY2ggPGphbi5kYWtpbmV2aWNoQHNhbHV0ZWRldmljZXMuY29t
PgoKUGF0Y2ggYXBwbGllZCBmb3IgZml4ZXMhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
