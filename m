Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04A0C636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lva+MHxRcqfb3H0iUXbh3E0HSetX6VKsmJDupM0Lq/8=; b=Ljl7u31/gnn0Y5
	QOAOUIlF9C1AM6cVw0BgUKwUyijsgJ/oEUKLJH8U0PB9QhMT+h5N90iQJusQKRs8+LhS1K+FOLY+s
	03cCdRLiJJMWocVsRuHD7JDa9h3hOAuufuGnIL7DB95hnHm8Rgmx7ojp6vlR+WlPeRS5xbvzGqyIk
	lA5CgWp5FWY5z6edabb5UaRAKsEPg08aQZFEB/DQ0hfchxNfUhjwrEbO7uBTPikeTZbW0tb4WbCaX
	y1OdkP6MTqJd2aYsLCyfQhA6Ha0xKcQdUXYWa+QehoQoAm5/uStyTKdqKPu9tIsyV51FN7pp8GgD+
	o+46Qr2I9VywlOy/uAAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6uQ-009geI-0y; Mon, 06 Feb 2023 19:12:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP6uO-009gdZ-1e
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:12:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id bg26so9437621wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7TeXUZSUDSF6HYQKz6bhsTXkRAHdJ9pyS5ZC6tmFPI=;
        b=NgFUTRlQYbLYTeTRD3Of8qS5nSQO0qb3dJ1o8dKsyUFGdBMO1OxY2HZZ0w3wNnPT0n
         Bgk0rpi0vqTs47pPAjXLCthSv65D4CnAgr3ry6aejPYzTwJKkDX6qxYQDodu/WphR/nl
         2HuQwuVRMAg2cPEmPcaDgdQ3MzZXaWcuSebyalKpO1XictcReXjkNuFsO6k78OiAJ0zP
         td/N3aGqV4OarT5yCRattp/A8AvFVwM5GA4USh9ltvu2v1EWMjarpDmlwX840Y9/qxVM
         b1Dfu7Es8slXSthDPkdGSUNEtfvhOE62GgkfQ1CfseD9CyCxjS11t9Mw5QZKqaL1Hwt+
         B6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7TeXUZSUDSF6HYQKz6bhsTXkRAHdJ9pyS5ZC6tmFPI=;
        b=nvwq5idbEa0wRxY9WucXvRJfJ5xur+AAgU0RbJb6uoHcIffXwmCWnT9OLJEdHBXjMs
         rway+j5OsLSSJq+7UHcbIl/2iXAMkieNPdpCjiYiIWAauYXpipPjbFwyR97Q3h67V7ij
         yJ9v+iz5HRdJGKKYiN1M7Bq9wc6Nr2njz2SlAhtn2+NsB25E+Xow74p9UgSxQXmDfRUO
         N34l7CRE1rU445irN43/xKIEUhWaCXwGRG+cVEqhgjp17v7lc5/7rxH0/ElrgfabOg70
         RR+DlDEEamK+YI3/Yfi9txPCT9qC8e3vwTvstZaHOlwd6w4yEmpyPgrznaUzs20wa2sJ
         Hvlw==
X-Gm-Message-State: AO0yUKW63+2WMyCGugPpUk2uj/+ENlQujLxaBWmp1Pe48dga/cEmXa6f
	h9fJQAIHDPPYioe0k3jEmE66mA==
X-Google-Smtp-Source: AK7set8uZ5B2m9aXDXsHQl3JhF94bRUla/vOWPgrTbzuMopuJzj/areKdz860Av+Y/KvoolzxtJ7yg==
X-Received: by 2002:a05:600c:4484:b0:3de:b1ec:7f95 with SMTP id e4-20020a05600c448400b003deb1ec7f95mr690448wmo.18.1675710724147;
        Mon, 06 Feb 2023 11:12:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c4f8a00b003e0010a9f67sm4404639wmq.44.2023.02.06.11.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:12:03 -0800 (PST)
Message-ID: <7452928c-f134-8f11-a966-1f3bdc792cb8@linaro.org>
Date: Mon, 6 Feb 2023 20:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-3-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_111208_118549_176F94ED 
X-CRM114-Status: UNSURE (   6.97  )
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

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
