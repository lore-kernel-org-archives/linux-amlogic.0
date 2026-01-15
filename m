Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F9CD29FFA
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gj4Q7KGfBS70cn8IWF+Gq+z/xweVcSt7shnAgKPkgCc=; b=uORvcbKPr1hsCW
	eRBfEKN0uCXPCH89B2yNvyz2Cc1rNBlPlo/h2Dy+TUUM6q7LxfHTJjDIYla7zTi/Eq9NKJPYwSDVz
	8FeFzAXXIcK+WPUGjC+JJz6CNgrnIKJsx45QzMrOqeFDDc+FreAXlqSYMGzaJnZyXyyloEzWy7pD0
	gap31wNkB4f8wAZdjRLxOmOfzHjCP4IOR9dBsSx+gGRwTK4upu3R9KgEv3LDmG5tiKQAvNePvtEeX
	heRxz0cmzbFnBO4bttOP+9r8cfxWmKugLz+zw7dw76RhaRkUZrflOOsW+bvc+2PHaHgpoqPC0uy7G
	BqWgKH3FuMPqFHdUDL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIN6-0000000By6U-177V;
	Thu, 15 Jan 2026 08:06:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgIN3-0000000By5b-2EYR
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 08:06:22 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so7652955e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 00:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768464380; x=1769069180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCWoEpw3wp1QWWzaKGJbbw2SnqJBwo7ssboWE/GLIgI=;
        b=jQ7AjKEXWBTOZO2S+p+kisySmzIiQBDofLS93HyKPRFvohr5ExGcFnAluHklBgTUN9
         iwO7iZWEBLirJjaqXv/eEBMhA1VrOgRDOxRUx5JPpeDXjNPVYnoZzINc1zAwXG7XCHFu
         cWvfjN5vfiHPoYNNrm+65duMpdbEYdl+V7WrriZGv38fkloFGGTmrQOCw4JKaG90EPje
         ToBCDeemRexwJUHNrygKc1uZVedMoEwRfUaJ16HTgwn+tCMtfaWtAEcr46L5tXP0BEwV
         ZaQP8xCI3pS9ppatvvHcKP8Dj1kSSjpvsjlEU/S5wYYX88Bgykq1VjnWqvFx2Ddsz7Eq
         0nDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768464380; x=1769069180;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCWoEpw3wp1QWWzaKGJbbw2SnqJBwo7ssboWE/GLIgI=;
        b=qSceZayuKTN3wGyQsMwJCfN7xEQxzgazF/nOQIdoIz8GNato4rcsNyWbSkCX9Cf3Fi
         WqdcWGIXgX8i2OpX0vqQRbtVkU+lDuzgpInjKzsaP6omeb9X7e1yHorkjWp3Sc4/ILuX
         HMw/e2IUvfp5PQs2TpZ9yigwL8w9QjoFxH8D2jD2OgNfgv4ctbQAOiO+SPrUBNUSzAwg
         16oto75KG/eF8H74YbcScToTRy70iIp02y1KX03QC0bxQQaYLLx5Ek5Xj6GftEU1q1xd
         02+7/IPA93ZWVzRfmhkNcbWL79/57X+e/CDvNeVXJKXqVFC5MBwAWjMTQgSJli6Hhylr
         /zOw==
X-Forwarded-Encrypted: i=1; AJvYcCVijwj/kaNyz6ssEwHrDTQiSPviVMwOg+kSUfGM+cjV/Ly3aZO4IpMwwReZ1rwcNBL7opzN/t16s1vO3MB1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbe+z45dIlau1ih16w/Z3dg6pzJXdLEKXAGTTMZHlv1jCMZEfY
	QMdpd9913/VKl5Y7+6O6HsAkcjwnWCSDKJnuZ27gxO4WZpyyZj+LDB8AFjngTVZbhlg=
X-Gm-Gg: AY/fxX4o4wyirBM7ZbYrrjXpdL1k3xsX5tasK2x5cohzRqBwm6ie2U7eaOwJiQNah+A
	3PrkK4oJs2vQ+vARFzltzLDU5HM9aFXa6qx8x5dCbwKiRz/cn9ClgW0nDzlhfOHgKcMFB1zvjhL
	PWW0Xn9j25G9INgsKQ6+6Wh5OOP2DaQoqem/3lnH11wLdftPc5VYzmZUEATE8yH1liXuK6ZuB0c
	wSk4stzXcJeK+/j2NLwouF+4d6yrUIjJ5epXV4OQAyV6caQHQbbhV58DpAKcVq6cF+vbTI0ItRW
	pd7JKkqZE4fQfy9Cww2CCCy8uToVLJnOzVO6aFStH7R3q2jy/6aJyu7hHbaKTtBdLYYrnRMW54x
	/oinaxrrs1eW26lJOpnIg3BCyiUBdRG6rIQUzdmunCZm2wrsV1kv/Y+SJZGg2+T8irYgdoK2o1i
	Cnfq8mq0WdIB73bPgBEnDPw8HHB3eMP8w=
X-Received: by 2002:a05:600c:3556:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47ee338ed50mr52682695e9.33.1768464379529;
        Thu, 15 Jan 2026 00:06:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b789sm32875245e9.1.2026.01.15.00.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 00:06:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: dts: amlogic: assign the MMC signal clocks
Message-Id: <176846437874.1204537.16755777734370082596.b4-ty@linaro.org>
Date: Thu, 15 Jan 2026 09:06:18 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_000621_613935_FD84ED71 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, 14 Jan 2026 18:08:47 +0100, Jerome Brunet wrote:
> The amlogic MMC driver operate with the assumption that MMC clock
> is configured to provide 24MHz. It uses this path for low
> rates such as 400kHz.
> 
> Assign the clocks to make sure they are properly configured
> 
> This fix has been split into multiple changes to get the Fixes tag
> right and help stable pick up the change.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/6] arm64: dts: amlogic: c3: assign the MMC signal clocks
      https://git.kernel.org/amlogic/c/69330fd2368371c4eb47d60ace6bca09763d24a0
[2/6] arm64: dts: amlogic: a1: align the mmc clock setup
      https://git.kernel.org/amlogic/c/c6ccd0d9a253b59125e5c625139799b41f0de3e0
[3/6] arm64: dts: amlogic: axg: assign the MMC signal clocks
      https://git.kernel.org/amlogic/c/13d3fe2318ef6e46d6fcfe13bc373827fdf2aeac
[4/6] arm64: dts: amlogic: gx: assign the MMC signal clocks
      https://git.kernel.org/amlogic/c/406706559046eebc09a31e8ae5e78620bfd746fe
[5/6] arm64: dts: amlogic: g12: assign the MMC B and C signal clocks
      https://git.kernel.org/amlogic/c/be2ff5fdb0e83e32d4ec4e68a69875cec0d14621
[6/6] arm64: dts: amlogic: g12: assign the MMC A signal clock
      https://git.kernel.org/amlogic/c/3c941feaa363f1573a501452391ddf513394c84b

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
