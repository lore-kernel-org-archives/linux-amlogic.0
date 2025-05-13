Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1436C3ABC3
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zlIhWnla1nIiKf/EzDhQBi06uWrY778EvBXDGLXa98=; b=2tz61fvg6wOKF3
	ktQbdLNf284rBEKo433MIesNgm3cxTr8ZrSoDOIM8LRe42wi3guBHkL1vMppSHbBMFsIMjS1evLN3
	U4FOzrH6LsrqBr00OHK6mQtpAzltJirFLrBoREUKoQ9j0et7zUNsuhhE1v7S1Z0kMSz3jg1v/TIac
	oM1KHNOJIDLvUmP/O4ZB8HuSSJaXDTHsku13XvxskFSizsQTIymTDKDqPNuMvCxUWP8Gffhs6PFUD
	nP2srfhB8kTV9XSNqLf7G5LGABp+lsW1kwh6yf0TMqSvJ8yFBnCeiu5omufO88j93H2y52hdhRHJ8
	uQmNXaRTkZFolqXmA60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExYI-0000000DawF-2X3k;
	Tue, 13 May 2025 21:52:42 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExYG-0000000Davb-2J9X
	for linux-amlogic@lists.infradead.org;
	Tue, 13 May 2025 21:52:41 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-30db3f3c907so59243341fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 May 2025 14:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747173158; x=1747777958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=aFUTfQbbX3uJax7TPkTfosDcy47KFeFYV3hDL9rbf1dOX6nBgoNY7xvMyBL5fy9Faa
         wrJ+4x4WtXASqDJf0fpOZLRSlw5WEJPQUEnV8GOJoVDBD/I3te+tEKdlucMgH1IBdtI+
         zlww44HWUmRRh7e8VugMLNgyz1leOdh+a3XcO6xqpBUvjqz8BDAsLVtK3LqfHjI4u1Nq
         lUNBAZ9tsJTcXxw1nCYfNV7dxbSHWDuBIufLWc9nuWhMUsSXXAp2qA5j6yJsBxewFQxR
         AGpSOab/E00quEBJLGUbzYs/q0/rcm64wClbPZimCV2GptqaDxZ4IOFNeJWGLst1ta9R
         PEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747173158; x=1747777958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMrFM87rAmuG/UnGteKviZfWZXINuxFQCsV17IJbRWA=;
        b=RP9kKUGfHCJOvKc5zJaL6O5cpKPn4af9Vfee2wYqtkGz2H+o7XWm9j+NtAt2A0Boim
         w1eFlqGZrz80QFP/bLFgGe+haZmMxo8TXtu8iU7mIAzdNRowPcMTel0My8lEquwPWyVq
         PKTSPIL5+dVwq4KYNmHm3V1qUGPwkN+mfusJWXoFkQOgwt7mSD+z+m7OW/OsakCUjaTK
         4xgdfklwsy2oYPEClAGxz5bgmpx6FQNrRaxvxyjsIYzntJ0jwfaZqmFfzeAvXgChlA3l
         SZ4HgDoG1cjri5AYnte3aJ+ia0naihJWH0M9T2xv0g84gNVDfkVRtek8FCAPjvkot4D7
         NGQA==
X-Forwarded-Encrypted: i=1; AJvYcCX0iEiOOgIS7ErpSrKhJVfbCM2gzbv5jJzuiI9yqoEiSlf0RPcsbrbJysuBoJh9jMiEM91aYhAvKTDkAoC8@lists.infradead.org
X-Gm-Message-State: AOJu0YzFhCQiTu2ga2/MROnkEaeqoOoWku4RQ4vuPwC04wgjls5M66R0
	tYuyKgUNuEBD1A7iB1N2Rj/cloS77Cux1bEyOl+TTWKRLWN8J3cyXXlFDNa7/4V3LfSEeurbNtA
	ll9+ljis1BMNWSI/IapmBQyhiT2gBNsZpU24MLA==
X-Gm-Gg: ASbGnculPu9eKJIiPjzvMrP2qZ0I6gKhwZXbdc3uJ12mJLK4p1FJCE5gsa0J7/CFIrD
	ZYOubzs0opbNvo5n51fHIXKCLIDAHhUyhdzak/l5QIvwQDNWv1Rp8nStvAae+g7XpMZg6aY4lSg
	qJU3aJRbGDqA0aMjYV7wH4RmQkaw6lrD8k
X-Google-Smtp-Source: AGHT+IHdxGQUgnLEP34p77bnggpFFcybep3eX0SRsxItjT7bGVq1s7hLEPXvIi67p9M416/+sOFwds+OUhyOtC4jV3I=
X-Received: by 2002:a2e:a545:0:b0:30b:cceb:1e71 with SMTP id
 38308e7fff4ca-327ed0d64b0mr3515771fa.9.1747173158581; Tue, 13 May 2025
 14:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250509150114.299962-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 23:52:27 +0200
X-Gm-Features: AX0GCFuybBjzXgbZgpkhrGy02_JvRvbutbRLwY2ZvnnqoSf9SNzjLph5-OzDFPA
Message-ID: <CACRpkdYwTcHh5LZ7j94LbGYv7BnTCtrJO33j17YbP6s_s3TeVg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: Drop unused aml_pctl_find_group_by_name()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145240_603440_5F74EABE 
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCA1OjAx4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKCj4gYW1sX3BjdGxfZmluZF9ncm91
cF9ieV9uYW1lKCkgaXMgbm90IHVzZWQgYW55d2hlcmUsIGFzIHJlcG9ydGVkIGJ5IFc9MQo+IGNs
YW5nIGJ1aWxkOgo+Cj4gICBwaW5jdHJsLWFtbG9naWMtYTQuYzo2MDA6MjogZXJyb3I6IHVudXNl
ZCBmdW5jdGlvbiAnYW1sX3BjdGxfZmluZF9ncm91cF9ieV9uYW1lJyBbLVdlcnJvciwtV3VudXNl
ZC1mdW5jdGlvbl0KPgo+IEZpeGVzOiA2ZTliZTNhYmI3OGMgKCJwaW5jdHJsOiBBZGQgZHJpdmVy
IHN1cHBvcnQgZm9yIEFtbG9naWMgU29DcyIpCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUGF0Y2ggYXBwbGllZCEK
CllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
