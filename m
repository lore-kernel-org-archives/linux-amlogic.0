Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE6BC38A30
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 17:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3986620CC7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 17:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rI03xKmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3986620CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snwiCIZ7DklBeh6UautHqJjR8xmv/tdzpeT7Gltp1Gg=; b=rI03xKmPzsDkYZ
	2rNExb8S0TazyCtbqndkUEEV7dyePKK3sNVvRIOuk2ZT+ffkfUbWHqDVwdcRrZmn+ThIiWcXBpPTL
	4v/TGHrZws1QG1bbNgIPycTHrqwpNNrHGJXuoq/pL5BCJeDcNThd8VGFAZ4EmNzM95I0S+/3/t9t5
	oiTQ8NO7ySFyCdl4+yBCHjSXB+Efj7DDIp41kqfVUDCb2N0qjaKMdjera4XWoKe04VvfbnQBDkUqu
	PbMdD9NY3nQdXw23iKHTOjSHQKILPBMv/TK80BT69FYlAYUNUPlvLkCcNVFC9pIbFW7Tcbz1Nokp8
	DUxOnGQpakyK8xy4KhUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQadm-0000sP-Br; Mon, 20 Apr 2020 17:55:30 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQada-0000hN-Pw; Mon, 20 Apr 2020 17:55:20 +0000
Received: by mail-oi1-f193.google.com with SMTP id q204so9547072oia.13;
 Mon, 20 Apr 2020 10:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pnrv9lM8OUTY4sC+Y+b2B4Yg/ImImSGXZBXHhlUhbQo=;
 b=WP75g9Mha3y2favfsxXQ4CHTs454ozrIjbtpShvDomw6EObqzktSrblJsWrS4EyRh1
 3Q78pBn3gmkpGKNqZFLTAte7OK5fDYnDbyj+qY8fbSCYxMXzTdPBeraGrvIvwxldB0od
 jTtm27+xDs1oGp2Z6Axqu6B3fCLLenGtez4QHk6q1+NcEwb91k/I22cS3ERsVzgMvL/W
 uMjS4PbuLnXGilwm6O16Q+20J9ufGNo9PBEN3ot/KTszejG3u36n7eGsE3TdFCVujd0g
 q5e4Zfvxg9jf/h690f1gmYy5wFeXU+bjJMc+7AJsDr4RanwJz1QEUJMoGuqAaxRosn1J
 O67Q==
X-Gm-Message-State: AGi0PuYC4CeTK0P88iqZBXliHJkKIvGrTIa2GCjoII5EQdg0z60sXs4V
 30Wp3sRfmViSDrvM4oAVo3MFP0k=
X-Google-Smtp-Source: APiQypKHszk2EWEj6YDqOxTUfHxKYjV5QQAmfU8m5CMhLH5+8GXPeri83oufl4B0ZfG2WOLRfc1+Kw==
X-Received: by 2002:aca:4b10:: with SMTP id y16mr435420oia.23.1587405317335;
 Mon, 20 Apr 2020 10:55:17 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k19sm25202oof.33.2020.04.20.10.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 10:55:16 -0700 (PDT)
Received: (nullmailer pid 29244 invoked by uid 1000);
 Mon, 20 Apr 2020 17:55:15 -0000
Date: Mon, 20 Apr 2020 12:55:15 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: meson-ee-pwrc: add support
 for Meson8/8b/8m2
Message-ID: <20200420175515.GA28534@bogus>
References: <20200417190825.1363345-1-martin.blumenstingl@googlemail.com>
 <20200417190825.1363345-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417190825.1363345-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_105518_842086_09180DC1 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 17 Apr 2020 21:08:22 +0200, Martin Blumenstingl wrote:
> The power domains on the 32-bit Meson8/Meson8b/Meson8m2 SoCs are very
> similar to what G12A still uses. The (known) differences are:
> - Meson8 doesn't use any reset lines at all
> - Meson8b and Meson8m2 use the same reset lines, which are different
>   from what the 64-bit SoCs use
> - there is no "vapb" clock on the older SoCs
> - amlogic,ao-sysctrl cannot point to the whole AO sysctrl region but
>   only the power management related registers
> 
> Add a new compatible string and adjust clock and reset line expectations
> for each SoC.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml | 75 ++++++++++++++-----
>  include/dt-bindings/power/meson8-power.h      | 13 ++++
>  2 files changed, 71 insertions(+), 17 deletions(-)
>  create mode 100644 include/dt-bindings/power/meson8-power.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.example.dt.yaml: power-controller: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1272441

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
