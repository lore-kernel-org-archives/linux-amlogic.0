Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37837EEB57E
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 09:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0XIuYblId7LbmexIj1vficBStq+nSXsen4xEfQcsFo=; b=ucTaJg3hYIBqoB
	oMW7obgJewR2fZWs001cIy7n/sJkFN4C/NLz4rYz93oUk2I61C4u2ZVi6ZRceIbpElyDsqVwl+YAj
	88sDs3uPgzC95+/Po5b8jogeYWrB2IxTkhDg8KL4JXi7arePmI+agNKyhLWS4lXvDr7xgHvfg6PDd
	ZLJTTpnvweQqOtwR7xtWa9NgbVpFrlum/dKR2hLQp0FPJ2UzCuRUbdIJ0f7qYWV4TkGzmHwdZt0Hb
	dfFxlvVI4tuPnvE6xP6lhzXPVYKPZJ1TVVKE9SGWq/SgEVOGTUyPFjOwzLkpBVc2I21Xq/ZgmmN6u
	6WCptwSA6XZ2TrYV9faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdVD-0002sP-0w;
	Mon, 11 Sep 2023 09:46:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdV6-0002lu-1U
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 09:46:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31f915c3c42so1615068f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 02:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425594; x=1695030394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AR5r3g93Rem7DNpxCNPYXtJX7SM5cWGRWdjy8kq3JwA=;
        b=NEKD6BQvv/3fkjHZcnmk6zzlXPHEoM5DZ2613n8sK4TU+IdiSFMBsUXB8m0xX9S0vl
         AdFP8BQfrEVlq9l2Mqp/NLPTMmge4jIhQyRTemFryflI1FYraqWrhgTu/Wi1d+XpPYwa
         eDjEkAdF2uqTNSF0Rj1Y8ZY2OfC/IRnaK5zsinUw+Y1JyuqF5eOodwqh3gU+IwODSaWu
         el1KKJNFIUTsPRbPPRrdXq6qRHi6o0HrhmGQsMJHnNdAiRo9WJUyoCTC3KBwToBwIuzf
         BLsk7rgOq/BFKV+3hrch/2N+6JnBAPuK2gvlrpOB7/RFy/Q1608VLtyACSMaLNwidb+0
         mpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425594; x=1695030394;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR5r3g93Rem7DNpxCNPYXtJX7SM5cWGRWdjy8kq3JwA=;
        b=TmFa+Ct4pIsAT2gZJ2QOyXYQWPh5yryxljij6cbUH4nvYO4DSuVq9caiuHydKUT+8k
         SieFTaYaRFv43aXjsGbbtZ5qbQb+P2QOIuHcuVm9XLykaGaGvJkkcwL0AlmaYuc8FHPu
         2cbZJQVIJE3fLCIOVXz76KSPnvmmIcDZcDy0xa4sn7ZLc2/eaFd/QcXMxDDctGYnJooj
         3zav2s5MsV445QZwWJRK0FHVs0bPmy66mlQh3VBtGC0SkDlEL8r0Wgg7HL9/otZKf9cY
         DXUTxxcxpclM+0zKlot0ekWiHebNo/h7cpgOWwpTyZeLVV2vfM2xZV0j7/ZGvXUtIOl3
         eDbQ==
X-Gm-Message-State: AOJu0YycLABjVvzrATq++m9t6JwPH8YpWYopriPtoyHNrCUKF3zX3iXY
	va6De/+8K7m5TNKE+z66jTDDxQ==
X-Google-Smtp-Source: AGHT+IHIeeGTixGVLQ3w8IGwO+JDDdkg+e9WcxFRAhz+oDKZn61/9t8brHl2PDw0+BRylOKbkUPiTg==
X-Received: by 2002:adf:ed12:0:b0:317:4cf8:35f9 with SMTP id a18-20020adfed12000000b003174cf835f9mr7111697wro.16.1694425593928;
        Mon, 11 Sep 2023 02:46:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d13-20020adff84d000000b00317909f9985sm9503496wrq.113.2023.09.11.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 zelong dong <zelong.dong@amlogic.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
In-Reply-To: <20230825115310.39993-1-zelong.dong@amlogic.com>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
Subject: Re: (subset) [PATCH 0/3] This patchset adds IR controller driver
 support for
Message-Id: <169442559302.3235506.15361466537260729684.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 11:46:33 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024636_497218_A3EC2C14 
X-CRM114-Status: GOOD (  11.78  )
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

On Fri, 25 Aug 2023 19:53:07 +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Meson IR Controller supports hardware decoder in Meson-S4 and later
> SoC. So far, protocol NEC could be decoded by hardware decoder.
> 
> Zelong Dong (3):
>   media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
>   dt-bindings: media: Add compatible for Meson-S4 IR Controller
>   arm64: dts: meson: add IR controller for Meson-S4 SoC
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
      https://git.kernel.org/amlogic/c/dc8bc779feb5e855421215384f23de90a4fcd622

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
