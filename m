Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9671DC27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oPck38rSLOOPt8IWlT1+Yndb3sXMiYbjF9uyyEu3JVs=; b=fqa9a466MTkWZ8
	LvlgCXTbWTJS1sWG7PegD/cItILUu7Nfg+p27+hRot6RRBPJs1tzhf9xPbDkbmqugy25FmkDZxYCl
	H8z8IgJZWdMhoZxg6FDmPjJ0q3amktl7pyGXHYPlyt/nXgAIu35Rs43Ds6Z8HVC4qNOIh0UJPDogS
	QpK1u1UtD4bRxgbM8hWD5U6a1dM9s+vQAp/tMCeE7oKwIrQzaNyhnK/WhIVOxzRbTfWwIAKmEUEp0
	2Hd3YgiYquHUpB1hYTQbux3bL87tXjgvZtfhlQESS3V+55ZHMT9Z1iIWGTtIhmjwpqq+TJCe4+eEs
	CRAHwDkUZaa87huxhUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Jh-000000096ZY-1qRQ;
	Thu, 06 Jun 2024 09:21:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9Jb-000000096Te-0MKi
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 09:21:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4215c65dca2so5062625e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665705; x=1718270505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IamIVnH7h3ptzY7s1SJQ3/raS/vygxAsXmJzN5Us3c=;
        b=Mammi7Kt4IdEeayQxojoIg9M8fRq31Dqm00DaHy/rGOJJ7upY0f+LLeuUkjv/7nuN7
         SCqX3BdQcRtRJKcHt0mKTSphtiHYJWPLX7B+rRAJpEEGolrbohKVKkxpm8n+a4rAK9v4
         dOf0TuTr6hOMP/T04vRs0OwNRQNHCQMurqnxx3DScaiVacM3v9hrneRWqWUiMsmcm9dM
         A6cjqYGOe1Cp03zoCli/k4pTg8bq+SNBg6vHp3eHZqcXO+z+hupsDTntcARRoMF8IhZE
         bdvcSbUqt4pvl2yHlnOb7w8ADIItf0HvacX251mE8ZIHSGpiXuS+gGja9kW4wJeZxlpF
         Uy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665705; x=1718270505;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IamIVnH7h3ptzY7s1SJQ3/raS/vygxAsXmJzN5Us3c=;
        b=l5Us+mH+ZnV28wCaou+ApQDZh2yCHvIFtkHqLfUc3joTLdm2viYQFdyBHrg5OEdYkp
         0AaJyUD6dZb9Php9G6hXUt5XJ8mw6CfMf7Vz/4C5FrWE2SbueaAWeMrIsLBxpA3vMBID
         5pmQyRCmtPWysqJxYlR506P/QJEUofdXo6zKVowStL3BmQ7YPeztVwjj1TgZXmmFbYkY
         5sNB97D1+49vDmTP7jjp70hYdajG3jq5u1bW2HNckxvAyPP7Yzq7aReN/wEcM9IqL1iZ
         mgARv2Q5KVUKTQBvH2IEs8USQBDii4xbmuXjRfc00dAmBpfsZDfWdMVI+s+U8UVCCssd
         b6pw==
X-Forwarded-Encrypted: i=1; AJvYcCUu7bQIkY7rqWjMFBt3jjtIkXAGFauN75pAbN1KgPUFO/ODKjyx/LKW5ntPqkt/TQusztzQuGnBGLxGdSNfyGwkbYCdX8zjwAPzWas2ekOYOR0=
X-Gm-Message-State: AOJu0Yx3FyZYUacA6bxrSjztH0utr9298FBGDfBptTsN/R1XmxezajQX
	D2EWSI+kdstaBBg8Zjtq+hH45l2yNA+DnILVPC5ieO74U6HPaK5yi9AJLNSZgls=
X-Google-Smtp-Source: AGHT+IEwTtsEYTmIGHFyaEV/Mt03vYK3X47FVxjZeEawQNkUUPRQKYSrAJkIvTiPl44uc76qhsDGzA==
X-Received: by 2002:a05:600c:a43:b0:41c:8754:8796 with SMTP id 5b1f17b1804b1-4215632e1cfmr43304245e9.30.1717665705057;
        Thu, 06 Jun 2024 02:21:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d4a582sm1033012f8f.35.2024.06.06.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:21:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
References: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
Subject: Re: (subset) [PATCH v2 0/3] Power: A4: add power domain driver
Message-Id: <171766570412.3938980.5083031830854767858.b4-ty@linaro.org>
Date: Thu, 06 Jun 2024 11:21:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_022147_247785_A83E5A85 
X-CRM114-Status: UNSURE (   9.87  )
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

On Wed, 29 May 2024 11:10:32 +0800, Xianwei Zhao wrote:
> Add power controller driver support for Amlogic A4 SoC.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[3/3] arm64: dts: amlogic: a4: add power domain controller node
      https://git.kernel.org/amlogic/c/c830ead0d16131de93d2020369ede4d670a4123b

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
