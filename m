Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77276ECE587
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 22:21:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2122086A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 22:21:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LOO81gr6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2122086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBBvWc7kco3qp/+PgiZGKc+VT9CluuZh+8a6WZDulwM=; b=LOO81gr6Ey0ITh
	d9G9Xq3B45tn5ZAudujg36ftf2yJdiwlZQ+29Q9Ev5rKoDFmM6oadzUauWiuDC4VY4H64Gy1KDUao
	VW9th94rN8CbT27Z7zkn9WstITyRq4vjAN1JR/blacSK0EQ6SGSKCTYk+S3LJoNbCV0LYGPSlMB+r
	1Owf+aezTGY0VHDirbAvbxr+cw4W1UlE0UzT5zeB5/oKSppuM7M/eRiiz29uAXJdiqUqYplbo8amY
	nDZPCn8xntiX00P029yX+xeR98uoZFRqKRGWvYFkirMAZbJ2FuDq9X9FoYlJsvFbcdrBn92WpxuAV
	0cIDae1pKzvhi+DybwKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFQWL-0005sE-Jj; Tue, 01 Oct 2019 22:21:25 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFQWA-0005hq-5V; Tue, 01 Oct 2019 22:21:15 +0000
Received: by mail-io1-f65.google.com with SMTP id b136so52216120iof.3;
 Tue, 01 Oct 2019 15:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tqpZqSWBzevFiWNRX1d50Nxn4Q6kEMJVfz95i9zh0jU=;
 b=ul64J9uf1KBQ+ookEUQACiffvAq/MX7E6c60Qx+klSaz8uGfXlzzGWCAKSar/Otk3X
 Mr7uQFmOkcYflDkDDuKdwhLSaiXqtCoF3vdNdu40m9A+6MqRoNLaYCALWaRz8Xr5UwTV
 d3ReZVm7brACrAbLxJiJu8XFuG7BnYKDi80ZGlMX+0pE7KgskErFrIZGkCDQ8CljgonW
 cw3+/clb51SDO54OYfw85b03Oys9t6BgP7TTto+uVjdh92NuW6Xn9+JVMLH0mbAJM5kn
 iPl4SgPaoea3MuIwWNZ+dLG+ca+GloraDcSlLAv1QWC2FtifEBLsdritnLdkTEK2IdEL
 7Zog==
X-Gm-Message-State: APjAAAWZkEQrGoaYHyyOq7fdfPwFbl3oFovF09vYst4aC212l8WhN7Ah
 c8WviqDTPlsEOXwBuVXNDA==
X-Google-Smtp-Source: APXvYqxO5LTPz9sKvdwvDzGXEOAzX1TntNU8CChdjjgJOYUb3Q3B/TxouQGgOk9y7bFjc+A4UCmazA==
X-Received: by 2002:a5e:c814:: with SMTP id y20mr501581iol.88.1569968473151;
 Tue, 01 Oct 2019 15:21:13 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
 by smtp.gmail.com with ESMTPSA id p20sm7826300iod.43.2019.10.01.15.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 15:21:12 -0700 (PDT)
Date: Tue, 1 Oct 2019 17:21:09 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Convert Samsung SoC
 watchdog bindings to json-schema
Message-ID: <20191001222109.GA26050@bogus>
References: <20190920162124.7036-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190920162124.7036-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_152114_207721_1C49794A 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 20, 2019 at 06:21:22PM +0200, Krzysztof Kozlowski wrote:
> Convert Samsung S3C/S5P/Exynos watchdog bindings to DT schema format
> using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Indent example with four spaces (more readable),
> 2. Remove unneeded timeout-sec description and include generic bindings.
> ---
>  .../bindings/watchdog/samsung-wdt.txt         | 35 ----------
>  .../bindings/watchdog/samsung-wdt.yaml        | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.txt
>  create mode 100644 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
