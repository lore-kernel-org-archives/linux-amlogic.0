Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9B8C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 08:06:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C4260ED4
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 08:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5C4260ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VaT/5vTIzR+V+Ndym20DPoWHsCU5BG/RWv8BCsE0EAM=; b=SD9YvXyWqLYTIUTVrqWC94m7V+
	yKFQWrOGGi/LSzV83vyAYOvi84tn/rKui716YYAXqosG5oC7VQQbFhBnG8h64kSxPLQAWH3dwg0Qs
	zfR8OcFnUx70NcdLli1z7qw0MJFmeqkFsX2tSM/ss9F+kJlNQ4+pOd8hFNBJzxzOnNLg2XpVgzF0t
	LjfyvgGL9tHF7wJnGlT76R29194fUItDA4/BwW8TTj6avh2VNrW9cUX+17eN7lUUL2bTMQSAWFsLi
	9rpySKyYJ3hHa7iv9q8E07jz9dnvj+ykffFmZ/39O8ZLgqB6nfQVtOoDi1cAgPIzLT46mhcXM3cxS
	cp33nYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbIEr-005rVx-IH; Fri, 15 Oct 2021 08:06:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbIA6-005pdf-8q
 for linux-amlogic@lists.infradead.org; Fri, 15 Oct 2021 08:01:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id e3so24748176wrc.11
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Oct 2021 01:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YxrOR9K6vhkLr9CjYB6yPZ8dIuZ0sUqPm84e+3V43ao=;
 b=gbtRdhAVWAfMeOpv8nsZ8fzW2oljAjNi4vEA1JRQhEUqq5+H14WXSh3SLab1ZMd6WX
 Uwo8YQk0JnXz7xfFsaN1sZJp2x5CbDi8tx1wf3EhmdXr1iYtp5IcL2ElDUvi9h9natRL
 WiVSAt4SRScgQ8fncgRHTUzP4r6Xinmp73uByxmuljlZdevUigp26lus9IuSiu7kntLS
 fVmiIzimtdLm0Ey62cl5p5ENcf1HNCEsN+VmAq6OSc00eE/BS479DkfkKGVLgB2VEMsy
 JBjaKUNAuXOypRIlDSfp/VYU9yCk72x1TLHpMG6PEEO6MgpvOUwvDbMa+Pr4zZ006Xr5
 yKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YxrOR9K6vhkLr9CjYB6yPZ8dIuZ0sUqPm84e+3V43ao=;
 b=mcjvhpGmc3ey+7JfsKK6Fz1j+vRlfZ4Wrnev1sFtkMghBGltG3of+LCJR/p0wKcAhU
 wiAIDrMRKr1lsHM6yHy3oeKFCu8r/JZIbFxQM8zpMYi6koJtDWs2HsAPcSSB2RKxBstU
 IR1cQoDXdPUrpbSaAvB5GKzK/voFodHBF5DBwZUIX5ekXYu0jxzj+16WjeexJvJBWqFR
 syqxTmx27gTSHArUDw6mMk/JccU82RgMOnUo9n3cNCRVYmozLHOMWMnjfN//FolKss/p
 dSzjU0MW3GmSV8rYd5XSz69WUfRoGIVmItkuDifJ219vRqvktjebhMKHhrqDg7AIO01A
 zExQ==
X-Gm-Message-State: AOAM530KWT/xWGtd2g9X6zJD0yBRjmT2RoW4ZW6E1yXbmRxUIY15yHGO
 ApHDzSH1fq0FQ/bWJUAUFCXheQ==
X-Google-Smtp-Source: ABdhPJzkiF7LkaHDd/2UrFjm/BApNwYvDwLW34HSiWSar7EyjXdbWpJay1YOcgLGP/mkp1k56fulIw==
X-Received: by 2002:adf:b348:: with SMTP id k8mr12345019wrd.435.1634284910439; 
 Fri, 15 Oct 2021 01:01:50 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb?
 ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id p17sm4241934wrx.33.2021.10.15.01.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 01:01:50 -0700 (PDT)
Subject: Re: [PATCH 4/7] drm/bridge: synopsys: dw-hdmi: also allow interlace
 on bridge
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-5-narmstrong@baylibre.com>
 <YWhyGBlz7JW8NciX@ravnborg.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9ec51817-a9e4-8a70-da08-5bdc2ba73697@baylibre.com>
Date: Fri, 15 Oct 2021 10:01:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWhyGBlz7JW8NciX@ravnborg.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_010154_389682_A97A1970 
X-CRM114-Status: GOOD (  13.04  )
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

On 14/10/2021 20:08, Sam Ravnborg wrote:
> On Thu, Oct 14, 2021 at 05:26:03PM +0200, Neil Armstrong wrote:
>> Since we allow interlace on the encoder, also allow it on the bridge
>> so we can allow interlaced modes when using DRM_BRIDGE_ATTACH_NO_CONNECTOR.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

I applied it to drm-misc-next,

Thanks !

Neil

>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index f08d0fded61f..62ae63565d3a 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -3413,6 +3413,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>>  	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
>>  	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
>>  			 | DRM_BRIDGE_OP_HPD;
>> +	hdmi->bridge.interlace_allowed = true;
>>  #ifdef CONFIG_OF
>>  	hdmi->bridge.of_node = pdev->dev.of_node;
>>  #endif
>> -- 
>> 2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
