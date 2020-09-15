Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE7CC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:30:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1012620731
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kXYpCKK+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1012620731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1NJikKia+UVBf6pc4WmCjzFyLhhdxliik3x8eYdp/4s=; b=kXYpCKK+2CozbciRuMsrHoV9D
	KX/BtwvhScmRHySIYt/FL+xLwqxBaAAi0ZZP7AIRLxU1lPGuizIzyZZI1Qf0aV9Cxiu3RKCtj2+WX
	GasQb3bYv/mF6b4xwJvYCikXELm3jqz11NQEEqqf5V1pSq4MgHExzF4Y7ZOHJcVE6bhs7nC1KzcUN
	mvH85k7MWn7o9djAgiOlf2d6lS2+VR8gMcm7MEI2NJ1x0lyuj01hrnjiYUbbvqkG5dvkqKObGubgO
	5K65Y3tK5GZL/fu8w+l0leXOz6Gk/w5nUnDP8wLW94fa7WRgGO5fzT6rkP3u+hg2F6ax1m/j976Fb
	j0YiKluZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICu2-0001WW-7Q; Tue, 15 Sep 2020 15:29:54 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICty-0001Ug-Lt; Tue, 15 Sep 2020 15:29:51 +0000
Received: by mail-il1-f195.google.com with SMTP id a19so3353450ilq.10;
 Tue, 15 Sep 2020 08:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z9MxfDSVj20FLJkNdG9Fpfa1v8rBz2a5FI6l6n2Vm6w=;
 b=MOOgibaj5XnVc5S7LoSCOfSNSjEuO2kVkhwMssa40/PPTAYtveXpvyozHghUKEPSV2
 RVFkDMs5zeUMEdcgpUQvbpOxeuXhlgtpBt/H7ZBFClzQYEppSP84dRtRgLauUvHwksQH
 XRC83jaQruVaJA463lzxeYAKeRgjSvPLD4eqlUHHmCDzLLU/nd4kKto4OMrDxyYmLW/L
 hqslHzh56NzUp9ej36+FNbDf1//Rw8bh7hy7G5W9wi9dMpmLBUcE8rXB2YzK5ywzSChp
 n+ub0pq5z6YQ0cUAf6U1IEI8Z35fjhF9rm6JwDjhauNdRnyej1qsAC7Ty/jxgqKGHU6x
 DFZw==
X-Gm-Message-State: AOAM533xltS2invLY+Ucf0Zzvn98RmdK2fFvdHOr0/g1nvkbi0sg9ryC
 wX0F1Zfwgr1m4v+/b4A+/g==
X-Google-Smtp-Source: ABdhPJwoqazv6MXGioLiGUJnVEx8NxVuciezDoqT6iHAUsJPnENvpZY0sXdlQqZ3k/GeDupxUnSmTg==
X-Received: by 2002:a92:ca85:: with SMTP id t5mr878635ilo.254.1600183789745;
 Tue, 15 Sep 2020 08:29:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m19sm9104553ila.40.2020.09.15.08.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:29:48 -0700 (PDT)
Received: (nullmailer pid 1981801 invoked by uid 1000);
 Tue, 15 Sep 2020 15:29:47 -0000
Date: Tue, 15 Sep 2020 09:29:47 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove phy cell parameter
Message-ID: <20200915152947.GA1981749@bogus>
References: <20200907073402.26674-1-narmstrong@baylibre.com>
 <20200907073402.26674-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907073402.26674-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_112950_770082_1626B329 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 repk@triplefau.lt, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 07 Sep 2020 09:34:01 +0200, Neil Armstrong wrote:
> The Amlogic AXG MIPI + PCIe Analog PHY provides function for both PCIe and
> MIPI DSI at the same time, and is not exclusive.
> 
> Thus remove the invalid phy cell parameter.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
