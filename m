Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F095D2ED11
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jan 2026 08:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYvW+GoMqf4GEgFZOnbJ1H0sz2Gmefbo3843n6mCPK0=; b=OsqNPKcCbOqXAM
	ibVrFlJE6R5eUOSNQc4iFEibKQ5MAnooXFDB3p6gEuIE8SCePSWUsKE9XRdfgwt9xVKhRnVO6i2rr
	L95jT2PlNVFdkddxXK9ry87+nsX1Lm2zz5J5pgWlF74Uh+Hh29w5rjIEPAZ9cQFRVR0MPKdCZTaG/
	zHNRqksVr9R7sutTLdxab80kU2Grhx84afWEH0xz31aMSJBsWiHBHtXmWiaKA28HOuQc5b2mlHLgK
	prGTQx66P5bIO/L2XPUOl6+t6wLZd4J+g+5vJxCw6GaBNvLC1IVpuO0WkIdQ6PMem1cC20rui/jCL
	pSp3hkBQzZpx7mXYIWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U3-00000003UL3-2JZP;
	Tue, 20 Jan 2026 08:53:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7U0-00000003UJH-43Qm
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jan 2026 08:53:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so28276855e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jan 2026 00:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768899183; x=1769503983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+Mpn+b7S8kX43PRVWBWsEkr3ZlV8vDSFyyH8rqi02k=;
        b=GCaIVB8+Hhl6n4vlfMvy+eoK9pTg5zx0wLD3XrsSX08+7xZxXTLidV4+v1wxyOj582
         jdPG9xdr+WhWIqBKCKP5qNKC2Yn24lFFu8wy2p/F/eCkXofH7r4KuQz1aIVDUeFKvMsH
         4SJ9k8IbhzWJUOfmT8UI8K0L0Qck7eWNnrcFK9RAPXtCxMJuHV97/MAHFBJXH/MfPNCF
         ijotsXy/KbyXMZjVQLZL31C2hM+Hsn/7PZrInBcwZhg+HagQVvQIiXfFIXG09O+G4L5c
         awRlmV3BTE8r0RjW0m8ebfqkdptiac1fS6A1KHqlA7Dt9KsaGlhASnqkds5H95e7iYV8
         p0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768899183; x=1769503983;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+Mpn+b7S8kX43PRVWBWsEkr3ZlV8vDSFyyH8rqi02k=;
        b=P4sbWlO14wDz0P/VxiLWZE5ruE+bx1+5SqF2AXzONhjLO+xo2b3MJJlAhcezpZ9BeR
         xXxL5RG9lyMa09KmVgTnqCK4DLuulKwMWuxKg3MieE3nqJnfWTfDk8eMUcFeEQ0DKV3B
         0UjBahX9OA+LP0OlGjOOhTRAsfSlRNrFLGja4ZdLigG6mALebMA82dyGIxjjq2GF65xg
         YvpNS3lkX+CzFbEMUylK+QEqglxIMVFXrgC1PCmmWUVvSkfTvQX0RBflCFhap5c/pBIv
         mnR1SAeHssYO1+3AZiD9luQA0N6C9DgwyLelO/tbRl8Wg5FJM0TKcMbBPC+G4r9hAQg1
         6N1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq7Y6LkY8LfPDIrRcyVZ31M1lfTK4w/imVefZRXKhU1D0VW7H06EjdL7+dc+kmFOlqL6wPvEja9xMSGUZF@lists.infradead.org
X-Gm-Message-State: AOJu0YxE1jUXLdf922+7yeJf/jmTSQn/KegqW2k9YxG5CcHkJBHIV/xq
	BaL0IMChQIpGrSUzMoy1YwSG7VqrCmdZ6StV50HCuinw71vGalgv5Dd+DM+m/DQ4xTA=
X-Gm-Gg: AY/fxX6HTg0R22D9MxQCXVPgBPJ6IMz4jmlehKQ3lh+4keFnCj+SsAYz3AO+NAmWHCR
	6q+k7ejSAUiME2DefDrC9O4RSXcgdBFtSg4WDWbPfX2KV2kbDRug/1gQJm9nKEQcRIzuqzXJVwY
	hMSfPV3dmz32hotEDGT6Afr4QqeHOqxi+gWgZEEzqob1ZwGBdgC5p+Gufnb7QMlgUxZ5vJSS1JM
	qap/dOiNz8lmH03g+N/Z6iUYj+xvSMoP6kGM6ek4WdK9t59/SVuUfpqv2WP5oAHcImCvLeJATvU
	rwEUSdON9JgGxCfvLX+dejbDZ59n+NjTOBQ6cUaPxYPigkCaLQ79V3oqapEL+mW3NJSPa8+otIT
	BK2UrifzuHCcwYlvjZZhUaFXwXRzLDvRMxY1PjJFkagCSDqRxkFJnoa2KLf0FY+fxiTCF5bXVe+
	kS/6EhvNiZc/OV/W4dBPUwbmCk7X9WSkI=
X-Received: by 2002:a05:600c:34d1:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-4803e7e8562mr15375225e9.21.1768899183012;
        Tue, 20 Jan 2026 00:53:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ffcsm27597335f8f.18.2026.01.20.00.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:53:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
References: <20260116-odroid-hc4-dts-v1-1-459b601cd5cf@linuxdev.slmail.me>
Subject: Re: [PATCH] Eliminate Odroid HC4 power glitches during boot.
Message-Id: <176889918237.1477585.6813293385956996088.b4-ty@linaro.org>
Date: Tue, 20 Jan 2026 09:53:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_005305_025428_DDB40781 
X-CRM114-Status: GOOD (  13.44  )
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

On Fri, 16 Jan 2026 23:02:20 -0500, Eric Neulight wrote:
> Fix issue with Odroid HC4 (and all meson-sm1-odroid) DTS that causes
> regulator power to momentarily glitch OFF-ON during boot.  Add
> regulator-boot-on to all regulator-fixed and regulator-gpio entries
> that (1) define a gpio AND (2) define regulator-always-on.
> 
> U-boot powers on devices necessary for boot then hands off the DTB to
> the kernel.  During probe, linux drivers/regulator/fixed.c and
> gpio-regulator.c both first set the regulator control gpio (that U-boot
> already turned ON) to default OFF before then setting it to the defined
> (ON) state. This glitches the power to the affected devices, unless
> regulator-boot-on is specified with it.  In fact, U-boot has the same
> behavior.  So, during reboot, a power glitch can actually happen twice:
> once when U-boot reads the DTB and probes the gpio and again when the
> kernel reads the DTB and probes the gpio.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/1] Eliminate Odroid HC4 power glitches during boot.
      https://git.kernel.org/amlogic/c/436418ef5baa024b7b15dd730c36d651c6aaaf47

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
