Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B695AC3DA7A
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDXXRY4uKU+xIfdUxex29UyOGgLUA4MNYonXvS1uaR0=; b=fcKKLckIBut8bs
	W+9GCK8Ie8oxexN3K8rEtfGULl596063gLbYHqx6DEFQEI4iHltcQ0+Hm2+y2wJJqTOuEUbLAqGRz
	woczuc0nmyFf0VBD24xahqcjq4dyd0tvrKN65AXcpV3X0XU+7no5zkCHqTxIkjovoR2Ku9KfJ0kU3
	LZ3BNX37uiguRZDuVb7gYuteRQoQCh1Q/J+iXl9+pJcfHtebRR69A7ddfOTG3HQv8dNkUlBfLa8om
	JZrduakXzb3FE1JJwiKrvrZG5YcW0IjLqDwxStNg4yunkfPlYm9jdAre3qDKgoEHgTbNnXmn197rb
	TpdywXXsLKpryWokAhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIBB-00APIt-AR; Mon, 02 Jan 2023 10:36:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCI8n-00AOKT-CZ
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 10:34:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso18309245wmb.3
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 02:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mgGt+WDil8dXaAkpJ8qZ0avMhy4Myb58QPGVDym6jk=;
        b=yNsiE5cnW7N2EYqUIgR6oylWXDpokhhUBC++Hyr5GSKhbbGYxxLF6AxDzhQlxgp8bB
         iP9FHXzLpMBT4+H0U+GeaOZgaqPkosrF71zTJbgP0DTCTH9Iep+XVGkqJPQ1AOwrWdKi
         gyUCqDrOD0r3EbPZfuAHfx4yVfSW0Ww1GfTy/GOP7wWX+VgUzWfWDepBAvPLMOsoNCmn
         0CJyADgaPbJFbsBqtM5gEmmtlJ+ndqG80yihZN4wiwzcNdNQv/eJbAfTVlioeKWnBQ8g
         u7Mk+2qHk6PzpoxLBm+ikqT+ux1UVPpr6X6D0Oxepk3AV8ORdC3Fqr22906Vtn31Ju5R
         mL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mgGt+WDil8dXaAkpJ8qZ0avMhy4Myb58QPGVDym6jk=;
        b=DxUm/ZDgnYN7kejRA0RSYBRwBOX0Y5+Q8+ykjcHPkqNeOOmhy9A419PMwClR6g6nEN
         VH/+5n2uZlDX5b+GHyW395A+FoLC9sPit5WQuhyYISoSOOexIJTYZPg8xtDQFEk7wFUF
         BkuhbT9/eyP9EDjn5J3O9/UvXs4GhcrLV9B90CP2LMRXcpjOZ0TsyktPCn66TNF6jjEX
         rCpG6IOR1+0bLWAL+HgHkJFYLWqpENZFTeQuAfn9hCPnQZ6N3LrFhywVQL9gdX3qwQER
         rxd1cYwvlufQpE1i4H9528M5HJ2vZ/ciaq4lzHltpER5K6ycir6XnThVedis/FduYgGg
         Vn9w==
X-Gm-Message-State: AFqh2kpHLQv7ql5OtRQpi9aH3gn/45VTU96vEwlgni44ZVPX+kWigACO
	faTj3GsMSvTwByXpWgiqk7i1wQ==
X-Google-Smtp-Source: AMrXdXtR8Zpqr1OOrcZbsXvxGi2rMh686vRDHyobS4MDPmdqNXmhUxFGkbSoZEpsVKm7yR6UFphmcg==
X-Received: by 2002:a05:600c:1e09:b0:3cf:b73f:bf8f with SMTP id ay9-20020a05600c1e0900b003cfb73fbf8fmr28237316wmb.7.1672655639818;
        Mon, 02 Jan 2023 02:33:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b003d96efd09b7sm39558447wmp.19.2023.01.02.02.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 02:33:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 italonicola@collabora.com, Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
In-Reply-To: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
Subject: Re: (subset) [PATCH v6 0/8] Support for the NPU in Vim3
Message-Id: <167265563884.375287.14738065029964626826.b4-ty@linaro.org>
Date: Mon, 02 Jan 2023 11:33:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_023401_536231_2097D19F 
X-CRM114-Status: GOOD (  14.47  )
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

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/drivers)

[3/8] soc: amlogic: meson-pwrc: Add NNA power domain for A311D
      https://git.kernel.org/amlogic/c/9a217b7e895313a4d42f7a6c48b6237a595945f4

These changes has been applied on the intermediate git tree [1].

The v6.3/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
