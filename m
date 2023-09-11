Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903A4EE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/Hnd+3hm7qgsZDAPEovI/g6u1rCbMjHyV436A6a7hA=; b=wMTa1DJTSQJfZp
	K+itYq3wbQZ80qyKzwu6zpgPaVqsPsfwQ/KNTmo/0ye1xNtH4INK4da99sevbI/gELkaWrWhzZuXm
	Xg4PK5dbKUjmXL+MHXxjwoUC826gR/kH+vk249rdZLCPOrTPYKgaTqe64o38R6myKOOVXEPR2PEzz
	ndccxxIgEavdXN+dinsdCMY3HyOWQnhVbXJrdAyS0/afRi1qNW6Jsrwi9kaZzzPMf69BlxWoXVQ8Q
	TogfLyi3gSkfwLx+N43iADK6VvhJNT737riBvWduMRVELjkMzJMfBGdARDH/h3DSVpXyLFKBjXJrP
	5IwwDY0wBdKjKL2QDuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjEZ-000wYN-0x;
	Mon, 11 Sep 2023 15:53:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjEW-000wX5-0q
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:53:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40078c4855fso49181535e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694447631; x=1695052431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3zHV6iao/svbvabAHUWRziqjkkVulJ/SFHDJG1zdw8=;
        b=fHWOyco0eTkkgWnHPcS310jbgoeVFwF+HpOFx8cFi0Xjadg74ZcxE4mGXAy1N6ssAJ
         Fxu/HZJs/tI0AP+E2sKSDCudXAcabxy+I5cBOqNV8q3ar6GfCfb4sn9kuTZdfk702iM6
         kMwQdX5C7VaaPK1rOGYUUDhCyoXumyY3BScTa5YRx7J0NzVUKNV6GzmCTAx4Iyts2mCa
         4wLTskLU+B6kUwKur3ywte+PHPUcrorw2JIL8ZiMnxo0eLhEMfUDWC3bwBYyCQo5V29Y
         1vKHy21zntkCWup7xokXk343iODv7u2vFfIvwt0mjr8EqarksYupox7lyHCjrzi5sJLv
         IBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447631; x=1695052431;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3zHV6iao/svbvabAHUWRziqjkkVulJ/SFHDJG1zdw8=;
        b=IsSuUL5ZhMJBlP2qlMZ94+EHKjQpnEPn/XaleXUhkTlcBHwBsf1Hl1IwaqU8tsM17j
         QJ5dvI74a2UWY6A9Tu2V5MVPeKbjAjzl4Glui2ozAk3/Gpi47Zg3PjAsgIacqjBFl723
         1vNr/JUrm0iTq+BxZp1vwwYOTA83LrBzUBX8kZU9zEZLBpjokg+FhpwAbKGiM/pswe9E
         0xcNjSMxI91NnPJNFum8cypizRBQfSdyOu685AyhuPVCedQL6qM8C42C+REJOCqBFXAB
         ey+VHrNkRs2J42guzidixTQ+aMlgUcQ0j1d+4TJnokRLG1S+5ptLue25DZObsdUljG7E
         dqNg==
X-Gm-Message-State: AOJu0Yze2NKrmHeWK16OWmyoREGsfkABRhNZy7m0cQLTfikvADNnmxId
	qS650XMBiEP2EuE918jbsX7IXQ==
X-Google-Smtp-Source: AGHT+IH9qzC3rYF8IeSOT1RPV7CsdG0ReQBfjcjNjLurVYgv7naSOiSTRp7oUKIY9gGW+TXEpd81cQ==
X-Received: by 2002:adf:de8a:0:b0:306:46c4:d313 with SMTP id w10-20020adfde8a000000b0030646c4d313mr7882614wrl.28.1694447630648;
        Mon, 11 Sep 2023 08:53:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c3b9000b003fe407ca05bsm14047580wms.37.2023.09.11.08.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:53:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230911154541.471484-1-jbrunet@baylibre.com>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/5] arm64: dts: meson: u200 audio clean up
Message-Id: <169444762970.3994411.2239837675633536062.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 17:53:49 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085352_322735_F3CA37F3 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon, 11 Sep 2023 17:45:36 +0200, Jerome Brunet wrote:
> This patchset fixes the recently merged audio support for u200 and adds the
> missing onboard audio devices
> 
> Jerome Brunet (5):
>   arm64: dts: meson: u200: fix spdif output pin
>   arm64: dts: meson: u200: add missing audio clock controller
>   arm64: dts: meson: u200: add spdifout b routes
>   arm64: dts: meson: u200: use TDM C for HDMI
>   arm64: dts: meson: u200: add onboard devices
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/5] arm64: dts: meson: u200: fix spdif output pin
      https://git.kernel.org/amlogic/c/66561cb158d0a25054bbcf423d59dd782311f60d
[2/5] arm64: dts: meson: u200: add missing audio clock controller
      https://git.kernel.org/amlogic/c/f9dc2d96e1bfb33635df7edf0a1b8572bbb20954
[3/5] arm64: dts: meson: u200: add spdifout b routes
      https://git.kernel.org/amlogic/c/4e47ea869289dab588c0152ec90d6eb5bf7f7169
[4/5] arm64: dts: meson: u200: use TDM C for HDMI
      https://git.kernel.org/amlogic/c/956236a24aec8364a3ee5d287e23c0c01cfb9c7c
[5/5] arm64: dts: meson: u200: add onboard devices
      https://git.kernel.org/amlogic/c/f1decbd5629bf0dbd3af3b2f803f72a27eb01c7f

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
