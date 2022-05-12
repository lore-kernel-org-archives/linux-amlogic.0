Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA5AC433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 12:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btgrEjruiI38gAEzhYO2nHHKTVUdiJV9p80ZQR2Wyaw=; b=GjyX4K/b7teX6mxPmwEUUyB06i
	abXKGRD9Hemtezh6TPKR4FmAwZBWc2OesoapG0m1v94EGSnjr46TVV9RIkDTkni/EPFbwlgp3HSZC
	C/pD3q7hxXPrpavOr2LPOmglU+ms2aJZiJrPSnBy80dKZCRZL/LSOHF3LAVipz9I4TAfwFgT7bWXB
	zeXJKhytmkvAlGUTgbQn7nzTDVm2MUSM24IZHjzz8IkrjXi/p4eEjWC1Fiwoocza7W+RwWmaJOqyu
	jnY2G1ZQXdoSrSCw/7yalwjivVlvyf+TjL8bBO6XjuYRNtyRqSZdqSLR9IIM+rGoqRVkxDh0UER9C
	Ou2+Xxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np7oD-00Bk5r-Tw; Thu, 12 May 2022 12:20:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7oB-00Bk41-5g
 for linux-amlogic@lists.infradead.org; Thu, 12 May 2022 12:20:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id d5so7010020wrb.6
 for <linux-amlogic@lists.infradead.org>; Thu, 12 May 2022 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=RB4UFWflnqT7YBqkDdk/tHJ953wpGWAq9+2dQip5Mgk=;
 b=SYyQEfdTxPtJhqIjDzLvhoXxyWDkBykTLx2EMy2UIBn9ANURE3n1SbvvtNKJiZRdb9
 QxgtIFjOVr0i1qU7eFxs7SAlFzFLIMyOfqJQRMcVZwp89iY5o2qN8fB/bRpKe413XYx6
 080m+FmyhUnWUdQhf33FL6LXzpjGiaJP383/f5NwouESb9+/Ap6JFzbb4ituiGdzm1o0
 no25PcXJuN67b6sN8hdFf4Fu9mryvYGvwYBqx35zXirO6yTRdPLYG2GInX6XHZoHBDGA
 w8y4OdbFAKcH+ezHiHm+UjUB5pt9wJuEFHUQvmwwSAUJOpdM4SXx2ohi5d2cuja7KxzU
 nCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RB4UFWflnqT7YBqkDdk/tHJ953wpGWAq9+2dQip5Mgk=;
 b=shMyE0gJey8qL32VtcL0kiL5ENZxpcgVaTXyr2BtgC8H/2F8C7Qj/bk7l0yUm0T5iR
 EUbVRrFGvMpzgIORKDnatPFSMAC9P3qevWB9Ug5JrKCxot/j9lTh/A48P2aGa/GCW886
 pEu26/yRzhT+tusqqWeMITw0Khdk0fOfe10sxdpagjKwn78gwvq0DfBxofMB9Q7EdrDD
 6mdrzABO07wEQtfY/P5YEiEcd3XxnA+oWwDFXmdk5FbFbHzTI7eZGPL5RYwRT1klVssZ
 y60hJD92ZryTOGhLjOj0n3tqmDulqQGz604PdGdLFIVxGWMKjw955JLmcyGt2qQuUUT9
 ydiA==
X-Gm-Message-State: AOAM530MsCpHgqAIHXIrUXy4lFMrGSGfEej8nvq6RzLTgPNue4RPG6Nv
 sdemDPVtqY+OPFteQS6gVP3OVg==
X-Google-Smtp-Source: ABdhPJyu1aKN5KiuDTzkBD61oRd1v63Bb1+xpDXJPlEui//nYUG2arMwW3pCr9WkbGGiND0niBZcfg==
X-Received: by 2002:a05:6000:144f:b0:20c:6090:3040 with SMTP id
 v15-20020a056000144f00b0020c60903040mr26377831wrx.479.1652358039271; 
 Thu, 12 May 2022 05:20:39 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:8073:a89f:6230:abb?
 ([2001:861:44c0:66c0:8073:a89f:6230:abb])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b0020c5253d8ccsm4104892wrt.24.2022.05.12.05.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 05:20:38 -0700 (PDT)
Message-ID: <dabe6a15-b0ba-0458-bbd7-a07224071920@baylibre.com>
Date: Thu, 12 May 2022 14:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220511054052.51981-1-linmq006@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220511054052.51981-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052043_238530_48B1AB94 
X-CRM114-Status: GOOD (  16.40  )
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

On 11/05/2022 07:40, Miaoqian Lin wrote:
> of_find_device_by_node() takes reference, we should use put_device()
> to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount
> leak.
> 
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 5e306de6f485..de87f02cd388 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -435,8 +435,10 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>   		cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
>   
>   		notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
> -		if (!notifier)
> +		if (!notifier) {
> +			put_device(&pdev->dev);
>   			return -ENOMEM;
> +		}
>   
>   		meson_encoder_hdmi->cec_notifier = notifier;
>   	}

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
