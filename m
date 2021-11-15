Return-Path: <SRS0=1Oxc=QC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12679C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC737615E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 09:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC737615E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=57HZ+Y+focl1FgoggcKtst9RVD72u9p0c23wTzJdrKY=; b=l6c5m5at1O+QXLsQYEdbEsgCXB
	4poM7dFq0z2w9++3xVfurdwEsvY5XUXktdMCCq3qtXxZIRlJHyFvmOUBqhrhPRhtOP1JhSyYsCbKd
	cwS7G64yxouYseSk05k92dzt/rYs3X6Oc/YL+ABuaDyAf97U6ni1YNem9R3z2DWQ2FlyFwJ5CsLLu
	oHqgDlqNecmyUJD2x7zF/xiLgua6qd9Acj0dwbaJIREhLalHlVMnB8plHdMXGeYh9xeK34jn9s+5G
	8b3dLju68L/br/O6GrGCFJqAphLNaikYNSkT92B8p82xgFzMVKV7FOba11PzdahTylPUEdU7rxNN/
	FOTBfGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYfj-00F1Xu-8y; Mon, 15 Nov 2021 09:53:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYEW-00Eudn-5E
 for linux-amlogic@lists.infradead.org; Mon, 15 Nov 2021 09:25:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r8so29187485wra.7
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Nov 2021 01:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iOTvirEH5cWSGGyEM/qyXakAhUbFgxeoREUjQ8w+UuA=;
 b=wVqrmsD6t948l6IGEEtAO02uAqL81mLJSJhjRpjSK7XHnfgo9ifDxBIDsGXbzCkuap
 OJn9BkiCwkbB/w3nIZkFvLn+rbw52o3qpSRjnoqA5VqrHAwl+SQufGrEfbeZqO81J8p5
 TMnO5fyKKvwdknkJTfjDuh9XOE5v76mtoJr8QbTNVYIvz6A4LljnCYfnVxcu7MsLaot3
 onHJE0O5VrwDmV00M0X151qC5AOyTj2XDOXGmnHoNOF1HbUKmwXIkeGI330LX6RbwXzA
 rS52IPTd/vfuQu1+A6UmEItrjD9FlCSmOCDUAsA+ZcLKxRNB7s9QSkiPk9pNSXA3l9+9
 ScYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iOTvirEH5cWSGGyEM/qyXakAhUbFgxeoREUjQ8w+UuA=;
 b=SowK94PHntxcArbmf+zRq2peK9uPeA/T8dQmE1RGSDAluuj7FakiUnZl/DJMFb7Zfo
 VcjrHvQA/Kc318RXzSc2X4pF4nwWGtBxQf6bfz0b06Z60NBbbrlFtI79o9Pm5F0G3Noy
 k3xtWJrSq12mEKPr6TqcnLSIu0XmZ2Gl1tvxXPUp4Kk2wElhmXY84eQO+0Ue8gAabVVn
 lgWxczqIeNUFx9Ix6XiGQQED1epI1AhVWq9w7KyP0qaDijHaQUwwzmPKOMN3H91aumsw
 8gjVgQZQfubwzWM9v9l6x9+dQCZHmfa9Eg1g1SFINxSE6yjdNVGfAqQ3yjG3NIZx6y6x
 dN3w==
X-Gm-Message-State: AOAM5303Ma3Mq+W+Tm3cTty0etr7LnrG1QQ460qg+rwZBs/iqmzJOUAj
 4cPIRZpfEGPySQR3pwln/SSWTg==
X-Google-Smtp-Source: ABdhPJzoV9mrpXPO3RmdyVIOrtl3aGecz13V5aMKjHCuh6HjkJjuGmkcOUFfyDiIVg1QVOsiKVwMOg==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr46501820wrs.266.1636968298616; 
 Mon, 15 Nov 2021 01:24:58 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:f56f:2409:301:93ad?
 ([2001:861:44c0:66c0:f56f:2409:301:93ad])
 by smtp.gmail.com with ESMTPSA id z5sm24768710wmp.26.2021.11.15.01.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 01:24:58 -0800 (PST)
Subject: Re: [PATCH 2/3] arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211012052522.30873-1-christianshewitt@gmail.com>
 <20211012052522.30873-3-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <850f8f23-e5c2-5b60-d696-5036efe7b644@baylibre.com>
Date: Mon, 15 Nov 2021 10:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012052522.30873-3-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012500_297471_B4F044C2 
X-CRM114-Status: GOOD (  17.67  )
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

On 12/10/2021 07:25, Christian Hewitt wrote:
> The absence of this binding appears to be harmless in Linux but it breaks
> Ethernet support in mainline u-boot. So add the binding (which is present
> in all other u-boot supported GXBB device-trees).
> 
> Fixes: fb72c03e0e32 ("ARM64: dts: meson-gxbb-wetek: add a wetek specific dtsi to cleanup hub and play2")
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> index 8e2af986ceba..a4d34398da35 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
> @@ -6,6 +6,7 @@
>   */
>  
>  #include "meson-gxbb.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	aliases {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
