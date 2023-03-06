Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE72EC678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8c//KG0vJ+xqnxDAP5t4TuwTRmQFg6j5jlO3XdcLqTY=; b=w6KM/KVbAZ8Etn
	bL1oilXXfHy84J7BCV2+MlGl3AalhX4npozWD/CYFfTTByGcaWmAVI853ZcK24ahEjm5opTZF+wwo
	wf4neKX0Cq1eLDeIZqFwVU7SAbrEuV2bys4GswZb8k+dKkdiWYWd/DwXSU6+6+xfrtS7cLVR4X4TV
	NhKFdUX4lanVKxGXYIucU9uFQlOFrrLPXU9y65QOgRMflpXITfuR4zw22JdWkH7C5hzRt5emDazhM
	iJ6QGLnH1SyVSRvMTOCo2n4qCMeV9ghL8HlOhQGqrluwr2FrE4jup0rMxnc5rTxHPokNpGMzrrGza
	uRLh51asTNlLtRL17IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ727-00C4BZ-CD; Mon, 06 Mar 2023 09:21:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ722-00C49j-5y
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 09:21:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l25so8048402wrb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 01:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678094478;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QTaTg1M82nHPuHpSBS+WU4NCi+YuYDcZym+3+BNoD0=;
        b=hY3zQEkaEFt7L8jf2l7rZVQ3WSnXzuIYX/YnXzeyUdnnkCARe0Ec4S4+mzCPLpmnga
         q1OxpBZ3DldwFuzEN95tjGEbuzVKMOsitKZtGkU3ZU8xSr+LBTGGhazcmsd/c80KJ5c+
         XjYKDAM9Et4UWcA0au7RTZpYuVG7KWUE8LtjsftwbJ/D9fehDjKQEx/W27u5Kv+OP9eB
         Ko2Fofulg2zHSkYhuIAnnfhU8CY87VprzXN9szg0Ni/j+mTWe4sssCc8y7bScULLVaJy
         LFGz5/R77awfacg4KoZIkOFdqkeTzrwAx2lkOuZGbpvqjYRBPpMErMMY9zTNy1sTWh2R
         sGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094478;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QTaTg1M82nHPuHpSBS+WU4NCi+YuYDcZym+3+BNoD0=;
        b=z+aSUb3OW9OsP5m8mdT8VkbaTrSfN1zOnVic5aKHgfY8bvjW3KR15BKsvxL4kogP5p
         dpb7BVewNB9K0hyfFMAD+7/cKkrG5UPIWEK4dCw5HCE2gW+mX0Rv6RG/LERuvjJT+S+J
         y9de+CXdrh41vZzbLAa0dD+EaYcQQWuMRieF0/QBEQA2ox3W9bhwHH1xy8r0AK9rj0vE
         L3T9U6BKcEAsnN1BoKJQ7Fk6coQvqqg1FoJvPnnz+WaOPUluyVeSl5SxVgdb+krjVARE
         MD3KpjWnXiTIkm4vSh+mTd/du6S1/ZrR3hUn51SZBUT2IUeLZcCUak7LNJPUS0BOc4Hn
         lreg==
X-Gm-Message-State: AO0yUKWZ322nBcW81ghWGfUeNHzP//k2lEXlLwgIQ1fxCKFMryR+xgdE
	QovIuJ08KD5vZSooiT72Fu4tlA==
X-Google-Smtp-Source: AK7set9PhQC/LAWuijBZyi1RnO+m0uSLl7osxh+Et8GDOHCxy9UxpG6DiUCb2nJKyQHWzg5n+chgsQ==
X-Received: by 2002:a5d:4a51:0:b0:2c7:778:5da6 with SMTP id v17-20020a5d4a51000000b002c707785da6mr6233079wrs.42.1678094478663;
        Mon, 06 Mar 2023 01:21:18 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id j17-20020adff011000000b002c5a1bd527dsm9235217wro.96.2023.03.06.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:21:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: devicetree@vger.kernel.org, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
In-Reply-To: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
Subject: Re: (subset) [PATCH 0/4] soc: amlogic: switch bindings to yaml and
 adjust some dtbs's
Message-Id: <167809447788.73638.7893425529034972741.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 10:21:17 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_012122_347357_7919370D 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed, 01 Feb 2023 20:57:48 +0100, Heiner Kallweit wrote:
> Switch two Amlogic Meson bindings to yaml. As prerequisite adjust the
> order of some compatibles first.
> 
> New versions of the bindings have been submitted as individual
> patches in between. Put it into a series again.
> 
> Heiner Kallweit (4):
>   arm: dts: meson: adjust order of some compatibles
>   arm64: dts: meson: adjust order of some compatibles
>   dt-bindings: pwm: Convert Amlogic Meson PWM binding
>   dt-bindings: interrupt-controller: Convert Amlogic Meson GPIO
>     interrupt controller binding
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/arm-dt)

[1/4] arm: dts: meson: adjust order of some compatibles
      https://git.kernel.org/amlogic/c/0c187cca73291f2c355fae31eed3fc7aa783b2de

These changes has been applied on the intermediate git tree [1].

The v6.4/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
