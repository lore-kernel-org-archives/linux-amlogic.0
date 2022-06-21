Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A13C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jun 2022 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGxqa2p3O6JwhnxKAV42fFmrIdvLR3xeJ33J7iksTeU=; b=DzFg0yKQNzC0Nc
	5qZD1/tjoJco5ngu/6dJQ6ToExrwejUsssePJ8fMmzevWgX2tHHUK3YtE/AmYdt6e5wLm+SphjTB6
	JzX1cPIrD4Rcs/y6GxMnqiLTbWenvtm+IkU+eTD8YpoDvWzN8J6+Zwl7twCaRUjJOku/93h0EH7W9
	CpBSnih6DILUMLlyAkL0YpxKdNKOa6qYOZImFo3nWp2uw5EgTh/+pbhK6Ua+u/AuixWq2eOUZGgZ1
	KMBt4LONgukZ52M2frLArGse4e4RdAH/CCJnNe6ZiUfx1kZcdqyYdqBAwcUKAiP18ukUjck2Fn7w0
	ETrNGR/Rn3ziVNbM3x1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3e38-005gQP-PE; Tue, 21 Jun 2022 13:36:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3e32-005gOA-Dx
	for linux-amlogic@lists.infradead.org; Tue, 21 Jun 2022 13:36:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q9so18986540wrd.8
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Jun 2022 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=qqTNqAOeKdNu0PJecSUXPJEvq/QznEHwzYVjdroUPXY=;
        b=1+2MA1gKXKsyI+zQ6hjv+gzIYSGFYfWQpC4wuEyIur/bKKXffQ90R9NQ2TQFbriijc
         /PnZwA/yGte87aVaJ+f9rus8f1xJY/cJ4IqqWrfEHoEjtWU5pH7FPeks7I/a0chx0Svv
         V+uKONK2DGLSVR6O/gd2PQwFmZf97xuv24UNOhxMvnzOP8b7RqXrNjFxJMbr6JpT/qv/
         k9ZoPHPkntMSyBPI3wTcdiFqjEHjQQHfNpVFtn/Xz1r+gjeD0IeaXSCL9vw4wfY0tRGx
         Rhv/wQCaqhajSdgBd14IlPAtS3S/coVtM2VHncbq+pyCeZNPACwDXl/i7NyMgz+pRrpE
         2h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=qqTNqAOeKdNu0PJecSUXPJEvq/QznEHwzYVjdroUPXY=;
        b=spCM8MqgvyZnX+OPPGah8WIYQc0ivNvYYDfT6BDzINaU1cEPBgz3Y+N9tem2kTAuTf
         ylQimfGPZQ6nAHllybYFzmCczumh0oEJL8k5V2hkf2KLlPU4mSAa8JQ8pho1InzxSl9q
         w10wvOl4/DZY/yE+Uvms0JGuww+LjPr4zzI7ObffUna0jtKMvgR8jgTQKitZCmHhOCEq
         elqtA+Vi0N33hFFs4nm2zf8MdbwOipwJv0NcbTNe45ntRerQ3zrTJkGYd8xg+iLCKSHP
         UO4P0KurSb4PwlcVf9faizTwe9IngqHCjqsEKZnKdrNQL/ab/lr8KAKzO03M6Jgrfv/Y
         oziQ==
X-Gm-Message-State: AJIora93qDL14j59AIBslrwpLQuYPcGyeBSTxKLre3r2lBkl+6esNal3
	+hmRE5I+hIB13pcf+u3AXbl50Q==
X-Google-Smtp-Source: AGRyM1sc4Nuf15EPxf/o4rS6i+04DqBqjCot5RM6I5P+/fHFVBB1ZthkIsqn8RvpWF8Oc1aTu4LGbQ==
X-Received: by 2002:a05:6000:1e01:b0:21b:9a9a:6aee with SMTP id bj1-20020a0560001e0100b0021b9a9a6aeemr2618293wrb.678.1655818556373;
        Tue, 21 Jun 2022 06:35:56 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:9f05:9492:230:f51f? ([2001:861:44c0:66c0:9f05:9492:230:f51f])
        by smtp.gmail.com with ESMTPSA id g13-20020a5d488d000000b0021b86dbad37sm10239199wrq.68.2022.06.21.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 06:35:55 -0700 (PDT)
Message-ID: <432dc551-9e52-137b-3762-1726a9ef087f@baylibre.com>
Date: Tue, 21 Jun 2022 15:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] phy: dphy: drop unexpected word "the" in the comments
Content-Language: en-US
To: Jiang Jian <jiangjian@cdjrlc.com>, khilman@baylibre.com
Cc: kishon@ti.com, vkoul@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, victor.liu@nxp.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220621120015.113682-1-jiangjian@cdjrlc.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220621120015.113682-1-jiangjian@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_063604_628459_7F0A26D5 
X-CRM114-Status: GOOD (  14.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/06/2022 14:00, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be dropped
> 
> file: ./drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> line: 139
> * when in RxULPS check state, after the the logic enable the analog,
> changed to
> * when in RxULPS check state, after the logic enable the analog,
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> index fdbd64c03e12..32d1ff09befb 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> @@ -136,7 +136,7 @@
>   /* TWAKEUP. */
>   #define MIPI_DSI_WAKEUP_TIM				0x20
>   
> -/* when in RxULPS check state, after the the logic enable the analog,
> +/* when in RxULPS check state, after the logic enable the analog,
>    *	how long we should wait to check the lP state .
>    */
>   #define MIPI_DSI_LPOK_TIM				0x24

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
