Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 009BEC7EE2F
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Jun 2023 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAEn8UaZP3lDHXVKuVH89Jf/drLMIho5dEj9CQfUhOU=; b=saPtYqnDsEAbQZ
	CAqks6hW17ibjYvv2TZ6/AxvBPhmwlFuzFiEsmGycSFReDaHQyq/Cg1fLNEG906OZRpB8wibh0twK
	aqmQkuUfmyxbq0ukUy+Ezix/LQbXJfdC3t5XFAB/yzYW7bUNv7iPdBzsxJCkAsklfiKDljCyauT9q
	o+4FzJpZK0glSiPk4ZcSEcoWLGEbBeXyI+I0/hxLd607fNCH9v5I0VcqcZAWXYELy1/9BhJkwx8Hq
	0OoDG1gl/24ixSbao5g7SjB8ZvF2B2IwnrQKxqNE+LxdhWl7Atd4kFcZ3VEd0rmu9XwAhtXalcWTE
	OgCKOHi3jwdJJ7EbCrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XJ1-00CCBR-2z;
	Fri, 09 Jun 2023 08:17:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7XIx-00CC7c-0y
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Jun 2023 08:17:10 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f611ac39c5so1897326e87.2
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Jun 2023 01:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686298610; x=1688890610;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbn/vidH7Q/LymlGmJYhGt3pz85OqWNGAZA4SRnTzBo=;
        b=fK9Ln5svpVf7phjZS+mbqw7W8KLEUddvL82nQQBDjWef1EMHZyKJu5uSv0ylG497DS
         77MDbGVz1ZJvyDJZ9TjECpi9s94vl0lFXkz6ecpCvDqgEUjDl/Upf0uiqbB0dWBChzOu
         2ermRRb2EaSeuuAPz/RLtXhUUHu/O2eSGWzGcv6WqHiMuopaSxz2F5WTcJwHAEb+DXn/
         xxURipHrESsmhHsJzbs8DTZxRnWA3ZeVb5Qx+rYMdnWqgWiCg8xCvdhSe1neH97i0MBQ
         RTQRbC4I5/z9CibtNsSEzrWYEodFJ6Bb14j8xKSNI/Bo4vQX9JayOrs9SIFG4f8LVI20
         qQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686298610; x=1688890610;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbn/vidH7Q/LymlGmJYhGt3pz85OqWNGAZA4SRnTzBo=;
        b=ViTizsHngSLDMa8MRfDh27q8ukhIJFVmIbJu5heg2oI99DStP2Kc6zkt5i8zDfBZM7
         RbxNOCfSrARK3zBiNSG8d/4Eofi6I5j/4a2WHXbt7rjSr1l3poB677aLpPy7raZHM0pS
         4eOATw7DK1LpIzLXAes0xOh6rr0pu8tpVTU8MUvBVtd16l3xnB476M4qLBkXt7cAvgye
         LSNQ+CAmt9x5U3Q91AM2QvoEAmaKiwtbHZrb6n/7Od/yyeO79G9JhHO3338mnocwXgUM
         RKFKMYHB5uDH20A1+Fa0LEzhnwPst8LqHZWLeiqjx1Vf7dPKlEEeUqkno0VtiveTLmKd
         TE4A==
X-Gm-Message-State: AC+VfDyX74MccH6bKZSQbKLc81qLTGRN13YxcQGMgZMc9gl++aj/5yJE
	QWl7AovbWcvmZT+UmtGuFF5njA==
X-Google-Smtp-Source: ACHHUZ72gjhpE6xfNIyCw1g194Gn1jxiJKWv4N13KPXnSFqysK5VlWgjRHhNj6J11ET014zr7Acx1Q==
X-Received: by 2002:a19:4f52:0:b0:4f4:eeb4:ba70 with SMTP id a18-20020a194f52000000b004f4eeb4ba70mr424776lfk.32.1686298610392;
        Fri, 09 Jun 2023 01:16:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m6-20020adfdc46000000b0030e5bd253aasm3768435wrj.39.2023.06.09.01.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 01:16:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20230510091129.151669-1-xianwei.zhao@amlogic.com>
References: <20230510091129.151669-1-xianwei.zhao@amlogic.com>
Subject: Re: [PATCH V4] arm64: dts: add support for C3 based Amlogic AW409
Message-Id: <168629860953.1192110.7115363386706217680.b4-ty@linaro.org>
Date: Fri, 09 Jun 2023 10:16:49 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_011707_370148_68B0F720 
X-CRM114-Status: GOOD (  11.87  )
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

On Wed, 10 May 2023 17:11:29 +0800, Xianwei Zhao wrote:
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
