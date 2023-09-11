Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD3BEE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZNflzRqhnVFz+SKdwwbhQA2vthVcLGaz3q0k7GTwRLk=; b=FGs4AfJ8I4A04E
	OrqQbnNtpEzgWHjvzgcQjZyyh1PCku0YntANc0cevrA9pS7pWZsH1XCWBYmRSOIp4DyuhO1Bf1GYA
	5h8yjaSF2WA8nMAn6xU6nHIf2NvCsvBdmvwW05xyM+KgAHLd5B2dDAvDAciHGboMgYPhZ5JYdLBEA
	Wb6/kC4z291orTOhnIf+WZ6UTaVCB//JlNBi7YMg0qobaFDsL0L6Ur+e72r1y7bkxC5wcbhL6kx2p
	FAYZa7Y4x1790G8DnWPhdvInU92O2BNGc66Him2BOALoYu9Gnni3VTobm4JAWX46uyHy599hDOoi6
	mXWSvXyuDxn/HXYwAc5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdV0-0002js-0B;
	Mon, 11 Sep 2023 09:46:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdUv-0002iH-1f
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 09:46:27 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bcfdadd149so73513571fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 02:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425582; x=1695030382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji7cbXQJKuEo0ewL5BwKdD6+HJSRYy2wv9gMLGPlepA=;
        b=j7l33D/e7IP2/pjH38+3we+vVu7LyIJ6cXO1EtUZd/IAZQdwmBto/mCwQvx+ADpaPQ
         vYPy1mnekL08tPGxyxiDxTMbRKjdSvEIRfwkHwpCf/BkKy2WIW6PqBrularV5tLwF9Mq
         /Eg8oYMZ8VA9zy18HZmaIFEVuefpLMYiV+wsLEBa6VT4Q6fKRSIrN6MO5iqLZJO8LgMR
         /NpHIFbdAN22enRIE8tVvKKNRnsmcMK8+11+h/Id+ZThLGuabHzTizrN0iFEVg25sngw
         c4uWBURNsGTP37DX0AMPdP40W99d/qVWb2l3S+dYnOCBBYf5lN/6EiXjlY9NMMboNJ+s
         kT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425582; x=1695030382;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji7cbXQJKuEo0ewL5BwKdD6+HJSRYy2wv9gMLGPlepA=;
        b=EEKHTWJJiJuaXq7c6O3CG8Fl1NvUuiOaIesQZnxknlC7IhjLsMygJTyb2LPmCfMh3x
         UJgEUN2E2YWxoFVNxllVSs+Od6oZEDDTpjgq04Vh3HRYsIDBKIx36DYK3oL2yuZ5d0io
         vsQva4xR+qhiMMhHngRrYrU0f4+Na/9gXESFfSELvTpfGM5mET+GBk2GnU5ubQW87tqB
         dsgZVDprzhw4fi3F41NzOpqN0MMyvtBwfdn8cykscGvIjxkQwxhDt3n9tVlCZXt12q+y
         FIkZl2abR8K6fParSxXjFwAWoVmskH2NNZ3JjqGGCiCXCMff85goOeVd+amGDuGtUmH9
         X/jw==
X-Gm-Message-State: AOJu0Yx7RMHkvd0oydGWF/6sUw/IpsMQOXUEPc1AmwsEJaJkXvB0BjU2
	3YgX99oJJnjGpr4GXbaVurGa+A==
X-Google-Smtp-Source: AGHT+IGlNxjxG0h9WOgUYfP5hWmxCEiaQjt2o82oL1F/nht9wLOL5kF0/RgyR87mixTRPaq/opAWQw==
X-Received: by 2002:a05:6512:ba9:b0:500:a3be:1ab6 with SMTP id b41-20020a0565120ba900b00500a3be1ab6mr9050406lfv.6.1694425581969;
        Mon, 11 Sep 2023 02:46:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p23-20020a05600c205700b003fe1fe56202sm9439659wmg.33.2023.09.11.02.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, miles.chen@mediatek.com, 
 martin.blumenstingl@googlemail.com, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Romanov <avromanov@salutedevices.com>
Cc: kernel@sberdevices.ru, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230830140850.17130-1-avromanov@salutedevices.com>
References: <20230830140850.17130-1-avromanov@salutedevices.com>
Subject: Re: [PATCH v1] drivers: meson: sm: correct meson_sm_* API retval
 handling
Message-Id: <169442558108.3235284.15250808268493542664.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 11:46:21 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024625_558614_B1E6383C 
X-CRM114-Status: GOOD (  13.76  )
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

On Wed, 30 Aug 2023 17:08:50 +0300, Alexey Romanov wrote:
> 1. Following the ARM SMC32 calling convention, the return value
> from secure monitor is a 32-bit signed integer. This patch changes
> the type of the return value of the function meson_sm_call().
> 
> 2. Now, when meson_sm_call() returns a 32-bit signed integer, we need
> to ensure that this value is not negative. It is important to check
> that the return value is not negative in both the meson_sm_call_read()
> and meson_sm_call_write() functions.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/drivers)

[1/1] drivers: meson: sm: correct meson_sm_* API retval handling
      https://git.kernel.org/amlogic/c/0d423c4a78984dd02f6596d6fd9dd40446eec517

These changes has been applied on the intermediate git tree [1].

The v6.7/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
