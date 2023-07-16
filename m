Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2162EB64DD
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jul 2023 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrcPI+Dd5dq8htogmgUU0/jtQBqCNEBa/HhaY79togQ=; b=CAycxIQt7OHbmO
	YhP1oMaBlTpw4I3tegx5ZQCjm/+YsKb6LmmUpqF/uA8BvKCKmaH2tUZOyvxSygQA+OwuVP6x8VQB6
	AcGqJ4MuKvv8p9o20u9CWF3zPS5v5Nxot04H6VTAuVXdJf5bqSQ/7Av7oatD929MaXyLqnaMINA1d
	H74hkPM/StHFxs7pi1Ur26tOP1Q0ldIZokRWTD9d8PipuQuT0/DoKjQLy9BPlslAwti5DPxlw52kZ
	aIo8HH9ddUHaRBPUrVPlIYSm/9Q90E1F1m8Xi0Q5t5buQYzlfwmBebWiSFHy9nScQrNw2H8VYdPy4
	0kNtzB9g6Z/YMwOf3rGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL95J-00FW5D-1k;
	Sun, 16 Jul 2023 21:15:17 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL95G-00FW1q-14
	for linux-amlogic@lists.infradead.org;
	Sun, 16 Jul 2023 21:15:15 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5774335bb2aso33947247b3.0
        for <linux-amlogic@lists.infradead.org>; Sun, 16 Jul 2023 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689542112; x=1692134112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syZ7bfmbG9hTUEEMD0N7OeMkyMv6b2GCywnkgDB26og=;
        b=sXL7NgE5tnn9Y0eWY08jOgmX0CpYug/RcZu2tI2IAIadZU2t2LxPm1pEZTl+3xKGqZ
         wvbD9aShgKnXj/nh+tY1sA1AAPSX/6SWkSy0YZHjbeW+aWwu2ZE42JTXzypBf3j8zF80
         VVVDN3tjOw6dl37NUp0rhIUEMihg/3YTqYlO1cGMzHZbRkbxKp7gERkD2P4cjwobQxz9
         t22D4KTMH60tH5sRn2mMjtNU+bRbdR8lnU2Q1PkvhTJeiiv0veV1TbEOvNgMY2CtqpiI
         dgWtNj0tKntU51hoJ+7/NSxNE/YTIsHnFP5ugTOg8M4yUkZaqRDyDcQDUzWfR2Sg2cJ6
         QxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689542112; x=1692134112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syZ7bfmbG9hTUEEMD0N7OeMkyMv6b2GCywnkgDB26og=;
        b=RdcR+gn5FU1DaJwKIu/RANRsi/g/8+mTXYB9IKoOq/1slZTgTKIhzXkk/xclub1Jrz
         lZrUU+gPVK6ygJF57rt+th09HbiXAVFkmMdCy3Z7nlJsmc9yXhjsfW5cZa3nKLV9CPr1
         9QeOMektGU0T9RlgaH/0q6zsBBDz2R9Sf7NnI/vVTKm13tb4awswy096Efuo6pbdqLxy
         FNkR4ZgSB8l3dsxd04M16asNxvO4NEBB5DcK2yZnUSv5GLwjJIh1S9Y3K2GSkpdJTlxQ
         R8mPY20HgCQ0ZSOsom9xAnI5k4zLBEGj+7z60H7SizjR3HNmSgKRxFnVjcyDrx3wJuNg
         qylQ==
X-Gm-Message-State: ABy/qLbhTG+8aHcrgK7EyNfjNluuetJ4tdpR5HSEemsMGI/avb1NvuYC
	XOAee6hExWe2sYYliCAmA6LJjsYzjMcXE+ZR8aC/MQ==
X-Google-Smtp-Source: APBJJlGyZnAGewtBuUF/Aql3jrigoDHvIMbIEpnRxYYShoyJ5AUs0mHl0XSztp5BEx545McQJfp3pSS4aLE/sSfxMQg=
X-Received: by 2002:a81:480e:0:b0:573:9747:9a0d with SMTP id
 v14-20020a81480e000000b0057397479a0dmr8625958ywa.41.1689542112298; Sun, 16
 Jul 2023 14:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
In-Reply-To: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jul 2023 23:15:00 +0200
Message-ID: <CACRpkdY6LaLCh+n4rpD1Jewk+-GC6zPo-TQ75bg8qcym9wxTMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 add missing properties
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_141514_410752_BA615493 
X-CRM114-Status: UNSURE (   8.10  )
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

T24gRnJpLCBKdWwgNywgMjAyMyBhdCAxMDoyMOKAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gVGhlIGFtbG9naWMgRFQgdXNlcyBncGlvLWxp
bmUtbmFtZXMgYW5kIGdwaW8taG9nLCBhZGQgdGhvc2UKPiB0byB0aGUgeWFtbCBjb252ZXJ0ZWQg
cGluY3RybCBiaW5kaW5ncy4KPgo+IFRoaXMgd2lsbCBmaXggdGhlIGZvbGxvd2luZyBkdHNjaGVt
YSBjaGVjayBlcnJvcnM6Cj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS1i
YW5hbmFwaS1tNS5kdGI6IHBpbmN0cmxANDA6IGJhbmtANDA6IFVuZXZhbHVhdGVkIHByb3BlcnRp
ZXMgYXJlIG5vdCBhbGxvd2VkICgnZ3Bpby1saW5lLW5hbWVzJywgJ3VzYi1odWItaG9nJyB3ZXJl
IHVuZXhwZWN0ZWQpCj4gYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4YmItbmFu
b3BpLWsyLmR0YjogcGluY3RybEA0YjA6IGJhbmtANGIwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVz
IGFyZSBub3QgYWxsb3dlZCAoJ2dwaW8tbGluZS1uYW1lcycgd2FzIHVuZXhwZWN0ZWQpCgpQYXRj
aGVzIGFwcGxpZWQsIHRoYW5rcyBmb3IgYXR0ZW50aW9uIHRvIGRldGFpbCEKCllvdXJzLApMaW51
cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
