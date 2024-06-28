Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974CDC2BBCA
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2024 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvi9/tuvmCc/37Ulis1g6oZ+ONoYX4YjreFAFHNMS6Y=; b=NU/85PZCtpyv8t
	VXabtVJW93xv6PAu4x3Y9dksla46PUAfxzzcPQBIVZi1B3mmrzJMHvWat1y+AI1Plqod11U9Evk6q
	KZKqmk6JmwS7w/BYhBHMCXmCYr0L9HuCaD1DvlzM51ggnhuJqIjUkNRzi2hUkqxIJQwJ2VODrWH17
	h6QkxyJsU3q687BxjDB4rh21ilINkPboZMmFgKO76477SQ47lPdsfGso01asTVNvle8XeAfXJ3GMA
	2LsUCdCpJ4v6DTvZmXymksF1v03Jz/edrv8BUMHkxrVzQO0Jb7xAZSqgJpc0iGfCTPr8OUPj9LoKI
	xvRJlg9wdLIPbL7d3YsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6iO-0000000D1g8-1SLx;
	Fri, 28 Jun 2024 08:12:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6iL-0000000D1fQ-2NjF
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jun 2024 08:12:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so2603915e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2024 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719562331; x=1720167131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Za8GJzSQvEWguBnhsVgMgbxpdx2OWPVe0QVMP4Zex7M=;
        b=MTLwh8jlh4PWR4RLIR+/IW/F2DCYupN1E/k+1cVtgHMl7N+0mbe7KmtFL/QQL/J3As
         pvo0cYZY6c4SxR9pt5nRjz+MsMrYYa2Cfj7VmpohjCX1Tlfm7QXsLKzaikZPx0LzXzFM
         OrGAPUal33eOscqG+yblAW0ec6W6L5wsK79AMef6KIyns3Awzuw8d+tg7wRaTR6O5TYl
         UcyBAbgivlINaDVHPh4qf5AhidVqQ6w4coeSHUiu9tJxqI29jYy2QiMnOUXoNwflCRkG
         FDSG13/nYbMfd3YZOV/Yt54To/b20BP3nDWfFX9j7t+wm3KdhLtMZr60joGOTH2ekKun
         zY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562331; x=1720167131;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za8GJzSQvEWguBnhsVgMgbxpdx2OWPVe0QVMP4Zex7M=;
        b=r8uCKsJ2c4jRxpEQQWX1OwXKYqcCzo9oEIKdVZbR6ECE+om6xRPWcp7drxVWTs0tQk
         e5zvHkqdjb+AzieMyxZ1zCmG59tSoBqIegRQ/eyzTuCDH7LjNUOISICLPMy8mHB/vVKC
         qbFfU/Zbznu/dYhq/SZasV6WfN7oaXejnT6DRGcq5HXJ9SrDPXQdodocBGJc7wpsOZ/W
         RD4j44w61My9sNT/njebvyDbRugiAqa+XFljsVivm1XNlzxSwCQ5iIRRJaACRA+JJiMq
         P3FmRhyCpxPzUFVDiMW36Vk0PDd22C9mFYlQCBU+NYD3CX4fjW56PbBwGjIeysujrDb6
         om9g==
X-Forwarded-Encrypted: i=1; AJvYcCXr8bM7p6PQy3WdvIvxTswBD1SyDpIPvYQkApXEUQLZ7WEpWwhR8T79u/8U6VpafMmO7iPdXqcOFxxDpbCnncy3xju2qo7ZeXrmUzYq1H6kA9A=
X-Gm-Message-State: AOJu0Yy4zLemXal51DHyINwLH99LyhLpzya4v05KQinVIdojXTJRKJnm
	uKdaVCRq+1e5Oi28PzruOFiwbmueAia1nsrnZNQaprhKXoY5AOAxKzMGTXbQov0=
X-Google-Smtp-Source: AGHT+IH1Ga8ve4A/0au2rmwtSixHp2ho56UaJ52/y9SYN40XIU8gYHAdzQXzwMD6SK6QXmXie5tssQ==
X-Received: by 2002:a05:600c:56cc:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-4248b95d0edmr124015215e9.10.1719562331060;
        Fri, 28 Jun 2024 01:12:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256d664052sm12589185e9.27.2024.06.28.01.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:12:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240626152733.1350376-1-jbrunet@baylibre.com>
References: <20240626152733.1350376-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: amlogic: handle hdmi system clock
Message-Id: <171956233006.862799.7789348204436390137.b4-ty@linaro.org>
Date: Fri, 28 Jun 2024 10:12:10 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_011213_665188_5310E2CB 
X-CRM114-Status: GOOD (  10.60  )
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

On Wed, 26 Jun 2024 17:27:29 +0200, Jerome Brunet wrote:
> This patchset adds the setup of the HDMI system clock for HDMI Tx.
> 
> This is another step in cleaning HDMI Tx and its direct usage of HHI
> register space. Eventually, this will help remove component usage from
> the Amlogic display drivers.
> 
> Jerome Brunet (2):
>   arm64: dts: amlogic: gx: correct hdmi clocks
>   arm64: dts: amlogic: setup hdmi system clock
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[1/2] arm64: dts: amlogic: gx: correct hdmi clocks
      https://git.kernel.org/amlogic/c/0602ba0dcd0e76067a0b7543e92b2de3fb231073
[2/2] arm64: dts: amlogic: setup hdmi system clock
      https://git.kernel.org/amlogic/c/1443b6ea806dfcdcee6c894784332c9c947ac319

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
