Return-Path: <SRS0=2n08=OG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E346C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Sep 2021 20:14:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6988611EE
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Sep 2021 20:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6988611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IQiE8W7gP5ynFU0SBi8DnK6UcmnjwhAsiY4BSpLf5cE=; b=c6aMUVoOoMDj7M
	s/0UozLKTZVdW9IfxqrHtpRc0exfBtA1q5NZI33sRRc9PYg5qO7bhDKK09NmTXIyddNzxAxYGIMV0
	wPmbpucrWfAs5ld4tDvxqTtIbiegcYFMMr6oewFbEbrEW0XOyI9rUAKqGi7WDwE4OSmLpGgrYskzX
	IDEzMvehqsY3Os9+wFjplEpMUJVb0TlA2NYQRq66xCxA6f+B9uYYbNpe2ka6MruRdxxaBN8HaTjGg
	n9AaiNnqTwReUGcT96PwGFTn1SF/Gor9lWKjO8JfLD0q9ZGhAEAzyxGS0vD8CW23IKw73L0un256x
	ZrKl7s26gRpP9s2Epd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQxln-00CK9t-OS; Thu, 16 Sep 2021 20:14:07 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQxlc-00CK89-ES; Thu, 16 Sep 2021 20:13:57 +0000
Received: by mail-oi1-f171.google.com with SMTP id j66so10660866oih.12;
 Thu, 16 Sep 2021 13:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LkjlCbdJ+/1asKmrWsWvetw+Vl0IFwVHJ8pm/ixnUJ0=;
 b=5HWEkMOemVjeg0j/HWwZUyXf7BCI+l8qS+OjxKtGxFqNUbY5m1D7bYIKa74oLoMOzl
 pu9Vo5xDy0XnutYFRUceATFqHv8kC9ED3CbwtWqwi6VIBIPptulBHSg809X3aADGUYAW
 SXCr0tdNkofqZIssbgT7Va5hU6eGekvFUA1QgSREUEPpnM82JueF4Als/WZjveHeojvW
 wn6x/e82PcEC6YldROmo1gsDwQ6I57oJHmqXxTO5NMKlnzAd3kyWIZ8oLOdUOTtjERCJ
 YyyyTjUEJakNSsQfMKbfTtm70gSuXTZ3cAxN92dzYfY65lIvk+WPmCSkWZq3uYB6SlmP
 lngQ==
X-Gm-Message-State: AOAM530lmlmvYwH1gdTwaBDYBAZioSz1AxOLA0/Maf76piapuvDkrU+R
 t1goyXJaXUwy/84sZAiX/w==
X-Google-Smtp-Source: ABdhPJypkToC1MJEJpn8Xj/+02g+RldDXoc1hjYx0aMlQb2vDjNw3JYQQwtuw7XqKuuLAMKUuLu2Cg==
X-Received: by 2002:a54:4812:: with SMTP id j18mr10847011oij.55.1631823235172; 
 Thu, 16 Sep 2021 13:13:55 -0700 (PDT)
Received: from robh.at.kernel.org
 (107-211-252-53.lightspeed.cicril.sbcglobal.net. [107.211.252.53])
 by smtp.gmail.com with ESMTPSA id s8sm952199otd.76.2021.09.16.13.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 13:13:54 -0700 (PDT)
Received: (nullmailer pid 1420373 invoked by uid 1000);
 Thu, 16 Sep 2021 20:13:51 -0000
Date: Thu, 16 Sep 2021 15:13:51 -0500
From: Rob Herring <robh@kernel.org>
To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: vendor-prefixes: add jethome prefix
Message-ID: <YUOlf+LDMXewucbW@robh.at.kernel.org>
References: <20210915085715.1134940-1-adeep@lexina.in>
 <20210915085715.1134940-3-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210915085715.1134940-3-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_131356_525426_154DB94E 
X-CRM114-Status: UNSURE (   8.96  )
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

On Wed, 15 Sep 2021 11:57:15 +0300, Vyacheslav Bocharov wrote:
> JetHome is trademark of IP Sokolov P.A., manufacturer of home automation
> devices.
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
