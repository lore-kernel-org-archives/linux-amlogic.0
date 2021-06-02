Return-Path: <SRS0=wHej=K4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33251C47092
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 04:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC05A60720
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jun 2021 04:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC05A60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qxvzGfRXaa1W1ooXvxUXH6AEl/9MOqLz9Ei9+p43Gy4=; b=p9BpNy1RAv28kT4hqSnEaSIeWa
	VqVY6htlG5YdpJITLsd9cHai7jI36o0H6AYRhirtEov26zsMq0SqocUMhvrdbDOjtbuKXsIUydS9j
	gGHl5kcYDUVVmLVCQ9K4Tnw2aZrB2mZ3/oKWd33MNG5QQzZKVc4KYp6G20UvidZZfT3ldPu6dMfFj
	BtIx3SVlDXbt9+HoKzSf11OllBBEVxxBGSowCb+gw9qEm65f7vQTKTH+z4uUKzto54MkENC0aOeKy
	XAiEsFBnjjIXyoXKavcN7AMoeeVjazkBQWKBuMe06c9LvKVnOl859k4dmdQ131zV8d5Zpr0adJIlX
	5uEWxylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loI4U-001lYr-M2; Wed, 02 Jun 2021 04:01:34 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loI4S-001lYE-DQ
 for linux-amlogic@lists.infradead.org; Wed, 02 Jun 2021 04:01:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 29so1141373pgu.11
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 21:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Psg5LZgVxkE0XFjla4qijJ1f+kTs+VjX8IAhvkS1TnU=;
 b=PzEglsbnRKOgy2zmiQZPocEgrcplSj7vy6E3yjFAHp2jSlOuDmSsyi0VJeZ6SREY8j
 b9aoSpkmlve5vyHZXP4NOWe8xEGYOB9FddFgVhcn0hwPiGoG08dYbr43ahwIwG+LcGT2
 CejYHEVx6cJDLEc81g7FA5LeQ+XetLJZf80PPQwHwxlgUBlzwqvDJ3dXyO+9cDVRYSK1
 26KOszqc1Bi4JhB5bJvO7LXt83NvpFtxge0SpSxDoqHUzVmuV/iki2xcZXuF7eeUrMh7
 XriLy2HSXpf3DA5n3PiT+i8mi1zv6TZT40lbR/YZ2X/mrS4rn1s0T7fgXsDX2lIohWpo
 /eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Psg5LZgVxkE0XFjla4qijJ1f+kTs+VjX8IAhvkS1TnU=;
 b=pFE+k0Oy0X+yFbi0MnidxoKNE575dW0iF72k9EY6BJRQRdRcvN7aE9WZ8g+aEzuQpp
 m/q9dTbjioPL8VC9nwrhVCmY+VoTqdWgyKD0BNoM4kZirdvgqL5wXt/yoTIs44p1JOkf
 LUvABlNTbPHdcnO4I6mVjNn2OqRPo4dT5z6IjfFDZVd/fxRNj+E8INTYaLvk30/j2lPM
 rLf8Z2OClM2mq2Isp19jMozHfJaz4nLm0O80byHG95NjR93UBd+2SYqo/icRdNi6aq1N
 6JH3Q36dYJBCZRWiwFqB2oN3RbPrbJO4alLxK/iLwfEwyFALDPsee55ur8ZKfV2xzwoT
 7MuQ==
X-Gm-Message-State: AOAM5335HXEO7EGiisR3gyoOhIlL8/hss+iFjUL7bWZw2hmW3Gc35qrY
 DNNxP++ebyxkHmMqYDj/7NA=
X-Google-Smtp-Source: ABdhPJxKlLfx8fGrjuW4kyOWyd346i+7tCQUK8Q7+rHQRknOzVIZop1GxuD0qUV4+7AkKc3PzRieRw==
X-Received: by 2002:a63:1b04:: with SMTP id b4mr12560718pgb.224.1622606490927; 
 Tue, 01 Jun 2021 21:01:30 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id c21sm2955384pfi.44.2021.06.01.21.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 21:01:30 -0700 (PDT)
Subject: Re: [PATCH v2 net-next] net: mdio: Fix spelling mistakes
To: Zheng Yongjun <zhengyongjun3@huawei.com>, andrew@lunn.ch,
 hkallweit1@gmail.com, davem@davemloft.net, kuba@kernel.org,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, narmstrong@baylibre.com,
 khilman@baylibre.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: opendmb@gmail.com, f.fainelli@gmail.com, linux@armlinux.org.uk,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
References: <20210602015151.4135891-1-zhengyongjun3@huawei.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ce8d1b78-47ce-9211-d948-093d316ea647@gmail.com>
Date: Tue, 1 Jun 2021 21:01:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602015151.4135891-1-zhengyongjun3@huawei.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_210132_489116_16AC6D3F 
X-CRM114-Status: UNSURE (   7.49  )
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



On 6/1/2021 6:51 PM, Zheng Yongjun wrote:
> informations  ==> information
> typicaly  ==> typically
> derrive  ==> derive
> eventhough  ==> even though
> hz ==> Hz
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Your v1 was applied already:

https://git.kernel.org/netdev/net-next/c/e65c27938d8e

so you would need to submit an incremental patch thanks!
-- 
Florian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
