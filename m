Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6EFC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 10:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqnlTFkx3moxKE9YYOh6Gzy7C+t2xhoinTgQ8qffi54=; b=TNT2r4SEM7kzWO
	97CPnDV16bWeGVOtRccHdxaxmqv9x/79Nt9DYKLkaA0HC1fsEwdfK6Xx8jS2RR1EM3ajdmHxWT7FJ
	PqftatVV18z3YQLnvIP9SgoNg//niHeqmKO/p37rHnkIvuUAPfDdvTQUFHYk+/3HG1HS6b9vxP1MQ
	ztr4O3/Q7DSWm+0FkPCm5Wwp11fisy5weKuecxWiu1Iudo3AwpJWHYurFP4lMh8T4bFIH/XjbefG9
	z7fEY8tshqsYlXYPHnz4Sq0notgtWDlyV8Lzx4sori0Ki9/+NjRbf3QHYV+6Tr//y83H9rikF6Vpk
	6r1HUR7/WZL1yzLVSIGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAYs-00APap-QF; Wed, 02 Nov 2022 10:01:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqAYp-00APZL-JQ
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 10:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667383286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
	b=fuSs/eA4/7vZhV+X35FsnJlEhJ/20+W2k2LZenlQ7FIAvrb5mWjQpHZEEE3G7/vkuBezcY
	ci/Smj7q/Z7hIgWVlQx1F2hNiJZQuFSvdEElWEudDf6CzncUGzYGNXoMcPmOQDpm4N2pDn
	leC3TPAoQgZGNS5Qf5k3LtPYa4n+dVI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-Z87o-xesN3KiHtpSvkYOgw-1; Wed, 02 Nov 2022 06:01:25 -0400
X-MC-Unique: Z87o-xesN3KiHtpSvkYOgw-1
Received: by mail-wm1-f70.google.com with SMTP id bg25-20020a05600c3c9900b003cf3ed7e27bso7750967wmb.4
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 03:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoVTRIE06q1gLaA+FiGPh2NoY5TNtlfidxMdk3t+aTM=;
        b=SD9dKcc5EddIAEJN12icTUcFZ/PrxpPLlmw82QjSh/pcjqIJiL1+wQwAOFx/gh9Unt
         O1H3nYsnGUJAmhRqtkB7mBTnOrM1E11ehjd6Y5G2RMz8OeSJfjx4AjcZBhwBi9Sn71hc
         zEb6yKbGWmZ+18MZPsU/cw6mQO7aqDU96UiOxu3xVtounT2+FjXMfsYeC4ErR9Lo4l6B
         wVBet2WkM+ddud1KKZmkGw85vx9ZUxlLezDcNTBCG39jiMIx/jUh7fJQy2uvVry5fd02
         KPzA2wnCl7Y/j8CwpnZyH/w45A77wSDPL5TQznPCIMJ/fpbobDYFgCqaAvKn6zic4+hZ
         D24w==
X-Gm-Message-State: ACrzQf346S9TQxQkH+QNh8kCwwaErChr+BMcfJmk20IPGQMQ4/HZLNHL
	EaPYvbN7dqjo9M2NzKOUGQn3LTd4FTX2yDNDQQOB2pAUQ6CbdCrLjYRAL+VldIYgGMbKGClR5ZL
	bLN+If2ImRD6MjVS4rYEatjnFPDqZThg=
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14405768wrv.68.1667383284428;
        Wed, 02 Nov 2022 03:01:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ieiweFPtXW5w3c0VZoUXMoQohTPuy1WtQBfT29g+UzlDhvHMzFOjUUUPFpm0LZwMa5DV8ag==
X-Received: by 2002:a5d:5505:0:b0:236:582b:7eb0 with SMTP id b5-20020a5d5505000000b00236582b7eb0mr14405736wrv.68.1667383284200;
        Wed, 02 Nov 2022 03:01:24 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d550d000000b002366b17ca8bsm14230263wrv.108.2022.11.02.03.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:01:23 -0700 (PDT)
Message-ID: <1d2b9809-857f-48cc-1177-72e6fc67b8e5@redhat.com>
Date: Wed, 2 Nov 2022 11:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 20/21] drm/fb-helper: Move generic fbdev emulation into
 separate source file
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-21-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-21-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_030127_751770_19FE05CB 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Move the generic fbdev implementation into its own source and header
> file. Adapt drivers. No functonal changes, but some of the internal
> helpers have been renamed to fit into the drm_fbdev_ naming scheme.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
