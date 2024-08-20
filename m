Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87243C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A3GeuYtlZyEN3qEbbtzN7BUL51x4MNE337wlYDbTJJ8=; b=05MKs30r08PdIm
	T1QIrSyfN/dLhVgAhnOhdbZE1h9DixzTKFLTv7FXEEwkXQws8j1JBzLtHg0iI4C+WcBRNLmKkq8ag
	SeTtIc+Tf8XAi8NoRJe4wyIIqf3z9q7oY08nVJwNOWf6Yf8vyVF1os4+xFbSVX1sL4Eo4bToupMwJ
	M/zAVy0xkmETeys2uTnTf4RXH2MilXX2HpnRUW7UR5vXfhlsYkL9TdAT8sd4LKmKSAKM5HLFQEGww
	kutLO+dKdiEYAl6h1A0+pTdNPd87p6xWvGgn2qVfFbZ0J/qNg2lsEpPQOagQnXfOn9dTxWVGVWM+6
	VuzD1GXIhyF5xBUPBPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQrd-00000005qza-3MyP;
	Tue, 20 Aug 2024 15:33:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQr7-00000005qsN-2EGj
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Aug 2024 15:33:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso45165635e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2024 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724167988; x=1724772788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuviY/QQQrSO9+Z2BJ5lMr1fzmIzONdeW1It0su3NKk=;
        b=d0y0MGnVxHB+3D/ZZWPQUXz/XDNPkTAn2jXkwAuvxhNEnpJd0pVqKb61ThHmRyqKwB
         8lBx2s87qNbhVY41W+opXZINbqrO9/bUQaM4ta+Ru9q8KUOcTLOyeJVwJ+VsMk8WHK6c
         5OhUnOUyHHG2cG1PnSKi4cgVTYKCsRYoRBB+VwHGSy8rkapTrPdE7wMxdYb81dT2mg03
         onEJSN/3lbaLliSarqTL3aQ9BkCcA7D8JWmD5rmFNwyvkix47GfcO/pNOz7/f4lJV6RU
         JFUIvD0XbhT9vPSeGdU8RyXsJy6uA6sgaW/Czu4OGX9nyPtfXPjfYW9ophTdK/GcoJf3
         KD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167988; x=1724772788;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuviY/QQQrSO9+Z2BJ5lMr1fzmIzONdeW1It0su3NKk=;
        b=CLYP22Jj/a7guFjBSruwxx4u/xMuS7w1OFYM9ImQB8ROHBHkh7fNUFeLmtcDb7LfR9
         7bX5sHd7I7zb3T56eh8v1EUWlsKtc0RV8HtzGmyDNuoADG8sg5lk8cE/OWF58AXxgohu
         rrw6QX1ChaNF5pVQfxTaRue/Uta6TDy/SUjqzroatb4/rIdDsCvNlzDuveUx2/z/bBOz
         oFwXpeGX2bz4rd4bYrnY8lxI+qTsOKIel3yCdQ//jEk3fO/e8+BCl12oqaeP0/pkOEQV
         7qxSkV6Eq41/144gtv1+HcbWY/q9FJ42hBWysuiHF6l0Wb3g/gatbf+Km0Nl9Aov+Elt
         9sNw==
X-Forwarded-Encrypted: i=1; AJvYcCUhUerjnI9S+BTMxzcp6xaK9EoLjsCP2zSIn7f51vVF8secQSbgkvnb4YEHkq3JjbpV0QKdCj19wQnH0jex@lists.infradead.org
X-Gm-Message-State: AOJu0YwrkLEy1/pby+TbP90bDXV+WBK1ipxE1YuhgQYagJslRxy8Q4pb
	oRa+bvRpPdUlt5jVMEXLj4YiPbJFTX3SjnpYdS7dCnCHYMxugJhRhyaSiw6LeXY=
X-Google-Smtp-Source: AGHT+IE777Bx6pTopHtMljghqFepuFOm8sSMWy9wA6vpKgN4DJRs3RE0ahQDEyikg2nfhn/BYaFEsw==
X-Received: by 2002:a5d:50c8:0:b0:368:6ab:ba69 with SMTP id ffacd0b85a97d-37194651b3amr10028009f8f.28.1724167987318;
        Tue, 20 Aug 2024 08:33:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898aac62sm13311675f8f.101.2024.08.20.08.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 08:33:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
References: <20240719-soc_info-v3-0-020a3b687c0c@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/6] Add new Amlogic SoCs info defines.
Message-Id: <172416798625.3053719.9732912917440614135.b4-ty@linaro.org>
Date: Tue, 20 Aug 2024 17:33:06 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_083309_764343_E68FC6DF 
X-CRM114-Status: UNSURE (   9.20  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, 19 Jul 2024 16:08:08 +0800, Xianwei Zhao wrote:
> Add more Amlogic SoCs info defines, include S4, C3
> T7, A4, A5.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.12/arm64-dt)

[3/6] arm64: dts: amlogic: s4: add ao secure node
      https://git.kernel.org/amlogic/c/4b26afe7d216183bcb2b1aa2c0096cafdf7a9ea2
[4/6] arm64: dts: amlogic: c3: add ao secure node
      https://git.kernel.org/amlogic/c/84ed73ee34d152032633e540f159c482ede4c10b
[5/6] arm64: dts: amlogic: t7: add ao secure node
      https://git.kernel.org/amlogic/c/4c23177c51884f5307e67875b1dc87d98543be7a
[6/6] arm64: dts: amlogic: a4: add ao secure node
      https://git.kernel.org/amlogic/c/b2d7fd0ecb292e77a2d04cb6836c909cb6b6655b

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
