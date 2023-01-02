Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C536C46467
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SecOfTW2KKI4qhuk2Jk4k8+UacpGr8Buw/E+NSvEhLE=; b=h20MiroFK3Kbxw
	8LpvqwXPhHyGJTF0OGHzF1UprHxvg5TMazOt6oUp46qtY9CoBf7GJBCxUR7XwLnuSniR++kve7j+6
	l2bjr8U9QB96eQL4eLiIpYhadHKToCpTQPy3dyfEKRCVr37g4EbkY0UCqxGJM0uTtShCRgK8piW2Z
	Od9vT4wzjd8BmSUqX2YEWwXTYEpOMg9JgzwMIDi9RoSHOioA7gdQIVlmI89MXREmt/P8RKBJD7EGf
	EJUcPGc5XaDZ8lQDpRW7yTNFmflG+xnMF1G0M7MU9dN6NFahoUJB5vljOvgH3cN9iNYGq4U5NM0+v
	41ReuPtFdG0HKUaG5W5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIEY-00AQhH-5A; Mon, 02 Jan 2023 10:40:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIEO-00AQbu-Fp
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 10:39:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y8so25930920wrl.13
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN3FpV1I7tFu/Kpha9CDnNvHD7KVpRjqtfkjCmVPUO0=;
        b=CakuEVBcyWpVCHtq/gK0WL8H5kopdxqYu/fVo/dM+vHh1V8sZ+azV8nsGYLtljTXD/
         Jan0bb1u2z6DBTbYgWOe3F3oWRQkEXTN7ztpNDX9uesOCbQwTs9b9Gy1XnACehMALSO9
         epAapZem3wE9CprqWtC4EIdMuPaKyykdTAI9wvrGR8ecRb9OdNyNT5dW/mHVs/l8/LEX
         vzsBl2x2BPr3Ifx3ZZcZZBGkUw1+odEJ4t+2weznXeuIh+RfNJcTOzij+gzqWzQ3DqQR
         wh88hwAqkaRW9U7tYi3O+oxdt5Q5UAigMXZtSxG5GVpOOl3XSzR82YsrFvWlDDt7UISs
         7Yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN3FpV1I7tFu/Kpha9CDnNvHD7KVpRjqtfkjCmVPUO0=;
        b=yau3ir2zTOdSg02rwkxyQJIRSIz0vhaFx8pYdHj5TF7xOkf+nLW4zFOacyoJkUP+Zv
         X2gMm8dd6c4k/8LxvEx3tTgBilLUScIXre1Z9v7VhmosZqKZPYb/O6UlogK+eX25LfpJ
         UvTw2ez54f7APVMJm/5uT4XjGhNCzzAf7TGjy/wbs33Hlssmdfsfl35y240okbp6aVeS
         Kg/wF/h1BVXKaEHy2QuVSJshBEfTUJM/2zZY6MTSv0IqfFltEEZ48IKTNCT0tImAOeAt
         1AzHdYZx5FMWwR03munGxJigXtnpbKuzvM8iVdMM0NzpjMd8DWW4j07oZekDujiTMQSj
         8nAQ==
X-Gm-Message-State: AFqh2kq3qfsFwGgiM6Nqxt/gJUrj51+JAVCE04H1LW/eP59ONi+mU4Ir
	2zodT79ueNFNXqkzUxjJ0Wlbug==
X-Google-Smtp-Source: AMrXdXvJmLCCviOiLhVE2Fn/tGQ7qfOD6ZJjjx6/aj9+9AjFtmpkJtNmUE2jJpa+634KcFkd2p2Kuw==
X-Received: by 2002:adf:f243:0:b0:26d:798f:ab8a with SMTP id b3-20020adff243000000b0026d798fab8amr22489628wrp.68.1672655986705;
        Mon, 02 Jan 2023 02:39:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r14-20020a5d4e4e000000b002549b649b62sm27810881wrt.50.2023.01.02.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:39:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv@lists.freedesktop.org>, Kevin Hilman <khilman@baylibre.com>,
 "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, italonicola@collabora.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, David Airlie <airlied@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265598564.387036.9948295692448105822.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:39:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_023951_083158_06664013 
X-CRM114-Status: GOOD (  14.76  )
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

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[4/8] arm64: dts: Add DT node for the VIPNano-QI on the A311D
      https://git.kernel.org/amlogic/c/18b542e544d3bd00e55d7135ee673b34dbfdb9b9
[8/8] arm64: dts: Fix NPU power domain references in Amlogic G12-based SoCs
      (no commit info)

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
