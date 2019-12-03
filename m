Return-Path: <SRS0=15i7=ZZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24B0C432C0
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2019 23:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92686206F0
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2019 23:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XfyiKgYz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92686206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPwChfbcIx2bhPVeJ4ntfgD1zkFzKeJCsk1fIsAwEGo=; b=XfyiKgYzZF5SPm
	5BE+gQ8GRyy8WuCxYQzcTbuwqW/vALEX161L0QuOXZeym2JRO+Hyz8XVKKX5LFKwWZ6y8cVP0C8tM
	83HcYpZ9rzjvWjnGMxiB5G8R3gfzvzMTg1q4od6xIbl4OKbMst0NKGad2oIerEmwZ+yYyYoWYAoXA
	0JsAzzwf231/Njtxg4PpGL1nJ8mQgSRjHprh4lIW16a/Oe08hSY0j3ap261Q2fli9UcSoOexwT4/6
	gy6Vr6sTji1i1nxIazppFS1h4dswX9cm4/CG1tOJdOFkRejied6z6n9k8pbOJMAYJWiFcMqbjmR3e
	/aIkdFMz3YUCQovEsJ8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icHUU-0005h1-SU; Tue, 03 Dec 2019 23:21:58 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icHUS-0005gf-KU; Tue, 03 Dec 2019 23:21:57 +0000
Received: by mail-oi1-f193.google.com with SMTP id t25so2801010oij.10;
 Tue, 03 Dec 2019 15:21:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nMoneiSilSnMDAbib3HTPfNytbUoEIQhC55SIxPHfWo=;
 b=Org2xzytlWLDmaFPv4qkdKDg7pQMmdrWNngaBpXoN/iuEm3DBDywaejnRAT46gaJpp
 6npMEjuTNxZXXxKvPMB9T1u6EfOvRx2BIHmeOIzVwf8cM5V68w0Vg9pb6l2QwxbKPg2x
 WZ6u6Y6v95cM1ix9fCCvq3UG7r6ysp5ZzFnN2HExRCdjWndBdtyDxG/AYxgf79gu4l4O
 RVlWcxLArHUYzVJ/Qher8IpIokhpLRerKUq70OLPh1/BCd22n6kSLPAPzRcnh53TVct9
 Eu1+MzvYY1xszLCkLhr4Kkn4o7y5aRBXizSPOBdj+9lVU9M8sZMMBty2/l9ZpirRTc8f
 St7Q==
X-Gm-Message-State: APjAAAWSAkNY/A9oD14fXhmnUR3Dwi/8xCEComqeqlrC5FPtqA9W1P/z
 KosCKStCyfpZmWWEKePPRA==
X-Google-Smtp-Source: APXvYqxhJhXJgEJMEk2ZIIIiqHXpmLaxsyVuFCtJzAYqTceER890+3dVIzoDW5VvmDJXBeM3+0mf1A==
X-Received: by 2002:aca:a811:: with SMTP id r17mr129440oie.59.1575415315572;
 Tue, 03 Dec 2019 15:21:55 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g203sm1336799oib.17.2019.12.03.15.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 15:21:55 -0800 (PST)
Date: Tue, 3 Dec 2019 17:21:54 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/4] dt-bindings: media: amlogic,vdec: convert to yaml
Message-ID: <20191203232154.GA12580@bogus>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
 <20191120111430.29552-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120111430.29552-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_152156_669625_E8D9A9FA 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: mjourdan@baylibre.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 20 Nov 2019 12:14:27 +0100, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic Video Controller over to YAML schemas.
> 
> This yaml bindings will then be extended to support new SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/media/amlogic,gx-vdec.yaml       | 107 ++++++++++++++++++
>  .../bindings/media/amlogic,vdec.txt           |  72 ------------
>  2 files changed, 107 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
