Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AFDC001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuD1LTxrhmn7sDpydRwOzvvHIqjWwReyoQZbSNNDVsY=; b=p8cvR11haJXVOV
	lhEJV0Uu9wdcuc88ITmNdLqDAMNp1gaJ3TUz+Gi3wLFrsCJS/ZkypE6XWmjjEPOxrccer3uQmRV6U
	n8YJAXklTudHY2Pcq61who9cMFoMKwvkATFfx+juotwcVliD9kXZwOajbkY3uoEEhZoet3lRhlsuc
	9itPkI4xhFn13QgVPetYJDOPrDGSOdtzaH94EWfaP8ZMN00nBo29+B9TF+U4N2fx8Xh21DhhJ1JOQ
	SNE5EZb6FyqKzBAK/xVKk+qjNCiRJbQ8cbdJsNZOMo4knJdkzE8mxAhSzWcjaOCi0FVJbfoJbk7cI
	7Gw4UcS4OhA4I4eUZ/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPbd-00EqEx-1m;
	Mon, 31 Jul 2023 09:54:25 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPbX-00EqDW-2y
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:54:21 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b74fa5e7d7so62581511fa.2
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797256; x=1691402056;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxvMJvHLwBTrnKLZye8TDFSPJgpR7pa1aGrAgRySAk4=;
        b=rtxydgC1gFkvb5mqPWXFSGiFQRPsbQ0ZaibVcnD1NSUYqfMl0IbHDE0rCfdx3TSuyc
         4M1Z5QR+NtQATWMNhrJNKlnjdWRI4M7goXuhgKl+R00xg9rpExLyylcY8A7BSj3eoPHZ
         POI7qCIIzpTRxbdyu4uJ/jxh/lwh9R7B47azI8gKpNUh5Kr5s3PRNCBNVVAxd/Q0Rpbs
         tGnuL55lb6MdiLk8YfpzRgboQXBgiXSGCnE1WTB2nYGjyC81FTX8eqwAowB7h5FfJzKQ
         Oer64uWIj27ehrTEWAOB0u8KMCF05uQXQGLfPAXY87TF38kdnSPB2iMH5A0+XBbklU8m
         rZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797256; x=1691402056;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxvMJvHLwBTrnKLZye8TDFSPJgpR7pa1aGrAgRySAk4=;
        b=ZPszY3erj7nvgSgVguB4IX27MJLMdIfBU2L65FKzS/Xy3su5tZK0IytRotPKnzZHIM
         1mQJlegajdkepHAJdBi0C10CN6SY8ccDMdphR1k13f/ktRB/0OJqH1OfEpECsy8OoQl9
         sCDPi9hGbh/qqq73SPmnxLeD4Qi9GFkuYy1CVBhw9DXi9Svdc0crPAPy0qVfgxLTmw24
         RapnCZhqFmgdpEY95JfOuV7zE1cO2t8vNnrrS3UWF6Yj3bESgKd1qM7jkr+aMNJySAjs
         aNuTk4+tDSuYszHt8FmqshYPkIZ61aDHTf9VCa9gNa8WthI4FKLAQLvXcdyuHQBrj0kz
         WwcA==
X-Gm-Message-State: ABy/qLbGjHdmHu7hoz5DZ9zwYPqwURAqJKyeLwq/UJ+9mf7bMx9covWs
	lJn33cyRIJba+1QWHYLgN8dxPg==
X-Google-Smtp-Source: APBJJlE7wQhXoweE/t+BJZjOJ+eAu06Zax8HzFnpro0zdCZ7/Ym8zCBK2Y/a+Ib5XLFFPG0rO8fENw==
X-Received: by 2002:a2e:9a82:0:b0:2b6:da88:a2d0 with SMTP id p2-20020a2e9a82000000b002b6da88a2d0mr6613063lji.47.1690797255881;
        Mon, 31 Jul 2023 02:54:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id h17-20020adffd51000000b0031455482d1fsm12543726wrs.47.2023.07.31.02.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:54:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
In-Reply-To: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
Subject: Re: (subset) [PATCH V2 0/4] Power: C3: add power domain driver
Message-Id: <169079725498.195351.12929338822608058749.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:54:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_025419_954915_DB1A1AB2 
X-CRM114-Status: GOOD (  12.52  )
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

On Fri, 07 Jul 2023 08:37:06 +0800, Xianwei Zhao wrote:
> First patch is that Use 'name' instead of 'index' as criterion.
> The  variate 'index' could be equal to zero in some SoCs. Such as C3 SoC,
> PWRC_C3_NNA_ID be defined zero.
> 
> Other patchs adds power controller driver support for Amlogic C3 SoC.
> The power domains registers can be accessed in the secure world only.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/drivers-genpd)

[1/4] soc: amlogic: use name instead of index as criterion
      https://git.kernel.org/amlogic/c/fadf18180022743ff74b1f6ca4f3cff462ddaddb
[2/4] dt-bindings: power: add Amlogic C3 power domains
      https://git.kernel.org/amlogic/c/83b03d62939c46c118a8d722f07ae03a87967b00
[3/4] soc: c3: Add support for power domains controller
      https://git.kernel.org/amlogic/c/77e2f4e3cbd5cde442d05a7bdb6cd01565bead6d

These changes has been applied on the intermediate git tree [1].

The v6.6/drivers-genpd branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
