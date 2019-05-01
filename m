Return-Path: <SRS0=yipG=TB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD242C43219
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 May 2019 20:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC29920651
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 May 2019 20:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Az/BWWOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC29920651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ensuqb1e5/CRX2IsVSmMzMYbnF2ey63KMvofmUPep4=; b=Az/BWWOusjQgEt
	LZN1O0YKdIKq92kjohFEdlfsWpfnMb0McR0Ka2wfWclA1Xovto9lnalwSvro6T9Ak8ZfEwkk3rKvC
	E2z18VSm79rXuMXpwCDY10scyigcJWbL6B+k6sK0qXroLel9CayK8w6Ts2uToIYRs90X2ggl44wB1
	t3OGqZ2T/uDCbxFGjbe73sN347lrGpqIPHNYtyL83IUQsbxiqggCb+cMPL6J4HD7G5mj+xT7aEOi5
	fvmv0uUAbjx2AvEdxTRmDZ5qOgt+IanFEM+1RzoersUhDPYyvUNSIGpn31D7jBXYNM9cVns3WS1t8
	5RQ3XJMXBInqFOJqUidQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLvPk-0000x6-I3; Wed, 01 May 2019 20:01:12 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLvPi-0000wG-5k; Wed, 01 May 2019 20:01:11 +0000
Received: by mail-ot1-f68.google.com with SMTP id g24so80192otq.2;
 Wed, 01 May 2019 13:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HxbNQi9DeZ2IJLgdIUVTw8HAwd2FcPK6Vz/jlq7BRoc=;
 b=ku3GkRIjbmUNjSg1owf9ZOqxFDWaPqHubDpxO1f89VuCkIboJwM87C8JQcluCuTeUs
 W9qIjd7u4BU7TfAxJRC0JuugDmAnTI4QDC8rA/JL9uQQpEV8InC0GSl4DaWifepE94uz
 j/IEJ62PUpCKax8riANWRnB8CFU8/3KMLmOIkI4TAWcqPXi0s0JoU7xzoPk3EfeDQuFv
 OZIqLVqSpSzoW9z4tJRcxa0WpeKwrml5UCfcnO79cPjf6t8SbG1+pxw+QzJqNE5emV2x
 yRtLZDZ7qy91UfFcdDio4mNLyNzVq6iDAYv5kubhELLS9WxUQ769uKYimptjV2dEk2n7
 uXaw==
X-Gm-Message-State: APjAAAXjQ5veusUdky3vQaZZsmYdnjTGPISDzXW5CzqKCideeFVlLmqc
 Y5OOoZm58c8pbXUgM2MggA==
X-Google-Smtp-Source: APXvYqzcF2UnIXneOHc3vVzJEv6m01JtjNnKY2BTBLXgguBiPwEBqQ+LDGuHzLgGqqLZG3bvV/MztA==
X-Received: by 2002:a9d:2066:: with SMTP id n93mr14060248ota.193.1556740866212; 
 Wed, 01 May 2019 13:01:06 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r4sm16901646oia.2.2019.05.01.13.01.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 May 2019 13:01:04 -0700 (PDT)
Date: Wed, 1 May 2019 15:01:04 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: pwm: Update bindings for the Meson
 G12A Family
Message-ID: <20190501200104.GA29281@bogus>
References: <20190423133646.5705-1-narmstrong@baylibre.com>
 <20190423133646.5705-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423133646.5705-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_130110_216284_17AA2EC5 
X-CRM114-Status: GOOD (  10.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 baylibre-upstreaming@groups.io, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 23 Apr 2019 15:36:44 +0200, Neil Armstrong wrote:
> Update the doc to explicitly support Meson G12A Family.
> The 2 first (A & B) AO PWM uses different clock source than the last 2
> (C & D) AO PWM modules, thus we need to differentiate them.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-meson.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
