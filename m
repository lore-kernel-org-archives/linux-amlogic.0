Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42689E784A4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Oct 2023 07:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoktDDP2Ohk71nOzyNOij1AdPY6Av7RDqR1O3o2Ysyw=; b=N8PLIN6r8SJKLA
	P/LOLj/AXRduLduDDSdbTOAKv51JUD6gcw1TNT8M2eppdrqvwXF68Jz3q0qznqXZ8hJKPkOkt7Wjl
	Q8PqK6ig3/GMN2A7JKaLR3fPN57ivPLSkdgDJcnY/2XMNX2wTxXADpmPJpsalFyF/CY3+UWaTtski
	u+TSSEiR/5dibUqe462yWhmiIBAsS6FEH+trxCwt8GMCYVrE+UZTRnLAYsHTf6RcQlmsLa8ZFSPAB
	hbQAwlrD2ZbEQHLHJv5GwJEO7hgakVnDCnDl/soQhe7aLYUOkEuXghlcodfp+s+gWmBCYElVDkslJ
	62yNOu89IScCDZnnn7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCvU-00C3TS-2f;
	Mon, 02 Oct 2023 07:01:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCvP-00C3R3-0k
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Oct 2023 07:01:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3248aa5cf4eso3711316f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Oct 2023 00:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230061; x=1696834861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED3nCHgOaahRi3tOePbQGBavpIZHiHZhel+Y9Fp/+p4=;
        b=PwDrtxHjIvQpg8pcyUZBr0r3Rku10+GsFXkUE6L/eOuDODy/WfOBCvnHdChwtioNZK
         Tn2LVoEQszopUux3I1iqivcVlFenlX3Q+YWtW+QTQWyoIsdN5qCslmuOrOb+rJZCqTYE
         t2sq8iV72C3uFSZ8tH0LfTaS2lld4/7HxPmYcl4b4w78AYqIwFld+VXrs6kVGoG1DWG/
         AVER/BiSJDQ19D6PtAkp5AOpexWi0mT8HzBK7HzZEBKfOnHaVvDyiJk9fpjR9lWk4yrU
         lVMUesLmJx38SVX/2O2rEhR7vbKepzvEyeq1hvv0p+V3olWw1BVg+KxAsry3r3DkwJ8X
         cYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230061; x=1696834861;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED3nCHgOaahRi3tOePbQGBavpIZHiHZhel+Y9Fp/+p4=;
        b=hzLIy+jZoh66qcNW52QYTtZZHUSYEngwFG+PL+Ga3E+XeKltwiHFOMQL3S+qQVF+uL
         faenhhvTWOlZV/oxKjlmaQGezTP7ML2UeAr5S7Es6J+9qS19HMIEKbQ9kcITMxmutJgK
         fbnEvV6FxuSTAIAgdJfV14fM45n7vOaqw1MswSx1ST3grLW3+5dUCoJpr4zt3xOiB4hT
         MUYn/+X7U8jzkPwqxeg9zChqBvZnZbEI+lMl3lXuX0z0h3C30jidok0TEduqKuSUDZop
         E+EdmOFWnYM0JhT/bFJKD4OpqMp6HlIThpkmrCuHAK2uc8ilgoCopysvoErQ0SCd21jH
         vAAA==
X-Gm-Message-State: AOJu0YwQ7QZdD508Ig1jKsaLPu1owE+OhYDqm9LlWVHJ0sALz3fXCbJ8
	mSdW4cb2/dcvkokt8LtxL83fyg==
X-Google-Smtp-Source: AGHT+IHnVHHnTOhtd/Btr60iU9/eHOnkZf9kPsbDDvwF0leE0UE71ygHUrODFNhJf2LGR0NcKfWECw==
X-Received: by 2002:adf:e48e:0:b0:317:67bf:3376 with SMTP id i14-20020adfe48e000000b0031767bf3376mr8843141wrm.57.1696230061171;
        Mon, 02 Oct 2023 00:01:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r17-20020adfda51000000b00327c79ca7c6sm2440715wrl.80.2023.10.02.00.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:01:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linus.walleij@linaro.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
 Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230922094342.637251-1-huqiang.qin@amlogic.com>
References: <20230922094342.637251-1-huqiang.qin@amlogic.com>
Subject: Re: (subset) [PATCH V3 0/3] Add pinctrl driver support for Amlogic
 T7 SoCs
Message-Id: <169623006024.3465675.18368876466117698542.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:01:00 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_000103_760386_49E62842 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, 22 Sep 2023 17:43:39 +0800, Huqiang Qin wrote:
> This patch adds pinctrl driver support for Amloigc T7 SoC (A311D2)
> 
> [PATCH 1/3]:
>   V1 -> V2: Rename amlogic-t7-gpio.h to amlogic,t7-periphs-pinctrl.h
>             Corrected indentation format.
>   V2 -> V3: Updated subject.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[3/3] arm64: dts: Add pinctrl node for Amlogic T7 SoCs
      https://git.kernel.org/amlogic/c/d0f3a19a990a8fde6a7730255af74ef8d70c3761

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
