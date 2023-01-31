Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38D7C636CC
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 10:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Avcs4BuHV63to9NNajSQ62UyEay2/kBH6mImyQm2vU=; b=lfhM9RwcamY2y8
	n71VgACyWjF0JlrxnjMoqveDZDX8mi01//ldLUV1ANo+NiTyZuMqp9yUCB2zOjHsea4EJg/LRb0kg
	nVDtxN0wKkOLuFcP8yIhulKsQhh8YgwqMeIHnTdtf84Nayx1o7xSkUe1NZN47AdxepMvQm+aObCCe
	OYo/FNIctopOEP5eO6dk9M8eIVFZdGDKVkFgfK/wHpGmF4xF9y4MX/LsHAsvApbaChZVnLl57P7HJ
	g/37M067KSk391/eQa9ieHNVTbe0lYnk2/YStovFMGMVC/toeKqq78MIdco+cl3Elv3AxmeBqyVct
	Y/b9UT1YzAEMjJR3yDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMo5Y-007VIt-Se; Tue, 31 Jan 2023 10:42:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMo2E-007Tsk-5r; Tue, 31 Jan 2023 10:38:44 +0000
Received: by mail-ej1-x634.google.com with SMTP id me3so40260191ejb.7;
        Tue, 31 Jan 2023 02:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AWfMqhC7t40F0owjKMxsw443nYgYg1pYLsUU0FA6XJM=;
        b=Oh37oXrWrPjyZ4hknOJyAkye9RiAWniJ74hYpeocda1ZVkga32X2jeF/qvMLwLN/JD
         c6eNQoEGVjkCDEJOdmpXC5rhl5xOyT+oHMdHgqreoYA9hw/GTNu/VhDhpUiww4CrMuxo
         MKqUZlXQck1ibcBjJK8wlOUIlgYw6d/DwTXtw0P6aVZiZLWzBuYRsKTXco3MPmbG7++9
         qBpPv/vSq8xxA9ORfaNcZQvNOZSeV6cB3YiOfVRl/wjdhM+O/H7GiwwoF2a63sFD5gpq
         JTNQXwVcmnW5zORYabtmauzlcgu9w+ku/qdtAK0bh8TQ+IcpkxPg3cGk/AnXKVuEUMA7
         r9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWfMqhC7t40F0owjKMxsw443nYgYg1pYLsUU0FA6XJM=;
        b=AuetVyDRs1CpNvH458wWE4hmV3+kSVLCjqh3Z+8tmr8PB1CZDuGqI49aoDeKr453VG
         tOVJ9nDu/TaDm3vuq0PIx+AE24J4vyZXIxMP/vJo0MOR1uxCdAtx7DAcy0LQJ4NxHz+R
         XXRPN72PV2gDGVMPHxEwaXqjafkAwiyA3JyUo9k/TFWdHj1qOMXZc7gkqQjkIKgAaaUK
         3MOCXQcZLEG6lpWWNnxb20anuT9Uu2iXOMJZUvx7B0YHZY6B++Y7DLgsh+2DCY9f0suF
         2E2BrnJ0KVRt0/r9WVfw7vEbOJ6x11EIjNyhPkupJU4yiCGSFm10suZ8KMVANYxWzviW
         8q+w==
X-Gm-Message-State: AO0yUKW7UL7IavtxcSyHY5OEecys4T0KVaxRSNKYfXtBGWnrJbwcsISu
	AGX8M4VIU2aV+GGvoG70LMI=
X-Google-Smtp-Source: AK7set9ZbsLLP3Kc0GjQujIrHil9RqC6xXl87N+oWvr8g+PlVmrzTr8pRFad/gUbGo17wMeAWPyfew==
X-Received: by 2002:a17:906:a886:b0:87d:f29:3a16 with SMTP id ha6-20020a170906a88600b0087d0f293a16mr2930786ejb.34.1675161519755;
        Tue, 31 Jan 2023 02:38:39 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8ba:6a00:a5c0:1088:ecf4:92db? (dynamic-2a01-0c23-b8ba-6a00-a5c0-1088-ecf4-92db.c23.pool.telefonica.de. [2a01:c23:b8ba:6a00:a5c0:1088:ecf4:92db])
        by smtp.googlemail.com with ESMTPSA id e22-20020a17090658d600b0085214114218sm8174856ejs.185.2023.01.31.02.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 02:38:39 -0800 (PST)
Message-ID: <671d564e-db1c-ed61-3538-97dd1916714d@gmail.com>
Date: Tue, 31 Jan 2023 11:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
To: Jerome Brunet <jbrunet@baylibre.com>, cphealy@gmail.com, andrew@lunn.ch,
 linux@armlinux.org.uk, davem@davemloft.net, neil.armstrong@linaro.org,
 khilman@baylibre.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, jeremy.wang@amlogic.com
Cc: Chris Healy <healych@amazon.com>
References: <20230130231402.471493-1-cphealy@gmail.com>
 <1jbkmf2ewn.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1jbkmf2ewn.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_023842_293335_C2D66401 
X-CRM114-Status: GOOD (  17.15  )
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

On 31.01.2023 11:05, Jerome Brunet wrote:
> 
> On Mon 30 Jan 2023 at 15:14, Chris Healy <cphealy@gmail.com> wrote:
> 
>> From: Chris Healy <healych@amazon.com>
>>
>> The Meson G12A Internal PHY does not support standard IEEE MMD extended
>> register access, therefore add generic dummy stubs to fail the read and
>> write MMD calls. This is necessary to prevent the core PHY code from
>> erroneously believing that EEE is supported by this PHY even though this
>> PHY does not support EEE, as MMD register access returns all FFFFs.
> 
> This is definitely something that should be done, Thx !
> 
>>
>> Fixes: 5c3407abb338 ("net: phy: meson-gxl: add g12a support")
> 
> This commit does not seems appropriate, especially since only the GXL ops
> are changed, not the g12a variant.
> 
The diff is a little bit misleading. The patch affects the G12A PHY.

> This brings a 2nd point, any reason for not changing the g12 variant ?
> I'm fairly confident it does support EEE either.
> 
Supposedly it's a typo and you mean "doesn't". Neither Chris nor me
have GXL HW and we didn't want to submit a patch just based on speculation.

>> Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>
>> Signed-off-by: Chris Healy <healych@amazon.com>
>>
>> ---
>>
>> Changes in v3:
>> * Add reviewed-by
>> Change in v2:
>> * Add fixes tag
>>
>>  drivers/net/phy/meson-gxl.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
>> index c49062ad72c6..5e41658b1e2f 100644
>> --- a/drivers/net/phy/meson-gxl.c
>> +++ b/drivers/net/phy/meson-gxl.c
>> @@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
>>  		.handle_interrupt = meson_gxl_handle_interrupt,
>>  		.suspend        = genphy_suspend,
>>  		.resume         = genphy_resume,
>> +		.read_mmd	= genphy_read_mmd_unsupported,
>> +		.write_mmd	= genphy_write_mmd_unsupported,
>>  	},
>>  };
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
