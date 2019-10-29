Return-Path: <SRS0=U197=YW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 463A9CA9EAE
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Oct 2019 16:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BEB220717
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Oct 2019 16:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6J82rjQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BEB220717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DoNBTAiLZeAAjLF5exX+KUJiEBn+qI6UsjTk1uKLyo=; b=A6J82rjQyqcmfG
	wQX8fUcsyinYeEEPScE3GkWvH3euW1MyMF04wScgspsb8ZVJVoClQdNYSR1m52M+pP0WBOe5Fr4rv
	jyG10JGMjCO5cWmoR7jntS2bMd23+4IBREIwpIh5/zTJYdFS0zVraXC2qopxFFRJO9tWH3JAIbKhC
	mnE0MZJOb8+vAgnJuQKyi2qXeKswbHExOlgOPr7365Jq0znAQpoR4+Uo8hiJAElarBB37AueLo0ND
	X65z0Cw4LWsp02I/XvrrSYkL4wnU3cSRDhqlR4WmMlQubsaPEC5CwUYAigPcqxXWMMfYnYRtY4bHh
	nO7PkZVaf186Gu5gqaJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPUKG-0004Ot-Hq; Tue, 29 Oct 2019 16:26:32 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPUKC-0004O2-Tc; Tue, 29 Oct 2019 16:26:30 +0000
Received: by mail-ot1-f66.google.com with SMTP id c7so10293273otm.3;
 Tue, 29 Oct 2019 09:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jrYKN+h6Z3GleTEUBK92hvb5i3b1naeQCWbIcyAY6B0=;
 b=G0hYFrWEVJoIiXLg1w4Gijb/mkPpHaGyn6yBO9FCoEMI5iiBQ/iZ0PwwzvbK5xkkkc
 5XBcQq0m0bKmWYd5ES7CnoNtTspDPcFgBuv+wVbHGQ49B0NaNzRQWyDSuJIC0TDN47kR
 HCv8zfJ01UKJVgAym49ZrSXx4L1nPFAo2cSZB09YIyzuEdfsTMIQQ4TiWrxL3lolkMew
 f8GJC7opoSV6ZFHtrnCKYF300gtWMLO1yNYEd43ohrjTqBbr4TQ11PosKZG902OC8C/M
 3Mk1qtH3Rr6gtmaZV7A6jw0Nh0U8B8cJdB9Br5+VBarfkeG3ilIeDMGWkPjlPh1iGy1Z
 G2mA==
X-Gm-Message-State: APjAAAVaVys+Ug5TJFA6/Bx+0kk3sfqSrfam4E46ALqv9sCT+sm7EwZy
 eq+PVhhYJ1oj6B319cRUh7tk8qA=
X-Google-Smtp-Source: APXvYqwQTFB5Bg3vscJfKb3aCnMfFE1g7KjqQZhR4gt+OVU1yKKpL1jg/S6GMNBR5n2q/cPa3xoaMw==
X-Received: by 2002:a9d:721c:: with SMTP id u28mr18904247otj.359.1572366387883; 
 Tue, 29 Oct 2019 09:26:27 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d27sm2347954ote.11.2019.10.29.09.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 09:26:25 -0700 (PDT)
Date: Tue, 29 Oct 2019 11:26:24 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191029162624.GA1057@bogus>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_092628_954831_78C0169B 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Beniamino Galvani <b.galvani@gmail.com>,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 21 Oct 2019 16:00:53 +0200, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic I2C Controller over to YAML schemas.
> 
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/i2c/amlogic,meson6-i2c.yaml      | 53 +++++++++++++++++++
>  .../devicetree/bindings/i2c/i2c-meson.txt     | 30 -----------
>  2 files changed, 53 insertions(+), 30 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/amlogic,meson6-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-meson.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
