Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A91BC6FD18
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Apr 2023 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OcTJogEekPoekHjEvlYGZYupw8XhMmqIlGpx0+1eCM=; b=APaGDPGykBoXg/
	Jj4Q/YcyhtC1xN1ApiAfxMZm9TMqc6avvkxcI2oQDPPfjcAr00GJ0Di0AfGsdhhvYH0eFkK0uxz6M
	m8o8MpSgC0E4r/b+QN8kxxjtIlXqcaAWxXwb2/27AqV2TalrAShxSM+2Kl2q5K7hUH5nUtln2AEbv
	E5sERf8vUE1K0HTfyo3nXLUn2k3R3ruAds2Zv9bvz9o7d3anOYESZd4uvehzMKsToM+1JhvzslS7f
	3X6avhC08Uo+wz+mZ4WrDgs07nBR0wN1lkVlwnLFP60DQskwARbwxiSlIGm0uOkvfPEayF1uvbVAr
	i+BCEkw2AG53MUZIMayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdyZ-00EbmF-1N;
	Sun, 23 Apr 2023 17:58:15 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqdyV-00Eblb-2C;
	Sun, 23 Apr 2023 17:58:12 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-956eacbe651so592120266b.3;
        Sun, 23 Apr 2023 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1682272690; x=1684864690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHsL9MQVPFQ34BbrwIo16wX4/j6whiAao+LaFJLRPH0=;
        b=Uwb4ivR/3kXWhWz/vDu6RE4t7bgqv1gyR28OwaiNgcSfA74vOUDK+4jybyiq7LYfyr
         TVzdUJ8Iv5bGlYN8U+d6At4msno+SN1dVnPxFC+BP2C0bEBgJyLnWrpiiqfOss6auw8+
         ljj3ZBX9jYfuGUrgLSI7kc92dw3CAH2nRUPD7oL2Aujl4Kr//cFa4CRm5LI/acmOpiqf
         lIjEl+8PJ2DRMoBrStF9fFheFOogplgRN29ytqP6rkPuGUErBMTINvG2N6y+ZOBQq9WQ
         WRuJ7L2c5O1O0FcNg78OMHbRgxJLzKQxqoa/Xtap8wC8oD7Gka9OszagYqljUaMX0vxf
         mKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682272690; x=1684864690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHsL9MQVPFQ34BbrwIo16wX4/j6whiAao+LaFJLRPH0=;
        b=gq8yZC8jADvMc2DpDhW0lyloqSqMEbjnII2esn3Jwxyb/MF8i5Oei5SjyY0Fb/O/yO
         I7jDHl9lWQ36kjHa5GqVh7Z/6ld0C8JL7NJ8qG8FE/3TSiU+utwygqoqM9ZhsHhCawi0
         ZEtEHsfgTxA/r1rNdsbzqs5cXbbtvwF1Y1r7vfwxpvd8C68k0MpXfQlCQ/68jKfg/cG0
         OaYNTQ7zHgpf6vALvyhty3HMZWVJAPIpS4/Gu049GfezQJAmVfpANOSv+ZPyMGu1Mnkk
         EXLl6dopQnQ4vPtcsSEqCmUMvEpzpHLLmOXdhfYGr73KX7nOX4RiGdRAeD8z4rBLfrbe
         CX2Q==
X-Gm-Message-State: AAQBX9eIVzq2hm7NrOBwy1gjEuVMIPO+ucLn8fSjoQQ+s3BFTpAhvs3+
	6JsmN/mnCsbgF3M6clp3Iv/BTkClA8ffLxpiAZI=
X-Google-Smtp-Source: AKy350apnvEC+ae+CMrevYIxaPwh5rSXT9cKmlYoq3MCQp5mEsXbkdnvU8ZOMbfPlQSldniQwmmPib5M4yspogPqnN8=
X-Received: by 2002:a17:907:1c86:b0:94f:81c:725e with SMTP id
 nb6-20020a1709071c8600b0094f081c725emr11010176ejc.59.1682272689794; Sun, 23
 Apr 2023 10:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230421223211.115612-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421223211.115612-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 23 Apr 2023 19:57:58 +0200
Message-ID: <CAFBinCB5Stfhv5Z_q0r4WC63PJDWW0Vt7yauByNCRp2rz-BpmQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: add missing cache properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_105811_744480_39FC2874 
X-CRM114-Status: UNSURE (   7.37  )
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

T24gU2F0LCBBcHIgMjIsIDIwMjMgYXQgMTI6MzLigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gQXMgYWxsIGxldmVsIDIg
YW5kIGxldmVsIDMgY2FjaGVzIGFyZSB1bmlmaWVkLCBhZGQgcmVxdWlyZWQKPiBjYWNoZS11bmlm
aWVkIHByb3BlcnRpZXMgdG8gZml4IHdhcm5pbmdzIGxpa2U6Cj4KPiAgIG1lc29uLWExLWFkNDAx
LmR0YjogbDItY2FjaGUwOiAnY2FjaGUtdW5pZmllZCcgaXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+
Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
