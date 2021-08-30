Return-Path: <SRS0=wk+L=NV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDB0C432BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:38:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD52760FE8
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD52760FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Rzjzdt5rvgp8PTdygElQqZOs/SHyEjr9L2tbGUGRvis=; b=fZI+PCN+5xLYD0h4NKdbKXIcLd
	b0g8y5V0zwUoOwVz55bSnZesr/0/8UvY5ba9TQZ7CEIiOl/H1ArLV9d9TFacENLlm0wMIdmNM6TZ6
	Zj5RyGAtecCM6J2goLQcJ8dUwMiPfng6dz3W5OETmNB4T9Vem6td5Br5saC7ZeN9Num1YbR56+vNm
	NgFZYJxKo+jbJ575oJItMqB4OCB990/KBKqe3A2BNkA8bajpEGo5H0z5kbtSuSrlaDwei4INXpRQE
	utFe8wZaMn4dsnmc7MYiPCU6c718aeoUKRJ3mh3hJcektYsOx7IALzA1Us7imFdqK004ReWYOrORK
	WM/p2e1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKbsL-00Gd9L-BF; Mon, 30 Aug 2021 07:38:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKbsH-00Gd88-Pb
 for linux-amlogic@lists.infradead.org; Mon, 30 Aug 2021 07:38:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id z4so21026521wrr.6
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Aug 2021 00:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IIuK5AN6rOwHRqOQzWHnDlaxFuAjSCvnIBuo4tIPMrU=;
 b=jhRqDVp3+k5FEhVJRrRo+oAR/cou8qtONW4IOSXc6judwU9QvNR5axI8vubenCFBTU
 ZzEK92yT/QWIOuhLZ1gFgdgwjYS4Y7hRQzmt1KkXhgc1UbxxS9eoCKy+v61gpd4Gc2De
 u2HHNy9hAQrPvcqag6kotRyM53TJYLnd34TfPyzw5yoKZY9gPSWsK112u4QsLZKm/ToT
 ayImL8el8JLkmT+mdqJ/KEXy9E1iy1QmVAZradJm4jp3Cur/a2JqCxhu3huJmEsMM+xj
 2XMswL7KrhHmCFm4ctXLFaNFVubXOvF8LZoSkX3GoUrFe2H/Sw/Lis7zsYhfbLPsLLwI
 Wm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IIuK5AN6rOwHRqOQzWHnDlaxFuAjSCvnIBuo4tIPMrU=;
 b=UZLM+WU3BqWLUYg4ENIa7DgKuPNwcT1JZeJcOQwbjb5eEtiRSzj+Y50W5SKljyvSR9
 KBSl//XCyMBzgMhxU5AVKvVojMBwOMagFcOewrfRkdmrjsOd+en/pzutt9Xl9vEpG3dd
 uZKI+UntaEEW/r/RlOweu/+2jexN6akGpMsbhydaTO9dSQ9GlGejBfUerANG8cJqpfSf
 tl8mx6nfoCgMLyPr1LChcsjvo9ZEzParaNgSBCG0wKaWMT+Zf6MbBeC02wjjM1g60hip
 RT6dYSqim2Bal+uw9L7IPXBllL1mABG0NxpVmK8SYZMv61feRuAYZxFhA6IKiGoYHugH
 sooQ==
X-Gm-Message-State: AOAM533pnwv2X5RyQ2+0eur0UBfr6LhboIQDN8OEAL6nR8ftLb9/80UV
 rqiOBWowWYU7JlvUK2Gw13IzTw==
X-Google-Smtp-Source: ABdhPJxBPl8zzAjs0+dT++iiMSPD5GqlY4dKaWCEO3TCnsNKykPaH2AOIyinee4ViDNYdQ7yiWIh8w==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr9756319wre.187.1630309109214; 
 Mon, 30 Aug 2021 00:38:29 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2ecd:4eac:486d:7a1?
 ([2001:861:44c0:66c0:2ecd:4eac:486d:7a1])
 by smtp.gmail.com with ESMTPSA id k16sm14929504wrx.87.2021.08.30.00.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 00:38:28 -0700 (PDT)
Subject: Re: [PATCH] soc: amlogic: meson-gx-socinfo: Add S905Y2 ID for Radxa
 Zero
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210820012718.10761-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <2fa65900-ece6-fa13-4bfb-dcc95c56e6ef@baylibre.com>
Date: Mon, 30 Aug 2021 09:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820012718.10761-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_003833_907998_9E79F6D5 
X-CRM114-Status: GOOD (  16.27  )
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

On 20/08/2021 03:27, Christian Hewitt wrote:
> Add the SOC ID for the S905Y2 used in the Radxa Zero. Before/After:
> 
> [    0.321650] soc soc0: Amlogic Meson G12A (Unknown) Revision 28:b (30:2) Detected
> [    0.318533] soc soc0: Amlogic Meson G12A (S905Y2) Revision 28:b (30:2) Detected
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
> index 6f54bd832c8b..165f7548401b 100644
> --- a/drivers/soc/amlogic/meson-gx-socinfo.c
> +++ b/drivers/soc/amlogic/meson-gx-socinfo.c
> @@ -65,6 +65,7 @@ static const struct meson_gx_package_id {
>  	{ "A113X", 0x25, 0x37, 0xff },
>  	{ "A113D", 0x25, 0x22, 0xff },
>  	{ "S905D2", 0x28, 0x10, 0xf0 },
> +	{ "S905Y2", 0x28, 0x30, 0xf0 },
>  	{ "S905X2", 0x28, 0x40, 0xf0 },
>  	{ "A311D", 0x29, 0x10, 0xf0 },
>  	{ "S922X", 0x29, 0x40, 0xf0 },
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
