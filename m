Return-Path: <SRS0=DOpU=R6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6B1C10F11
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 23:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF9A620651
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Mar 2019 23:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RT/96Uw7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF9A620651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBzJ5ShP3G9dzCg1uNiRFlPtYHowGyZjb7JpqIMEy1A=; b=RT/96Uw7Hv91yu
	UF7FZk5dWWGkWV9lFYQgrZkTWeHV+x1v6ro7zxhhce93ZiYL2T0mWu/su3bWXfeg/HtIsh32QNrtU
	iKDP6uq/EWo7wWzbBsUemhU4uJYXnv5vpFAwEs1FMyS2PfXu7Ny2kmUtw3uZmH9EjqSmqdxDDr6N5
	iyY6UzwxmG2vT/M1tQDkBW+wkMrj41eeTZOeY8/cqaAJ7YKMIicTdmsMzVp1Hg8HR0q9sNlsHnW/k
	RD3WNbiomtGPVi4m1MbaOhBFUq8GXocux78qS5dwngsZFEJ/LMSviCU0vbSS7z0CsWP5dSbxjUcW7
	qwWdsROOjeHh2s9S5EXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9IGh-0005MU-FA; Wed, 27 Mar 2019 23:47:39 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9IGK-000553-3k; Wed, 27 Mar 2019 23:47:37 +0000
Received: by mail-oi1-f195.google.com with SMTP id w139so14359335oie.9;
 Wed, 27 Mar 2019 16:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aF8UbrX+SHdnXSF1IP9nWwxcy7seC6lQAeUB+2U8+8I=;
 b=JqPy+VYq6PdDWM+a+9P3eLrNYELJDpuFM0iZB7jQNCrQO/Ngyg+KW/qSMQdZmx9jhk
 EJeRJ9DObtF4RklfGeqeMNyoAP+wQjYkiH0tM23lUcDKBKO6yKfklT9mgxpODFEOda23
 BxUPEgl+zf4783jIY0KMCfnYT/KcGarGvVty3rELcXC3mUTnvSfmZwOnHhvBT4Wjgsuo
 Ah0dJVvAPyYESLxfYGL5jaqBIF+sV7JsTNADZ0JRvxAbrHbf2jS4kY54ka8A7xEB1DaJ
 o0CD+4KCyXHwNESjGHsYJllUXevuxLAc+PuY4OV+Zm80G+uLlvVWB5iABJXE/Joz1Uj7
 mqEQ==
X-Gm-Message-State: APjAAAXu/EECB+dily8i2xCOSca5Gp9hCzOfCucHLE94DmKNAQgFw3p8
 8/jiHY1U7OnknI2TQ+u5FA==
X-Google-Smtp-Source: APXvYqysBvd7Yy0P+PgpYw/gwpTPVSBRLPuFFs7atAhUyRGAZQ4mlZHlhN9NbJIY93sUucTLndbOZQ==
X-Received: by 2002:aca:c68b:: with SMTP id w133mr21225939oif.58.1553730434872; 
 Wed, 27 Mar 2019 16:47:14 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h68sm9714796otb.1.2019.03.27.16.47.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Mar 2019 16:47:14 -0700 (PDT)
Date: Wed, 27 Mar 2019 18:47:07 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: clk: g12a-clkc: add PCIE PLL clock ID
Message-ID: <20190327234707.GA25542@bogus>
References: <20190307141455.23879-1-narmstrong@baylibre.com>
 <20190307141455.23879-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190307141455.23879-3-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_164716_451016_818BC182 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu,  7 Mar 2019 15:14:54 +0100, Neil Armstrong wrote:
> Add a clock ID for the reference clock feeding the USB3+PCIe Combo PHY.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
