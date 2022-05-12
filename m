Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182F2C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZB3eUIbNdoa9jJ2wZMwVQW3ra5gFryJcFkFEfB+4B4E=; b=HlQXcFtPQ69FmyRygUKyvHYLp+
	1CRKbV14A/4LEAWC7rty2MaqccxPwTzI4Zg3zJ5eCDmOBdkZf91IsneyonGiiPCRinC3bRFeXbBK7
	bENb3Ff2tSkNIq9lssM49OE1wURRpJurZOOwqUiZ7Slh3vbTe7HeNpoRNkBG9YKKTM9VnrPFCOshn
	QxEB/mASCQoS/GSgZldeLg+JOp/fyDrAn12M8qJQ1BbW5Bu3XKi1XmbH1chaR9RptezjfJdOcLBsC
	eL3SoiGnD/ordqaoGCCPGIZYxvi7fHAtPh90Kq9XTgYr/OkNP/x+Dmg+CnLEIs8hleiDQyuZfOFSp
	4LQ3CeEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np5BQ-00BAgX-A7; Thu, 12 May 2022 09:32:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np5BB-00BAaN-Kn
 for linux-amlogic@lists.infradead.org; Thu, 12 May 2022 09:32:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id b19so6366149wrh.11
 for <linux-amlogic@lists.infradead.org>; Thu, 12 May 2022 02:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=VQN/aLux/2RP21RLeqsLxxrhMb3H+/UUp0giAkzj/KY=;
 b=WJZbJ3OILOz44m7dxa/s2kBpGiX7pJmSaVbOIL68jRiSqr9EeJmEipxQbwv+V0NeWH
 LDFrHfyUZfcjCqrG4pddn/y3+5G0c5SgjS9TTM6+PTlCLH4RtR3D+ArkoK6psjEf6TUn
 fFhHpqmqZjO8isUf5vpZOfmIsp2v9Z0HGvAZlf+bLlMtUWvDIgZ2uZ2Bstilfe+qxyDL
 wLuehjGI3xQCoLXdk+xwxtnZ9UQHyzOzbzastcFlEIjBi1G7+jsfaTswBPIhjzIYvaVN
 xiaukeNdk0zHeO4+Xa6a3EGLePNKgLcg1H5E37Yy1321Tq4c9g2iritE1Yf3Fe2q5/Xt
 nRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VQN/aLux/2RP21RLeqsLxxrhMb3H+/UUp0giAkzj/KY=;
 b=6So0y7KA4PZ0WJBvJpzDAWUqoN4EbKzTV9xE3m+EmX42siOA5wbc44h5jinDLjDNxE
 AZ50xThXIyPm9GQKy1TTZhs/Po7aPzYliDpBPcLA4tE7LLjZtec4x2/vWv1lQBDNiJcS
 d2A3P7dMqzyjv8FOTZidPTDC2cmUPF4Ryf0ahH7bZj0/mKjc3ZceBunVSXxX+IvUm2E5
 u7X9Niw97KZXo9W1b+gUiOIOGVmT4vQmOYtIboXXyN6vuH1Dcj2t6PcuQLh0rFkBuK/N
 lP6sI3Yx1KxdRZO3TQ/AZVf5jfEYbyAh59BzAsDD0yAA72mk9N1woRnOfGANmGmbLmwF
 t0ZA==
X-Gm-Message-State: AOAM530AaSA8bYGu7FQztxVMe0GdM/v3O6RP/JaBg/askq8b170WjBg0
 ojh1C39GT7IWQbumaG6Zwf/fSQ==
X-Google-Smtp-Source: ABdhPJw00kG769CryQ6GyYt8QzevXxWsniJdsZ3bDBhdnyNPjJ/q5GSrgrVTkEWWjjGvXIW0MOpg9A==
X-Received: by 2002:adf:d1c2:0:b0:20c:a916:490e with SMTP id
 b2-20020adfd1c2000000b0020ca916490emr25540965wrd.403.1652347934209; 
 Thu, 12 May 2022 02:32:14 -0700 (PDT)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a7bc04c000000b003942a244ed6sm2203918wmc.27.2022.05.12.02.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 02:32:13 -0700 (PDT)
Message-ID: <a811a26e-ec34-f9ce-589f-82e96a975594@baylibre.com>
Date: Thu, 12 May 2022 11:32:11 +0200
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
References: <20220512092114.38426-1-linmq006@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220512092114.38426-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_023217_709320_BDD6EF87 
X-CRM114-Status: GOOD (  17.35  )
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

Hi,

On 12/05/2022 11:21, Miaoqian Lin wrote:
> of_find_device_by_node() takes a reference to the embedded struct device,
> we should use put_device() to release it when not need anymore.
> Add missing put_device() in error path to avoid refcount leak.
> 
> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

You already sent the same patch yesterday, please avoid this.

Neil

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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
