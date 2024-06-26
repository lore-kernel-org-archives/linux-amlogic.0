Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486C0C30659
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2024 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM2u4+lC7F8quIiEKC6a21gta/N2Poo6TQQwEMtMSFA=; b=mtSH/emj5UzM4R
	16kGNS0SUhpHpWiKfTUxXb/N4L344vabUNvEpmlK6WfxH/FS5SgdfOoA3tj2SMDgrspQkWpYwhRIQ
	ruBXfckT+nK4IxhAI/56XcZ9dfNC/tCedAxSrOMQig6N2NKQmGYC62I44a+u5I4uLdH63uE9thNJb
	rhkvt3sIV2gNeUmXUUZsj/3zUr1EFq3z6eVsf6bJxeDc34xbRFyj2Uxa97czq8IAHgJsNgfjH6zFf
	JWKmoV6tMN/lauPW3DcRc9M+XPQXog9QzSvA6tRpNRTCafHDhs2JnIRWGqez4xVvhMdbmZUEkCnZn
	3AzWcFg+0XDMJdhTHFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN8x-00000005klx-1dZt;
	Wed, 26 Jun 2024 07:32:40 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN8u-00000005kkd-19kS
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jun 2024 07:32:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-36703b0f914so156755f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2024 00:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719387154; x=1719991954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWdwFGLisZTjIZj5f6mqYa4O5wFiRQ0vmR5lx8cA8wI=;
        b=Umqc9FfrCz+Kx7qeAFrHecCmN8XFHOjMqseHWH47yN7UfjXXGZ7s6xcsX2WzOCe2Qh
         BdOd6hflCFCvCOEUiQVNP2mIZhy0zaGTJSY+L/jPpibxakr5fo8qdJvM/bWXaKd2CGya
         DLeE769MeWUxTAbPCiDJ3oNeRc3i6iBkqHVF+dzNqedDH9N0OhS/oDqyVFn/tED1HNYv
         bAf/+M9mRiuQx8H8vgr0lZMufGGv5K9LZHqm+GNsyjyilnKOlMQN1F/218PPbmi2/lQg
         DswJ2QO23vWH2g/TLBo/4YN8AO1XXtaFw0vtmfV7LS5eOsTgYc/Mkh19YhsAJxN1sz3S
         5LcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719387154; x=1719991954;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWdwFGLisZTjIZj5f6mqYa4O5wFiRQ0vmR5lx8cA8wI=;
        b=RLmO3nAMtEV49srjXqQMpw3Ndt2297XZEYp6irG7HxAIj76ncLRq6rUDIVIyU9RkKp
         be1fXzRbpssludaz2sKw9SHuVQWnO4xY3Nd6MRfxnDBSIdHmmP0ibGNNao09FGix1ni5
         sJB362ztYI3VRlvnRgdYReyIj6hKPrRQqLqFosscZ3znY1IKywqRULBUaqslNJiokTDV
         RjPv0WqsrFoMt8EjqJyUL1MKQTZkQI3QM7vfc86q7tLewRKpcMt+/ZhE8yyFnKtw3xB/
         ClvOy6lR5WcSFYtdCrUChmxjkcYA1xaaQGS2Lg4UHF7qu0jOBY5V/kbkaCDPuJVJHvsU
         BbGg==
X-Forwarded-Encrypted: i=1; AJvYcCVohs/43W41k66l5JuX3G5s0I6z5DFLwnhJeGFyX3s25iBXivKZGlHgBRQRc38gGrUlqDLCbp+HH0L3OfH5rvUD9lUR/ulV4wUXJ/beWB7izpY=
X-Gm-Message-State: AOJu0YwsXBkK1X0y2ZfFHCsZnqR4e6doReyipIZtuuEsPTYjlsug98yy
	3r0lCBF9/zcTCGdMOB/zXy6GNlVcAHwWGn6jwLileZoBO4lP28J4CNlH37VrZvY=
X-Google-Smtp-Source: AGHT+IGJuKO4xRdWJJ6w9hrgqcoyAjnmhy1mlVONlk9q3lHadUvykbc5FStD6K1tQLlvYfQE0ICfmg==
X-Received: by 2002:adf:e410:0:b0:366:ed80:d054 with SMTP id ffacd0b85a97d-366ed80d15bmr7224161f8f.10.1719387153638;
        Wed, 26 Jun 2024 00:32:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8f07sm14962150f8f.110.2024.06.26.00.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:32:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240625111845.928192-1-jbrunet@baylibre.com>
References: <20240625111845.928192-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1: fix spdif compatibles
Message-Id: <171938715287.1644768.879633042309393465.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 09:32:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_003236_429295_5B2A9A0C 
X-CRM114-Status: GOOD (  10.56  )
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

On Tue, 25 Jun 2024 13:18:43 +0200, Jerome Brunet wrote:
> The spdif input and output of g12 and sm1 are compatible but
> sm1 should use the related compatible since it exists.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/1] arm64: dts: amlogic: sm1: fix spdif compatibles
      https://git.kernel.org/amlogic/c/b0aba467c329a89e8b325eda0cf60776958353fe

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
