Return-Path: <SRS0=tEAa=6P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD3C4724C
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 15:45:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9082137B
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 15:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q4cMpyZb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="g9Y63QfC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E9082137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n37proBSyJez8L0pHU54o5Faisleac4WfavHnjBfTqc=; b=Q4cMpyZbhf2rYf
	gzmee41v9Od4NU3EoknN9qeBXZeDiCn/22cq8UQwduJ6eAx1Y/B0K+8b5uB+fkfqUdaU+s3Ef6kyO
	290UFzzITT6d83AoX+tixSpJGqYflD3PbFu7rRz+qC6hay7SImywESUhUnbdygDYQk5RxQ00xToyz
	0TqdW+6oVjdmqalVOAkTJ+vzpDaKu4a4qMhRmkajAfR7xhBRVvh7ojZY9A8j854xyDF7hJuDDTB2R
	sjH1bvfaHdI+If7H40FyK9Vv0MweGzOABpQfovGY6HX/QcFx9Jq9hs4m3aM1yspyAYW2UKSoTXt04
	oHCW5WaH54e5pQ+p/8jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUXqU-0003AE-CJ; Fri, 01 May 2020 15:44:58 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUXqR-00039C-IT; Fri, 01 May 2020 15:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zq53wD1ebttWy9Fs+bAkUBp+KMkAbk1gvP4L0POpNiA=; b=g9Y63QfCt8YuvaP45/GWgzLNj8
 no//b6ULwxrn4pBY9MHOk89RSiunJY/l98hVSjVfsLNrIuLgM/KQfMzLn1fYX+lQW0qRLzMOvy1Ta
 lFnR3/T4p7PWi6B/VbYak39g5tqWm4oIXxzQB5PjCtHV+QNLsdO/I3HQoav+YkAlNQd4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jUXqK-000YMy-7n; Fri, 01 May 2020 17:44:48 +0200
Date: Fri, 1 May 2020 17:44:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 08/11] net: stmmac: dwmac-meson8b: add support for
 the RX delay configuration
Message-ID: <20200501154448.GH128733@lunn.ch>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
 <20200429201644.1144546-9-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429201644.1144546-9-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_084455_608300_A478717E 
X-CRM114-Status: GOOD (  10.59  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> +	if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
> +		/* The timing adjustment logic is driven by a separate clock */
> +		ret = meson8b_devm_clk_prepare_enable(dwmac,
> +						      dwmac->timing_adj_clk);
> +		if (ret) {
> +			dev_err(dwmac->dev,
> +				"Failed to enable the timing-adjustment clock\n");
> +			return ret;
> +		}
> +	}

Hi Martin

It is a while since i used the clk API. I thought the get_optional()
call returned a NULL pointer if the clock does not exist.
clk_prepare_enable() passed a NULL pointer is a NOP, but it also does
not return an error. So if the clock does not exist, you won't get
this error, the code keeps going, configures the hardware, but it does
not work.

I think you need to check dwmac->timing_adj_clk != NULL here, and
error out if DT has properties which require it.

      Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
