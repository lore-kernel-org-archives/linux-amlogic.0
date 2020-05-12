Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810D3C2D0FA
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:44:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558D620784
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNCSrJPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558D620784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cU3Fz4XYMo/jNMhAcntYa+ZHc9BR0q+rF+y0g+8yzHU=; b=CNCSrJPzaffbmn
	ICOe6rIMl5T9+sUDcyVrcOvrOtRlszhnVzMRPZW0jh4hlKWlMub+VUFJCupuX20VLdQb6xz7VNx6N
	y9IkLONN1eLqap7ZsdR1pYzJPmYqvatDoC6Mt3BXyAlLAah/mY4Ql0uvmUh8s5wVJxqaWF6nbL6NV
	SJo5spqAlk+GCNXpAb2MzqSXhpj4T3pprSEpVXdOfm7TJCQqfshfRNbspofPpYCvE3pcdOruM231p
	HvPkRpYmARtHxkVMbajZqns0opuH4sE/95oJOWKNvM35mKFlzr1Hteh7/h8Q91kONZku5V+qIzelV
	GJarzhxVfcncmz/8+bFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYddO-0000Pb-1z; Tue, 12 May 2020 22:44:22 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYddL-0000P0-OF; Tue, 12 May 2020 22:44:20 +0000
Received: by mail-ot1-f67.google.com with SMTP id d26so645697otc.7;
 Tue, 12 May 2020 15:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uumrDYsgwLaDX3HJhkdtaUmDr4MtGqDPU0CrAV2rD6U=;
 b=o6P9O7+GUFEAnlaFQYg++B/rlkYKb0+jRvIAkec7UIzEKTKbBb7/2AqIg3M3dAi1Mn
 qyxrzf0nRThCODOXpXw0i75wAsBhnoKZhv1vvvOyVhXBBVmGXLY2CoGXx9ObEgMFpPTv
 giT1/MWdid++d1NMoWxTWaw/8/UM4aRUWmLOFSl1tyzRfT7Ae8TtvgFfT11IYeZwluc4
 ZSYRq9bZMJXOLJglczuO1vDBvviRSfxvPIEXChsnCW9tHwd3bZzpvkS6e1JrrWNxMOG6
 CNF/CXwqMU+I5XJ2rGaJyJLLX8bw+tkQkM61t+/lHXilkLvPy/S5U6E95o+UtkdlHStY
 wL4A==
X-Gm-Message-State: AGi0PuZhij8V/EyHqN2y+u6X35/vWtKPLXbAYvchORCTHhTH7hAxIqeb
 6uXAS4jTS5ESAEdqIH6jWw==
X-Google-Smtp-Source: APiQypLudLaDx5Hvkugopv+ecKjUtr8tCweVHIWbZyoNgK4NPkO3hFmOEWUVAp12V5dMbReJH6+0XQ==
X-Received: by 2002:a9d:69c9:: with SMTP id v9mr19153655oto.267.1589323458777; 
 Tue, 12 May 2020 15:44:18 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w3sm3779500otg.24.2020.05.12.15.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:44:18 -0700 (PDT)
Received: (nullmailer pid 11405 invoked by uid 1000);
 Tue, 12 May 2020 22:44:17 -0000
Date: Tue, 12 May 2020 17:44:17 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: mmc: Document the Amlogic Meson SDHC
 MMC host controller
Message-ID: <20200512224417.GA11220@bogus>
References: <20200512204147.504087-1-martin.blumenstingl@googlemail.com>
 <20200512204147.504087-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512204147.504087-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_154419_786778_411835C5 
X-CRM114-Status: GOOD (  10.06  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, ulf.hansson@linaro.org, jianxin.pan@amlogic.com,
 linux.amoon@gmail.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 yinxin_1989@aliyun.com, robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 lnykww@gmail.com, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 12 May 2020 22:41:46 +0200, Martin Blumenstingl wrote:
> This documents the devicetree bindings for the SDHC MMC host controller
> found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
> bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
> HS200 mode (up to 100MHz clock). It embeds an internal clock controller
> which outputs four clocks (mod_clk, sd_clk, tx_clk and rx_clk) and is
> fed by four external input clocks (clkin[0-3]). "pclk" is the module
> register clock, it has to be enabled to access the registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
