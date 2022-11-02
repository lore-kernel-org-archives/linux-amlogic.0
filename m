Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A11C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6BMKKKRohySZOLkvOxidY+VbsWOp8NrDVUkAvawIrs=; b=KYn8BsirB7aMxM
	Ou1pAUj8gTw9CCfqsKOdwzrVnz/nZgB29Nv5JVVsB5v5pkCfucf8TOZ9a3VIG/3l8T85wVyGjXDCV
	rdcMBjnCBfQyscpzHv3saDaAHqskd1J9cG7Ym1NaFw9UmzNKbynZBg/jco1YmYogA43/Ke2pMnZ5m
	sUzuttgtxumeJJgQX+edQ79BZNynUzBJ8AsZQBN1HsGT1b9m4R8v006jKRuzqQpWdXNmoWIpDw8hY
	hA/3NTFvQCFuTtxBz9Y6lvG0gbDdfkcPnM3Z4jgBmWM/iuMKPfKSA3Th05mHV30dRHJfwYruUeF0t
	ngu53MVzmiOgNBF8xrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqEmZ-00BWAq-Iu; Wed, 02 Nov 2022 14:31:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqEmW-00BW9v-5k; Wed, 02 Nov 2022 14:31:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B05BD619BF;
	Wed,  2 Nov 2022 14:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21348C433B5;
	Wed,  2 Nov 2022 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667399510;
	bh=pn4Onsc7GZIXH8zAj7BbT2KcypGggk8396m6IL8/CLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l9vTpgH+Bm5HpFsamvgWpvMdEi6LuNCfd/+08VDvSnxjbQ8mGuQfh13mWTwmbsltM
	 ukUPe15dcsVQ2rUPoq4lMPgGAqHzhKcA48HgJix0GFXCwwRExW3yCkCXJ/yn8dXOWc
	 R8794EQozOzZKnh244x7s8JxuvIHQX2eVrkzH1sJqx9w7BiG939oDcefd2JlRGL5g7
	 FbZX47wisMNzYtrZ1S8uRMsKS9oVWTJfLCxkYZPIjDR4MRGpS60BtU9Cux3Hpr2TYF
	 Ys4NMtt0yYZGCSEljh4NZKZF5S79FkZokITLBH7FvbvauCdu0ggcwQuzfSJJZCLXXN
	 9XWN6QO/W4iBQ==
Received: by mail-lf1-f50.google.com with SMTP id b2so28526834lfp.6;
        Wed, 02 Nov 2022 07:31:50 -0700 (PDT)
X-Gm-Message-State: ACrzQf0eQ/V2t01QsB91SdCBqGLBvlI4FetLo4W4Zo/Ehr3P4ywpKCgF
	BxkDx1Vms8ggXyxNL1K+hCp83a4vhEV2URcjAg==
X-Google-Smtp-Source: AMsMyM46H70Q6ilb5d7i2/vY+7lKHic4+n4KcEvasPFdEhFQD8mP+FYgt+mVXGv60R0ZlQXW5IBmlkKeM+9qvjro/QM=
X-Received: by 2002:ac2:4c03:0:b0:4a2:2273:89c6 with SMTP id
 t3-20020ac24c03000000b004a2227389c6mr8745771lfq.245.1667399508109; Wed, 02
 Nov 2022 07:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20221031091918.531607-1-pierre.gondois@arm.com>
 <fac3eae5-687e-9eb0-ddfb-c659d3816d81@linaro.org> <3c54db0a-44fe-ee24-1833-7637e249ec79@arm.com>
 <CAFBinCBi_xT-pgdMSROHyZUfyZZE33S2YXczr9ijE52AfQVYHQ@mail.gmail.com> <CAL_JsqJMxH9hFo7uXRJ6rFcqhZL0AUhedk7Fq1xMdKcSDe5ciQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJMxH9hFo7uXRJ6rFcqhZL0AUhedk7Fq1xMdKcSDe5ciQ@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 2 Nov 2022 09:31:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLnmDDPpFOcRSv9qEm5nphskhUvQFiKCFkZ6+KGtZLXJQ@mail.gmail.com>
Message-ID: <CAL_JsqLnmDDPpFOcRSv9qEm5nphskhUvQFiKCFkZ6+KGtZLXJQ@mail.gmail.com>
Subject: Re: [PATCH 02/20] arm64: dts: Update cache properties for amlogic
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Pierre Gondois <pierre.gondois@arm.com>, neil.armstrong@linaro.org, 
	linux-kernel@vger.kernel.org, Rob.Herring@arm.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_073152_337142_52612980 
X-CRM114-Status: GOOD (  19.84  )
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

On Mon, Oct 31, 2022 at 5:19 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Mon, Oct 31, 2022 at 4:09 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Pierre,
> >
> > On Mon, Oct 31, 2022 at 2:33 PM Pierre Gondois <pierre.gondois@arm.com> wrote:
> > [...]
> > > To avoid cc-ing people to DTs they are not related, the get_maintainers.pl
> > > script was run on each patch individually. The cover-letter is at:
> > > https://lore.kernel.org/all/20221031091848.530938-1-pierre.gondois@arm.com/
> > I think Neil's question is the same as mine: is there a dt-bindings
> > (yaml schema) change for this as well? The idea is to alert people (or
> > let bots alert people) in future when adding a cache to a .dts{,i}
> > where the cache-level property is missing.
>
> There's not one, but it's something to look at adding. I'm not sure
> how we'd check for missing 'unified-cache' which is a common problem.
> The challenge here is a lot of what needs to be checked is based on
> the overall structure. This probably is better checked in dtc which is
> better suited to do cross node checks.

Now there is an improved binding:

https://github.com/robherring/dt-schema/tree/cache-rework

With that schema and this series applied, I get the following errors:

