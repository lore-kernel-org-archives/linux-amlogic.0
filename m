Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB18EC27C4F
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jun 2024 07:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aP3n8rr9teZU43wx9gNzJPezsKVq5oqiaou8NFGnTNs=; b=nNQ7UceIKlyEe5
	9wPXkHdzuamFwZcqwUBxUBxQp0yt0A8vytm+wuxp1HmvaDqWmNff1oO0zoeVTP5F0YIIRXZgGEoYh
	VjQu1Ge53C7MLTM6Xa9/qNcehtBD1BvLDmIcJsjqZqTecj8tYxzV6+24hgaoHYthv3zTGwF8MbZMC
	xQSKxwUFy021C1VGjfKDgxZ90qGoQM/5D6x+qtLvn8Am/Cc/LNiufWT7hCMao/dvEz185BXZGDar6
	AB1xCh122thDPvsih+XNFSh88R72vyjO4geuLPxF6cltGLkUc2oOgnlLJFj7VoF5zfxtvgUJIaM99
	ymQfeuG4eTAJISIGG/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN8y-00000005kmK-2tye;
	Wed, 26 Jun 2024 07:32:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMN8v-00000005kkk-0Qu9
	for linux-amlogic@lists.infradead.org;
	Wed, 26 Jun 2024 07:32:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4249196a361so23113805e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 26 Jun 2024 00:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719387155; x=1719991955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7W4OioQKN0eIBHViOR9QZ+vNRz4LIKL+fXoMKffOCkw=;
        b=OEDFSHnMUqH2PabaS3vo2CMT3ewaSjsg6H3lLsNwokQKdEPPoZjt7AfEl730d35WAt
         FlceI1u66owvsyqGY2k5Mz2sYPlOfdMcrpZKGOrIl27lZjspjSjGtS+njHHJV4XumJ9R
         cJKGTSZ3hL69gmdLIo0gpTQcJblpXs67+ac3qf6UFScLXBY4hshDHRZlliiAeddef1jV
         9TfSqdhuQPzxFSFEmTCsnMBQeYumFaf5lp4QnIpUG9LvpDZKRIE6qIVwuvFazY1QYcNZ
         EORcDZWUMv5i60huhX8wDyDTpcaiTXs3UhIOaAgesepnxI5gFDxsf94bBg1mg1bp7H3s
         ynJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719387155; x=1719991955;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7W4OioQKN0eIBHViOR9QZ+vNRz4LIKL+fXoMKffOCkw=;
        b=BSvIMDr7pA134vyFHHAEYoh/DRketDERYut63FSmviOOw1V/ue0PcJNebBiNJaxIq4
         t+XL82ncYhI9KTYlPcCZW2IooCiWAuogyHxjejpikTB+bm8IURSZPcdyMnoppuS3Y/2o
         Bc9VMVhMgXTqF9CqmD3TklJChM/pBmYonxIrsOKUZKYMbPPBny/PCIjXHVll8Q0+XZ/3
         tpR2RLr/R0Xt95kOZYrFmK9UMBp0QQRJ8FfP0ocaS3PyLV5NOdnJtMbCKma2wXs2kqJA
         6UBBqXxCDz5nMbtVGbfQnG/93f/0ToceB1QO5l+KZcR6Ez924YjKx9sbIt3VrXUTz9gg
         Qd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHjQtVTWH4VxjqqFq1dMpGhtnaHExqyccVsMYFn7hJ8Frc5/xX7VoXrnMRgKOvqZcn7WgwSvIhp2YzwArLnJz+uhl9hNBCl+yfSZLuaDmpJfg=
X-Gm-Message-State: AOJu0YxKT6pvtn3y2qEolaVfoUB5YO+bmm8QI10Q2lu8UEexb27E0LZx
	mNajB9/i8dR9Sgq/DjjOtLGrqwDSkuqyZe2n8G9QqVd9LQKUNYwgBtHDL/anLng=
X-Google-Smtp-Source: AGHT+IHkStzMgEtlbhfEd3vr7XWwRbdJYImOIKudj1b47ahck4Suw5YJPuzNImYmMu5zR3rIDZJ4Eg==
X-Received: by 2002:adf:fc0d:0:b0:355:143:b5f5 with SMTP id ffacd0b85a97d-366e96bf096mr5830496f8f.64.1719387154733;
        Wed, 26 Jun 2024 00:32:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8f07sm14962150f8f.110.2024.06.26.00.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 00:32:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: amlogic: add power domain to
 hdmitx
Message-Id: <171938715374.1644768.9308792407844880407.b4-ty@linaro.org>
Date: Wed, 26 Jun 2024 09:32:33 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_003237_181684_673E71C4 
X-CRM114-Status: GOOD (  10.94  )
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

On Tue, 25 Jun 2024 16:50:13 +0200, Jerome Brunet wrote:
> This patchset add the bindings for the power domain of the HDMI Tx
> on Amlogic SoC.
> 
> This is a 1st step in cleaning HDMI Tx and its direct usage of HHI
> register space. Eventually, this will help remove component usage from
> the Amlogic display drivers.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[2/2] arm64: dts: amlogic: add power domain to hdmitx
      https://git.kernel.org/amlogic/c/f1ab099d6591a353899a2ee09c89de0fc908e2d2

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
