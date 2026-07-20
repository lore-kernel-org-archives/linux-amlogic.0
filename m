Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EECCC44520
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hy+pkHwGawKE7mnz19tAqV3ida8NXbVK5WWKYBr94to=; b=AeZ9m/Byj3ef2Z
	vAk660djcP6xdPbssdkloKywRmR0O240+SxuBIO4Z3PMHrhqWuICMKCH4AtUZV4Besd4CyLW3J3ui
	wqjZc2i9yy+oCKaEdhITjbFW1EcG62Y/1uduOAcm770aXCeyzJbLZWlFHGStgd7vfTckSb0M/4xG8
	R5KPqaSJpViPGLN+gxLROyRlrXqahq7jcFLM8XZeFMN/pJTC9KbIwvh8eg9jQPWixhNelJ58K8xOo
	OvdUO7q3qdnBQDx3bvJgGQxVJL/al28GdZvHPpTGxR2Goj+sWcpYSI7nfsGUFrlcOfl/yIwwt9YzF
	jlhU7sFeUrcjl3BIP/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnAA-00000006hgH-0nNc;
	Mon, 20 Jul 2026 12:32:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnA6-00000006hdr-2sBu
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 12:32:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4955de8797cso5424845e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Jul 2026 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784550717; x=1785155517; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NWr7T4d59y34KnfzO23vP7E7473Y6DR4P1HbwbXpOA=;
        b=tAbQ/FOIEay5zD81OjSMpgzPazuhMZG4o9Hd9XY176jfj4wiURwjWKs6HE5ISkI3Lw
         rbp0dxuRu9VNCjGDrWaPO2S4D2azGKuMpGlWT1rL1/Jn/Md3N9E50Lc8WoFaLukqsAJd
         CYNf0GXi3zHaUGzIkXyGR+5ZjPi7ljgBiqjtpWTVLc8nfHsRTQRAy5qQiBJY/hDb9hQH
         7xvHDKggINKVE2V8y1d/mfCFfdSB/GB4Td+s1FFLa8gowzL6YUdk41tGDUy+2KxO4w12
         IRxjdn7X9ADX3xskO98H7F2e3w0vNLUNQT4jz7C2wVKCn2ZgPHZ/kOX/gUVjRjKl4+X/
         bETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550717; x=1785155517;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NWr7T4d59y34KnfzO23vP7E7473Y6DR4P1HbwbXpOA=;
        b=PeAnCSI9cpQ1gaph23srZKnuR4D5+auJ1M36vDHQ3JHcM0laq+65K03T70VIsvt7KQ
         RVakGlcPDoPfQqMo+V2nUZyGpFfxABVMwqeYJ3xqIknJgfg8VVQ5gClAy+iHXwNk5VqH
         gYQCBEZSR2DE4s1Azazd2Bi0OzJQp2ZvNO1+9JFryilwi4+wAOLg0tGn9jNdmzYgu813
         t8IEkyimG66XGmdQbLz5uOj3Xncva5dGvWzGM9Yw5iw9df2boXJFimTopsnl2H634NOM
         Ih/n80iUetJIzFfmyrFI7m9VQOIw8B32tNsuL21baAqeznge5tOujHDJL4f5+J0cfsyt
         YsCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7TXy5+77AgOk4hMUMko9RtTiWebXq5koa19pYFkfsY0clhkHif4UJf2cJ9BgM3fGWL38jbUCORFoA50OH@lists.infradead.org
X-Gm-Message-State: AOJu0YxnXfuhO1plE/jzqPJnBEE5QhiXMVz1PlgsifF55dzMYUfUhn31
	5rh981nrGqUxSQbYxQMYykeTEnec41JLMzBWXLK6yrQ9sr9iPvro46hXYY5wt1fOqc4=
X-Gm-Gg: AfdE7cmzkchfk1XgJW3781dL44zJivEkAHqNmvowjFOYToWuEXXcTaykwvQXIcDnRNg
	KRXQxIkXa3jkgVkTDea6z7vxTW4xY4jBTF6sXYlyJpiCB7YDIIeVUsDJ0DdSoIPorn72eOxUiK4
	4MDG1g5fGmWLsXuQduOAdnbx/eASN5mpUa/sW+8vokqBi9Xxn7IJMbOfi0pzDqdf9oYeOByXI4i
	qRN4klJ0EsJVq5bAz9Pm07UxzU3SjYRBqPb/1shOdH7lZeysdl1r1GouGI2EnIL70bKzmdirGJF
	4tgt0Qx2bZhyId4454OuHln8eXta5CR6G+1ImV28hLUR3TBlUBoAUH4hTfZkXcZfXiWjgo9W+VA
	5pLKUSENccpdc5s+yvW5qg/l48sDunwnW53c0dDC5Tv9JUb1kaX5BQYh6gAlVkVHPB14RLW1bAG
	HWIyeBpSMSM8CqRXHhXxK8fSU=
X-Received: by 2002:a05:600c:630e:b0:493:e6f7:ad75 with SMTP id 5b1f17b1804b1-4954a3dc687mr158360205e9.11.1784550716629;
        Mon, 20 Jul 2026 05:31:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2692a3sm243086825e9.0.2026.07.20.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:31:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arseniy Krasnov <avkrasnov@salutedevices.com>, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH v4 0/4] arm64: dts: amlogic: meson-axg: NAND fix and
 PCIe PHY adjustment
Message-Id: <178455071586.746335.9935948018468278045.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:31:55 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_053158_745450_748E70E0 
X-CRM114-Status: GOOD (  11.89  )
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

On Wed, 24 Jun 2026 21:56:40 +0800, Jun Yan wrote:
> - Disable nfc node by default ahead of nand_rb0 pin addition.
> - Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
> - Disable pcie_phy by default to suppress probe warning.
> - Re-enable pcie_phy on S400 board to preserve PCIe functionality.
> - Enable mipi_pcie_analog_dphy for PCIe on S400 board.
> 
> Changes in v4:
> - Add patch to enable mipi_pcie_analog_dphy for PCIe on S400 board.
> - Link to v3:
>   https://lore.kernel.org/all/20260617082239.645562-1-jerrysteve1101@gmail.com/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[1/4] arm64: dts: amlogic: meson-axg: Disable nfc node by default
      https://git.kernel.org/amlogic/c/77c63ef3be3972eb3d8aac2dd36f349d78620b0d
[2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
      https://git.kernel.org/amlogic/c/45eb76f9ab6854f79690d56d04df227429a536b8
[3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
      https://git.kernel.org/amlogic/c/25ab968f7d27f46927658150bf466cac856e4f4f
[4/4] arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
      https://git.kernel.org/amlogic/c/7f1d0cc86cb70fa550163b6f70fd1d484c03218e

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
