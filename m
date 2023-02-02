Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAD6C05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32K7gK4E7i8F/iJivvlAWQQjTPTZVJ3FRcTaJDNpmNI=; b=hXc2RM+3DDV1J5
	6c+YarlfFY8sXdfzwUuIvalhd/DPCLPkI2LW8kX/7KHXqfai+GDDyhNza2/AP8hJ0kXkksCPhUmFG
	25cpEuzq5PdSlOgJJwj+K6Zck3uPdTCBfOzVSN8+uf5q9ZCosrfHSf1I+tvgJlopEMXBeLo6P0jC1
	BI9kae89iNVUPewrOLcSFHTjAajsOv2sHJIR4TVS16vUnujE+tfjNslPcKARNw/jG31TDjA5+uuCK
	W5qdO9z5+rCDWJXao2BXXcdvxujIR2v2LbqTFeR+t5Udn4arDB+C/W65mqy2cKeBkFVXjdtQL034r
	G7Gct1NRw+JBYS0rYPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNT7J-00EY4K-6T; Thu, 02 Feb 2023 06:30:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNT7G-00EY3L-4D
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 06:30:39 +0000
Received: by mail-ej1-x630.google.com with SMTP id bk15so3056045ejb.9
        for <linux-amlogic@lists.infradead.org>; Wed, 01 Feb 2023 22:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7OUPmdoqA1ASCnvnJ+g3jZcLGp6QAX2wOvHgASoNp8=;
        b=SJu+4O67I8IzdqGR/k70QEVg1ppY2PLAeCKF1u1QjecAXjO6C1+Edd+7H0ftqH+m3X
         sM6BxZnsdU/wk5xMIDTGcQQdPxgs/xGJryfZLngglaLcwyMRPc80C2YtBSv8iihRy4E9
         XRqNV3s+WWzW9JmfyLwMPsrczzJV+BBfkHBD9dBHrVTIvCLzkiVUi9x3NrYYFvliQUMd
         9e+CcDY9TMjlXLqP8M4ARd3Ii0FUdCfgqCVvaNm0VENndwE1tn3CvYslJbw5Y5Hu6e5e
         m37Gh1o7iBHMKgEQhglhwv4PU8rymI8PVEQnLcJ0+R/FKiOM6NkNsxNagjq8YDoyiclW
         kZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7OUPmdoqA1ASCnvnJ+g3jZcLGp6QAX2wOvHgASoNp8=;
        b=BEFbQTN9dE3Q9djlDJVMcOfWv73dFIL/vaRqKCr2IFHE9JMLQCmOXs/ogJMAyj/HMm
         KDu4Yc5aPOLmI/Jn9Qqcac0C21/pRKoscVU40AdE2aZ4SdHkHh8OlyDqWPodvSyCHfMv
         o6MejDhhErYJvVbVUCnrpKw7xpbsHhXZQyE28VZ1/7rksS1zRSX5b1iE2p7H0uPZByhQ
         BHG2Ub5zhiL8OTDHWNpdpVXOH8R4Y7l3LTNNZmWKblGlYw/d12MEVxtj7pqXrYzPnPlL
         ICzq08z5PTZELs5TXYypoGXlU2crEqxGwrOzcIcaENX5dnY/rajjlZwMej7D9HVPdVzv
         +ByA==
X-Gm-Message-State: AO0yUKW7F9FHf5VFPgSTBZviT3LbNLZyW8XeXfyzvNERnE+ASxZjyXom
	GYsnLIhIdYe1mQFlJNFL/BU=
X-Google-Smtp-Source: AK7set/MiWq+DtZO9IGSh7aIOfdhElWixdyc3uLY7ShbgoecBI3Youodd+N8teK+EB3axH7Pyj/isQ==
X-Received: by 2002:a17:906:6d42:b0:887:d2a6:cc54 with SMTP id a2-20020a1709066d4200b00887d2a6cc54mr4844036ejt.30.1675319434194;
        Wed, 01 Feb 2023 22:30:34 -0800 (PST)
Received: from ?IPV6:2a01:c23:c579:1b00:2187:237e:ee8:4c17? (dynamic-2a01-0c23-c579-1b00-2187-237e-0ee8-4c17.c23.pool.telefonica.de. [2a01:c23:c579:1b00:2187:237e:ee8:4c17])
        by smtp.googlemail.com with ESMTPSA id q6-20020a1709064cc600b0084d494b24dcsm11072771ejt.161.2023.02.01.22.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 22:30:33 -0800 (PST)
Message-ID: <83e1e852-303b-2460-9034-ce1f91445f47@gmail.com>
Date: Thu, 2 Feb 2023 07:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Kevin Hao <haokexin@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Chris Healy <cphealy@gmail.com>
References: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
 <20230131215528.7a791a54@kernel.org> <Y9pfBpoZ4cezf6Bb@pek-khao-d2>
 <20230201210754.143357c5@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
In-Reply-To: <20230201210754.143357c5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_223038_213721_E6CDCFC4 
X-CRM114-Status: UNSURE (   9.28  )
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

On 02.02.2023 06:07, Jakub Kicinski wrote:
> On Wed, 1 Feb 2023 20:45:58 +0800 Kevin Hao wrote:
>> The "Fixes" tag is used to specify the commit causing regression
>> instead of patch prerequisite.
> 
> Indeed, what's the tag for the commit where the problem can be first
> observed? All the way back to:
> 
> Fixes: 7334b3e47aee ("net: phy: Add Meson GXL Internal PHY driver")
> 
> ?

The issue popped up with:
d853d145ea3e ("net: phy: add an option to disable EEE advertisement")

This commit added MMD register access to the generic configuration
path in phylib.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
