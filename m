Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2C1C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 07:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC9561181
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 07:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EC9561181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e2GK4KYSND/pqeE6q6yIEnMDTGALyJzYQlA3aOcMOew=; b=wffMDxBLiyr4+SOYmVCtBSEpO3
	ZYXyDV6v2rVdHndwbAPcCTK3HyRLMewW4YcSmjEBcxvF5OVhdCBMcxF6vPMYiaGSOXiHmiZCBKAFD
	pax0+tP1qlOTUO3MJLv8mipWgKVHpR1FZarbyzMQ2tHKeSyfzONUnZO4FXDeQFaKY5MJsiEnQZ9Oh
	qH2M4xV6qTv+oWF1v8kaMGNw0X8iAZty5L/V25reHLNai+H4cqYTCbeG+jy6It8pXm0hjXF84Bw3F
	Y94h9OVRwVl/LHsAIkFEqoXp5aMF23OtHdw64+E9jceJrOBgotDM0pkZKNAvDi+WhBvSW6gIEf8un
	As281Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbI2h-005mQM-KL; Fri, 15 Oct 2021 07:54:15 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbI21-005m8X-RH
 for linux-amlogic@lists.infradead.org; Fri, 15 Oct 2021 07:53:37 +0000
Received: by mail-wr1-x429.google.com with SMTP id r10so24830021wra.12
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Oct 2021 00:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r0spq/U0Y1vUnnJkuA8fNer3gwXr4La5+YzTv1JANT4=;
 b=OPKHsjsMlECFIRSoyAxu0nUIdT9MWAa07Xu3fjBTCoVAF0BBsOrOtvPtXCMdcLuPQ+
 3B3ZcONLcdihxRhdhBmgnow0TFyuzfxG1SAh1XPErSy5wm2DqBm/UtvpE4fdVtYS9bPU
 b6DWraJF69wd7i8OrBWEMwJHgfqLVjE5LAGTJ+PrjuPnK4u58nBjDdwCselzwtHbIZd1
 ulGl9TytTaixcaZjx8GGMa2LhIE3Epa6gc0G5A+4+anxFSYH1sOF/1bbnS+rrnKR6kq0
 W6uJti3CPiuwi6fyyPjd/bQ+luOL5WAkzx54V7LueZKdeSAYuV1tghauq6rVn/7mXHa8
 ydvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=r0spq/U0Y1vUnnJkuA8fNer3gwXr4La5+YzTv1JANT4=;
 b=o/aXH1ZPPAD2WYAtQ5a6zklblU0sm+OIYYB8GCFVyVRQgAO4PVP4p5k7/dowewW2EO
 o7kwWyGDkt7f1tq+GTN5W3e9GclFJg0iMZKy2gFuu2XYEUgRyeB2p2aTdXwnoKvvdll7
 o1WW6KV4PBeJ9F7JJs0IMVQFPF1xga+89+Gp2zTKJ9wQrjiKx1mz5M7qwGMHUj+iy1ze
 /k9F6idv1POBjJMRNpUGpOmWf20koFJQf0Dk4oeV5f74ddqrHv9+aQixR2QsSsn6YS2n
 xfviZ6hnUzPXOBSbtSsiep01PlgQWK4JDCmpsizEPe10BijMQ1C4pyJHwBeEzIp0XB6V
 rM2g==
X-Gm-Message-State: AOAM531vaaPVtk7hs9KIaZYQ5bBeJSlQQpZUYxFSQlXgPlq5Zjfe/w6V
 coGFOrk5/ON+6qX5+Q/poVRzkA==
X-Google-Smtp-Source: ABdhPJwNyqlhUMZpM2GkOpFAlS8ek+MAN89gKyE9g9mbwBMMGFkXf9TpS6bjzZ8K8545wj7L+GVp0A==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr12566299wrn.215.1634284411932; 
 Fri, 15 Oct 2021 00:53:31 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb?
 ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id b10sm4144098wrf.68.2021.10.15.00.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 00:53:31 -0700 (PDT)
Subject: Re: [PATCH 2/7] drm/meson: remove useless recursive components
 matching
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-3-narmstrong@baylibre.com>
 <YWhtuscoVWCdQAkY@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <56fe9cd4-6903-b1d3-d2bd-8b559fdd4304@baylibre.com>
