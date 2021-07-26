Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1077C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 07:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 908EA60C51
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 07:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 908EA60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=11ZpC4L61uxT22qXr5YX62+1AAIeqQurmH9krGGOqxM=; b=ORyXxyKWJjyORokX9CKMmQWg65
	zACcU9yq1Z0M6Xba+B6/dyvs3Pkad5zCYaMph5bDxyjyTK1q2VvmLUoz+mWLPfAFbHiZ4txNSZj3r
	w4Wv39KDUhn1+ZmAFvAG/G6R/HhFXEh9OPeC45XCQekYj7W2ZpALPFPF53qq6Iw9O5ZAFBr3ngPlj
	VOYxac8m+DcrDHxb7s5DQxoSVoF0oyRgTOroVrD4UemKxYtNkmFJiwuFV3IW/F1Fzx+74Pam8gYii
	6FOEOqk2KQlHKF5sHvcly5slurWYlcliAFgaoz9TZWMiVhlbXQAXlEcrBE08ARlU26EBEwAKVqD7O
	rfHnqbug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vTr-00A2sA-NI; Mon, 26 Jul 2021 07:56:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vTp-00A2rH-4y
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 07:56:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id c16so73239wrp.13
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 00:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zeZqtxONqWWF1em7aYmF1Pe2r2Sx+MqyCamwwBYmG9Y=;
 b=mgtCpoRn4tE+jdrGVM133ESQwkInrmHEMxbAv0NgNy7z8nv2s6PXOb85P9bzlSd+TQ
 QnLFOPCU6RLq5cIkaN6dkAzIiDoCP2xckOGiR0qc9JDbmCZRORjBmsGw6Il8uOcNzbj9
 Htof2lkK57WMPLV7uUrr3pIjVBMUgxunp9uz/yNZo1zZZCrMMI+aQz6WnmuMSCVRplpV
 44QznKcMlI6ABe+nxwIVfFwgwDq3fN138Yz80LcseSR/YhYp8U8L2UcrtN0qALmd0QZy
 yBIsIDwR0kGFKfVhNBG7hhFqfBIw1cIEEUFJqIOx7phDp5pLB/u2acD+ibeZJ77R6M67
 CdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=zeZqtxONqWWF1em7aYmF1Pe2r2Sx+MqyCamwwBYmG9Y=;
 b=B+tGJtyHch25qOkQcU79nqbzydcBCgQCEOMMFpjgcOLZWlJ7nv0365L6k6d+j8LyfC
 k0qbaGpGZwQDzAdSOltBin15WoKE8AUeREph9UdjF3xfXFktcMpT4J3NNiZbb++jdgUL
 xXuLrJ5QabL6yjRO4HhePx/ICfFq03cNckKRRICLFdf4yjPYcw8D9YUy6CazgiZC74T4
 oVcP3VU70kcKgf3Kdfg5Y0ccqlZPz7GX4Hb2WzY+SgMWPLDFIofsnyxha5tq5Kf80up0
 RAQWnXDN6hdMvk5QjHw1myX/lKNTlyf8cxvfAx4LJundKo0VjhUdqveY+B1L9o5e+ppp
 6gfA==
X-Gm-Message-State: AOAM533yv0iQWQ4bCps24xFIrWnQF9CgNJ1uvIQQ7LuMSIUctHUSYjR6
 wN/jKiAgJUzVghf+tMbUNDMhmA==
X-Google-Smtp-Source: ABdhPJx4vPKU8tB4VmIQwzUhtb0brJd08GmTFGNU9uStJmtuVXkrueiibPYwiraRrfkl8+llS4x7PA==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr17876210wri.263.1627286211271; 
 Mon, 26 Jul 2021 00:56:51 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:32b6:aa71:d2df:4f1d?
 ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id 11sm12714511wmo.10.2021.07.26.00.56.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 00:56:50 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: meson8: Use a higher default GPU clock frequency
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Demetris Ierokipides <ierokipides.dem@gmail.com>
References: <20210711214023.2163565-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a51c083e-52cc-f7d6-239a-1da3ed8ab3e1@baylibre.com>
Date: Mon, 26 Jul 2021 09:56:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210711214023.2163565-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_005653_249717_794A008D 
X-CRM114-Status: GOOD (  18.94  )
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

On 11/07/2021 23:40, Martin Blumenstingl wrote:
> We are seeing "imprecise external abort (0x1406)" errors during boot
> (which then cause the whole board to hang) on Meson8 (but not Meson8m2).
> These are observed while trying to access the GPU's registers when the
> MALI clock is running at it's default setting of 24MHz. The 3.10 vendor
> kernel uses 318.75MHz as "default" GPU frequency. Using that makes the
> "imprecise external aborts" go away.
> Add the assigned-clocks and assigned-clock-rates properties to also bump
> the MALI clock to 318.75MHz before accessing any of it's registers.
> 
> Fixes: 7d3f6b536e72c9 ("ARM: dts: meson8: add the Mali-450 MP6 GPU")
> Reported-by: Demetris Ierokipides <ierokipides.dem@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson8.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 157a950a55d3..686c7b7c79d5 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -304,8 +304,13 @@ mali: gpu@c0000 {
>  					  "pp2", "ppmmu2", "pp4", "ppmmu4",
>  					  "pp5", "ppmmu5", "pp6", "ppmmu6";
>  			resets = <&reset RESET_MALI>;
> +
>  			clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
>  			clock-names = "bus", "core";
> +
> +			assigned-clocks = <&clkc CLKID_MALI>;
> +			assigned-clock-rates = <318750000>;
> +
>  			operating-points-v2 = <&gpu_opp_table>;
>  			#cooling-cells = <2>; /* min followed by max */
>  		};
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
