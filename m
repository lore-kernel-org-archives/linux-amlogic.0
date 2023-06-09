Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B19C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jun 2023 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPI1NbiHXH0dQjmPXLrc7tHSC/bH1Dbd5llq0VVE3AQ=; b=GABhGk19lAy2tF
	1YupeC5pLvMIKxlFB3BeH2bINng5lNmzuCySP0qWKKpNVO2XS78lpqJ/yrG/tI52pUaFO3yGhqVZ5
	m3BTGLk+SsyplcAvmHTLCTV9c/FdVHR26hET2Z07BbWaCt2NBa8F6hspMhjxQwRf4pbY8wkr9Ec+7
	UygRqrZ78UDH5+nvaArY9stqO1quhuKO5In3gOWodd4mLWNAywbvMHJ4SoBdXkavwYqGhDfK4AN5m
	YdjhA4s3Kks+gRSpQp+R6X8RKtad+dfAH3NJxJNdQg+5yEzwpnIpVU67ccMcerx+KoZUmlp48q+vP
	FtxEDsFyZqZLapiyggtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XJ1-00CCBF-1p;
	Fri, 09 Jun 2023 08:17:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XIx-00CC7i-0x
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jun 2023 08:17:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f7ff69824dso8119165e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jun 2023 01:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686298611; x=1688890611;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYuIhDGuCC9opvLWfytZKMbJoZ2C+T9RI7zl7IlZO1c=;
        b=L9Xw798jWqySjeSyCuN5WLGzZGM9mHf+L552ShJwvBJ3gecpRLasnxziivFuYJplRt
         bzRi4gxZy7IPyiByAoLuPMBmo7moZjTwli8i8gqz51Dpw+zI/2H0lMDsPm/oX8G4F41U
         nGuQsHbcGP+bRfEwv+m94GcXPA8dmCt+dM+rVbyzINgUFk/T9woZNh2xw9h7qj/rjSTx
         eA/IEMOhycMhR/czG5F1IpVAMCWeprDeM9aD0UMTRlRxqNqm1CokZAnff/cu6m0zsxIJ
         mVImESXWghJChwP1VeDjoQ8piIOqyy0IvFSKDCLv8D5nqERgn5oDkrUSnE78bAjKFuFh
         MunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298611; x=1688890611;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYuIhDGuCC9opvLWfytZKMbJoZ2C+T9RI7zl7IlZO1c=;
        b=UAX8ALr43RanEXLuaY0Eiv0280UgDjY2NTEO0iYfdV53rO8xLxlZLcQKRt5G1vdb1E
         gE9TF44jqvZ98+SBxEjzTdkgM2qlRNrIr/3PQkCUdau3q7+uPRXnxBG1mA72BzOQM9Nd
         dGv2wkX/GkKvu+LnRy+tSr04pISWS5IaqMTbkF/C7a5o7n0fU3xpVNYLMBkLwJj1bFNC
         uKyuIzs2U2XWIlBZYkplUKnWgcPkQXcFQFSwvmvmJMnMxj07ESu0iIJaCgGx3HPkB7pR
         YoZ2QscdD+AQh3mabwscbb+XXUCrkJ8xdg/VHFLXDZySgDs6oYTWvhg3cQ5KhtCDmZAH
         N6dg==
X-Gm-Message-State: AC+VfDzN/U8VcwRnQgYEsfPLArRqPMYKSemiKtIiQ/Q2ZsSMSCCkcSLH
	qsUR9QvMsWb5CQRxbDl2OfevsQ==
X-Google-Smtp-Source: ACHHUZ5MaRYmFgAgHsM4aSp6otcol5L86L1080ihDuGUjqwqVtjgtl5fPm6KgfpUfbk92208u9+K2A==
X-Received: by 2002:a1c:4b16:0:b0:3f4:2158:28a0 with SMTP id y22-20020a1c4b16000000b003f4215828a0mr916471wma.12.1686298611256;
        Fri, 09 Jun 2023 01:16:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m6-20020adfdc46000000b0030e5bd253aasm3768435wrj.39.2023.06.09.01.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:16:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20230515093237.2203171-1-xianwei.zhao@amlogic.com>
References: <20230515093237.2203171-1-xianwei.zhao@amlogic.com>
Subject: Re: [PATCH V5] arm64: dts: add support for C3 based Amlogic AW409
Message-Id: <168629861051.1192110.13312431547309473090.b4-ty@linaro.org>
Date: Fri, 09 Jun 2023 10:16:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_011707_361038_62F14FF5 
X-CRM114-Status: GOOD (  11.68  )
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

On Mon, 15 May 2023 17:32:37 +0800, Xianwei Zhao wrote:
> Amlogic C3 is an advanced edge AI processor designed for smart IP camera
> applications.
> 
> Add basic support for the C3 based Amlogic AW409 board, which describes
> the following components: CPU, GIC, IRQ, Timer, UART. It's capable of
> booting up into the serial console.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.5/arm64-dt)

[1/1] arm64: dts: add support for C3 based Amlogic AW409
      https://git.kernel.org/amlogic/c/02310be6f080071e1b9e2021fd6dd655bd842aad

These changes has been applied on the intermediate git tree [1].

The v6.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
