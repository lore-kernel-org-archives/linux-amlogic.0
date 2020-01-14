Return-Path: <SRS0=nUoP=3D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51027C33C9E
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2020 22:22:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204152187F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2020 22:22:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nVr8tJ+4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204152187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMUl0K/R8kKHIWxtE1d8JQOQdYDUYxqx7ij/LrZNgeo=; b=nVr8tJ+4Lsp7Xl
	7Ef54ZQkmFk2jsq0MEdixZ0jTauGJbp5cnRs7gEzfxKx2e2qUg0yhljWoiphKxESkaQCRXAaqFm6R
	L4q27nwYlH4LgFKrc97hhGetR383/qUO5jCn4fvfioi3+1ZBnrp/WayXrJpugYYI/s+qTrjcfcbyX
	P/nli3mOWbXDtW1hVgdFTrBovlp+CRsLp/HDK38wl4qP9m6tHvNverInFhpUjeGWP84T2ZCHngJPF
	XX8zI9YRCbGAoiqXYjYAOsKai9FHfTrmI02Pgft1iMnxkduP3qb4Kj6NKVAguid1T+/2i4iPsjcsI
	w681jthvHgx9M69K8/QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irUZv-0003os-G5; Tue, 14 Jan 2020 22:22:27 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irUZt-0003oA-5r
 for linux-amlogic@lists.infradead.org; Tue, 14 Jan 2020 22:22:26 +0000
Received: by mail-oi1-f196.google.com with SMTP id n16so13454068oie.12
 for <linux-amlogic@lists.infradead.org>; Tue, 14 Jan 2020 14:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Yb6xHORuBeJhfPujkVSQ5MYYi1HxS0bOoVjowX+c/ks=;
 b=lGZvm3zyEQ5ZB6HgjYDucNA/RSUn13pTCoP5S1yr8bJMk9xKKqyMqnL+dD76pqm0ZW
 ezG7tEetlF/OJ/BhlYEHzXea0SaKbQUv4XXE+I5CqNcRPnNc9B0aRgZt64C8bBZZHLOU
 AcYEjYCUqedKPGlnzDFaWM2SYJrDh8xdVyW9vyT6aiwdXXEG8SLqZ17v9tmrqyO+FKS4
 TZBCaXD6wGytWW9oW3zJzy8+1ap39BsVLYmBfj6hRVAYk5cQ+ts4Ra2u+06ATDLDhizN
 4suAbQBxtIYUW9yNBYymD9O+RRIxm+5/6dr7eR5NHVQsdaDhryfPpX+qmU18f0Gog3w5
 Di/g==
X-Gm-Message-State: APjAAAWY2EYk8INVWH602fdnaYcn5BYU/jNLt07XOr79RJEYoqLA0Dys
 oRwz4KRzerG7mwhavoX4tZJTgB8=
X-Google-Smtp-Source: APXvYqxE2FEDdZNs619LslbL5TXbqHCn5jf0qb2bRoKCkINdS+enKxNqQPeeSATJqqRxviWyTvI8oQ==
X-Received: by 2002:aca:1903:: with SMTP id l3mr18595473oii.16.1579040544028; 
 Tue, 14 Jan 2020 14:22:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h1sm5863492otn.6.2020.01.14.14.22.23
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 14:22:23 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 221a3a
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Tue, 14 Jan 2020 16:22:22 -0600
Date: Tue, 14 Jan 2020 16:22:22 -0600
From: Rob Herring <robh@kernel.org>
To: Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v6 3/5] dt-bindings: watchdog: add new binding for meson
 secure watchdog
Message-ID: <20200114222222.GA21654@bogus>
References: <1578973527-4759-1-git-send-email-xingyu.chen@amlogic.com>
 <1578973527-4759-4-git-send-email-xingyu.chen@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578973527-4759-4-git-send-email-xingyu.chen@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_142225_214048_D0A609EC 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Qianggui Song <qianggui.song@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 14 Jan 2020 11:45:25 +0800, Xingyu Chen wrote:
> The binding targets the Meson-A/C series compatible SoCs, in which the
> watchdog registers are in secure world.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>  .../bindings/watchdog/amlogic,meson-sec-wdt.yaml   | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-sec-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
