Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E14DC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:43:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EFFE20882
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HHM/dzyi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EFFE20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LPTJCtzj8Lh0Lry+fLkveNFzFPegJShDXgR3GbeZVec=; b=HHM/dzyirw/WttWEK2Co9kyRRZ
	UzdGqVNk/FE/egp9WMt6165jS+msYyM6uA1ozBEQz7uSQihcpY+qaXRkM2w5VNQH+olCSFK/UK7J8
	tVazqFprb91wP6hX8o1Ht/Rr/vY2fI/BeQ4NLSzzpxF8GSN0XjD9ZD/HcaGw/VUUU6J0XYkAIrVx5
	glKzCpMItHGfmcfo7K0Mujy8FOZ88sWYqglGc7XvKaTgb4OCHHNNuRx+y7eJR0/ZwAh9NMvFmsxNa
	NKut5aQ7MAOhU36noaQhca21KrmmrlnLSyciEYuANKRu5w6xWCjuLnOqW8D6Kvu+PbUkGewomoJpn
	yV44WuZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAUBJ-0001Sm-Sa; Sun, 31 Mar 2019 06:43:01 +0000
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAUAA-0008Me-J4; Sun, 31 Mar 2019 06:41:59 +0000
Received: by mail-pl1-f194.google.com with SMTP id bf11so2919389plb.12;
 Sat, 30 Mar 2019 23:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=sgFc6uE0XsqlrZed6OMYcuIFTo1ZGmRUyoxq+EubJfs=;
 b=Cn/PjiV3ISDw2k1AxzMMDaDdMKPB+ZIoH2k2fnW2muPkg5EJhqZ7BEkeWOO/wA1RVc
 CpLmWrW9cRERfcCbfz11M+GT2XShgmRofJE89mITUc15Sev/LOImJUkbuHzWlA66aySa
 1/zk2XtFN7SHNXOlUwOcyv6iluL3G/JJ+tLEFEYMHOqoGyTVb5MdcOXkXFkpI03bwn2T
 wWg8W8vyYvAqxgIu7mHqzROD/4uybWpM16KBoMSAdVXFkxWC4JWS9m2sZo7Y79Z+q+iJ
 yMt1hd1iRB5eJJ6We/HnMr6I3eHXwd4qrOBZ4FQuDebsP3t/h6CL50H5dViH0fQw/6OJ
 XZqA==
X-Gm-Message-State: APjAAAXYK2vY4cbGYqqv5nXQz/aAPn5NkGNizmb1Y8OAxKKnEqEJhvYi
 7DD3Tizj87YZ+0CVJUEfow==
X-Google-Smtp-Source: APXvYqzrEThhPbhnirOCnsgTPqKYfsebpjhFZ4QUuZGzWxOV3nBokcR0YgqsQf5VD5iTgqN0lr4zfw==
X-Received: by 2002:a17:902:d211:: with SMTP id
 t17mr22652332ply.214.1554014509967; 
 Sat, 30 Mar 2019 23:41:49 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id k26sm8759588pfo.111.2019.03.30.23.41.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:41:49 -0700 (PDT)
Message-ID: <5ca0612d.1c69fb81.96e6a.76a9@mx.google.com>
Date: Sun, 31 Mar 2019 01:41:47 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: meson8b: export the video
 decoder clocks
References: <20190324151423.19063-1-martin.blumenstingl@googlemail.com>
 <20190324151423.19063-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190324151423.19063-2-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_234151_223731_88BB320B 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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
Cc: mjourdan@baylibre.com, devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 24 Mar 2019 16:14:22 +0100, Martin Blumenstingl wrote:
> Export the four video decoder clocks so they can be used by the video
> decoder driver:
> - VDEC_1
> - VDEC_HCODEC
> - VDEC_2
> - VDEC_HEVC
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  include/dt-bindings/clock/meson8b-clkc.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
