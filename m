Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18EEC10F06
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A0620882
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 06:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mFL0/spy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A0620882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B4zHyt76QA6WqvEVebhtH7VulTE7HAbPyShhJwwPcYw=; b=mFL0/spy7VmTjS9ig5Lur6rU00
	D6vKBGO9lT/fxvfvgl+8W7dYyakbiMOFTKtwJQ1YzuiIUyhYsiNt7ylci+dL9yA0Px5+hhcMBkU2y
	BSmtS3GyVyd9mzwfUnJlh6VKuH+j8caVqPTZEhGITA2hSKIn72CCMP/wf6Gna0voBTLBMqkAdxiB1
	JiS+QRuqfM3OIf99V2RJKer6sUDlMUghvL9B19zzld4Cv/IMkbsDn45Gh/46fvZeZsmd/WTS5RuF4
	0vALDcKttfNqHU+2A6TpdjDjzw7SVgKGJIyzjw+21SjOG3ccoprf41LJYsoSnY6rKv6DcTCfMzDNm
	seds6FGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAUAe-0000af-V2; Sun, 31 Mar 2019 06:42:20 +0000
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAU9F-0007PR-Gr; Sun, 31 Mar 2019 06:40:54 +0000
Received: by mail-pl1-f195.google.com with SMTP id y6so2921782pll.13;
 Sat, 30 Mar 2019 23:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=HFZEx2jg2T33GoHe9R1FwMUeV+jh/KdgivL2e+0YQw0=;
 b=B/iPkSPfOGiIBvmkXOWW1Rs3izDHGfJdW0MqrtqwOiKuQXVAmkp1lQc/ru47Hw06p5
 4uSowUhpb1Dc+8Z/fYk+HroAtzhOYXglZwSmMVyumY6pd9KmN19lKIIXyAjUBrSDs46t
 ZkMx7Sd/H+oFvomgD0XTgwF6Hz+sfRiw/TcXOq7DCteqlPerLC6XwGN3tpAUgb66y/y2
 ox6Zd1GWTHAW1hTznM648aHo7TzljoA+M4RmDvmY/KGHL1Mv802GPxSieA7nqXViNfyi
 Rha1xN1QTk5W8mcjzDJyFgHPS5FOTXV/5sYQVjIOFlFL1AZdiREjYZq7Xp+oDBkAAhQR
 78lw==
X-Gm-Message-State: APjAAAVNjMla+CAPnfoYDUDBvGZf44cQA4nLvrLzdAargnzvpQ1iad9i
 sW5WbHtgG4OwaRDCIYx+ifSBg0imrA==
X-Google-Smtp-Source: APXvYqxLT2MKs39nII6bnd+8oSUX8kRAGImM5WtOOFXZw5FNM9MQpFsJeXOEBoMVeJVulRMjvMS0Tg==
X-Received: by 2002:a17:902:26f:: with SMTP id
 102mr56837399plc.175.1554014452669; 
 Sat, 30 Mar 2019 23:40:52 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id 4sm7887541pgx.68.2019.03.30.23.40.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:40:52 -0700 (PDT)
Message-ID: <5ca060f4.1c69fb81.ce85d.55f9@mx.google.com>
Date: Sun, 31 Mar 2019 01:40:50 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add VDEC clock IDs
References: <20190319101138.27520-1-mjourdan@baylibre.com>
 <20190319101138.27520-2-mjourdan@baylibre.com>
In-Reply-To: <20190319101138.27520-2-mjourdan@baylibre.com>
To: Maxime Jourdan <mjourdan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_234053_583876_EA15FA13 
X-CRM114-Status: UNSURE (   7.10  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 19 Mar 2019 11:11:37 +0100, Maxime Jourdan wrote:
> Expose the three clocks related to the video decoder.
> 
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
