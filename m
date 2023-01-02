Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFED8C46467
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWSQuVc/VCEj6q33FxaZTd/Yc7RbaXVzgdMvf85Ia8g=; b=lT31RkhNQ5ee20
	11nboBfiHRI2wJukA+p+Z4m/YG3tYaHz4Pdceb40pDL78XMRSCEelq8N34CqGKLYpNbhNSITuDQbS
	Xyd3zpLNBwO44qldP3vfLm0o74E3vhCi+u6/Agi+j+I/HIpRtJ4jY/Q+Yewbq/3QDbss0ll8Hj4Uk
	xQXN2UHKcLYadf7cX92Yv76Ix7WO013+VRHBXtGIvmPOmuUG7xRN84rP1htkhut+El4skUpGFHej5
	EAYdBE7FsQfG5KO6AoZ6N6lZR7x2qPbWLIl21SfvTXL8F6qa+33HiXzbtLepDfJJuwhUBIz8v7ULJ
	ZMcPN7ax1gJbc5T9198Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCI5U-00ANOy-35; Mon, 02 Jan 2023 10:30:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCI52-00ANFV-LI
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 10:30:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id az7so1533390wrb.5
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 02:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3pnp00fAFbCsjrwHeYydTcNOrlFzBbyWXdERp2QJas=;
        b=nDp7cO36WKjes1Izcci1OZT/KlGLELLQ9Al9dmcUPZK1X1kRSyE+4XNsVd+fPNdoo6
         Q2753XPoSR3z6VUXYvNp1a0u5NLVEQayrD4YTdAtQVE3iT9+VXEqV4/OUY5s515JHQlp
         IpFIZLQ4VSKcorsvXHH+dTvXyOHYHSRpzXwkuvZPpL071MfrczEg+55sFkN8o59Ico3J
         PAfoWUI60jYkusOv0KBtsrok/CgbzkUQ9zTXcYXjrfEilpy8+aqkc4fMfrBE237c9DVb
         g5rieZWGpAk3GUNI7momneQNCf54Vq67nrXds/J4B1QFHqd1b3wI2mSYUKEHAdfJGXlZ
         8JwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o3pnp00fAFbCsjrwHeYydTcNOrlFzBbyWXdERp2QJas=;
        b=O8lQkrHQraqBmCYlJyeT6UcwdiqYgJn6YsKRbBZxqX/Iz+9vJKQf6krX7SaikGwz20
         JGHDEBporu++QdFsO5cx3y324gKwCZKLXLszwDyfjd5/rst6oXuC14MXwOlm2n3EutkK
         VSkUkq9p++WlTjWjYWPytofOJJa+4o2VCf87/MWEdxyJ77JLNUxiPOZ/VC/vhIGQjHW7
         F059Hk4p5VlrxC+/sYXfoNVjp2MPs9pqEaYBgfGCPWhkIkL/js8s/wuv+bmIezCpAhY5
         ru9jJXnz/WHynsD+wnl4QWtrfKRbntC/J56Hce43YuuxHf1ku3v4OGC1XArm+Vdo0frT
         5dqQ==
X-Gm-Message-State: AFqh2kqzkI/zdshB+enk/DFq6whtMQt6GRYZ3+PfRELCh3GV1k0n0Fmd
	jaY3l4h+ABIQkFvCsKik6CAfQhhpTnjCXxDm
X-Google-Smtp-Source: AMrXdXu3JhHyb5jnLxTpAVovV90esQPMUhxrIbYN2ov3dmss4CzYWAETVnJ3KJrM+Cv2iPnI6yfXUA==
X-Received: by 2002:a5d:624d:0:b0:242:4d70:7882 with SMTP id m13-20020a5d624d000000b002424d707882mr24814292wrv.15.1672655407012;
        Mon, 02 Jan 2023 02:30:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d594a000000b0028663fc8f4csm15263318wri.30.2023.01.02.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:30:06 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv@lists.freedesktop.org>, David Airlie <airlied@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 italonicola@collabora.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Vetter <daniel@ffwll.ch>, Russell King <linux+etnaviv@armlinux.org.uk>, Jerome Brunet <jbrunet@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265540588.368935.8530142567394825177.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:30:05 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_023008_826636_5361DEA3 
X-CRM114-Status: GOOD (  14.17  )
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

On Fri, 2 Dec 2022 12:52:12 +0100, Tomeu Vizoso wrote:
> This series adds support for the Verisilicon VIPNano-QI NPU in the A311D
> as in the VIM3 board.
> 
> The IP is very closely based on previous Vivante GPUs, so the etnaviv
> kernel driver works basically unchanged.
> 
> The userspace part of the driver is being reviewed at:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/bindings)

[1/8] dt-bindings: reset: meson-g12a: Add missing NNA reset
      https://git.kernel.org/amlogic/c/a439267609f9d57b15991c55550956d7cc5404d8
[2/8] dt-bindings: power: Add G12A NNA power domain
      https://git.kernel.org/amlogic/c/340ea839b4306335bd627fe0dd6789df803aef58

These changes has been applied on the intermediate git tree [1].

The v6.3/bindings branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
