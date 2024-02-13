Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8C2C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDsW/CGgdgWnoQORhKFAY6VL6QNorSbPemMVOeHT+KU=; b=xQCkDy5MCiQAT1
	Dfe78L1deDuZHPYo2sHWBfoWuJAi1Vl552mjN3EmhvLjth4Ha9hZ8Sj5W6DtwoAJzjk9zCFgbxQUx
	Crr1qZDhd0bmyyaDlwOO3xqvtPfcFbUUQpw/Vt7fKCElC+yvpieRcGLT3zOKHdBLmNh4SUMpq0Ikv
	MrLYKjSZVCkpWj/NmT7FKNl9SRBwBkn/ykJJa0nmL13wlbLWzaMK9CZf4ELQ/Vjol4GuWPxnVLSo/
	WXHWznwPrn/UkVz6GznGVgGn5b/LbYYi4OWQ/JPEx9hmOvniShkFah30I++RNWfXo2vadyFt+rbdx
	iNGnCQmmd+Yy8F2GnRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoRg-00000008U7V-15RC;
	Tue, 13 Feb 2024 08:47:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoRW-00000008U0u-10ar
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:47:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33b8807b55aso777332f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707814024; x=1708418824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75EEaodnUavPyXiDW/zXiMugNJn4rgT6eT/hJD3ce5o=;
        b=Dpb3O7D414bQVaCaO808aCGR3tjL0qUyLYaNIE/GxIqJlvuoprDFvR3jJJhjmGQNDp
         E10tZ5fhr4Wai8Ffk9PyifHOQaEa1KPWJwZ1a/Y4y5Bwe3NaTQHbBC7rBDpQJdaKwUhg
         xEHPwm8SR+lNm2lrhkkoXETBMFyppY1gq/Wi3jMkRW2LYJsl0puBIVHa23F5yT9HKkZo
         GITh3USzeBjDivjl/dx0VARGNd1tCYXhiW9X+50ftpSrCSnhfv4sn5o3YzsmMAbpvgjw
         TmH8rGhN85Mv4qi6kS25/DgMLPc+VyDfE9Be4sBgXLpZyGoTDy0VRU1LOuh/fX6Tjejp
         OBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707814024; x=1708418824;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75EEaodnUavPyXiDW/zXiMugNJn4rgT6eT/hJD3ce5o=;
        b=jFyeUY/xaszNFgLePjAApQ1TXe8IImVWuv6DyiJJeMOJGlTNiONus1Q6W6k9dy5r8o
         cqgHcFzW1mt/KnfqrZU3hXSWhbdKyDtm5h0uUki3hVSxem9Aq9ayfFZxM7ymPFRgzReu
         +CekPLN6fGGxY7RVhkXszep3iHsBZxTk68WbYfu/iG0X+saq7WDVVn5c9Pjs3j0WoBCE
         QvZeLqr4BNlB97hDrPA2nbima6F1LqmdJRvAw/NJeQzUFS1f3b02dN22ojD1G6fAyYJD
         Z6MlbmL2Vk9Dj2Sz6ou5eviLY/zay9sB7K/qwzlDo96rPqNblk15aoIdf9xe2xuepKBo
         Jlyg==
X-Gm-Message-State: AOJu0YybNiGoIp1+91ZCvvNP+h7YIjQV6HOaI46NWpQi08SI1YnyETns
	kUSF3Cr3vp6stuXIEmCvA9XfBZTbnU4OjteolbO2dx1ktQ/nVzOvF8iLe5zBiSI=
X-Google-Smtp-Source: AGHT+IGTdnZvyHeh7eWYeSJDhc86QdOUzEKnpJMoqWenO+UTYHFk+lx6eFsx1MZkCcVxpEVcl/39mw==
X-Received: by 2002:adf:f24e:0:b0:33b:304d:36b7 with SMTP id b14-20020adff24e000000b0033b304d36b7mr7221572wrp.56.1707814024476;
        Tue, 13 Feb 2024 00:47:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeTf7UecjwlGIodtLfDFk7swIZwWcjKycfmtkhdv94Npda/6KaT4lh+JHM9lkBjhtJIkLDZArH8INQQn4CcNWQKUASNUwySyYIZZRK2kgnM6MtKGZ25uzNIthThiIdltkY+mDvStB1dRji9LNKZPmz4fy3isYJeQKdAM+3hV5vpiqawGk8ufN3PytbE8QBLW0cdDUfKjG1sm9/OoxODLVQES4S3lzr94SXWTsC1WTgtY+RRZHCJb/xMOGjSCjJ8bGuwldGnh8tx0dwqZYe0OZWA1i6CdfFtSyqvyxZs7sQyifHVcm/pcezmSf+6cICv3GP8N1gkcpA6ZPMYIcju8MUcDJC5IXZ4HTyHkTJVGTk+Yxz4l+zjNyHcpno83O7LQ/+COWkP38qXks8P7SCs7/HdCIa5/Pr0fmXBKRysE+eyGAUibPVLRbN9B2Ca1JHnv+VXYqspWrBxK63iUf3FoQYff1C45Ym3g4J1w==
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y8-20020a5d4708000000b0033b507b0abdsm8888707wrq.32.2024.02.13.00.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 00:47:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, 
 Alexey Romanov <avromanov@salutedevices.com>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@salutedevices.com, Dmitry Rokosov <ddrokosov@salutedevices.com>
In-Reply-To: <20240124130623.3471236-1-avromanov@salutedevices.com>
References: <20240124130623.3471236-1-avromanov@salutedevices.com>
Subject: Re: [PATCH v1] arch: arm64: dts: meson: a1: add assigned-clocks
 for usb node
Message-Id: <170781402367.1503948.783057553743938971.b4-ty@linaro.org>
Date: Tue, 13 Feb 2024 09:47:03 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004706_526999_EDD6903C 
X-CRM114-Status: GOOD (  10.43  )
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

On Wed, 24 Jan 2024 16:06:23 +0300, Alexey Romanov wrote:
> To ensure proper functionality of USB, it is necessary to use
> the rate of 64000000 for CLKID_USB_BUS. For instance, adb may
> not function correctly without this setting. This information
> has been derived from the vendor SDK.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)

[1/1] arch: arm64: dts: meson: a1: add assigned-clocks for usb node
      https://git.kernel.org/amlogic/c/d1159418fbd5880d3285f4797d3f11eeaf6d0d42

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
