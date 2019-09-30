Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC2FC32792
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 15:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 395A620815
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 15:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CGyhAzLn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZOM/o25s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 395A620815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+gv/tq3ftlkvAiOxQCXUdU1nZynSHerBXpNwGFDfSM=; b=CGyhAzLnoEgZyp
	49YDAhgCa7NC/ujwC3KQgXCV+kqSerUh5GjxsaJ7QbMwGVe2E9yZXCM2GV4PEFuTEBKgcdU4MslvS
	kZgLgIZEtUfa59pN+LcTeXAjK421sBClqG+/sJx+ohNvorvwPa6R5nkukqbsoWJsIT77hvX2MSK0x
	o0dV/lVHET8OLq1R51QZkfLJh5+OWtp2xadpfBAmE4PY+go19toKQa64vgsKF6nwG4XetBgsDgkmL
	QfiSbmxTiyPT4VQJmH+rxBLFq5cWpwyCS5F/+8rbiBY+DpWh4C9MeckFc9eqlYW5iiNHZGVULoakt
	K/MUiToW1z3Sx3cJFYrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iExgw-00074z-Oe; Mon, 30 Sep 2019 15:34:26 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iExgt-00074Z-KP
 for linux-amlogic@lists.infradead.org; Mon, 30 Sep 2019 15:34:25 +0000
Received: by mail-pf1-x444.google.com with SMTP id q7so5818854pfh.8
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2019 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5F08F4HtlDPyvY4r3+PCuN7SNxQH64MKcXi/kd7HCrE=;
 b=ZOM/o25sxvjMLKRKC3Zd9rAx0hvP1hljMPVRkriGdckO5c1A91PHJh2aCVswAY0hfm
 Z9d2+3JPNT3jJ++Tc/HA3L7SyJH4D0r0sfgBjqWhP5zpt+8otwCtBg5sX4vlJBmS/SuZ
 5YNNFJzir4g9iS35zxDhQYo8JdrSR8dNmcjHW2Idowx7dqtnwQ5Sz1PEy251eYdg+d99
 6lthotV8WxDf8zkxx1iEUo9ZoRY36KTswzYimcZUG5CAJ5wqrq03USkkzxteBV0gWX4i
 WInmhy7mc4CXiohXjvMKqi7zldss7UX2rYu/7RCCQXiIRF+Uc3tF77p2ySjypJKTIMGT
 9HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5F08F4HtlDPyvY4r3+PCuN7SNxQH64MKcXi/kd7HCrE=;
 b=PnejuqGiBxiabtah8dYGCcs0h7wwIgneXSax6iXjshhBszzXBOqC/E3Q6pTCn6Nkxw
 ZNe9k4wF7Krn//Rs1kYECAKSAUPdwACYDJK8T6L6A5I5CG/PvRIk7ySVdWjz7zh0sG56
 vJzWPLPnm0ooaw3IoqhGoQWf1CZEEVvD0CVnPXepQELkImFmXbNe3AuvGtN4w8zT/TNW
 juQ2pjVxqdOiDjNcRb6r1C0Cl1c4YgV7+y2Jeywtl3k+tnTwEh0EikcdtdbGSADhCeJZ
 6IqLfbESvou3B44IfooNYrAS8zO58Fg1xqXPSVEm6FEp1plcvH3QlayNV6oOi+5SnLRC
 GgtA==
X-Gm-Message-State: APjAAAXtHXbZ7P995llRevf/VDQBKFMQGW2gPVajH0IZ962cJMLFLtvy
 S/60dTj78JKRod/sa1jCo2nh2cc30FA=
X-Google-Smtp-Source: APXvYqyOvb4d+aPS0cQERmHhssgzbMyfskBVAlx/Xeu3fPMFfwDEFTsiAILnSnwHN3omJUS1nvUcwA==
X-Received: by 2002:a63:5652:: with SMTP id g18mr5896531pgm.283.1569857662965; 
 Mon, 30 Sep 2019 08:34:22 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d4sm12397930pjs.9.2019.09.30.08.34.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Sep 2019 08:34:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: enable runtime PM
In-Reply-To: <c0db12a0-66c3-7636-a7bd-b071d0820426@baylibre.com>
References: <20190925193154.20732-1-khilman@kernel.org>
 <c0db12a0-66c3-7636-a7bd-b071d0820426@baylibre.com>
Date: Mon, 30 Sep 2019 08:34:21 -0700
Message-ID: <7ho8z1g5mq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_083423_673292_87CFA49C 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Kevin,
>
> On 25/09/2019 21:31, Kevin Hilman wrote:
>> From: Kevin Hilman <khilman@baylibre.com>
>> 
>> On some SoCs, the VPU is in a power-domain and needs runtime PM
>> enabled and used in order to keep the power domain on.
>> 
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/meson_drv.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 2310c96fff46..256b6a0e9c6b 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -14,6 +14,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/component.h>
>>  #include <linux/of_graph.h>
>> +#include <linux/pm_runtime.h>
>>  
>>  #include <drm/drmP.h>
>>  #include <drm/drm_atomic.h>
>> @@ -274,6 +275,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>  
>>  	/* Hardware Initialization */
>>  
>> +	pm_runtime_get_sync(dev);
>>  	meson_vpu_init(priv);
>>  	meson_venc_init(priv);
>>  	meson_vpp_init(priv);
>> @@ -416,6 +418,7 @@ static int meson_drv_probe(struct platform_device *pdev)
>>  	struct device_node *ep, *remote;
>>  	int count = 0;
>>  
>> +	pm_runtime_enable(&pdev->dev);
>>  	for_each_endpoint_of_node(np, ep) {
>>  		remote = of_graph_get_remote_port_parent(ep);
>>  		if (!remote || !of_device_is_available(remote)) {
>> @@ -440,6 +443,7 @@ static int meson_drv_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	/* If no output endpoints were available, simply bail out */
>> +	pm_runtime_disable(&pdev->dev);
>>  	return 0;
>>  };
>>  
>> 
>
> I'll rather implement true runtime PM instead,

While this is a minimum implementation, can you explain what you mean by
"true" runtime PM?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
