Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE981C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJxUC6duJ0qMsJVCm0A+cVQ9XHDVl01KCWHIZlPvr3g=; b=JPQ7u61P8V3UwB
	SPwmZ+tJnxxl3/qAK5QCWH40JvJTOamlMBDKhJXPtE81vp7R2rDBE/4Zob7xv8vs8nNbQ1gKY2KOF
	tyjJHKwY5Ded0VO0SUYDUW4o5KnmnNqv4QgOoPyI9HTSv3Mnnb8VdGiICtGAVhgW9B1n9yZjUHP9k
	YVTaMKWGoTLvWPaY3r0EIdt1SDD+3PvIGwQNXChhrtvSpGkQFIRr7V95QntobltFHUE2ZajIkI3EV
	ROAVLNCc7HFTf/AF7E/WWnHh+SquD14Dp43/p/1c2XY+FV1gU4n/31dhyJlXXQjhSkFV5wRI3OwWR
	gUQGtIlcuHNfuRrOmHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8VYB-00AMhw-JK; Fri, 14 Jan 2022 23:00:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8VY8-00AMgq-8L; Fri, 14 Jan 2022 23:00:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 809D9B82595;
 Fri, 14 Jan 2022 22:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285ADC36AE7;
 Fri, 14 Jan 2022 22:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642201197;
 bh=pinsoFsBLJXMxhqrkwnb4NPQ5Tui8gvxNk7tIaJK/Tk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=en8/v75YdOTH0qUlFjNBsBJ320M/eAFBm5gcn+8I4NI4i7sQ40mmWfu/us8knqbCq
 f3c7sTQxhqnbRJBbJX2VN8RySqfW+4Q4sdKMfeEbgdM40L5U9fXn+xvYV2WyUGiNaA
 qJom3wy5rnh91yxHR096Kbav8YaAo/sVJ522qCqkP7YRTAGmADNQ7rXOquZRl4xQGk
 mRxP1/0B8ZNALrVe9cLnkQEWRGHCWkzeC1Jbi8Gkgg9/1lC0kcw1VuOkz/RDiqLERR
 gT2lY1LLBEHplGVPC2flRPnXnAuSBlfGie52mXlGRxeaaJblWt72BMZl9pT0vU91Uj
 G58lcF6f6R/Yw==
MIME-Version: 1.0
In-Reply-To: <5d99ac02-a246-5bcc-2ecb-371b0d193537@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-4-liang.yang@amlogic.com>
 <20220113212957.768FFC36AE3@smtp.kernel.org>
 <5d99ac02-a246-5bcc-2ecb-371b0d193537@amlogic.com>
Subject: Re: [PATCH v9 3/4] clk: meson: add DT documentation for emmc clock
 controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Date: Fri, 14 Jan 2022 14:59:55 -0800
User-Agent: alot/0.10
Message-Id: <20220114225957.285ADC36AE7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_150000_594774_07DE2ABC 
X-CRM114-Status: GOOD (  18.32  )
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

Quoting Liang Yang (2022-01-13 19:06:07)
> Hi Stephen,
> 
> Thanks for your quick response.
> 
> On 2022/1/14 5:29, Stephen Boyd wrote:
> > [ EXTERNAL EMAIL ]
> > 
> > Quoting Liang Yang (2022-01-13 03:57:44)
> >> Document the MMC sub clock controller driver, the potential consumer
> >> of this driver is MMC or NAND. Also add four clock bindings IDs which
> >> provided by this driver.
> >>
> >> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
> >> ---
> >>   .../bindings/clock/amlogic,mmc-clkc.yaml      | 64 +++++++++++++++++++
> >>   include/dt-bindings/clock/amlogic,mmc-clkc.h  | 14 ++++
> >>   2 files changed, 78 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
> >>   create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
> >> new file mode 100644
> >> index 000000000000..a274c3d5fc2e
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.yaml
> >> @@ -0,0 +1,64 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/clock/amlogic,mmc-clkc.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Amlogic MMC Sub Clock Controller Driver Device Tree Bindings
> >> +
> >> +maintainers:
> >> +  - jianxin.pan@amlogic.com
> >> +  - liang.yang@amlogic.com
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - "amlogic,axg-mmc-clkc", "syscon"
> > 
> > Why is it a syscon?
> 
> The register documented by reg is shared with SD/eMMC controller port C, 
> and it need to be ops on NFC driver.
> 

Is this the case where the clk is inside the SD/eMMC controller? Can the
mmc driver register the clk controller from there and pass it an iomem
pointer to poke clks?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
