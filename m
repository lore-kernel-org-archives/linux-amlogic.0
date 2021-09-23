Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1F5C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 12:32:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CEDF60F4C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Sep 2021 12:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CEDF60F4C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qm1mFpIvpZe/HMX6R80n/+sAgFiqd/spGsSw3B/OoUE=; b=sEWVPkYd2efAFi
	qLgETjJpkpI2joCy3ThcPbu5mMOk1W3B5CIuEbBIHQLyXtQKJjBNpTccwNrpOFuC3ho9nMTx/ujOU
	DgiiN4uxcS9QCDHxCmAl2hWLqTF+p7WlaLLBbI9RfFzEw0/03AIVRDMDq4N+pybF9B77UvKSnsm/p
	HRpe24hTBeCS2bJFKGxROt8WQ8c7bk6cmMcn3FQpxq3CLJe2qvB9zypoHZvLLo0o2iMUmewUZ/wPr
	UPoow7OqYigOUPc1W5Onm45L09nWg8/u6Vd9d6aJWG44savF4R4TWsKgU3GxONOt0bZn1v1TPavby
	JUIDWlniRyPtn/TREN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNtt-00BPoC-0K; Thu, 23 Sep 2021 12:32:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNpz-00BNlz-CI
 for linux-amlogic@lists.infradead.org; Thu, 23 Sep 2021 12:28:29 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u15so16682633wru.6
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Sep 2021 05:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=3X/0Bz3TcQZxyw6b50mGF0nqME1lbTMZ6NdXCIyuzXo=;
 b=jSZNqAHs+OjD/7w3jZCNY3F1xVfRXKrlg2nd4C82G4Afbdry99c7o8Zyo61gLwj+kM
 I9ulEN9uDswy/Ta8BGKoHv/PkcQuy/uIJBpy7kleDMCMC58z3hMPtndDViwVVe77y4JL
 Z32fp18nIFftHY8DaDBEUqQMgeofzKiFUXx+yf97nmoKGPjyZaFsMx5FIB+zRJf/hYrw
 K4Nj5CL9sgg2scb70wQ4rR/z5h1FBkxDEFtHwqGI5UejKvpPM+Ds1378MzVbil+0QFLV
 Y6bk+UojhWTiy72vBt3Rh1sHx4enwF2wphEINo7zUhT+NvLpUJ0mrhr3OqDu/uC0zlXw
 S6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=3X/0Bz3TcQZxyw6b50mGF0nqME1lbTMZ6NdXCIyuzXo=;
 b=65mmbKM2x0os1rxpjiGztFyosuv8ZDhQoGpPfahofEieDYp13osc/o3BPUVd5tCmUN
 vefPZ6jfCIJxiAP9IcfA2ICy8WbwIYzqZ5AwdkFVxsJ7ZNzLhgfNjF03ykE9XECdc3JB
 qK9eyZGki/U8scTf0qR86Kb02OKOzgghPEXnzaFWY7z6EMF5LA+uWCWp68QIKt/ZyuFl
 nnVJDJQsE9tqbOWQLfSxp7Eza7c19VkrVDzz3wggHawYgsUnbxFOhTUBNQ2d4CSEN9me
 7pR2SCg8pgw4MZn/+s+bMBjl1h3Td5FS37bn7GRTUt3QbJ8Mzq4nbfDuMFv3LlrsUBde
 DhNw==
X-Gm-Message-State: AOAM533/RRUlj9om1vGOJTAw66toRrJ9l8DHQ3TLuc7tYKNxpIIGa0pP
 xLPwf1R0PK1MqMQHlbv2PZ2LmA==
X-Google-Smtp-Source: ABdhPJyB4cN2SQ746UTsS+Xi6Z7GvzTowSRdy7xGGerq+PyWppLS9px3PcMBGb8R1+fOpatPI35AOw==
X-Received: by 2002:adf:f3ce:: with SMTP id g14mr4678787wrp.95.1632400105910; 
 Thu, 23 Sep 2021 05:28:25 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q7sm5249401wru.56.2021.09.23.05.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:28:25 -0700 (PDT)
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.6.6; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, narmstrong@baylibre.com
Subject: Re: [PATCH 0/6] clk: meson8b: video clock tree fixes and making it
 mutable
Date: Thu, 23 Sep 2021 14:28:12 +0200
In-reply-to: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jbl4jscgn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_052827_493763_D4ACA40D 
X-CRM114-Status: GOOD (  18.25  )
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