Date: Fri, 15 Oct 2021 09:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWhtuscoVWCdQAkY@ravnborg.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_005334_014089_E2A0B059 
X-CRM114-Status: GOOD (  23.84  )
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

Hi Sam,

On 14/10/2021 19:49, Sam Ravnborg wrote:
> Hi Neil,
> 
> one comment below. Other than that
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 
> On Thu, Oct 14, 2021 at 05:26:01PM +0200, Neil Armstrong wrote:
>> The initial design was recursive to cover all port/endpoints, but only the first layer
>> of endpoints should be covered by the components list.
>> This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
>> first endpoints instead of recursing.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
>>  1 file changed, 21 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index bc0d60df04ae..b53606d8825f 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -427,46 +427,6 @@ static int compare_of(struct device *dev, void *data)
>>  	return dev->of_node == data;
>>  }
>>  
>> -/* Possible connectors nodes to ignore */
>> -static const struct of_device_id connectors_match[] = {
>> -	{ .compatible = "composite-video-connector" },
>> -	{ .compatible = "svideo-connector" },
>> -	{ .compatible = "hdmi-connector" },
>> -	{ .compatible = "dvi-connector" },
>> -	{}
>> -};
>> -
>> -static int meson_probe_remote(struct platform_device *pdev,
>> -			      struct component_match **match,
>> -			      struct device_node *parent,
>> -			      struct device_node *remote)
>> -{
>> -	struct device_node *ep, *remote_node;
>> -	int count = 1;
>> -
>> -	/* If node is a connector, return and do not add to match table */
>> -	if (of_match_node(connectors_match, remote))
>> -		return 1;
>> -
>> -	component_match_add(&pdev->dev, match, compare_of, remote);
>> -
>> -	for_each_endpoint_of_node(remote, ep) {
>> -		remote_node = of_graph_get_remote_port_parent(ep);
>> -		if (!remote_node ||
>> -		    remote_node == parent || /* Ignore parent endpoint */
>> -		    !of_device_is_available(remote_node)) {
>> -			of_node_put(remote_node);
>> -			continue;
>> -		}
>> -
>> -		count += meson_probe_remote(pdev, match, remote, remote_node);
>> -
>> -		of_node_put(remote_node);
>> -	}
>> -
>> -	return count;
>> -}
>> -
>>  static void meson_drv_shutdown(struct platform_device *pdev)
>>  {
>>  	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>> @@ -478,6 +438,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
>>  	drm_atomic_helper_shutdown(priv->drm);
>>  }
>>  
>> +/* Possible connectors nodes to ignore */
>> +static const struct of_device_id connectors_match[] = {
>> +	{ .compatible = "composite-video-connector" },
>> +	{ .compatible = "svideo-connector" },
>> +	{}
>> +};
>> +
>>  static int meson_drv_probe(struct platform_device *pdev)
>>  {
>>  	struct component_match *match = NULL;
>> @@ -492,8 +459,21 @@ static int meson_drv_probe(struct platform_device *pdev)
>>  			continue;
>>  		}
>>  
>> -		count += meson_probe_remote(pdev, &match, np, remote);
>> +		/* If an analog connector is detected, count it as an output */
>> +		if (of_match_node(connectors_match, remote)) {
>> +			++count;
>> +			of_node_put(remote);
>> +			continue;
>> +		}
>> +
>> +		DRM_DEBUG_DRIVER("parent %pOF remote match add %pOF parent %s\n",
>> +				  np, remote, dev_name(&pdev->dev));
> Avoid the deprecated logging functions.
> Use drm_dbg() or if there is no drm_device just dev_dbg().
> 
> I assume the driver uses DRM_xxx all over, so I understand if you keep
> it as-is.

Since it's in the probe function, I will move to dev_dbg().
I'll probably do a print cleanup all over the driver.

> 
>> +
>> +		component_match_add(&pdev->dev, &match, compare_of, remote);
>> +
>>  		of_node_put(remote);
>> +
>> +		++count;
>>  	}
>>  
>>  	if (count && !match)
>> -- 
>> 2.25.1

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
