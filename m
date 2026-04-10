Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE32F459F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2026 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VwBzsYDDeTjt7xH55cP2ruHS+H4P27s4k2RgCB3d1Q=; b=AjChB+z240SE0d
	O0Ss7rEWG4ZcSD14+8w8D3cQujXZRURZBlMmSqMe0dFab5kBHvJcv9F1goAhZujIqhKSxrsRC6WUr
	hV2YPPFGVjiUiQvxUwfF0XfUzE+25fIXTgycV9Qo6XBPORNSRn37u8SqzVhtkfQj1ztB51yiDyu0e
	RAnGry2NKYdPhOtqgbXxnMajrLxJtXWWei6alws7Ee96dXZNgNcsFE7vlLVWrkgb35EpFGGctncPy
	ezAxT9SiFb1/M9+1w+nC2I4kBQBlpiKzzctNyXB1L3J3Jampy8V25E1EHWoiwPjtsRq6ns22avTRs
	FY6lx7sM7PD2CbUBrqKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFC9-0000000CaHF-0uee;
	Fri, 10 Apr 2026 16:59:01 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFC6-0000000CaGl-3QOy;
	Fri, 10 Apr 2026 16:59:00 +0000
Message-ID: <08af5c73-8558-454f-a829-4ff33b0a69c0@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1775840334;
	bh=UmZRGZba5vQQqPdfM0FaDawLz7o5OzGOJk+BR1COVAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=omrqlx+Xg6YOQIrtVlYAx7Z8vO59bI30r2+IsHyfPkI2VuOIXD7+HwY2p51MvljFd
	 g1S8R5wyk6Y9wuRUmfbKjLQxZmQCB98CH6Q96oecNg5nXZymCVBXA/bSmWVKFHf+a/
	 PBe6CYW+WssEawRAZ4ekbAjNf5kK1l4ZCEF8poxg=
Date: Fri, 10 Apr 2026 18:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260410100329.3167482-1-jian.hu@amlogic.com>
 <20260410100329.3167482-5-jian.hu@amlogic.com>
Content-Language: en-US
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
In-Reply-To: <20260410100329.3167482-5-jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_095859_011203_00755C98 
X-CRM114-Status: GOOD (  11.04  )
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

Hello Jian,

On 4/10/26 12:03 PM, Jian Hu wrote:
> Add the clock measure device to the T7 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 7fe72c94ed62..cec2ea74850d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
>  				status = "disabled";
>  			};
>  
> +			clock-measurer@48000 {
> +				compatible = "amlogic,t7-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +

Can you please order by reg, it should be between pwm_ao_gh and pwm_ab.
Thank you.

>  			sd_emmc_a: mmc@88000 {
>  				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
>  				reg = <0x0 0x88000 0x0 0x800>;


-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
