Return-Path: <SRS0=tEAa=6P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B14EC35280
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 21:09:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7AE208C3
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 21:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FilQskJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7AE208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWvhfFQmDu6dDKbGt8LV2lg8cgd9zobsKOnPLTWF0ZA=; b=FilQskJQQsTDlR
	e8BO/WKobVDjuS/2QWxqA+hz0byhT6P/rlwTJDBbLYzR+cSbaNazdBu892oZJGhTd1KuP7izsoTGr
	AMjhR6mVzLJuWRFXWICb04e61NxDTESBA9TnU+jTarkpX8TwZtgGS7zooAezUGxKuKHJeMvaaW8Z3
	7HhvkNoN2zj6DBHWP1c8fNRG2y+grXkOmTe6LghYwKQg70g6TLxK0zSMDpr6mHjLl0Jsnh0oNJWy1
	mGU2l5JNr7rSB7kj6SUX5gbexWe6VRQA/5jhqyTdaUkwSt71lwYLpajWOvyluvuw6bPeJj4y69q/L
	asuMlTb3qhdptPJ+7/gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUcus-0006t5-95; Fri, 01 May 2020 21:09:50 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUcun-0006rV-KB; Fri, 01 May 2020 21:09:49 +0000
Received: by mail-ot1-f65.google.com with SMTP id z25so3571591otq.13;
 Fri, 01 May 2020 14:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=azaNq8gnek7T+A7rdK17PV/xQfKmjBVg34Ma1l/t8qw=;
 b=I9MHl3/PqK1G7wIzCtedAKRtVrHR3HnhPyWvBe9HQ1UCr8ioyr3VTuE00mXs8nLKor
 VQfZJHc5VUFnDeyc61hVYm6rMOzpjT3IAfAp6k/3hR4Ge4QAsaM0u1As1g/1e0S7/n0i
 ERMEoYGaALk+q0VouFZs893V/SLsxqWFzSQVbmBAl4u+yw13z0iJlZs6jG+Uvdm4E9C6
 k3WZeX2A+UzR5kTFHl8EaOmUrHS9il+ZcSREwtWe5J86cfccGjCTiBojZkkK8NgBtvuO
 v7z8V7sbF/Eex63yRyQbcl95MRBxXkS/Uq9HCE3Gi6Hb+icHGPgy8gCd6Jx8OZCQh1/F
 +rgQ==
X-Gm-Message-State: AGi0PuY9mshzXTTR6OlhyMf3ZBjr8arZ2c0FVC1KIvFSCNVg0YbBL5W2
 1icBVXeyrJGmEzF9yC7AXg==
X-Google-Smtp-Source: APiQypLECOBaRa68pLT9OXVtC6bUt86y91nQBnNKSvn0KMAG/61MoBxyIwqFEkO/eNcHjZD1+jP0MQ==
X-Received: by 2002:a05:6830:20d8:: with SMTP id
 z24mr5338741otq.74.1588367384402; 
 Fri, 01 May 2020 14:09:44 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h24sm1105171otj.25.2020.05.01.14.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 14:09:43 -0700 (PDT)
Received: (nullmailer pid 30822 invoked by uid 1000);
 Fri, 01 May 2020 21:09:42 -0000
Date: Fri, 1 May 2020 16:09:42 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 02/11] dt-bindings: net: dwmac-meson: Document the
 "timing-adjustment" clock
Message-ID: <20200501210942.GA27082@bogus>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
 <20200429201644.1144546-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429201644.1144546-3-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_140945_660938_79C35620 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 29 Apr 2020 22:16:35 +0200, Martin Blumenstingl wrote:
> The PRG_ETHERNET registers can add an RX delay in RGMII mode. This
> requires an internal re-timing circuit whose input clock is called
> "timing adjustment clock". Document this clock input so the clock can be
> enabled as needed.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml   | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: Additional items are not allowed ([4294967295] was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: [[4294967295], [4294967295], [4294967295], [4294967295]] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: Additional items are not allowed ([4294967295] was unexpected)
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.example.dt.yaml: ethernet@c9410000: clocks: [[4294967295], [4294967295], [4294967295], [4294967295]] is too long

See https://patchwork.ozlabs.org/patch/1279646

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
