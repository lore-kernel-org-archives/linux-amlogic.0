Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03EBC072B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 11:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75A102168B
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 11:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZGjC1Mm2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h4/4vz3L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75A102168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bSxVEHC0z7rR390cxgNa4tRienzoH9J21hLcDK2eyY=; b=ZGjC1Mm2Pfmb5s
	mefVfpxDs8q95nz52TAy45vnOj82AMg/YcV8oL+kyFO2EXIc1T6K3DfgiEPcry5teXKQGyA+jRLJV
	pXUNPYgvAS4qPynK5F3odaGRume6mDpyvVNcegF+AS+2VnBQuPYI/dXCiSCJ0w86ALE/iz44C249c
	PyXV6SbksHyrWk0c7ID2+DjZDA1BNgTYnixvptwydIUoXiy+CHLD7L6KK/kajSs1Y1shhSxHe8frA
	o0lQe13H/WFvAKezRkqIgTXI/0M3/zrkMNlWgx8uMr2BySnMqYINm+jOwz1E7aznVxfYZqh96NqxF
	j/wHv1XzIW7/8RIJxlhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU8iA-0004Cl-Nq; Fri, 24 May 2019 11:50:10 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU8i7-0003pQ-Sb
 for linux-amlogic@lists.infradead.org; Fri, 24 May 2019 11:50:09 +0000
Received: by mail-lf1-x141.google.com with SMTP id u27so6908536lfg.10
 for <linux-amlogic@lists.infradead.org>; Fri, 24 May 2019 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AL2d0pjlVBmIWRs6fr455brLUAHkmqGB07RrA1F6UsQ=;
 b=h4/4vz3LD2ZII4MSJYVeGvEjd8RGbaXMRdluTLEVzPBGwfPTSo43vsYoHYH/xySLNX
 V3rGq013VRND/0yAuj7v5uqA7np6Ia3LuEJ6wQ25a8Wtm78bve/xXkyTWTs0vJJsXk7K
 PNhUmZcnHMsLAxNUFohIKBAKVFCyISAmeJe80Tox/KO2IeSu/8Jx4IWxl4SsrBCoU7CT
 AOyrklKJAz8x5PVopaL4hoIOkev5AbUTo1Jz/q03XW38IygBl/52Jwk3PZIfyKlRDDAU
 J81VG4MVmf005/SerSCAeZwN7SndZOQlGCaigSqqUn2XzmvwgxU/qS3+d0xxB1jItMgH
 8dNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AL2d0pjlVBmIWRs6fr455brLUAHkmqGB07RrA1F6UsQ=;
 b=Gjvq0+13uYlJ+ZEqcHFq43LdsodnA/k2LnFL6MohuWHkW+pNyt2fG08ggO8Q1avBbq
 gTHdtg7KQVf/GbFj9hNRssfFpQCy6ixV+PafrFtwK6XHFqF1BCNtVQkFFoY/5eYuRmjC
 f7I1Y+TqIN7iI+1WBVcd6m+haMEK5jjHkFrZiaVAXHT48W1uOehm/YYOpcRM6oa/DHb7
 jYCjWwRPtdv0088JzgZ7auZKEahhMKnB5vroEEyeOblcCIa6eJ2/BLuiPUyPV7gKEDwJ
 E+wuFQgOUFW6izszqByY6ukxNqUlImRsm1QeWnRix1VciHqUj5fmNrU8j/ypws6SZvje
 8y7g==
X-Gm-Message-State: APjAAAVZiFJlOqCwZAXpXul9dxKm9iWYGveD3nuzLeP97NC2fIeqi8Gd
 Ky5ZWKToGsifgqnsowIV/pW9/AU3Y91cIEMMcq1OBg==
X-Google-Smtp-Source: APXvYqwbOkonOaKhd8YCRIfmv8xAdTAD2vdgJCKAFZSw069Ovzk2VCRpvhyKKNBx3bpZuWAcz7AuNGltRgMJWnNejjw=
X-Received: by 2002:a19:4cd5:: with SMTP id z204mr5666594lfa.113.1558698606083; 
 Fri, 24 May 2019 04:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190516151339.25846-1-jbrunet@baylibre.com>
 <20190516151339.25846-3-jbrunet@baylibre.com>
In-Reply-To: <20190516151339.25846-3-jbrunet@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 May 2019 13:49:54 +0200
Message-ID: <CACRpkdbxudSAD8rHbzpPFSAhxmd39=Jt62AKEXQV2CaDEZZQGA@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: meson: add output support in pinconf
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_045007_929559_334809BF 
X-CRM114-Status: UNSURE (   6.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, May 16, 2019 at 5:13 PM Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add pinconf support for PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_OUTPUT
> in the meson pinctrl driver.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
