Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C045BCA1015
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Sep 2025 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvqztGWC+1yiWDvAMzwEb1TUWds9FTFr8ci4kIIHh1A=; b=B474fktY4bcGr8
	CP3cLhCOKMVxygWJqvl8ElQNUyK8IZ8vFmZJ2d/DZxtCxCr93MWXxm454BY1bxXaFxkCnB39Z70DE
	KPYFFk6ZqbgqbE0lsWkF7fKFnVSAx0Lw/uu8YcihVAqajqjd/BtFs0HXDm+aPBL2VmFoTb7fmOsbP
	6SF2fM6BZjTfciTkzJaB2RJXluXddrnIOs4obvhyLOp7cDseySahef17W7nxpy+vxtfAbS6sH4Ltx
	WSG7rlpEaFAM34FSB5lSlM8VkqC/2LA1kRHQUYcYxbjbx/wdASKHb/U1K4eNY6F9JW4K7V0Ee9MAo
	NeVMpJYxglphBU6pP6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCo0-0000000Culv-0794;
	Thu, 04 Sep 2025 16:27:27 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuA0t-0000000BtHT-3kfg
	for linux-amlogic@lists.infradead.org;
	Thu, 04 Sep 2025 13:28:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so7704215e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 04 Sep 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756992510; x=1757597310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vVjNlWUjUJbko6NCXNm3bP5sMvagvoIs0Rsycf+Tcfk=;
        b=qnH54Qaav/SmvPbs89HTs1LsYPxEAKYczgCl4PHBRDWY8u1iG5FGT5i7B0YkyUFx4v
         81P1LiYbQS0GObItI4yDrbP7VJlVJHiwXyXdprOMTAv2fitHYpuw9uKiN7DkEJuIeg12
         gR5bet5Q3bF9RgkADeEB7sdX3/eSXlnbnDRPDx0QhLXbA3xg+aRFVFDGKtl6oP/w+dhb
         AcFCXSCc9lIEPcQfYMPcsh7pILTdRjY8CrAs8kY0LyA9/GyCKrmLBKoFQviGRwm5pc3n
         c2wdnQx62z9mkHipai6p53+0+kI90fBk/gP3A0mTFig/I5R1ZfdhSo1P+gspYRQ1WKib
         7U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756992510; x=1757597310;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVjNlWUjUJbko6NCXNm3bP5sMvagvoIs0Rsycf+Tcfk=;
        b=kQ7DdmCVTT+h/UR1uSJCCBGgHyDWUzaOpwg8LNqsUNwmMuy0cW8heXgkivHSZDGFNx
         9IgfcHYHW+9IlsA5zR/EqGnZdreM/752nqHJyL4pN80nXn/pyANOfyD200fPyDNtSJMW
         MNsymg4Q8G9tcs6o2AsMmGsb45//HSdLK0KOPU6GPvwXj0IM4oQYXvKawr9sDk0ZSmKj
         UAC3xh5WBcSJWhY6Zqn1Xp7MsPLwiW/Eib3FLI2ej6xiZBC6R0pQN3QEpnpFxCSzEnTA
         ViZdGWkHnGpKYEBYNPQYPGmjGntMP65dNVCZNyZrFxl/grx8z4J8IUJX5unWvsaU+H/e
         CGPA==
X-Forwarded-Encrypted: i=1; AJvYcCV1yU3XUjjA3M/9dA9+YctjgcHp1qEWCYerGBj7q1JS6oFyV8jHPyNPiNZxiTuAd/DuhB6P019R2R5dR9Ww@lists.infradead.org
X-Gm-Message-State: AOJu0YyJW22HclTuWmPUDpJAbpTEFWW9sfbAEg79KW/mooU/l5/c8mEE
	774UVsp+pY71Xt6NFUsvM7cLQg9DiACINDNEc9cnxKTIRazRmejI0El1vM6ZcNcSTlsDJ5BXm1x
	nlApm1OYQkA==
