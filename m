Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BB2D2F7FC
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2024 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLug84M637fwGC9shxpfCPCH1Z0IWAm0x0Dnw1ebJF8=; b=wTf8Y2HugX2GZ4
	hR1QVEVh50JIqfaLWO5XQjzZvx5FO9ufrrSJ8LVi1UQunjmkJ3m+us2ylamtfxHLXNElD49hvYSBU
	GMvxI8Jhj4l/xcYeU6qbpzMteGu6uiuDOzwsatyEq61N6ySM8rxs4bHAUlaXyw2qcoRM7hYqQ8QIS
	Ov2WxrVln1aT6zC090j9ElI3mZ4SebgWyfiI2irc+WpUWQ5eHuoRYqnIjgd0Kga7zekCxysUZbifA
	MbZXeUgDAf6BlQkfnT9InMm+EatOcrOXFSIGYFDSPTEikGUEu2QN/eXfp6XMCY135KJzaSJeen1HR
	meXV3Znv6pwehoSLd5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LnL-0000000EAXS-05dE;
	Thu, 17 Oct 2024 08:23:43 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Llo-0000000EAGb-2jeC
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Oct 2024 08:22:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so405962f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Oct 2024 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729153326; x=1729758126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+o161Gg5qEIBbD/Irkt8zZ7lwsNP+yatDJyy3MG9Sw=;
        b=rhMYj95GGg0WS1NCzHAknbkZ1ieWQRP+/TqK1YmMOtbbNGPQnk3oXVRqseItor8/em
         8+0rh3Vh3EFG8t6DGgYJXJJjGuac1G7yNVRwte1fElDLL9kHWM0yejrknPejQIR1V91E
         HQdUFOGWclY9lTiLn3p42RF/6lptzStbTFXcYJOpoOzzc9oVf8DHP++J1TP56nmtkXf9
         PIRBM91eOhIg8YNlh13oHPxxwt330gV2dAsxoZysLzCfm1bWXUYVTcK31vLZ0FZxbtOs
         d9yT23h0PnIaOQ45C8naQBE5K6eWU9mMc45SCC++fI1pTR1L0k7kb2LzwaNpPZ/rAOh2
         vzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729153326; x=1729758126;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+o161Gg5qEIBbD/Irkt8zZ7lwsNP+yatDJyy3MG9Sw=;
        b=ocEJaR1yttOr4Z0IZZ/LSfm3RpMOljBhMK4uRoZBvJY3Mm0ujBZsh+//SQdzW9j/BO
         HyWAeOyfY/a+MVg9EjBFWmbQ6kFd4h/P3otkyAPyRiPvkk67ranJ4MfIdbbG2XfybWCC
         TKDkF0cz58Y28DT7p2IYjoTiJf8axRRfC9ZQ5HWdkLpI7C3RZN9mALwQHAwZVpIOsI9Y
         brnRYYcp33ed59SpMBOC/3/ymvyCDBIfQA0KQX+etp40XFqBp0xVndJeYGD53x9/5ZOl
         d5z/dE+xPhn3vxgVM/+ujJTyqt2RK0RYKh4XQnzlLNDoI9rTLAyRCP3AgQn2sS2Fi4/x
         mGzw==
X-Forwarded-Encrypted: i=1; AJvYcCUxIAK2LYba4LGsp2SmbpP0Cl2ZiJfvBHgFirTn8jkKPnufCFNm/zsUDBMSaqWZt3RBqjoD0hENdl+jwdCG@lists.infradead.org
X-Gm-Message-State: AOJu0YzUSDJgoZdD/ToICZKQwXe00JUbvT5bvh7ZBAD90mlqqzAwm7wt
	ZXAen+nAObKUYHl/swkPUqfUQEaHoGyjXu4KykcdDRbToAyTb7UBOoL23YigOKI=
X-Google-Smtp-Source: AGHT+IHtsgU6ukQtSJeOkmPtLxn9d1+7JFeyM7WZp79bJmJ9dLCMy+8OJEeHqNpJw8LWr8LrqN9mng==
X-Received: by 2002:a05:6000:118c:b0:37d:2ceb:ef92 with SMTP id ffacd0b85a97d-37d5fedbb12mr12179177f8f.27.1729153326514;
        Thu, 17 Oct 2024 01:22:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fbf8567sm6511645f8f.76.2024.10.17.01.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 01:22:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241015-topic-amlogic-arm32-upstream-bindings-fixes-pinctrl-dtbs-v1-1-c7291f17063e@linaro.org>
References: <20241015-topic-amlogic-arm32-upstream-bindings-fixes-pinctrl-dtbs-v1-1-c7291f17063e@linaro.org>
Subject: Re: [PATCH] ARM: dts: amlogic: meson8/8b: remove invalid pinctrl
 reg
Message-Id: <172915332568.1203867.12350138706735239328.b4-ty@linaro.org>
Date: Thu, 17 Oct 2024 10:22:05 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_012209_249555_0DF8AF93 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, 15 Oct 2024 14:25:19 +0200, Neil Armstrong wrote:
> The pinctrl aobus/cbus was originally here to configure the
> GPIO interrupt, but it was a bad design and was moved to a
> separate gpio_intc node because the GPIO interrupt is actually
> separate from the pinctrl/gpio registers.
> 
> Drop this reg entry, and fix all the register offsets with a
> proper range property.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.13/arm-dt)

[1/1] ARM: dts: amlogic: meson8/8b: remove invalid pinctrl reg
      https://git.kernel.org/amlogic/c/2b901e9ef05d84e99582607e85393a6eba0e2363

These changes has been applied on the intermediate git tree [1].

The v6.13/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