arch/arm64/boot/dts/socionext/uniphier-ld11-global.dtb: l2-cache:
'cache-level' is a required property
arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: l2-cache0: 'cache-level'
is a required property
arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: l2-cache1: 'cache-level'
is a required property
arch/arm64/boot/dts/mediatek/mt8186-evb.dtb: l3-cache: 'cache-level'
is a required property
arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: l2-cache0:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dtb: l2-cache:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dtb: l2-cache0:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-ld20-akebi96.dtb: l2-cache1:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-ld20-global.dtb: l2-cache0:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-ld20-global.dtb: l2-cache1:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dtb: l2-cache0:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dtb: l2-cache1:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-pxs3-ref-gadget0.dtb: l2-cache:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-pxs3-ref.dtb: l2-cache:
'cache-level' is a required property
arch/arm64/boot/dts/socionext/uniphier-pxs3-ref-gadget1.dtb: l2-cache:
'cache-level' is a required property

Cases missing 'cache-unified':

arch/arm64/boot/dts/amazon/alpine-v3-evp.dtb
arch/arm64/boot/dts/arm/corstone1000-fvp.dtb
arch/arm64/boot/dts/arm/corstone1000-mps3.dtb
arch/arm64/boot/dts/arm/juno.dtb
arch/arm64/boot/dts/arm/juno-r1.dtb
arch/arm64/boot/dts/arm/juno-r1-scmi.dtb
arch/arm64/boot/dts/arm/juno-r2.dtb
arch/arm64/boot/dts/arm/juno-r2-scmi.dtb
arch/arm64/boot/dts/arm/juno-scmi.dtb
arch/arm64/boot/dts/broadcom/bcm2711-rpi-400.dtb
arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb
arch/arm64/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb
arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-a-plus.dtb
arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dtb
arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b-plus.dtb
arch/arm64/boot/dts/broadcom/bcm2837-rpi-cm3-io3.dtb
arch/arm64/boot/dts/broadcom/bcm2837-rpi-zero-2-w.dtb
arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb
arch/arm64/boot/dts/exynos/exynos5433-tm2e.dtb
arch/arm64/boot/dts/exynos/exynos7-espresso.dtb
arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dtb
arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3-rev-a.dtb
arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dtb
arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dtb
arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb
arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dtb
arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb
arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dtb
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dtb
arch/arm64/boot/dts/freescale/imx8mm-ddr4-evk.dtb
arch/arm64/boot/dts/freescale/imx8mm-emcon-avari.dtb
arch/arm64/boot/dts/freescale/imx8mm-evk.dtb
arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-ctouch2.dtb
arch/arm64/boot/dts/freescale/imx8mm-icore-mx8mm-edimm2.2.dtb
arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dtb
arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-osm-s.dtb
arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dtb
arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dtb
arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dtb
arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dtb
arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw71xx-0x.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx-0x.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7903.dtb
arch/arm64/boot/dts/freescale/imx8mm-venice-gw7904.dtb
arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dahlia.dtb
arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-dev.dtb
arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dahlia.dtb
arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-dev.dtb
arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dtb
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dtb
arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dtb
arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dtb
arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dtb
arch/arm64/boot/dts/freescale/imx8mn-evk.dtb
arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dtb
arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dtb
arch/arm64/boot/dts/freescale/imx8mn-venice-gw7902.dtb
arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb
arch/arm64/boot/dts/freescale/imx8mp-evk.dtb
arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb
arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s-ep1.dtb
arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb
arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb
arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb
arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb
arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb
arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb
arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb
arch/arm64/boot/dts/freescale/imx8mq-evk.dtb
arch/arm64/boot/dts/freescale/imx8mq-hummingboard-pulse.dtb
arch/arm64/boot/dts/freescale/imx8mq-kontron-pitx-imx8m.dtb
arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb
arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb
arch/arm64/boot/dts/freescale/imx8mq-librem5-r3.dtb
arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dtb
arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dtb
arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb
arch/arm64/boot/dts/freescale/imx8mq-phanbell.dtb
arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dtb
arch/arm64/boot/dts/freescale/imx8mq-thor96.dtb
arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb
arch/arm64/boot/dts/freescale/imx8qm-mek.dtb
arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dtb
arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dtb
arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb
arch/arm64/boot/dts/marvell/armada-7040-db.dtb
arch/arm64/boot/dts/marvell/armada-7040-mochabin.dtb
arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dtb
arch/arm64/boot/dts/marvell/armada-8040-db.dtb
arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtb
arch/arm64/boot/dts/marvell/armada-8040-mcbin-singleshot.dtb
arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dtb
arch/arm64/boot/dts/marvell/cn9130-crb-A.dtb
arch/arm64/boot/dts/marvell/cn9130-crb-B.dtb
arch/arm64/boot/dts/marvell/cn9130-db-B.dtb
arch/arm64/boot/dts/marvell/cn9130-db.dtb
arch/arm64/boot/dts/marvell/cn9131-db-B.dtb
arch/arm64/boot/dts/marvell/cn9131-db.dtb
arch/arm64/boot/dts/marvell/cn9132-db-B.dtb
arch/arm64/boot/dts/marvell/cn9132-db.dtb
arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dtb
arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dtb
arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dtb
arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb
arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb
arch/arm64/boot/dts/tesla/fsd-evb.dtb
arch/arm64/boot/dts/ti/k3-am625-sk.dtb
arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb
arch/arm64/boot/dts/ti/k3-am642-sk.dtb
arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb
arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb
arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb
arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb
arch/arm64/boot/dts/ti/k3-am654-base-board.dtb
arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb
arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb
arch/arm64/boot/dts/ti/k3-j721e-sk.dtb
arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb


Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
