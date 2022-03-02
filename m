Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA5BC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Mar 2022 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTQEsnXpWiKxQT1NRrZLwkPDP9WWMmjJ3e9ORSjOC3k=; b=3QGy+fJNr8BFSO
	KdbtbNDqBlqM1QkBUUKr++aWbQyPFNHiF0HSNoYX+rzPOle+PZ6s8heoK0dU9tWyPmzGeIX+J1w25
	WICsXomMuG+EQQst9Sr4E3Lr++THu4zPIOfWRwchsdF8tqVtc6hguF5ntIIc9y9ftQYNvgFFVSzXq
	rGgrK6BoqlKVfsNHAA1Ycd6qZwPQGX8QJIBLXdFbaOVfDZ0Ai1tihXerPGCYJ8Mb7GlfXv/i+y6rF
	qcJszA9xBrnl7/M8u95DRAC2ml0TM68BYBmptHLxqemoktmvR/940+YPhHsI9IeU28/0AaSBjZHzJ
	7ZtLEV0DOS8OOzz9HZog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPTIp-003iS6-LG; Wed, 02 Mar 2022 18:02:19 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPTAs-003frg-KU; Wed, 02 Mar 2022 17:54:07 +0000
Received: by mail-oi1-f175.google.com with SMTP id p15so2436579oip.3;
 Wed, 02 Mar 2022 09:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MEa4+AitEkUo+ZXbXWDE7cqp60A7nDmM+8ONuWSuF+M=;
 b=DN27rhMPEePD6MOnXIDA6lQu/54vtrX58fuzpD0eiXmZ7ZoTd8OIs6h81X0c3B6+j5
 ELaO9UmiAxge25CEhSfnSo/ZOYuAG7YtOOpioPoj0KPFkzbXfD1qcKEI7xy8RlUsXc7d
 nxiGrF/rvUvFzl0+JGuECAmlWjybr6oobIh8OZMhShyiomhBrROi9QsstS9kCeDR4xrd
 89nUJa9Gjn8o7nOtYbNxIxog18RN5aQhBiWdHEGpZSVI7kr7uXJ/KZNXt//UGsmZU68K
 JlSTlUC08NMMYrqwd9GjwQzbwoEs7xuy/swzmvwOSGhsOHsZFJFHMhvFf/ErW4ApKZxw
 QvQQ==
X-Gm-Message-State: AOAM531yKSTPloyB0A2054knuqGZM58WXt9wKO82p32DOmPNn8g9RpWn
 ljgibs7fEu7BheGpEKuYNGpAs0aLWQ==
X-Google-Smtp-Source: ABdhPJwPpntbUJaBIXkJvbsIIMxK880e0ZksZypP3v1aQsNnVvZiD9H3/kVjNqCnP2kBEW1y3SNjLQ==
X-Received: by 2002:a05:6808:bd2:b0:2d7:9ab4:a0a9 with SMTP id
 o18-20020a0568080bd200b002d79ab4a0a9mr897512oik.81.1646243645201; 
 Wed, 02 Mar 2022 09:54:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 s29-20020a0568301c7d00b005af050c12c9sm7932222otg.72.2022.03.02.09.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 09:54:04 -0800 (PST)
Received: (nullmailer pid 3959165 invoked by uid 1000);
 Wed, 02 Mar 2022 17:54:03 -0000
Date: Wed, 2 Mar 2022 11:54:03 -0600
From: Rob Herring <robh@kernel.org>
To: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V5 1/2] dt-bindings: power: add Amlogic s4 power domains
 bindings
Message-ID: <Yh+vOyKUsxwic9oq@robh.at.kernel.org>
References: <20220302065540.16031-1-shunzhou.jiang@amlogic.com>
 <20220302065540.16031-2-shunzhou.jiang@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220302065540.16031-2-shunzhou.jiang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_095406_718196_4FDC5432 
X-CRM114-Status: GOOD (  12.07  )
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

On Wed, Mar 02, 2022 at 02:55:39PM +0800, Shunzhou Jiang wrote:
> Add the bindings for the Amlogic Secure power domains, controlling the
> secure power domains.
> 
> The bindings targets the Amlogic s4, in which the power domains registers
> are in secure world.
> 
> Signed-off-by: Shunzhou Jiang <shunzhou.jiang@amlogic.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> V1->V2: fix spelling error, patchset use cover-letter
> V2->V3: add power domain always on reason
> V3->V4: clear vpu and usb power domaon always on
> V4->V5: add reviewed owner in patchset
> ---
>  .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
>  include/dt-bindings/power/meson-s4-power.h    | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/power/meson-s4-power.h

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
