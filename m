Return-Path: <SRS0=83F9=64=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2DEC433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2020 14:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B49D92054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2020 14:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UyKY3OzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B49D92054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLdzVn+8c4njj80/l/zweiCD8CJI9ZjOKWUtMtUyL/4=; b=UyKY3OzJBSefW7
	exZdyUJoPEqjARRKzwJ/48mlMcYRwBZGFoZVlVlpi7ctnI8E5BW5i03PngZibIhKlhJnLv8UZ1x/4
	swXMTwfbjdg6L4pVt4LiOZM3kqdrqqnSJZNS4SvwtsGGucu2csgKUUm0XgLNobdqLLeT9v5uv1Sav
	mJIi61LEyI1fdoR/bM+LsjH/CpeCuXeB2oTO+P3vEAMk5f3BQIjkaeLdiyGyDBRPMVQXBhP6V9ACQ
	R2cEKiXD7LaVssus44nU03Qn8e/H9qzQSjKeRgl+cyTmp92Oc21RueoOeyRFCEgbRyJLGPpq+blLk
	HMIhFMgvxmB8UL7QT6sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZFGk-0002bO-8y; Thu, 14 May 2020 14:55:30 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZFGV-0002Rw-SW; Thu, 14 May 2020 14:55:17 +0000
Received: by mail-oi1-f193.google.com with SMTP id v128so7940752oia.7;
 Thu, 14 May 2020 07:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6GKTQ1hvayQx5OvCaJHWXeEsZVK5jinIl8AV+xK1lWo=;
 b=M52v+3Y99R2jbKdj44xxOlabMOvKSZto01DXmKKUz1Vk/Ro5ut5RLJxTDD/v01rGX1
 cIb/TAUk/y8Y50Unu7GDIjXev3qAbjHW5k9x7icF5CGXRzER4Cit9WWK81hr3wuTDtH3
 MOfI6NqthNsJ/5tx8cgUlyTuS1qMLPd+GFO52mlwbYB4zSe/zgLPlnMpQ4eS5afLRu4A
 VjegyRHmKq6xviVRprNIzcYBkm4XGCg3Sx+oiul7OnCHHSq6odIU8KYKDrVSc17g58SZ
 oHA347oU1LP81Vp7KJshzY78gkRkcInrWk+bZu7ewN2c6ZQgza9gIwrW4ze0v8tL2PvQ
 Qw/A==
X-Gm-Message-State: AOAM532GbbNmf1ngBR5hR8cVqGx/A84Gino35dL5nDkiUb3p2LkGx5V9
 J6EWrMroTRQne9sn/Md92w==
X-Google-Smtp-Source: ABdhPJzPExS9+yhGzaOvpYeJu0M9Sj6OuOpDB5AsKxDZI3H8LoAnJ+egHuHqWQI81CVMcYTdbNgB0g==
X-Received: by 2002:aca:aa91:: with SMTP id t139mr2198536oie.176.1589468114895; 
 Thu, 14 May 2020 07:55:14 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u17sm837801ote.63.2020.05.14.07.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 07:55:14 -0700 (PDT)
Received: (nullmailer pid 28709 invoked by uid 1000);
 Thu, 14 May 2020 14:55:13 -0000
Date: Thu, 14 May 2020 09:55:13 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add odroid-c4 bindings
Message-ID: <20200514145513.GA28489@bogus>
References: <20200506080702.6645-1-narmstrong@baylibre.com>
 <20200506080702.6645-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506080702.6645-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_075515_927667_569B28C3 
X-CRM114-Status: UNSURE (   8.59  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed,  6 May 2020 10:07:01 +0200, Neil Armstrong wrote:
> Add the board bindings for the Hardkernel Odroid-C4 single board computer.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
