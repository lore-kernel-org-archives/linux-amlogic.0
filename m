Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF7FEEB580
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 09:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dEgbwpSwDXX1K18JOyhklKt57eoPIO5C+5sDJF2Gjg=; b=NUnlsfdrEkb/fB
	N1Is5lNuSgy3Orz63nj7JPzImWgwvs6gh3FSZDVjNSPicEbe9+1Sgjbmk/lFDKDeUCkTjL/1c1PGW
	9ryO/Gb1vewOGembPzUE3bM10JFNKAxjBtHyzloZ02/FJREkvYipHWtYyFibidZ8foODEVMgb9RDi
	k2EgqP4ofcdxKLCau+QdvUe3B/4Swrr95wZcz2v0ACa6zEUtKn4NxHQ1C9zG8mBWlI/HA3SfIs5Dr
	QHPPjTZxVez0krmWp9ymO8BgDLUJPuZEKBhjBYqpfZws+syIW8zbiqh8J6KfOHvXYc4VM639frUtj
	L2C7XqrOK6Vmjjj4E8Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdVD-0002sh-2H;
	Mon, 11 Sep 2023 09:46:43 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdV5-0002lO-2E
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 09:46:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-403061cdf2bso15611835e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425593; x=1695030393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpfWGrPSBuBG7+U0dwFU/lJOZNNMxd815XPw6Rgs8Vs=;
        b=rAXioFowB3LPFrhR24egHr8U2NLMO8WDCQz1dUdRH0VDutbaH6eNYs4AepQfnWpZMO
         eJTWSo3XNoPiPTJk9f0CAxCCiQech3qSu6yJH527LacZ52SKhqBtOCROOlpyUpWpwUN8
         ud7Y3gOC/XJxQsYHMey99wL8En1KTzV9F/J0sg+wFwylWS19yMbyfmDDxZi2V+MHy5zk
         26i+mHFoJMil5KN/0BhMyn0hJUEjPcVTpr1TQXYfJ1AJsDGgY2ciZ/ZDwPoh0yKUO7jm
         12FbLUxRLeSJ//lmFsA3crda0zWLPDAT9PSePhVeBDNj9DgBUXq9AG5sEeAYIIASuaC0
         T+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425593; x=1695030393;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpfWGrPSBuBG7+U0dwFU/lJOZNNMxd815XPw6Rgs8Vs=;
        b=eE4Njn+UqJchZDPg79hpPvts8ilC5rHqvvAnzwp4PuMKCinUWrovQqggJshFuqK6dA
         5BNofWTlVTaAEEwgSrQ6ZRlNJiqojBxG3wui7MCOYxZI+II48PYfAxTHsTY5NPy/vDn9
         yqiNlzIxP3pp5TnV6+fPRRaRpc4+aszC9cSz1JrIm/nOyn0gnT5+Zb+68pI/XCAE9ApW
         c0A1RytIRQPcQ0hJLehigYDaY46VcKZFY4XIFfssj4SWXaqk3wGMsggHiQfJKMxa5Bd4
         6xUZe9ZIThxBLIfsSXXgMbXMYBKJwSCPf2HbBErdk3+Afcd5G1s7C8BzwiXkeX8hOjdR
         CmCw==
X-Gm-Message-State: AOJu0YxKilf7q+PZYAQyWGjll2qh/sPZju5gJtnMMh8FRGm2JJl1M+Q5
	OYuZcrQuctAsyIKf/rhk6vl29g==
X-Google-Smtp-Source: AGHT+IFB2NUgPRCR1E53L1RZWLMIv4pvvpcenAmQmhAg3oTkQvuSqfR80muGqdBVaRCoXOqcPSinSw==
X-Received: by 2002:adf:b345:0:b0:31f:9838:dfc4 with SMTP id k5-20020adfb345000000b0031f9838dfc4mr3521960wrd.33.1694425592923;
        Mon, 11 Sep 2023 02:46:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d13-20020adff84d000000b00317909f9985sm9503496wrq.113.2023.09.11.02.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
Subject: Re: (subset) [PATCH V2 0/4] Add watchdog support for Amlogic-T7
 SoCs
Message-Id: <169442559190.3235506.16709679651395559880.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 11:46:31 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024635_752514_F96F65A1 
X-CRM114-Status: GOOD (  11.26  )
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

On Wed, 02 Aug 2023 11:32:18 +0800, Huqiang Qin wrote:
> Based on the original Amlogic-GXBB watchdog driver, support
> for Amlogic-T7 watchdog is added.
> 
> [PATCH 1/4]:
>   V1 -> V2: Unchanged.
> 
> [PATCH 2/4]:
>   V1 -> V2: Rename rst_shift to rst and use the BIT() macro
>             to build its initial value.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[4/4] arm64: dts: Add watchdog node for Amlogic-T7 SoCs
      https://git.kernel.org/amlogic/c/8a63d22183d0d96d742e34730430cc1f286c7092

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
