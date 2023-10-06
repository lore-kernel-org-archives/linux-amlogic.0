Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C19E92FEF
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXy6E5f2gwZtH3Joq2jc9D/BMFGCl2ZwgQs26g8Pk8U=; b=xx9DY4EbBAwq9I
	d+3FsyVwRn2/Rmne+0hurYOin74pDEBuVqobVBupVtHvXU/87OTsPGUSKV4MzIDntEs5MGNIziO+X
	XkfNe3WoVYTMy5H4ys6JK5jBvvIPyz0mBb1vxYRzJFamh5RUK5dXeSiaOcMyFGf1xOw2zJWcR2+uZ
	U0ZT//bgG/A500VtL+wEBm1OSsSCMU0s/RTuxEFeEW9zfv4CaAUcDj4d9IiHt7xWrFMCFbf6MLeRm
	YBuZJip0hsOq640/xBQ6PlJBwWExm+IaWPN5OEEecROx6pkGNeL/AnQ5saSj742+AtBzvD9m/Dfp8
	xDo7U5A+ZaoG6Tk5tjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoeYZ-0055l4-0s;
	Fri, 06 Oct 2023 06:43:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoeYW-0055jR-0g
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 06:43:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40566f8a093so16083555e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Oct 2023 23:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696574602; x=1697179402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHZrwWZAfNjVWk4/AUcfESVqIawgSpGdGoZyI+1qlJk=;
        b=IRnv6wWhU7bljheTBCLMUzaq8jTMs1bG06l9UVF3d0d7B5NsjvO6070iQ289MpZ8/D
         z1vNBpyBSaYccJRGNorGyLhjxE6zjKteQk21XqX943OigY7NhDrblUrm2+sXYEodpUpg
         0Mhl5zjAXe0ZJm8DI4AzRgL8CaDcn1mnymrks1X7WPnVcO6NVVIpAJkNpn44ZVYmdlFF
         4d0ZE2dICjx/w+Us89xNMni5LHabdYa10LbUieZ3t977ij9ZkGJJJ9P+++K67hZFCWma
         Lj0yg/2LdXP/Qra3rkWggJ3OwEO7yEWtI0FY5PzlG9JMsE26khvwUEIVP9WlPO7etduv
         qOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696574602; x=1697179402;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHZrwWZAfNjVWk4/AUcfESVqIawgSpGdGoZyI+1qlJk=;
        b=KEkDrQIPOhLDecum9cU9ZPHqquCnkyyiTeWGUSEJiHIcobHdWOEQ5DhOxW+H88121k
         CUm0zM3hyYuJ2SQWtp1+j+QvTA6/+2FkFrcqt686Q5qXm6ivl985p7W6UAkBzvUfE7sb
         xEw8dXOpSuwZulJieblA50+mJbJiZw6zypUCgLS2UQjP+J3hbfIWBgm8er+WRU1xKfWR
         XPWOA9PRJxAr7MPSI4p7v5HMoNF99uUYN89V3pZmMWAy8AspJgD6mgn8qz8/VfXsST2D
         oFgnazWAtnwcdzQqEzatrm5+Dr7pwCq13EPTcgOJhTsTZrGAOAlwBWfndwH3gXfxBU5h
         G1fg==
X-Gm-Message-State: AOJu0YzenC2oU9lPbz1/pgXDyNnU1Jl6bAob8f4XxdqMKgbWZkZXgN9U
	L5XQ2mmF34tcEft4bg/OSqyfiw==
X-Google-Smtp-Source: AGHT+IEa9D6UEg8Kim6Z9RKpbqTF6yPxbwX33SKhKAYQuYTwCSxIBRvJ5CVQJEe4sosIQ6eGaegeiA==
X-Received: by 2002:a05:600c:b41:b0:405:499a:7fc1 with SMTP id k1-20020a05600c0b4100b00405499a7fc1mr6767148wmr.40.1696574601638;
        Thu, 05 Oct 2023 23:43:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y24-20020a7bcd98000000b004064741f855sm3002073wmj.47.2023.10.05.23.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 23:43:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: olivia@selenic.com, herbert@gondor.apana.org.au, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, conor@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, f.fainelli@gmail.com, 
 hkallweit1@gmail.com, lists@kaiser.cx, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Romanov <avromanov@salutedevices.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-crypto@vger.kernel.org, kernel@sberdevices.ru
In-Reply-To: <20230929102942.67985-1-avromanov@salutedevices.com>
References: <20230929102942.67985-1-avromanov@salutedevices.com>
Subject: Re: [PATCH v5 0/3] Meson S4 HW RNG Support
Message-Id: <169657460045.2128575.14990345978498318753.b4-ty@linaro.org>
Date: Fri, 06 Oct 2023 08:43:20 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_234324_248901_E6DD1A3E 
X-CRM114-Status: GOOD (  11.19  )
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

On Fri, 29 Sep 2023 13:29:35 +0300, Alexey Romanov wrote:
> This patch series adds hwrng support for Amlogic S4-series.
> Now, S4 uses a new random number generation algorithm.
> This changes implemnents new algo and also adds description
> to meson-s4.dtsi.
> 
> V2:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/3] drivers: rng: meson: add support for S4
      (no commit info)
[2/3] dt-bindings: rng: meson: add meson-rng-s4 compatible
      (no commit info)
[3/3] arch/arm64: dts: meson-s4: add hwrng node
      https://git.kernel.org/amlogic/c/1e3dbe8006247386592a2fdce3a52cca15625997

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
