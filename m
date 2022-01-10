Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E7C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YUiLGXMBBB6UXxYPcP2UqoFylrvaEAfaqMYjvuH8/90=; b=ajnR9rR0FFymY1fsTrFmoQhp0T
	909bs9Dv8ATyMKQZxMu/zaJZkwrWApxZly7QABCUQDvgCxjseJBQWMoesPoBpvHhWZKsUdD0G25AN
	VWfOhaBpg+opK+fpl1zrTfBPh/wGWPhNvyFbu3n3zXK9PmwQVNKo9SXPeIAJJ/RZgwsvsoekF/zKR
	l33eIHHWWQ6KkAfy9M9gpMBDihNtVOjx9/yLG19mfZ/Ft8pdvMs8pakEqF3mtwiFPzNupdnJ2UvwR
	NaK5wdytXGjQ3HLE8eWcE8t6Y4RS3oo/72S3mMIhEUx5i7tw9Hn51YBfKDQb8Qc/ABLwFBIswAJRg
	5yQxWJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6uIq-00BSYD-R5; Mon, 10 Jan 2022 13:01:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6uIn-00BSVl-6q
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 13:01:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso5173147wmf.3
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 05:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VJEMyTSL01yzwyzBH1ogq1RDgA7lqAGH2WXcdzLGgjo=;
 b=KuZAXZ3ZWP8qIfuAbD36Zgtco5ENapO7WysQBN72KNU/8/BG1U2Mmkp7kz5JzXw1h4
 7kKeaj81XNLwaybFvBgCk5A+GEDd0y82Itp6RYah/xvFxMYrslBZELHGwM0KCFNCirpD
 Iq+xnMELOpHDfZRAVvgwfGfx2gNO+xj4F1XbF8c35iqvcR0SJneFup4QsrLRtvVFlLVX
 IYJd1HdGfEiARGg2FaMpI6mdfSMGXLkM+glHg5yo9LRltnZjvWkuqfAa5qSNlT3JnCe9
 7tm/sd75DC/QtPLNd+tfU/qdG6sfK1OKOacsct3GZoKSG5VEN0zQcSZK19O2PIin8nBi
 g4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VJEMyTSL01yzwyzBH1ogq1RDgA7lqAGH2WXcdzLGgjo=;
 b=PcoWLNPLTkWxitsT0ZkuXLwHmHLlK5e1dlSH07A008qFhNwGX4NPB2RCumpo2SxJ8Q
 j/fXmK6SajdBwXVO25fuc4qTrboVy434AJQMRJCVyCYpLngvlHlxLLwD4u/FxMF9rGxK
 1yQEjL16AQb33yqNfdP/U2YnJQfZbmNMRw91a59DIN/khCyYogKv7U0VQ418V08nviXg
 ddnonWkcQikHgzrOFqJtSQQgOxkAtzLw4TDZdCSzRBSwdeX36RLhrnuAB+5qlnNnApbI
 kQ7zmUqxbDASt+2QE9cMeV6VOpwuZs/yrIcUJrUxW4iIGZ0UwvXxRolQlzVbj6LZAbTB
 OoGw==
X-Gm-Message-State: AOAM531uWRGOVlCSs2cZiyJBiPiC3uWUTvfT0trq6JUBhxsYa4C9rOeB
 5QLKwac2Q9HmWvo+fSN8tIPEGQ==
X-Google-Smtp-Source: ABdhPJxoccRH+KX27a/eLPTTXByrJgo/z+jQlyAzLsIRsJcCmZV3LChVjnKha1NAc/+h3HDFi05wHg==
X-Received: by 2002:a05:600c:21cf:: with SMTP id
 x15mr2545054wmj.8.1641819691598; 
 Mon, 10 Jan 2022 05:01:31 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id k19sm6384673wmo.29.2022.01.10.05.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 05:01:31 -0800 (PST)
Subject: Re: [PATCH v3 2/2] phy: amlogic: Add G12A Analog MIPI D-PHY driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kishon@ti.com, vkoul@kernel.org, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220107150512.614423-1-narmstrong@baylibre.com>
 <20220107150512.614423-3-narmstrong@baylibre.com>
 <CAFBinCC9J_w9JM-TmrXp7SXT27V7Ze37wrxHZZQ1==N4y2-0dg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3f7f1c95-8a16-cb74-3a99-3f67404424db@baylibre.com>
Date: Mon, 10 Jan 2022 14:01:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCC9J_w9JM-TmrXp7SXT27V7Ze37wrxHZZQ1==N4y2-0dg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_050133_346491_94C3729B 
X-CRM114-Status: GOOD (  21.18  )
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

Hi,

On 07/01/2022 23:09, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Fri, Jan 7, 2022 at 4:06 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +#define HHI_MIPI_CNTL2 0x08
>> +#define                HHI_MIPI_CNTL2_DIF_TX_CTL1      GENMASK(31, 16)
>> +#define                HHI_MIPI_CNTL2_CH_EN            GENMASK(15, 11)
>> +#define                HHI_MIPI_CNTL2_DIF_TX_CTL0      GENMASK(10, 0)
>> +
>> +#define DSI_LANE_0                             BIT(4)
>> +#define DSI_LANE_1                             BIT(3)
>> +#define DSI_LANE_CLK                           BIT(2)
>> +#define DSI_LANE_2                             BIT(1)
>> +#define DSI_LANE_3                             BIT(0)
> At first I thought that these should be named
> HHI_MIPI_CNTL2_DSI_LANE_0 (and similar).
> But then I understood that they aren't bits directly in HHI_MIPI_CNTL2
> but they belong to HHI_MIPI_CNTL2_CH_EN.
> Have you considered naming them for example
> HHI_MIPI_CNTL2_CH_EN_DSI_LANE_0 to make this more clear?
> 
> [...]
>> +       if (IS_ERR(map)) {
>> +               dev_err(dev,
>> +                       "failed to get HHI regmap\n");
>> +               return PTR_ERR(map);
> I suggest using:
>   return dev_err_probe(dev, PTR_ERR(map), "failed to get HHI regmap\n");
> to simplify the code
> 
> [...]
>> +       if (IS_ERR(priv->phy)) {
>> +               ret = PTR_ERR(priv->phy);
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(dev, "failed to create PHY\n");
>> +               return ret;
> and similar here:
>   return dev_err_probe(dev, PTR_ERR(priv->phy), "failed to create PHY\n");
> 
> [...]
>> +static const struct of_device_id phy_g12a_mipi_dphy_analog_of_match[] = {
>> +       {
>> +               .compatible = "amlogic,g12a-mipi-dphy-analog",
>> +       },
>> +       { },
> In the past I was suggested to use:
>   { /* sentinel */ }
> meaning: no trailing comma here so nobody can add entries after the
> sentinel by accident.
> I suggest doing the same here if you re-spin this series.

Yep, will do the changes,

Thanks,
Neil

> 
> 
> Thank you!
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
