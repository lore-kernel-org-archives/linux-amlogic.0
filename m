Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE0CC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 14:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCA42082F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 14:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jDJM0Dn4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F9JB56gr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFCA42082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MuZdPKkHRhheIOVixKUyS6oJIsOXCws59wi8J/aD7k8=; b=jDJM0Dn4PpmkOH
	s1hg/lvWboF7dG4qP5ULHWogyQtdcPgxYI5qYQQo59xXET/yQodNUAarYjPkn6EKGAzFWkgukMFvu
	6720Pk1UkEujQDsp79yqzwFhQ1r14tS0gymt1XuyeM3y5Ii4nrWREYsJw+xggm9UDEdpMW02RamKG
	IX4K+nT4HJfDnRp/TeFCbfKNE285yIWe4QW/sUOFJdi3uebzcS8jXZxycZz1/UyKGpeDYrWLqgjYv
	CsRkBqObk3Px33/PXUmPDzF2vMO21bJ1DoWLCqsLX5efhsLL7T5Lc5w05f/PzXSpRsqwBAYe0B/2k
	2w2ImUX76i4e+jYW3uqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTowF-00017N-1Q; Mon, 03 Dec 2018 14:11:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTowB-00016k-2C
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 14:11:05 +0000
Received: by mail-wm1-x344.google.com with SMTP id z18so5982401wmc.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 06:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=zZLk8OmqJ8tdp8dvej57iykCxTP7RI8TbT8Mq/Ra6EE=;
 b=F9JB56gr0Mba7VFYiPL2xBI3z+b3JiIo3uXGrjdemRF5odFNmVOmlJY7JcczKVTy+L
 NAwKvNpnznsu3bDTXmm1nxN2XM89sYHGDvThaUhsueFi0TU+Xb3bCGFU5NL6awNoqafi
 a/+8DabGJf1f2zqlSM7MAV4n3ucpbgSrVSj7+ed1O/AVs0tzSBh2j8N/+73iYewnwJrJ
 LAnd5UBpgUPrM2PNk9PqG7ruV0/rKcYopF1kApF67npX3JWmdixuIvHGYfkxy3M83NHf
 CZWNzq2CYa7NegY+liAY+7N9I61gAOmAEvXYusPQS7UfqRFehbSB1czSSszeA/tZWhLN
 tMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=zZLk8OmqJ8tdp8dvej57iykCxTP7RI8TbT8Mq/Ra6EE=;
 b=fEvcvBnteNDM09vaG4Nc+4hjGC1RDRrpduLUOKM9eF58TwF8IXxASngvEFaos7JfA8
 b1/FaFvfQ9CZJvSAzJe5OoCrujUslVtooUQFghT5Sc8COYYH72VY8oekjgQ0V7zn4vZz
 AA4mdAh7RZ53fTLdsKGnhJavvWTwUg1FbjPgxJrmoKfLFNpbWqAdq3nqdia/maW6gWX8
 JqWt79A9JvVhIGVmglBtmYJU0bTGTujUZetknG7MYEd3zxWClKsg9m+Z9dB3ia+oLOL0
 ggmFwI96VZDpPBizVFaS6p3QpbTrfkxhkTm+unhQbl78s7TeGQItLxBe41B2z1gKqgPN
 XGcw==
X-Gm-Message-State: AA+aEWZrH5ye3mvYioOmhq3Z21BVJ49BaScmCcOssPzngjnhFv9jS1l2
 3jdwTPWSTczm1HUK28O8dMzJcA==
X-Google-Smtp-Source: AFSGD/WdVTNfm5/h1habuLkaCXtA3/WY/BNFDBLQuNgXIuwTJTSBGrhkPWSAwRH9yS4f31oZZqDfSw==
X-Received: by 2002:a1c:f916:: with SMTP id x22mr8841691wmh.87.1543846250914; 
 Mon, 03 Dec 2018 06:10:50 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 y138sm6956398wmc.16.2018.12.03.06.10.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 06:10:50 -0800 (PST)
Message-ID: <921f7fbc2091cc7973645d18a5c7e6257a798b4d.camel@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clk: meson: add ao controller clock
 inputs
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione
 <carlo@caione.org>,  Kevin Hilman <khilman@baylibre.com>
Date: Mon, 03 Dec 2018 15:10:48 +0100
In-Reply-To: <20181203131850.31388-2-jbrunet@baylibre.com>
References: <20181203131850.31388-1-jbrunet@baylibre.com>
 <20181203131850.31388-2-jbrunet@baylibre.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_061103_112052_6552DF35 
X-CRM114-Status: GOOD (  15.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2018-12-03 at 14:18 +0100, Jerome Brunet wrote:
> Add the clock inputs of amlogic AO clock controller
> 
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt     | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt 
> b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> index 3a880528030e..c480db8f4793 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> @@ -11,6 +11,11 @@ Required Properties:
>  	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
>  	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
>  	followed by the common "amlogic,meson-gx-aoclkc"
> +- clocks: list of clock phandle, one for each entry clock-names.
> +- clock-names: should contain the following:
> +  * "xtal"     : the platform xtal
> +  * "mpeg-clk" : the main clock controller mother clock (aka clk81)
> +  * "ext-32k"  : external 32kHz reference if any (optional)

While chip like the AXG have only 1 external 32k input, the gx family appears
to have 3 :( I missed that detail when preparing this patchset. Please hold
on, I'll send a v3

>  
>  - #clock-cells: should be 1.
>  
> @@ -40,8 +45,9 @@ ao_sysctrl: sys-ctrl@0 {
>  		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-
> aoclkc";
>  		#clock-cells = <1>;
>  		#reset-cells = <1>;
> +		clocks = <&xtal>, <&clkc CLKID_CLK81>;
> +		clock-names = "xtal", "mpeg-clk";
>  	};
> -};
>  
>  Example: UART controller node that consumes the clock and reset generated
>    by the clock controller:



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
