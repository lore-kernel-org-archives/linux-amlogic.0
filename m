Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920F2C56201
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1FD22D0A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 15:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yFgvFhm1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wv/jt9xd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1FD22D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zFB+QYpOorrY4d4+jttsTlRMtyvkovweq4e9d30GFSs=; b=yFgvFhm1GvkmX7TpjZEV6TfRR
	dPEarSTQAO9075rBkje1s+ntZzVs0/VU2/0G8llJZ/0HTtMBtU1fvr+emt/37Ja5VaiKxnd0S04uS
	eBUXXW64qqNCzZYoWQH1nvz44hKnD+3ZI6YXstMpPy9mAl03xo2xbvCExIZZ6qmbsI3iODQZ6v7Ur
	P2UpiHa7DisJYFu/8674m4I46LMEI6r8CcadDFGFTk5FZo6+fXBTKly32z9Cs2RtE2HE2SheOEjgn
	HwCG2UMWFlkdxXhdzusiC5o3QqFtqkHfsQTur7o5VrruakF0qSkoVsvCTR+zE74In/K/04dDEB1wT
	tbVNUle+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg8Pk-00081d-M7; Fri, 20 Nov 2020 15:33:32 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg8PZ-0007vm-Jl
 for linux-amlogic@lists.infradead.org; Fri, 20 Nov 2020 15:33:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id k2so10495560wrx.2
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2020 07:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HGENVwdY/OrXqJIcwHQedcOOBp7b1J+6l8m9mXUvysE=;
 b=wv/jt9xdbPswN64nzmXsKHufEKsgaQxc+qDv2BhWqGF4KH5TNxHOkQD/GYg78yEaZi
 qJFRr1NDOCKEAxmPfkj+wojHAJjd7naU8Mj9ljVGJxo8dBC6LtEk43PtqHhTmFqIwcH2
 qqPxLeg5n4pOZN0F4xye+J5Tva5xyQ/vhKJmWT1qCf/i7Y7/ozI8ioFs6s12jPl7Q1+e
 AmPeS9+vGcz+G652KPtuo146C8UFicRAdBrIQ9tCX32VUEIfm+t2UxVXLFYf+PnwSZsz
 museT6wjsp2efmqdvfanD9Oe+hNxXYe4b+LRHBqsnnalyKPgD2w3ihJYOetHpwkztVib
 3cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HGENVwdY/OrXqJIcwHQedcOOBp7b1J+6l8m9mXUvysE=;
 b=uRtaOwLA7jgNicW6XzZlETgaHe7tbm7CInm1gzmsBkt/Ul8YOTeUqiJE87ktI1q3ep
 iLRmJsdRrbq7tYuxyGD4YD7I3qnQcUMYYS8c4dZ/2nsrl+a6GKG4JafmS8R4J2QfSHil
 ovl5WcM2hoPByNKTV9QwAoa94xJsgeC+3ifNqMQFvbVt4WQFMdapxwo7UBIf5Kxkb4G2
 AHhOeHILJz+FY1YdRqMP2pEOnyZemPcbQCx3Ua2Xvr3MCAVY2hex81FXax6mW16EW+He
 fJFpeyvb87ERrvM+j/z0mzgkCjv2TYo1QxSj0soYS37l5ycn4KrDSBGZKwo8DiV+38za
 vxzA==
X-Gm-Message-State: AOAM530lcU2lVwif7NULqj8rK5MUrkEXJ3PQS540hb6OVT+sOye6nY0d
 6URyWGIGsKQWHAXfFJjHMiTHaQBWJDypOeu6
X-Google-Smtp-Source: ABdhPJxAo7wUucIX/E7u++cFjidzp+7vN/BOkSeRZLbIAaf5Jcng0wFBuFOFInZEIUCsYnpTvN5VxQ==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr16823563wrv.400.1605886400497; 
 Fri, 20 Nov 2020 07:33:20 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7?
 ([2a01:e35:2ec0:82b0:419f:dca4:d17a:66a7])
 by smtp.gmail.com with ESMTPSA id w15sm5313417wrp.52.2020.11.20.07.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:33:19 -0800 (PST)
Subject: Re: [PATCH 0/2] arm64: dts: meson-axg-s400: enable PCIe
To: khilman@baylibre.com
References: <20201007100631.192348-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <0b5405d7-4df3-c82b-8d73-a591fd343ba1@baylibre.com>
Date: Fri, 20 Nov 2020 16:33:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007100631.192348-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_103321_709303_1ABB57E1 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/10/2020 12:06, Neil Armstrong wrote:
> This adds the nodes for the :
> - AXG PCIe PHY, using the shared analog PCIe/MIPI DSI PHY
> - 2x AXG PCIe controllers
> 
> And enables the PCIe M.2 Key E slots on the S400 board.
> 
> Dependencies:
> - Patch 1: Analog PCIe/MIPI DSI PHY update [1] MIPI-DSI nodes [2]
> - Patch 2: None
> 
> [1] https://lkml.kernel.org/r/20200915130339.11079-1-narmstrong@baylibre.com
> [2] https://lkml.kernel.org/r/20200907083300.14412-3-narmstrong@baylibre.com
> 
> Neil Armstrong (2):
>   arm64: dts: meson-axg: add PCIe nodes
>   arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots
> 
>  .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 +++
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 61 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
> 

Was depending on USB DT patches, resent with USb DT patches in 20201120153229.3920123-1-narmstrong@baylibre.com


Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
