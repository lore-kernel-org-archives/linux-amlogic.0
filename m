Return-Path: <SRS0=GwLp=O6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A56DC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 18:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF0220449
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 18:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mc178L1p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CF0220449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuBVOORu0QFR0qyXF8s/zbJQqmHadXttm6xT1MYZAKs=; b=mc178L1pUEbBB/
	xgF45Hb+D2v/TjTP5PoeklU3DqD06oQZppXO9k68tbGSMSrnA6F5h+xd87SiNTSSCJah9oW5Ppgq6
	o5VuMhtyMcGd2imf4M4fbuuuT8t2W6swEl05pbNXq9VuZGRLUpVCqPcoBdIx8VOMYSJWijEuOT8Ij
	dB/RFnwJX1loju06b3yNeNNbDuvsd+j1N2rFvL+uWd53y7DnywroPcxWaabVxkiTrYrC+Cg/xP8oy
	n6E+UbDNGMAVG4rK/Q7fnIzv0TwHkF1zySRfp8jBAEd+lcxpp2UfxvJqOVysyk9tcHanss9XVH+Da
	RSq8zIgMDDh7+T8AWKBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaPOB-0001UM-JE; Fri, 21 Dec 2018 18:19:11 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaPO8-0001SK-Uu; Fri, 21 Dec 2018 18:19:10 +0000
Received: by mail-oi1-f193.google.com with SMTP id w13so5489758oiw.9;
 Fri, 21 Dec 2018 10:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YMUcRmedR1+TWGOjoz0Wlfhqc+rkPb0GF3TzBUuCLYA=;
 b=NuDl+l7CigubVPv6T+YggWNi0V+YKrqeWSmSBxS0Sur467QO3yWgIMFZ3nxSZ8Y3BP
 HI3nyWoYYU14/miMxzCX+t9AsG2k/uqQTeRFzHhKwCtmk7AgF/u5vWvuhOWQwaRAJaDj
 s8BvWmJbBWhPJpHlZKo2U00KtWrB8xxVDwHyev4Rl6WZXez+aHLsS7qP8DNvNZGObN+t
 3uRwIjyvHXqrT5bPoKetsMVvn3hdOCB3RN5eGTfh8SgOOR8ua8o0T7V9g2CzmcnaA/YO
 vAtcwiCbs1g4IreY/x8TZ0FeSCFT57QVIOb69o1zRo8bh3cul4sut9N4OiYOplXwXNjP
 iHwQ==
X-Gm-Message-State: AA+aEWYXbGR3XrnZkxIj7Epp/IVudDCGJlzXtfR9tuy2jOJVMMWALPG4
 6ddXJDMVWVsnXCLkLeUIzhnvJkM=
X-Google-Smtp-Source: AFSGD/XUXMmQl06uZgiT0gemqrUbdmLYDxBCg8xj5pPNaYPvlxeYPHFVVh1FjXAvR1cFBY/kZRHHWA==
X-Received: by 2002:aca:5d84:: with SMTP id r126mr2157519oib.227.1545416337485; 
 Fri, 21 Dec 2018 10:18:57 -0800 (PST)
Received: from localhost (ip-70-12-27-227.kscymo.spcsdns.net. [70.12.27.227])
 by smtp.gmail.com with ESMTPSA id
 f18sm12822700otl.18.2018.12.21.10.18.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 10:18:56 -0800 (PST)
Date: Fri, 21 Dec 2018 12:18:53 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/5] dt-bindings: gpu: mali-utgard: add Amlogic Meson8
 and Meson8b compatible
Message-ID: <20181221181853.GA29842@bogus>
References: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
 <20181208171247.22238-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181208171247.22238-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_101908_989934_93AC5762 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat,  8 Dec 2018 18:12:43 +0100, Martin Blumenstingl wrote:
> Add a compatible string for the Mali-450 GPU on Amlogic Meson8 and
> Meson8b SoCs. Meson8 uses an "MP6" variant with six pixel processors
> while Meson8b (as cost-reduced SoC) uses an "MP2" variant with two pixel
> processors. Both have a reset line to bring the GPU into a well-defined
> state.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
