Return-Path: <SRS0=SHiD=UY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A8DC48BD6
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 20:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3476720665
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 20:32:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mIpRVFBk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bALF2utk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3476720665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlGlPBo7kDcXd93T79TF+ieA3YgXXewz1AEzQDmuDRE=; b=mIpRVFBkm4D2Qd
	p2kVLtaCFRlliQmUs+h0qnCbvDOnQ8KMRbhQM8NLA/OQLziS9IITr2bBH1QJ54n00XrqUY+DmGISh
	O+AkQIWUCwU4iUx+TJbyStXFhOpDiQa6lA3d8JGjOsYpteDbQqBe/9W1uGMEmbTcE57d764Gk3Z/G
	Qc/Wxahhaei1BwYMsttW4qkO+m04CL+cZzbjaZflqrclLOno8UOlFF4KU8kvJSifujFVqnXlGfQey
	cSw5wHh6LCvzBEQsPBiomrD5huFWY/VJq2uibZ/HTfbibtnbu+uDU886QNxpJKpo4URBDs+gWe056
	002ips0Ew0oAzPHxj/Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfs7C-0004Yb-Qg; Tue, 25 Jun 2019 20:32:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfs79-0004Xr-VX; Tue, 25 Jun 2019 20:32:29 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9696920665;
 Tue, 25 Jun 2019 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561494747;
 bh=79veobl52Z84hPCuz8vwU8EIU+giIpnO94zX6uPPBxQ=;
 h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
 b=bALF2utkmoFHF613ojuyDcQASrKDND1ya3U6U0eClfPxV/Nx5hC7HmsdkJpE3e7mE
 1FYGhYF7BUYeIlGvlPj/CAPVC2fZAQoy44jGbEpsYgU37i/zOK0VWP8VTpygJ5OUAW
 DdO1IFTBHrD6ajecFLXcF64/VyjYkj88D6Hv0XQo=
MIME-Version: 1.0
In-Reply-To: <20190620150013.13462-3-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
 <20190620150013.13462-3-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com,
 khilman@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC/RFT 02/14] clk: core: introduce clk_hw_set_parent()
User-Agent: alot/0.8.1
Date: Tue, 25 Jun 2019 13:32:26 -0700
Message-Id: <20190625203227.9696920665@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_133228_030965_9DA12AC6 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-06-20 08:00:01)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index aa51756fd4d6..3e98f7dec626 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2490,6 +2490,11 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
>         return ret;
>  }
>  
> +int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
> +{
> +       return clk_core_set_parent_nolock(hw->core, parent->core);
> +}

Will this be used from a module? Maybe it needs an EXPORT_SYMBOL_GPL().

> +
>  /**
>   * clk_set_parent - switch the parent of a mux clk
>   * @clk: the mux clk whose input we are switching

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
