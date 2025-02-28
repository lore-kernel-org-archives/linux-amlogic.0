Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5826C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1lFpep5Dmtma2PYmP5bGeg0nGTHN58VA8Cg0z9DV0I=; b=ZAKmpmuJ+ILdB2
	PUL7LxsYSC906jGNFEcOXQUwTTmqtzxEdlACMSWY9UAdvQ6rStbZcY2Yl0FuYXE0RDvY0P/5xM3H/
	T4QPELg5IhPJGrWXTasq58B4sOLt5GxZL4eai8FsNw1z9o7zkIMqCbSKkVb/d2CE5WbqAy4wAvZZS
	OdsL4i9wn4Uiv9L34XL953JTqz65k2YAGR7osXE6Wrz/MXaztgx83mYEhs5YwauPPwOOOm5ijij7e
	iNvuNhbmgetfX9hSl7EbMdLziFqQj1OXM72PB77nytebubnTZIw9l7YtVORkWiHISp+aChMUjvROM
	pjXN6t1nuZ1K6iQ+6nSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvlH-0000000ABni-3LpU;
	Fri, 28 Feb 2025 08:30:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnvdp-0000000AADQ-3ltG
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 08:22:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43984e9cc90so18164395e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 00:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740730960; x=1741335760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mjk45jguiUNe+AcHQUbiNYsEpUBPM+3F/r+trzFvSE=;
        b=n3UU2iSwc+QcoifTwiFwnt4JdMzBQ+MZqGdbPwW1mHIPbnZGERk4/InNW6IdA4yDZw
         94T50wsb9k3IrBFbV3ZLAv9z7uwvEiNQvLoSN0V67y865Tzt2cr8DTqVxaZIE2+zEIA/
         ImCdqHMQ6aUMakO0+SKDI4ZMUZzX84Kif+5yVndo2K/FKAjcSfLgxBM6Iyc5PMnFMf34
         0KhagCn93yU+Tbx3HZe/IljFONSRQ2+wTF8DmMDML9/3d/trRcglwzRfjGiMAzbyaB3n
         s5AxdJaQhrs5rSd25oRnQqAEjJ2zstg128fNvGThT1C1iFc2PjMdaYuo8dDQe/EnTQgz
         DWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740730960; x=1741335760;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mjk45jguiUNe+AcHQUbiNYsEpUBPM+3F/r+trzFvSE=;
        b=ADPwFHlOZLTiT88xdI4oihMfopyZvJxx1BPyim04hK5CiC7tWBSIR6ANuORbTwqsVS
         +WuFxyH2qWmil8uWT8b1vd6L9adA43P2PF+M0hA+3tEV8O0HEjTSks8Ct6w1WZTJ+6Pe
         nTWXlc7TSsNho6YUE9ysLhoPwZsnFOsJnvAjQstV1T2mL424iZYE11kHhvnLumO7GbHD
         Xc3E+hJqDV+1aN1NEZKReHyU2kVgAOnkJUU4ACKWlFLZXpTstzWyvFmcNiqPa0SFDOff
         GvxrsJkKLmJkozZbZxAGb/IvnBGXrn7bNwl4ku0tsoE0ldZoBy+ot2XzBCTavgcYwIga
         QrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGq0/XNbhLylAGy6ezNqMo+eWOkLqLwtmSSnfY2ijHNz/hZ8b38JuO4LZOZAYG2REtfkOKdZk0RFTVpM2r@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ85g/ATq4QP7XM2mARmfa/q9PGQTjY2pbdFHJ723GiKAfzV0g
	P0lhQ1cFKNHvF+Y7vGeecdI6LpPi1DQrA9nz7Y/T/vi4yBz7GVxdAI2odLQlZ6Y=
X-Gm-Gg: ASbGncuA+0QIVB89Bsme6xYEBDA44KqgGqK/2yE4UKsO2SQUmDvJiLWaZtzIo5zg/Vg
	zn1CEYiVViLaRTvwpIBav6aOv1J/YlggehuHrqCkZmRTA5bYRoSDpPpHGoQF3PxLaoixUovlmR6
	ssQiE7nBYq4GYszysgM3ScuDJxooeTAi8yCeo5kgXG4mQfvCkE3TfTP8T80GxHkJILRYAoroUdC
	iLVysvjhVdraIUT5/GM6yQV0tGeA5Ho17Vnt86MGhEPqP8z4n5rPPtFtWx7u21ar9Wrqk+Prs5a
	mNSvNmfBguSsEB2Oyn2euzbx9GHrSROhXxI5dlw4UpujSns=
X-Google-Smtp-Source: AGHT+IH038oCeROvQ6tVC86akUZzZeoenUNBH2cva8eK5sDSrImvPU+Z4DWRdw7Bok77rrj1L+R8WQ==
X-Received: by 2002:a05:600c:4f51:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-43b4829817amr44075105e9.6.1740730960086;
        Fri, 28 Feb 2025 00:22:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737074d8sm48750365e9.16.2025.02.28.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 00:22:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
Subject: Re: (subset) [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
Message-Id: <174073095934.1139542.13898190567088651391.b4-ty@linaro.org>
Date: Fri, 28 Feb 2025 09:22:39 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_002241_946719_9FB2F183 
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

On Wed, 12 Feb 2025 13:20:49 +0800, Xianwei Zhao wrote:
> Add pinctrl driver support for Amloigc SoCs
> 
> Base on the previous discussion,
> https://lore.kernel.org/r/20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com
> The existed meson driver failed to meet the requirement of the current dt-binding.
> So we start this new pinctrl driver to solve problem.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/arm64-dt)

[4/5] arm64: dts: amlogic: a4: add pinctrl node
      https://git.kernel.org/amlogic/c/ce78f679e08cc4f90db1ad8e61ba9f85530c701e

These changes has been applied on the intermediate git tree [1].

The v6.15/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