X-Gm-Gg: ASbGncu2gOxoA5OVHV1u9RwxMngOWMpS+p8dskUyf2lE6pvoHqMdGzXhlU15893z1/Y
	Jm5pVmhdotW3fD/iP8WNyUp/0+SqToIaJdeJK/U7esqMGAwMKJZugcTLbZ+w2g0g3RAfnKHRaDY
	UCJAq//H4BgCFetc1r6yuovukyCkHIZyxryr0dlWdK/Zg1I4fmJROHIyUjbSFpockJIl47f/w31
	0Eb2OntdjIIzrfPYw8sfXLsFpRDGZnRXtqTeGWXsbeEjr0J+qs734Yuj1tXtVLuvtcuzElERJgk
	L/0fpJnW6XRgUhi80yJ587vE+mzvWuwWzZBvFjkZSTZ7jUpz3qFffksJkp2/CUJ8jprNYxrb87e
	4zQsjNzWmS5rD+bXaJh2wS8MKQUSW/Qet7J8g6TzLIaJhUyfVdKFyqQ==
X-Google-Smtp-Source: AGHT+IEEWnzxKzJRyT3eEFYsuorsgTXLKnfmT3YCKLi6VQxYP8ugD4yl1yHboe6tUZ8/uCLiCcnrlQ==
X-Received: by 2002:a05:600c:46c3:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b8557f254mr183701165e9.30.1756992510230;
        Thu, 04 Sep 2025 06:28:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8879cesm286165305e9.12.2025.09.04.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:28:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20250825065240.22577-1-linux.amoon@gmail.com>
References: <20250825065240.22577-1-linux.amoon@gmail.com>
Subject: Re: [PATCH v2 00/11] Add cache information to Amlogic SoC
Message-Id: <175699250964.3374853.16885676491827667777.b4-ty@linaro.org>
Date: Thu, 04 Sep 2025 15:28:29 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_062831_981106_1FF04BB5 
X-CRM114-Status: GOOD (  10.93  )
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

On Mon, 25 Aug 2025 12:21:40 +0530, Anand Moon wrote:
> Most publicly available Amlogic datasheets mention that the CPU employs
> a architecture, quad-core ARM Cortex-A53 and ARM Cortex A55 and
> Cortex-A73 and Cortex-A53 cluster, sharing a unified L2 cache to enhance
> overall system performance.
> 
> However, these documents typically omit details regarding the sizes of the
> L1 data cache, L1 instruction cache, and L2 cache.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.18/arm64-dt)

[01/11] arm64: dts: amlogic: Add cache information to the Amlogic GXBB and GXL SoC
        https://git.kernel.org/amlogic/c/d7fc05da8ba28d22fb9bd79d9308f928fcb81c19
[02/11] arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
        https://git.kernel.org/amlogic/c/fd7b48b1f91e1830e22e73744e7525af24d8ae25
[03/11] arm64: dts: amlogic: Add cache information to the Amlogic G12A SoCS
        https://git.kernel.org/amlogic/c/a4428e52babdb682f47f99b0b816e227e51a3835
[04/11] arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS
        https://git.kernel.org/amlogic/c/3b6ad2a433672f4ed9e1c90e4ae6b94683d1f1a2
[05/11] arm64: dts: amlogic: Add cache information to the Amlogic GXM SoCS
        https://git.kernel.org/amlogic/c/fe2c12bc0a8f9e5db87bfbf231658eadef4cdd47
[06/11] arm64: dts: amlogic: Add cache information to the Amlogic A1 SoC
        https://git.kernel.org/amlogic/c/2d97773212f8516b2fe3177077b1ecf7b67a4e09
[07/11] arm64: dts: amlogic: Add cache information to the Amlogic A4 SoC
        https://git.kernel.org/amlogic/c/57273dc063d5a80e8cebc20878369099992be01a
[08/11] arm64: dts: amlogic: Add cache information to the Amlogic C3 SoC
        https://git.kernel.org/amlogic/c/6d4ab38a0a21c82076105e4cc37087ef92253c7b
[09/11] arm64: dts: amlogic: Add cache information to the Amlogic S7 SoC
        https://git.kernel.org/amlogic/c/494c362fa1633bba127045ace8f0eea0b277af28
[10/11] arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC
        https://git.kernel.org/amlogic/c/e7f85e6c155aed3e10e698dd05bd04b2d52edb59
[11/11] arm64: dts: amlogic: Add cache information to the Amlogic T7 SoC
        https://git.kernel.org/amlogic/c/e97fdb9b8a0f8bd349de48815694f8a7200e3d62

These changes has been applied on the intermediate git tree [1].

The v6.18/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
