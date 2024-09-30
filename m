Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30B3CF6497
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tn50uoQmlHV6M4/sL+e1ZkX5duZGFX3psDcMXhgvtIY=; b=cYRmeuu+dRBguh
	1GYEHGUMTWY9tQv/nNnTbnBrLl92NIxUmWv7EEA1YJFATfJu59ozRqZYUSE3tRi5l0+n/E5swIoii
	UjhklGqAzk6QuDhGZOOpMFUXWd3miajx8CEFcDthjTnlciRf2RqzyU1SLyKIpJkYQuSRL3WjfR8ZV
	+WhmDl6/J5J4/dBb2dvINulyxqTTZvkQ1dIk48xdseGyebmo7lqh/H+E7U32UjGnLLSQrQtAKH/Ac
	qiU/OP9NQVVuswNk15kZnV1+0/RPKHG7pdRMjlLWhJf3gWfXyGX22edWevKDyh4TIP9hhXUuz62Xr
	8I0Yu9VGlMKG/IdlJDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svAz0-0000000GCV7-3zyT;
	Mon, 30 Sep 2024 07:38:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svAuY-0000000GBjg-3bL1
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 07:33:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so38666065e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 00:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681617; x=1728286417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ge67RKvyAjwxvFyFHbHP8Cjfyu4HRjQ4k8rzGZeOScU=;
        b=U0PqZMpPSS6irbQYAPYkoaUOAJBVTNt1Fg4eu2YWlaeDdmx3LCpmLLZh1kPApQvaRe
         Ab9AxFQsmMe01ZNj1Tt7csnihlAlTnCvQzxZeNcE7Rg1hB0h9fSlwferHwMA+en7g7Xn
         PMDC60IuIH9cxANnpCsCuFC71LUREIYyhy1HXqov/ySnrqAl1eIm/ntdc7mz9QqMyJMj
         o6iN+sbUPNihbacwh9naMg7yMCzH7qz5giJx8jpHFEgxeHe9EaWD2ta4GNeNr/30ZAtV
         SGA8nzDb5U1op2Q7Wi6TZuQd7YmsTzniED20b3yHPT3tCdqD/uIu8gRCsUBOuHkxvqlM
         Jnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681617; x=1728286417;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ge67RKvyAjwxvFyFHbHP8Cjfyu4HRjQ4k8rzGZeOScU=;
        b=piS2oHThSdjtcHapbRUrBdWBLUT8osyvPwWV2a6bhKxUNtH1rXJwvtri+lTP0GIdnM
         t0rupRkECbuuPGzTs+tdXuUm6BqILVngS4cyRmAFjVYugIVmL8aJ5VJ7gxXbP/jqXOFn
         /oIcpVRbMmQvPiJZiyhunDjTZEcPpRHTY0Ad9DCKSiO29A7XdmvOj5Im52ROhLEKqvCL
         +YR0tdqJ5YHn8PXvR82bTrvmS0+hVIusG78xKAKxMq5u4jQnUEN/J3UU/WaQ7J+l+v/K
         +SoEjzLUsrZAvrJzWpp3isrBT3xRWAh9kL+Wu5frj3O+vcL/iJdfmuW6UI7E/sjC2Q/V
         ntUA==
X-Forwarded-Encrypted: i=1; AJvYcCVGNIeH+X0Ook4srYFnebhlHU8v9eSHieByy7+ABJenYFe0tZVGWa7UOp5skrVI1KtxiIE1Mxgc+3YGMZU6@lists.infradead.org
X-Gm-Message-State: AOJu0YyctyFR1DUfLe1wL+CGcxt0o0Hw0eTAu8QzM2d/aIsDIGey3QVm
	2upR3GrRjA7/uMfFwOpeLk1op7iyr70zOkLcgInqhK6lJ+4tOuWRUDd82pD08s9txuAr/BpIs1Q
	v
X-Google-Smtp-Source: AGHT+IEILOGstLLqV+dwL8EFZQMfy9IEnSMRvstj3RzZnzCOZfqZUywgp/v+TiHhIJ5gXhKCMQqgWw==
X-Received: by 2002:a05:600c:1e16:b0:42c:b95c:65b7 with SMTP id 5b1f17b1804b1-42f58437692mr89334255e9.8.1727681616959;
        Mon, 30 Sep 2024 00:33:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e90274aa0sm105673295e9.0.2024.09.30.00.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:33:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, glaroque@baylibre.com, 
 rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
 lukasz.luba@arm.com, b.galvani@gmail.com, mmkurbanov@sberdevices.ru, 
 George Stark <gnstark@salutedevices.com>
Cc: linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@salutedevices.com
In-Reply-To: <20240710223214.2348418-1-gnstark@salutedevices.com>
References: <20240710223214.2348418-1-gnstark@salutedevices.com>
Subject: Re: (subset) [PATCH v2 0/3] amlogic SoC's power-domains fixes
Message-Id: <172768161502.3724702.6653433141402666004.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 09:33:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_003338_947373_1E2F8B42 
X-CRM114-Status: GOOD (  10.97  )
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

On Thu, 11 Jul 2024 01:32:11 +0300, George Stark wrote:
> Here's some fixes to the bindings and device tree related to Amlogic A1 SoC.
> The SoC provides dedicated power domain for for almost all periphery.
> 
> Changes in v2:
>   dt-bindings: spi: amlogic,a1-spifc: make power-domains required
>     - drop the patch
>   dt-bindings: thermal: amlogic,thermal: add optional power-domains
>     - drop required conditional
>     - rewrite commit message
>   dt-bindings: i2c: amlogic,meson6-i2c: add optional power-domains
>     - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
>     - add RvB: Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>   arm64: dts: meson: a1: bind power domain to temperature sensor
>     - add RvB: Neil Armstrong <neil.armstrong@linaro.org>
>   previous version [1]
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.13/arm64-dt)

[3/3] arm64: dts: meson: a1: bind power domain to temperature sensor
      https://git.kernel.org/amlogic/c/7e3b4f56a76b233a70db09ddaa5e822f7cddf371

These changes has been applied on the intermediate git tree [1].

The v6.13/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
