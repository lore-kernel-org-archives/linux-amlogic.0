Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5435CDB482
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Oct 2023 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LycxvA6Xn/A4BZvvZffKkOjTaHyu9DKsAuBSXmNjHw=; b=o/YDi24T2h0LEg
	TbESCTJAXjRLsN8CMm+73OILNS+M6GHpqBzP64JfSs22RFjs9oqnLKvsHciK4fXN0KFKgc8nRIS6l
	MP5hRKUKr8A+fUPyhpAwaon/GvssSQ0fiiK6XbcCvMcpl/W6oHyFLYyx0Mh7O3Q6nhzIZ9DZFEG5s
	AIP+YkJo0szoO34qVfSmFhAOxUNUM/Go7i2cYpXUQQbV2wocL96uIXLTFv8Ne3tcgMweM2DPQ5bAi
	BgRVeln5or9rq6U+UR9M09mhbBtRDIK4mYeLsvTUkHNNsv8DrrR8S48naWAgf/pXJseKcIuyUN2D4
	dVt1JUVvafrW3eCPRtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCyQ-002kuG-1J;
	Fri, 13 Oct 2023 07:52:42 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrCyM-002kru-12
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Oct 2023 07:52:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32799639a2aso1669923f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Oct 2023 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697183555; x=1697788355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTHX0FRa0mIsovtBPL6JAcK8C3YX/mCkit2iZ+0AIBg=;
        b=HgnOMq37UMURAeKiPa9370YfP2kFgc2bnJIAJaIcN3jbj43k7RiDNyy6kTR7cq2vQF
         Ke5x+4RIoKqGL2ZlQbddWey/jfoKvIotkYMU/O91b+8KyS0o/6CNsdqqXYTMLtPKlbEK
         Iqwp4X0OGJ9Eh3uFGiE66iDMrl2PvE/ajP5ARaK4BXX33sPjsotZ18LjTP8QYNKoa2Kh
         qDdUjjMGmCqap3K9yOzLjJRsyIPxE/VtdBSWCcWKk1SZJHpcXuGYqpYF9ZAv5lkrmmqP
         BboesVu9QJxrSv3BWwYsw9Uat5klNFSaxp9SxjkuAMLGRTPNBKeVVOOchY32QbG/Lukh
         Lwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697183555; x=1697788355;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTHX0FRa0mIsovtBPL6JAcK8C3YX/mCkit2iZ+0AIBg=;
        b=RrdzbECNBNZL1ldBDMkJjloczsfBXe9nRsyFgtpRep6qEpisVXCx7UdYmO/p2EEqxW
         n+ZFilabY+ekdEaUFh1F727Xf38Ool8j50atEqcJjMmf8jPCAn/xSxltoW4Vwhntf6FN
         GvuVM/UW5u0KZ2Fmi15ejeTNb7g0jrKab9SWf4uS3/+Xt+2hucGW3XK5rFMoHAawucYp
         KdpI+8k+dJis6Itga8qG1N+U6Y+BH9lelLezUaGt7jrrIgveuUQLGm1EH8p3jKQDr+XV
         7p8JIsZsZPVV86Jc/U+LktdXPvIvO5SRWsZXihvgq14UenpcQ4TNsNxBeDFPj2IU1jcP
         pxAQ==
X-Gm-Message-State: AOJu0Yx/I1dxQIpCDJydmPl81B49+ntr+917yjvdtsO3P60QrY1XOTNf
	NelV/Jh+ZExvfsDuQCd4rSwwQ/WMzrUxwaT54a9chZ5I
X-Google-Smtp-Source: AGHT+IGiyB9W+thMrr/86BjFDhdIxFVIHXZpdrHzrUUMm74SeNpy7U029sugpKwEw5/NWnsIWPXEtA==
X-Received: by 2002:a5d:504e:0:b0:321:4c7e:45e3 with SMTP id h14-20020a5d504e000000b003214c7e45e3mr22735710wrt.11.1697183554975;
        Fri, 13 Oct 2023 00:52:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d12-20020a5d538c000000b0032769103ae9sm20171592wrv.69.2023.10.13.00.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:52:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20231012103600.3381340-1-m.szyprowski@samsung.com>
References: <CGME20231012103636eucas1p21eec119a94d1f2adfe8d1c2602bd4012@eucas1p2.samsung.com>
 <20231012103600.3381340-1-m.szyprowski@samsung.com>
Subject: Re: [PATCH] arm64: defconfig: add various drivers for Amlogic
 based boards
Message-Id: <169718355421.802317.14102706469164690952.b4-ty@linaro.org>
Date: Fri, 13 Oct 2023 09:52:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_005238_358096_A0C044E5 
X-CRM114-Status: GOOD (  10.30  )
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

On Thu, 12 Oct 2023 12:36:00 +0200, Marek Szyprowski wrote:
> Enable drivers for the hardware blocks present on the Amlogic Meson SoC
> based boards: Khadas VIM3 and Hardkernel Odroid N2 to increase testing
> coverage.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/defconfig)

[1/1] arm64: defconfig: add various drivers for Amlogic based boards
      https://git.kernel.org/amlogic/c/a23bfeda86239d29f18a149a7e658cc3d4e5ef8a

These changes has been applied on the intermediate git tree [1].

The v6.7/defconfig branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