On Wed 14 Jul 2021 at 01:25, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The first two patches in this series are small fixes before we can
> actually make the video clock tree mutable. One patch adds
> CLK_SET_RATE_NO_REPARENT for better rate control and the other adds
> a missing clock gate.
>
> The third and fourth patch are targeting the HDMI PLL. Add the known
> working M/N combinations. Also this PLL has some special "doubling"
> setting, which is calculated like this:
>   OUTPUT = (IN * M / N + FRAC) * 2
> Since not all register bits are known we use a copy of the 2970/2975MHz
> magic register values from the vendor driver.
>
> The fifth patch makes the clocks in the video clock tree mutable. The
> final patch in this series exports the clocks needed for rate control.
>
> For reference, this is the .dts definition for the Meson8b VPU. The
> code for the VPU driver is unfortunately not ready for upstreaming yet.
> However, I have tested with all resolutions my monitor supports and the
> clock settings are all applied correctly.
>     vpu: vpu@100000 {
>       compatible = "amlogic,meson8b-vpu";
>
>       reg = <0x100000 0x10000>;
>       reg-names = "vpu";
>
>       interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
>
>       amlogic,canvas = <&canvas>;
>       amlogic,hhi-sysctrl = <&hhi>;
>
>       /*
>        * The VCLK{,2}_IN path always needs to derived from
>        * the CLKID_VID_PLL_FINAL_DIV so other clocks like
>        * MPLL1 are not used (MPLL1 is reserved for audio
>        * purposes).
>        */
>       assigned-clocks = <&clkc CLKID_VCLK_IN_SEL>,
>                         <&clkc CLKID_VCLK2_IN_SEL>;
>       assigned-clock-parents = <&clkc CLKID_VID_PLL_FINAL_DIV>,
>                                <&clkc CLKID_VID_PLL_FINAL_DIV>;
>
>       clocks = <&clkc CLKID_VPU_INTR>,
>                <&clkc CLKID_HDMI_INTR_SYNC>,
>                <&clkc CLKID_GCLK_VENCI_INT>,
>                <&clkc CLKID_HDMI_PLL_HDMI_OUT>,
>                <&clkc CLKID_HDMI_TX_PIXEL>,
>                <&clkc CLKID_CTS_ENCP>,
>                <&clkc CLKID_CTS_ENCI>,
>                <&clkc CLKID_CTS_ENCT>,
>                <&clkc CLKID_CTS_ENCL>,
>                <&clkc CLKID_CTS_VDAC0>;
>       clock-names = "vpu_intr",
>                     "hdmi_intr_sync",
>                     "venci_int",
>                     "tmds",
>                     "hdmi_tx_pixel",
>                     "cts_encp",
>                     "cts_enci",
>                     "cts_enct",
>                     "cts_encl",
>                     "cts_vdac0";
>
>       resets = <&clkc CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_PRE>,
>                <&clkc CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_POST>,
>                <&clkc CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_PRE>,
>                <&clkc CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_POST>;
>       reset-names = "vid_pll_pre",
>                     "vid_pll_post",
>                     "vid_pll_soft_pre",
>                     "vid_pll_soft_post";
>
>       power-domains = <&pwrc PWRC_MESON8_VPU_ID>;
>
>       nvmem-cells = <&cvbs_trimming>;
>       nvmem-cell-names = "cvbs_trimming";
>
>       #address-cells = <1>;
>       #size-cells = <0>;
>
>       #sound-dai-cells = <0>;
>       sound-name-prefix = "HDMITX";
>
>       /* CVBS VDAC output port */
>       cvbs_vdac_port: port@0 {
>         reg = <0>;
>       };
>
>       /* HDMI-TX output port */
>       hdmi_tx_port: port@1 {
>         reg = <1>;
>
>         hdmi_tx_out: endpoint {
>           remote-endpoint = <&hdmi_tx_in>;
>         };
>       };
>     };
>
>
> Martin Blumenstingl (6):
>   clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT for vclk{,2}_in_sel
>   clk: meson: meson8b: Add the vid_pll_lvds_en gate clock
>   clk: meson: meson8b: Add the HDMI PLL M/N parameters
>   clk: meson: meson8b: Initialize the HDMI PLL registers
>   clk: meson: meson8b: Make the video clock trees mutable
>   clk: meson: meson8b: Export the video clocks
>
>  drivers/clk/meson/meson8b.c              | 163 +++++++++++++++++------
>  drivers/clk/meson/meson8b.h              |  26 ++--
>  include/dt-bindings/clock/meson8b-clkc.h |  10 ++
>  3 files changed, 143 insertions(+), 56 deletions(-)

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
