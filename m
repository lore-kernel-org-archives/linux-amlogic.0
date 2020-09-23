Return-Path: <SRS0=7V7W=DA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2B2C4363D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723092371F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Sep 2020 01:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g1luToUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723092371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3uQyrxR/p6DBLZpZsYQ0yv+n8oAxLnqj17J9QmAzPxQ=; b=g1luToUcmKbIe5dYRotaFQogW
	oJppBArDrk9gh1fq7RxG9Sd6B3DtOBsgwQsSEsdGgnsVgr7O1GHCe4ZJTOrE37Pozr/QPzYSFl+Zy
	HQqtPZJAeNRryxNevjzVuGqE6v9Ou+oR2KSeGvpZWBF1XSeJd5hByrjAA2d1OAh5Zbdi5YCqlRlwH
	WMv7CW090cQr2Lc+jWdQladudsaDKfcDlBU4AUBliU2eUHPooN1qR0cWiXjkav67xOccUnqYjNdEC
	br0GhHwMa+DPxNChHJR+ubsk9/j91CshOKKTA2L6jeH6v2XxZfryktHgC8bOv4PTg5Av7JEo/Iaor
	VmgL58KTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKtdV-000558-Pk; Wed, 23 Sep 2020 01:31:57 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKtdQ-000536-G8; Wed, 23 Sep 2020 01:31:53 +0000
Received: by mail-io1-f65.google.com with SMTP id u6so21896502iow.9;
 Tue, 22 Sep 2020 18:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O/1uY0ea+dOiIx/gu+uWclu23l4go3q7mcQvxB944Bs=;
 b=QETRw71NSnblFEZwAP13y6Tylm0htLH4VrDes2VdPGAtJcVMo6ubJ4hkkXTWrPZn7/
 4VPZEVsrTkMUUAHEqwsQ7uzWMHAtMaGa4dKUPu0lHTNY6wD+e5CPVR4iv3AIPShR91YZ
 fOMspwJo9s7t1FE76IkvGZdCQp+c/RFgHVKaMDOAAEtyZu6DMzhJlEgC3Q33JOY0Sg9N
 M0mZLsaLWxKjDz2DchXk109tmfbLGHoW9YNyPcy1zfMZIykx3jqc4reA4LUBTKPxnHUc
 MzX7bPVpH6rezO90x11qTwoSYGpglOKUCoL4zc5EBHFwWFlSsRakdd0+L6okObsCX3+w
 NghQ==
X-Gm-Message-State: AOAM532Re2ipobtXjpsPqhzxkN5U1qcIoFJN7UBaYOYMBhDMqT/yDLfs
 Pm0ZrdoC5LOkvmIro85hSw==
X-Google-Smtp-Source: ABdhPJyEMaBvP3/ztVLWZkxnsPOXD6uyY/aLBSQHqOpEeXNd393utur8koLDkvfSGNNfKtjceOssNA==
X-Received: by 2002:a05:6638:1316:: with SMTP id
 r22mr6367491jad.129.1600824711507; 
 Tue, 22 Sep 2020 18:31:51 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 64sm10241194ilv.0.2020.09.22.18.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:31:50 -0700 (PDT)
Received: (nullmailer pid 3662119 invoked by uid 1000);
 Wed, 23 Sep 2020 01:31:49 -0000
Date: Tue, 22 Sep 2020 19:31:49 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: amlogic,
 meson-axg-mipi-pcie-analog: remove reg attribute
Message-ID: <20200923013149.GA3662065@bogus>
References: <20200915130339.11079-1-narmstrong@baylibre.com>
 <20200915130339.11079-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915130339.11079-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_213152_556628_92377A85 
X-CRM114-Status: GOOD (  14.34  )
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

On Tue, 15 Sep 2020 15:03:37 +0200, Neil Armstrong wrote:
> The PHY registers happens to be at the beginning of a large zone containing
> interleaved system registers (mainly clocks, power management, PHY control..),
> found in all Amlogic SoC so far.
> 
> The goal is to model it the same way as the other "features" of this zone,
> like Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
> and Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
> and have a coherent bindings scheme over the Amlogic SoCs.
> 
> This update the description, removed the reg attribute then updates the example
> accordingly.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../phy/amlogic,meson-axg-mipi-pcie-analog.yaml | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
