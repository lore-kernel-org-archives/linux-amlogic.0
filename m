Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161DDC76196
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Apr 2023 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/Cbc0sLWM44Qe78lK+9NfAvqpP9MRpj0VvLhxFeSOU=; b=wCdmk2msJ73hqZ
	CLOGpxsYuewNDFhnIQ82auSCVMjAxoJvMkQsCpQNat6z/buNQBat7V/T2eLtYiA+6yXRedEg/nKCF
	1PdbPQs1Nudp4yh9Kxl6f6pUloQ/aFK0Sr10CIs4Ec9Pqn94XsXmltsEj80r/u2aaoYImPIvomryf
	GlOJCHUnWbjUAY1SVpug3k7citn2HXwkQIfEVE5zNcIj0V2agAT8epVxzaH7NzXq5agSNXjNns/pY
	sNbQyS6W1qwuNVeE+AMbAHylIN9E5oB5tArIbhbtvdPBz7jpS2KCyhpsHOmZD3mimQKqCNNm2F4R8
	PBRb+wknXPCFfBYxfkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHVI-000fnp-31;
	Tue, 11 Apr 2023 17:10:00 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHVE-000fm5-2H;
	Tue, 11 Apr 2023 17:09:57 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94a34a0b531so212788366b.1;
        Tue, 11 Apr 2023 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681232992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+LovfMj5Y0fCLq+tJd34Pk+bOAIbnzd9GlCIhTrCFY=;
        b=MEiLqSI+mBvBUZtQPXMn04wmr975COI/+1cCkmtDNQUuRPtcKJID9wO3oazysIVii5
         TXKIBhG8hVjLMG4aui0YGC0ggOFIGT80oA9BwqfSI2S1m5a8v+9zkaF4PYVqvBAsUodY
         oWQUdxYRvgHHIYUejrBMCqOgKySz2fQbfJ1YFA9w34uD0J7vkU/Ci3wRe2vevxAmyraS
         RUA9wLf8jc4CavsDbTpGAsX20xxB4DX1LynkzlBMUFlFBXPJ9i5AMylLaMxk1+bL7L8J
         cfBQc41mw/iVjLU6YNogk3YPwcbyoCNWnHqy9e9k27CRjgQjXhETYiyUc8OGFBFkqB+s
         R/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681232992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+LovfMj5Y0fCLq+tJd34Pk+bOAIbnzd9GlCIhTrCFY=;
        b=3ne4bHqdlJHo8AbhslweTJh3jhnjqC4zZXOgWNRN/nNAIW1MWQxiwyCFvMY793l0t3
         XaRhbbepeyolcmCHgNBBLLbfWahRCQ3QB5UKW9RbH9oquTjGZXZ4xGaeNyUsqUR2qNyE
         uOx1B8bUoG/NXOftm49gzQhJz2oFOuRW30WskVY1qX5NRRaEP6PFVSWakCXk2PQEe9o7
         l475bZs4Yalbh2S9ACWh3JIuvVLhKvW4ew3sRN0BCnMlzFh53o3x0H02x8q+7KWm8Q3a
         woBXd7MDeZBvBFD+BaJ+0OIc6o2K1eFZjosXUQipYZ6YfcZmL63DUD4fCVMYSUez1J8V
         +E6Q==
X-Gm-Message-State: AAQBX9dtztkbA4RmAAXLgBhX3Eubjfzo0uCH4v0uRRT462PXgqOYG2um
	U3B+VDsGZ31X9993JH9a200Ckw1dNgfLNntlTho=
X-Google-Smtp-Source: AKy350azwMn/Osiqfu+ZdrahsW8SxHlklqm04Na0PGVJVJmFZcn+bqBSIUqvudSzQ0cHoNeD3a40ZUHs0X6yPDSIdkg=
X-Received: by 2002:a50:d69c:0:b0:4c1:6acc:ea5 with SMTP id
 r28-20020a50d69c000000b004c16acc0ea5mr5457829edi.4.1681232991705; Tue, 11 Apr
 2023 10:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com> <a3fb613f-73d4-c9c7-f48f-ffd79fa654aa@gmail.com>
In-Reply-To: <a3fb613f-73d4-c9c7-f48f-ffd79fa654aa@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 19:09:40 +0200
Message-ID: <CAFBinCBtxQvDX8OSjACqRbFfM-DUtb5PoPp4Cwv4Q6PD8j0_gg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: meson: omit video/hdmi clock as mux parent
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_100956_746412_40D71407 
X-CRM114-Status: UNSURE (   6.82  )
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

SGkgSGVpbmVyLAoKT24gU2F0LCBBcHIgOCwgMjAyMyBhdCAxMDo0M+KAr1BNIEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgICAgICAg
ICBpZiAobWVzb24tPmRhdGEtPm9taXRfdmlkZW9fY2xvY2tfcGFyZW50KQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNoYW5uZWwtPm11eC50YWJsZSA9ICh1MzJbXSl7IDAsIDIsIDMgfTsKTW9z
dCBsaWtlbHkgaXQgd29uJ3QgYmUgcmVsZXZhbnQgYW55bW9yZSBvbmNlIHdlIHN3aXRjaCB0bwpj
bGtfcGFyZW50X2RhdGEgYnV0IHRoaXMgcGFydCBvZiB0aGUgY29kZSBpcyBjdXJyZW50bHkgYSBu
by1vcC4KQSBmZXcgbGluZXMgYmVsb3cgdGhlcmUncyBhbiB1bmNvbmRpdGlvbmFsIGFzc2lnbm1l
bnQgb2YKY2hhbm5lbC0+bXV4LnRhYmxlID0gTlVMTDsKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
