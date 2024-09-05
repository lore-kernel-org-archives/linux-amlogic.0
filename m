Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D95CD5BB9
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2024 12:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6G4PlnRt8Ie2A157q5zsYX5yVx/KK9ie6MwSyLa7DIs=; b=uemBP63eeTeYXh
	XcH3GCFQHjPffDALV3Y985UabqjYzHKg3I7KJhqtnAik/N2brtfezXewhO63sSpBrcUlbwy5E2Y1z
	G12if4oP5b8rstKuPx6XW1Hu/EFSbyxvw8UOu1gl38gny1fGS+VO3V+KIVT52WFKF2ovsuM/euiGF
	klltq1MN74SkzTBVNyQrSjbn4CsXrJboKE6p29vpO4slT/gSfRcWII1zTcbaFGCxDRfXctdqetE2v
	Zyms5bvkVbAuhhDXz1DVMUZPSqYbzSCOlFA21cBMyNzEjPFeyGvHSg+HVXUoPLTG+xc6SPa13cOT1
	4pl0IzpjWD5FVOduam3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBy3-00000008QEI-2JXB;
	Thu, 05 Sep 2024 12:52:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBwB-00000008Phh-1i3Q
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Sep 2024 12:50:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso7606405e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725540610; x=1726145410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnMGuLxKfLcoYb1PUszqIgntyujKQFWBKYM3hRMDzrg=;
        b=zEbNZPAarvp9VXS1TYUkvyeA7TfThyNMngWo/yyJHblqRzfeWTQcndYVfb20htoaFs
         twE+cz8rwh1VOqujosYFO1Hay2P1y9kyxlK5mHgwVHuuaKo8baYdfyOUWNCL8H2mZt2G
         gHfeVfB4SW3o6KZLJ1g/3Bw+yt//N6CcWAywT0wnZLnXbNnRhw8GjWa1V12VScPtetpu
         xYh0DPM29D6s4S/HMHWhVIGW+yucdgSMkJeg45jMjyT8B8IrN6IcomvTbRzjYiXWJska
         h7FXEQqGDdUOcV7gSlEFKOa/L6gYobJvYC8sgSGcYxAUIfWUV3UE823EZy9C3KVtNIlJ
         fYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540610; x=1726145410;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnMGuLxKfLcoYb1PUszqIgntyujKQFWBKYM3hRMDzrg=;
        b=guw9sfqLeF67q8gMAgeg6/B+xeOv8eZ+q2LqMovHlkGWJlVX8rf4QBoJ0cr3QJMX4E
         lRnO9NRNeeJjtjTTs3t26sZuEES1K4dpVXXn3V6qRvGvZwczliYMPrCzLjfq7UgUCXXo
         ZkVNkBBl2gXWw7GiqGP0uvc70o7AIThW6gUMoA/RA0eG66mvneUbYyv/NobggRow3scU
         SCg/C686e2T29Fh5Cx6CUcP+CtsqTy7KU7kDe/4+CQUlE6QyYXkKtIb0oxQvEK6H17GZ
         ZNEd7YwgDxovh77lZ/0tS33yB2cRdKxLaFQ5WNEZUHQVhVj6Y8pOMs00wYlhjEhivn08
         tIGg==
X-Forwarded-Encrypted: i=1; AJvYcCWnF3uoPdisLVnU+eUYyn4GAFo2GAlFttFJZ+ZyUT+QDdgpqvB/yuCpFY7rdlBOitCdmP5XKcK/rnKDO7iq@lists.infradead.org
X-Gm-Message-State: AOJu0YyIfWE5OSqbLb1bY1YhFa3/V/OcNWwACJ75/urH/szQrojEWAQk
	QmBfTlhztv+deECRGtzPmpnWXTcPfVs+Hac/jDAt+tWNl0EgVfA+50omNQswefE=
X-Google-Smtp-Source: AGHT+IHFWyn+bCI9Bu+LILGhtUkFhExgaYW6lXVst2PA4BGmTHaiO/LLeFnPRl5bfeVzz4YI2qUZtA==
X-Received: by 2002:a05:6000:1f08:b0:368:7f53:6b57 with SMTP id ffacd0b85a97d-3749b544b2bmr18684509f8f.18.1725540609740;
        Thu, 05 Sep 2024 05:50:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbe79f545sm200862825e9.2.2024.09.05.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:50:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240905-topic-amlogic-upstream-gxlx-drop-iio-compat-v2-1-7a690eb95bc2@linaro.org>
References: <20240905-topic-amlogic-upstream-gxlx-drop-iio-compat-v2-1-7a690eb95bc2@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: amlogic: gxlx-s905l-p271: drop saradc
 gxlx compatible
Message-Id: <172554060875.3272060.14995227202857291504.b4-ty@linaro.org>
Date: Thu, 05 Sep 2024 14:50:08 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_055011_491449_F687B076 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 05 Sep 2024 09:02:10 +0200, Neil Armstrong wrote:
> Drop the undocumented amlogic,meson-gxlx-saradc compatible but dropping the compatible
> override, and fix the following DTBs check:
> /soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)

[1/1] arm64: dts: amlogic: gxlx-s905l-p271: drop saradc gxlx compatible
      https://git.kernel.org/amlogic/c/e202307b75660aad42fafbb0d3df2c9dadf019ec

These changes has been applied on the intermediate git tree [1].

The v6.12/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
