Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3863C761A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDzVb3yXOVoUtrpKu85iKYw3VKgtINHHjCIMF+WgmnU=; b=U/5GB1mI6Jb5wM
	hjO72mi/EfgQrJlVZTmRDxCkXCk4nZFyAmoJcHwuYIun3IiftNsknMVFj+VhrckJkSkbQBrif32S1
	sqc+8eit8JBGEMEVlbZ2KV7T948D2npmDEeWes6x1wkzSH2PmntSZflmdNtrmCQR6d1e8OnrC50fs
	WQ3h15bO9j+oiJg8YasmybmirhICtlD2/cToEVYKC+BI2MFk4//lzGlgKzoFeQZKdDUbZ4f2Z3P+A
	0e1vxecV2uDuzgvEefQpdP/+l+Il2+jOhIJQ0iiiAtu8b2YvO/VYbzjw6XCZblwz5oXOE/ORS5T8a
	8q39CrKepUzhgPqVV5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmDa-00AzZt-0o;
	Mon, 27 Mar 2023 12:44:58 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgmDX-00AzYA-0p
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Mar 2023 12:44:57 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 2A3772003C1;
	Mon, 27 Mar 2023 14:44:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1679921088;
	bh=v7pcs8LXutW1j04pLxqMujM71BjU3pgL8w+MHQBQnGw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uqGfHSE271am0CHoa+CBB/L7Q0bNf9n9fkxuJMdIuiWlozT2LTz+Th8jQ50fMhkbN
	 50Uf3+NnPOb/Ab553pGYIwT2mAsUJ77CBTn+QcsF4Nv1EaIQ4VBvkkYzfjHr1+s42G
	 gAlKlcRq6Ror6dShFfjzAVrPS3rhr6Qnkr2Te1CNaJeqMygtHki6BknR6Pn/MTpsPd
	 oBgabM+5f6JHxfNSm/2x1mF7LZNNFxP18A+YvlsC8G7iqN7xab0X/ov3AK6Ju7tPXT
	 3tmeIhOdXprlGMjZOwRwTPvqtTFMzh5khf6lI84f042GFEBAX/KAZV4qY1PAT/xnF8
	 oLSBw/gWNlRTw==
Message-ID: <2887b454-ecc2-0fea-1a3f-7493d78c7580@free.fr>
Date: Mon, 27 Mar 2023 14:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/3] perf/amlogic: resolve conflict between canvas &
 pmu
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Pierre-Hugues Husson <phh@phh.me>, linux-amlogic@lists.infradead.org
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
 <20230327120932.2158389-3-mgonzalez@freebox.fr>
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <20230327120932.2158389-3-mgonzalez@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_054455_738472_A82DE713 
X-CRM114-Status: GOOD (  11.57  )
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

In the patch Subject,

s,perf/amlogic,arm64: dts: meson-g12-common,

Regards

On 27/03/2023 14:09, Marc Gonzalez wrote:

> According to S905X2 Datasheet - Revision 07:
> 
> DMC_MON area spans 0xff638080-0xff6380c0
> DDR_PLL area spans 0xff638c00-0xff638c34
> 
> Round DDR_PLL area size up to 0x40
> 
> Fixes: 90cf8e21016fa3 ("arm64: dts: meson: Add DDR PMU node")
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index a5653ab1f0b43..1aab65bb5f578 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1585,6 +1585,12 @@ canvas: video-lut@48 {
>  					compatible = "amlogic,canvas";
>  					reg = <0x0 0x48 0x0 0x14>;
>  				};
> +
> +				pmu: pmu@80 {
> +					reg = <0x0 0x80 0x0 0x40>,
> +					      <0x0 0xc00 0x0 0x40>;
> +					interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> +				};
>  			};
>  
>  			usb2_phy1: phy@3a000 {
> @@ -1710,12 +1716,6 @@ internal_ephy: ethernet-phy@8 {
>  			};
>  		};
>  
> -		pmu: pmu@ff638000 {
> -			reg = <0x0 0xff638000 0x0 0x100>,
> -			      <0x0 0xff638c00 0x0 0x100>;
> -			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> -		};
> -
>  		aobus: bus@ff800000 {
>  			compatible = "simple-bus";
>  			reg = <0x0 0xff800000 0x0 0x100000>;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
