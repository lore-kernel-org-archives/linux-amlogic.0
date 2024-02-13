Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C6DC48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q69gn6N3FHq8N0jABFMxCds/fLR6sQyIqhKw3sG9gGU=; b=nfPRXZTJy4byzL
	jdDlSkkwrUUVd5BE8RL1+RiU1YClVfOVXOPmQu5Ewgtak55Nx+BXwH5Lio/Sy+zoojYM9T/rULsfq
	UYrmsmddR3lNsYNuyEmdWY4VdLz9AKc5mNpoLT7cx3RnJQ0jn1+FGliu8aysCiB1liMn6GGfUw3Tg
	VLx6CW33sWt+Ti7FfQlg7cqjrD2PdB1o0HantlyaK5TUhQiExG0HCvU7dSV4GjN7eoNs4WWCmFTFV
	CGoxyVhY5EyNUVyZvmT7bM44Y2/26TAG/gMGe3kfDh5SfXS0A3I0T6+aXBu5KzLHGQN8aqGvNuYve
	JqGP+L5S5vZ8E7iemhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoRn-00000008UCJ-0oKy;
	Tue, 13 Feb 2024 08:47:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoRX-00000008U1b-1AHk
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:47:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-410c59a3e46so14692195e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707814025; x=1708418825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL6+54Bn28isJYNVVsc9wHQqBtpvekWqbNxClEEpQwE=;
        b=lnpUFbOlVcShqlTkOtfh8ii0BfqHZqdDEHb3zZDEjVMrCCA4cLW3sGcGNmoYvQrj38
         RPiIZI/tmcSCycJOpQewf3ljhDbFUxJ8HkK4QYR8KLIC+V4DYUUm9n1doB/H4FRQKUhw
         LZ4gF4eXK4HnZ5QHWBrGTtJKZsUN9cCLeXMPdTdSQbNSuRq9ohtrTELUpg/1TEKPiBuH
         7UTR8e23h+W8SL5ig5zd4JAwbx3Lp3qJVHZlWyHNAwdgc4YuRn28nOzB5XRtFE4B3veU
         hkKXnGKtXWzBWs3P/+IQC1Re5ElzaAVOIEmj3AKh0yQTidN1H+en/IM6RuJS5kZkacwo
         wZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707814025; x=1708418825;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UL6+54Bn28isJYNVVsc9wHQqBtpvekWqbNxClEEpQwE=;
        b=ZQUXANMjIY6hymXIVjcRy6zzV2eV6bg9T0o3ifrkQ2HrcNys04Dh+4dgXTuA8kOnhh
         j2IZG9Sb6XDyDa1MLGvAh+s76wtY8Yi40VWNj8WT3RRjByjfy7zz9VS/h1ELMmhassYY
         XrmpBhQyuyNHVAzFqHJ//tJavqikFxFilR6BSb7byVS8EKiWpR8xZs9xMc4o+QB45XvR
         sOGkWkMHFGo0+HPe+SYTBxKeb8Ns0F7b0VgLEQYYMdLKB0mL2/z/uKFiu44j/xWVaKgS
         VEEAA+ky1HdkKQBLauup1ko/dF8AZ8dxwqY9eDnE1XsZLkcg29nkY5vIndkOtCGUTH+A
         JEFQ==
X-Gm-Message-State: AOJu0YzFZXPvm/hHdbX7E2HzboXWofFt26RjyQS8sdcau/SY7sVr8swH
	cTO2MGu8OD1SihGZdayvs1yWzPIt5skhq5cUiYX/7S90HPfFdIgg6SQoyT0SmEo=
X-Google-Smtp-Source: AGHT+IE8InF+/Xt1UPuRw5x66d6evDnELpDvPFVVv4NCMEUADrcu3PB0+DvyfdVb86EzCr4XV5tKVw==
X-Received: by 2002:a05:600c:1548:b0:40f:d25c:41d0 with SMTP id f8-20020a05600c154800b0040fd25c41d0mr8388501wmg.29.1707814025459;
        Tue, 13 Feb 2024 00:47:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUT0GQy7Y8azAepuXHPWUSf2Lg7ZCjC/Cahq9AjpQJPu3FHOKTpR2lqb1bONeEGM+qBzGe+5vj0rGvixZJS+yysrdtV67nrQNLiLOYjCLc9d7WE377YSh4FqbCNdUHf66/x/rv1YvksGU9CdwwX99lkHoF1oG6Q2Iq8QtlWw0vFQ2wcdCwjfzq3pbp6MMgEdMyQAtC1XxBUnlK79xln4z9Vhxg7rAwck3VHfLlXmzp4I7lomnr2O/47ggsudjG0gdojuSfWRtyABSUG1HPHRABdZB0Xj+4vFRtYiPskLmBcyBiVYLniNiUc5nAQ5hjupV+YzyJXIb7wGCnCIUIhP64hw8VCRvj3aHtxlvMdfHFKoiWKZxcvBYYOBOoxsZb6WxrhqSKA0QhL951tGwOMLA4oqhcNbdlB/T32Ulp/QhUP9tk8tf8WCnDuqNFW2qa2Hmmhv9HUV873KaB5jX7kKCzZ+gZ/N7D2fXbed8v7VJQGA5kTUGiBc5ueXBDBlIP7y9NFLEqysPrhuISi5JutHSbI4SifKbrvO6i8axq/bH9zg8+Vrk14lVqadZmLJZlXhfgGDIA=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y8-20020a5d4708000000b0033b507b0abdsm8888707wrq.32.2024.02.13.00.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 00:47:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: jbrunet@baylibre.com, mturquette@baylibre.com, adeep@lexina.in, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com, 
 martin.blumenstingl@googlemail.com, conor+dt@kernel.org, 
 Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru, 
 rockosov@gmail.com, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240209212816.11187-1-ddrokosov@salutedevices.com>
References: <20240209212816.11187-1-ddrokosov@salutedevices.com>
Subject: Re: [PATCH v1 0/2] meson-axg: properly setup CPU power management
Message-Id: <170781402460.1503948.8383837524449723560.b4-ty@linaro.org>
Date: Tue, 13 Feb 2024 09:47:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004707_402744_12E8EADB 
X-CRM114-Status: GOOD (  10.25  )
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

On Sat, 10 Feb 2024 00:28:04 +0300, Dmitry Rokosov wrote:
> The Meson AXG leverages the SCPI ARM protocol for the management of CPU
> power, thermal, and frequency. This series addresses several issues that
> have impacted the functionality of the power_allocator thermal governor
> and cpufreq cooling devices.
> 
> Dmitry Rokosov (2):
>   arm64: dts: amlogic: axg: move cpu cooling-cells to common dtsi
>   arm64: dts: amlogic: axg: initialize default SoC capacitance
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)

[1/2] arm64: dts: amlogic: axg: move cpu cooling-cells to common dtsi
      https://git.kernel.org/amlogic/c/7c3215fe05fe3b8faacc03245cc922c4b98075d7
[2/2] arm64: dts: amlogic: axg: initialize default SoC capacitance
      https://git.kernel.org/amlogic/c/a06d4fdec1ce800188bec15c0219d6774dd145f8

These changes has been applied on the intermediate git tree [1].

The v6.9/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
