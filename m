Return-Path: <SRS0=6m2Z=JN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92325C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71D36115B
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Apr 2021 09:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E71D36115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=55wA/w7MaDnd/kj64ckgAUZXQCi1AeX+tYh3/pJYfvA=; b=VIYF+WzHQu/ke2A4Dw3yR426D
	rsCl6vmUhq2aFkxcGFAnfcB60toLGoYKTBmPT+GIzL8bKFbD5aRAmjpruq9HELKjNVelwt3MSH2jb
	dBzooAjYhb52Oy5/2OH77hD63KpY7C7poJFokVRJEMDtGP/nrCsU2Q+rg6V7sA7/bBvHrYrzU+qiL
	TUaHOqer2dcxuaTmmoAN4BfiM2MKdT3o4HUfLBoLjhvvIYJwvY3DZsT7WBSMGnPQDVxQqfFucFjpC
	1ZexcAN2LrzINkDPb8aSL2mie54d6m2l3M6Dg05zFNpNR9bcAejt+3b1rlo2l99pTQg529Beimpzn
	vxrkpgcQw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXL5A-001bk7-7n; Fri, 16 Apr 2021 09:48:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKr6-001Ybl-Gd
 for linux-amlogic@desiato.infradead.org; Fri, 16 Apr 2021 09:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Y6UyUK/PLZR7RRPxa5IwMOvQk8P6IAfMpv+pLHnWIWk=; b=SIeycweJE99Jyd8dOcCfipRoIQ
 zj3HaIjgb/Zb6WDHk9I8Hx+VqJNnsfsxl+EB5xY8u27LbA/y5Foc4Pak9k47g0xPdHGmOPdEd+ogx
 i/BQahSqIBixy9VjTnoU+gT2kg0Ax9WbbRMsVZLaSyliz7O6PFXPLdAoGVTTeWYVEBRCeJRIJC1A2
 5lx2TbUUO6Us1B2CuGvfp9zjbngB5GqF+jsb7wu5dn6DYlbsQ/jIJUacaV7xhbR1CMDZ5pJiWYId8
 6Zed50SKsU4pdb+RLvgVjp1YGiJrX4emuxneySqz3lgD36Yn94rjjd+wJOZQ9AWgDTuMe2Xaaetta
 32OmSs8A==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXKr3-009FHI-Ro
 for linux-amlogic@lists.infradead.org; Fri, 16 Apr 2021 09:33:39 +0000
Received: by mail-wr1-x434.google.com with SMTP id j5so25063956wrn.4
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Apr 2021 02:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y6UyUK/PLZR7RRPxa5IwMOvQk8P6IAfMpv+pLHnWIWk=;
 b=QZQkZJdBI8z4aSv5GPjE/sdUZF5KNDwCq5LFScZU1aQwxesSrQTgs2rloNEdifvRkG
 kutHzoba1sPCUsWxZjyPd2edgncUU/2Qdt9sFwNZxbEF/1AErUeJce7TeCo0pSweY58F
 sRTu860WAz3M8uM6/XAdDMy37xtCeDXbzcYA4VB33RITm7AgkBtdz6HoJzEcpvxdPbLG
 6VszU67q5srWYwsySecPDR5vGbtoUxsQgBhu1aR08i9iuDhhJLiIrAbvsw6Jp+K38Pnf
 O0fxY7RTMTlhQ6p9NrrYcoaNPcY6+cIWLP6ln+KF4a9iWUuZqCUIWK/lyj7Occ3Y3Hwz
 bTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y6UyUK/PLZR7RRPxa5IwMOvQk8P6IAfMpv+pLHnWIWk=;
 b=mtVbCZHz3nRIMOTLJVuJIKDc9Bbcy68Raw/AzMbhveA+D9dbL1iHbv5uqVIpAQ8vyj
 FcJAf3bZaF7VxOI5kNa6k77GoEpVMQcor4RdSBh+dBUUPlHuRy99+RDTscT/vxZD4tFS
 lV6RSpQR02mQ4/KD6g7P4EuncDRVyp3zqUs1PnKXvvTTrOcSQRwB0MULV2IyYe10zcfE
 HCUQ6Qg1bXJafDzj7bgdhM1x9cuKEbNIVD4V4YLk7U4N0jVxzJSf2umfKvvxhwLm6hgw
 dnf6Ah+ROYITLjj+cJMyQTu9Eh0837Szq4Ih0gc/OIiu78ey80HcGb0CkTC5YKhtfzx+
 LX/Q==
X-Gm-Message-State: AOAM531uVuL6QqOUGbPwLZLjd8Pj5Kfo2+eE5br8Sa4pAPwjKwmZqYzs
 CC7VRbeJsADE46y1GNwKpvOEZSGW7PXS2dbs
X-Google-Smtp-Source: ABdhPJyi9TudN5b27GdAZGQawwbe7hN4TWTVODnrXz7f90bs+B7teKNt5eKgfJN+j0eEBk4vPKX/tg==
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr8068180wrx.241.1618565615984; 
 Fri, 16 Apr 2021 02:33:35 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7?
 ([2a01:e0a:90c:e290:6e70:fd4e:dfdb:68d7])
 by smtp.gmail.com with ESMTPSA id s14sm9473716wrm.51.2021.04.16.02.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 02:33:35 -0700 (PDT)
Subject: Re: [PATCH] mmc: meson-gx: remove useless warning about scatterlist
 size alignment in block mode
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmitry Lebed <lebed.dmitry@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210414100010.3877669-1-narmstrong@baylibre.com>
 <CAPDyKFpNLu3R+7ODZaC7yWMYbSOujswgLTkN97FQNg5zhwSxgw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ff1d8605-4f45-c272-9bd6-e55ea8a9c68c@baylibre.com>
Date: Fri, 16 Apr 2021 11:33:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpNLu3R+7ODZaC7yWMYbSOujswgLTkN97FQNg5zhwSxgw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_023337_935351_AF7E58F9 
X-CRM114-Status: GOOD (  17.66  )
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

On 15/04/2021 11:07, Ulf Hansson wrote:
> On Wed, 14 Apr 2021 at 12:00, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Since commit e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode"),
>> support for SDIO SD_IO_RW_EXTENDED transferts are properly filtered but some driver
>> like brcmfmac still gives a block sg buffer size not aligned with SDIO block,
>> triggerring a warning even if the transfer works in degraded mode.
>>
>> This should be ultimately fixed in brcmfmac, but since it's only a performance issue
>> the warning should be removed.
>>
>> Fixes: e085b51c74cc ("mmc: meson-gx: check for scatterlist size alignment in block mode")
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/mmc/host/meson-gx-mmc.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
>> index eb6c02bc4a02..6bc151045843 100644
>> --- a/drivers/mmc/host/meson-gx-mmc.c
>> +++ b/drivers/mmc/host/meson-gx-mmc.c
>> @@ -246,11 +246,8 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
>>                  * size, otherwise chain mode could not be used.
>>                  */
>>                 for_each_sg(data->sg, sg, data->sg_len, i) {
>> -                       if (sg->length % data->blksz) {
>> -                               WARN_ONCE(1, "unaligned sg len %u blksize %u\n",
>> -                                         sg->length, data->blksz);
> 
> Rather than removing this warning, perhaps an option could be to use
> dev_warn_once() instead?


Yep, I'll re-spin.

Neil

> 
>> +                       if (sg->length % data->blksz)
>>                                 return;
>> -                       }
>>                 }
>>         }
>>
> 
> Kind regards
> Uffe
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
