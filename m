Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07113106F30A
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRcGKwfTlSMeDSRbi1UrTy398wvtYjCTcQXm9E3ZtwI=; b=IHznzX2qyhy05K
	C2QbfHJ5CHiUhJrEXeLa6LUmAia0X2Ipo2qtSioUO6lvEYD0INrQNHCvo+uNxwwMl4BJ8ny27/x2H
	awtIMpwcpWai09/Icejye9oxEv/8wXGFm2/hCzWfbGLflPs4yGSr/y8o4qiIOW4ozdYLkfppr+mIh
	XJyqz8GiBHvFG7jsXMkYNN0jJTOP5vqET27N16oWiTJdsQ89AbNfvrf2zXzfzaMOMSt6AYSPOF7Am
	C5yVRLg1f5p5h7O6l7+aYYo+MHjz5WMG3oiz4IGdB/NbUdStMhs+lUDQL/KHus0CZIqeow0jXybA+
	sL2QYNYctIRc+2Fj7NUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gg6-000000056NX-0PbN;
	Thu, 26 Mar 2026 09:06:58 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gfo-000000056E8-0kPQ
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 09:06:41 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so6753655e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 02:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515998; x=1775120798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=;
        b=CnIgaWE+J7fNGrlsv+V8jheWGrUZ5ekhNviPRLUEjfEUyCTOXbOaQlAiR1pP0HLWbP
         AAQVOrvMi/5C87z1FdISKlquG8e+LDrWspihtArSvd/JLVXbxMF7P7dsdDvrRt409lq6
         suyADLNLFRPUZkaYTSbMkdoBLgZgtP6rgrGAHH/mDNkGR6eiye9D9LY7Kgx1RnsvIT+3
         gLkwE15bOoLUJ0p/H/UzQNI8KhfJnp7wjcd4L7JE5OW4IDN0LHnxZQiZbM06/xT9w5Nj
         k4Ph6sLaxD+hJCm9Of1L+OnbMyfCuJsbsY7wW+uVGcb6Z4YUCZAsh25rFoz/3lt0p8gm
         Cu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515998; x=1775120798;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2cSFou4RAM9jBcIrdaxJY8v5ZGpuFyXZx62301CfC+w=;
        b=Qnzob7YKCPqpvQSuerGyYNBAaum1TS1DKv8G4ejG9XDh49Xc/LwwijPk1X0BeDAjQa
         ACFch5XO5JLv83yf96o9rWBlJ8LucvDU79aQGp4+3dM/iyZoLMEaoNkTjq5/NF5dc+VG
         dpTa02xrEOaLmeZWlIUmOKbiK3SohvzMlvnM3wSi4/LR41JWvtyKY1MHTB+0dzJY6rml
         XRnCUVd7wSV5p8dvnKixHBfNA9t19BHNZlGuPydDf5LrVTX66xQt722o0ZwmjKloAt78
         gan2hu5GmOhVtc0N1/BNpUdgjPTVGo1WIBYky42aufU98DUknabGLiiRsy/6RhppNW90
         iZwg==
X-Forwarded-Encrypted: i=1; AJvYcCUKrc5cBveRwl6EJhpncfMztNQI7O9CBoQuXFG69s+Rv9y1/gH/KPplTvhwJ7PBL16zGzlCqd3fH1QEbCxM@lists.infradead.org
X-Gm-Message-State: AOJu0YxyKfIgqjYNBvfQfe2dYS1GMvo9N8hpPIt6mYphcPoclqkEaasp
	eV08OO7nKLyKZw4eV4oXP/rJM0UnVqO2QgmSex0D0CWDyh02qzabmpkBHZx5wwghYc4=
X-Gm-Gg: ATEYQzzLzUJPs6wcQEkbEyr5fISVugzj3dOqnfJIMq74mfoKGJOBkWHuPuB2uKoKC3u
	Os0raCnmO8J5uUGF9yIfkzaTbpvtDdVT/EuZD/kHJspHvK7sbIZt3bP93PfhhEckzQmB/SI4Ued
	eaf2b0wm5QDK/guZ4SqWsiknKCSo15GeJA9ULJQPTTK7iz0c0ajnqySA6jyK/eaRRjp9b0kWIUG
	b0kaOjJfu1MAvhbIwjZrSlig/ED/NCBZzAg8d1Z63FAqjANK3JNa1B15Lhvec6flyW0IBpGb2wc
	8IzGTmNIzxqtQ0jmBBtbdYlZ/YyIra/JNU1zH+5LlDaU+QOwwXXN6nzHnct8ERuUt/D12tpxGZZ
	mQeBY0cBaGvcZdwsp9F/vImc0Zu9V8Gt2O3dXFFEkx8lIH4RUI0MMx5roOrbIePJyjKNkvc4aIT
	fvUWYK7FVZFoEdsugaQaMPAeUeNb6RCDCVEl3Pj6nNyme8
X-Received: by 2002:a05:600c:154b:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-487243fdc55mr572145e9.6.1774515997897;
        Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872090368dsm14726905e9.5.2026.03.26.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:06:37 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20260219103548.18392-1-linux.amoon@gmail.com>
References: <20260219103548.18392-1-linux.amoon@gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-axg: Add missing cache
 information to cpu0
Message-Id: <177451599694.122020.11374125029762505205.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:06:36 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_020640_228948_C311FEC9 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, 19 Feb 2026 16:05:46 +0530, Anand Moon wrote:
> Add missing L1 data and instruction cache parameters to the CPU node 0
> for the Cortex-A53 caches on the Meson AXG SoC.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/1] arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0
      https://git.kernel.org/amlogic/c/e28f4b18c134f944b0ae93ebf1bacc8e517fdcf5

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
