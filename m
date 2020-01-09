Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6F4C32771
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E6D2067D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 11:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7XBpUMy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E6D2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6cqUN6bqjIFygWB3gSePKZUmOz9bq6y+i9HfvitHRI=; b=I7XBpUMyfxGTm4
	VhXYwBtR2aXnfDdnk5W7aDs4d8RmoNeBW6eK8XHxKzfxh/opPd8EEiv1d7Em3TtU8ARwSHBUa/Vt2
	ry6m9MQD5AsfFuJFJFbLJ6w7CMKRnO7yHqdQWbz80z0ohmHAhx9mCJGp2YLgCx0FjGmA+jGqHqVEu
	aj5TW0w2Yx7W/wiK103o+9T/65UIKZ1ee9hgy2FL6gANM7chD0cjev1r4sMWQ8XasXmhhb53EI/D6
	IpPc4SMUHGDzhtVpulDqbFO4ihI+qPnXd9CbDWzOp+UZ41XafxDzXbkpOJSy5WHWwWJJjVfZqvcA3
	QLMhTEveDJkjIVtrMBsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipW2m-0007qs-KY; Thu, 09 Jan 2020 11:32:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipW2b-0007fw-JX; Thu, 09 Jan 2020 11:31:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04B3C328;
 Thu,  9 Jan 2020 03:31:53 -0800 (PST)
Received: from [10.1.194.52] (e112269-lin.cambridge.arm.com [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B627A3F871;
 Thu,  9 Jan 2020 03:31:51 -0800 (PST)
Subject: Re: [PATCH RFT v1 2/3] drm/panfrost: call
 dev_pm_opp_of_remove_table() in all error-paths
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io,
 tomeu.vizoso@collabora.com, robh@kernel.org
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-3-martin.blumenstingl@googlemail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <394ef595-198a-3cd1-968e-2182098da92a@arm.com>
Date: Thu, 9 Jan 2020 11:31:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200107230626.885451-3-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_033153_700767_3DACEE88 
X-CRM114-Status: GOOD (  14.60  )
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
Cc: airlied@linux.ie, linux-rockchip@lists.infradead.org, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/01/2020 23:06, Martin Blumenstingl wrote:
> If devfreq_recommended_opp() fails we need to undo
> dev_pm_opp_of_add_table() by calling dev_pm_opp_of_remove_table() (just
> like we do it in the other error-path below).
> 
> Fixes: f3ba91228e8e91 ("drm/panfrost: Add initial panfrost driver")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 1471588763ce..170f6c8c9651 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -93,8 +93,10 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	cur_freq = clk_get_rate(pfdev->clock);
>  
>  	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
> -	if (IS_ERR(opp))
> +	if (IS_ERR(opp)) {
> +		dev_pm_opp_of_remove_table(dev);
>  		return PTR_ERR(opp);
> +	}
>  
>  	panfrost_devfreq_profile.initial_freq = cur_freq;
>  	dev_pm_opp_put(opp);
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
