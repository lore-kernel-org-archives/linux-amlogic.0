Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20652C31680
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 17:11:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E66B320879
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 17:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KKbGGv0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E66B320879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByH+IxvgIQ8p1owUluu6usJvSM8WsdpJOmUnalYLDHk=; b=KKbGGv0nET5Vjn
	HQzmIE61yCay/FoslIbjcztT1CHLl/hb+qPDAHoYm3K4t3rsf6P1NLN9vmb6FBqKk/W7jHfaWcvKJ
	VcS/rUkCmRllo0VtOjFxSz2md7hRlcZ0sK32+z9zP9pDUrQZTYIJN7wub6ugdlwJ+Y6IMNS3u7FdK
	XTxlrOGJiddGSHwcH3202xqE95LatYSNfEv7LUi+OUt4Le4VrPiaAuLLsz6/wS/4iAtTNLVNMIoyL
	6OVgvF9HanbyPn2dsJDpJKRsa5Rvm9Yd/+X+0Hu6z8k+Da25uafy0gfA2Ch5MkdfeTu4p9lURVceY
	0+8+NHcNpuk69mJeojog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gld6J-0008FW-9O; Mon, 21 Jan 2019 17:11:07 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gld6G-0008F8-M0
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 17:11:05 +0000
Received: by mail-ot1-f67.google.com with SMTP id i20so21198203otl.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 09:11:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D+dEaEM3KM3Uc2U2QSkF6NrdJxm4gb7uvGA93VY/bpU=;
 b=YQdtvupcb4dqeN5vy9HgBcozZktfOZUQrqjO2WkLxqzWJ+7pcYaBvVpzkeqgMiDoQQ
 lRcJMfscp0n0dozAl1/tSmbS0mOUjAN/mcVEwnEWHmzhw0OGM5MWA1oUpKUG61Qm2mm+
 rX12kFl5h6u9CBw/qYMKSA5dwfeEMyQVmpnt4CPlyT2Mbxx2jAPu4tASFlCF+NG89ixp
 UvZG4L4EKpy7DgvcYBjbWX/xVjiMlPqGGGHn2Vwc6jMwuMLBBpOMFVtOljhZwBJRMdwg
 LDePkWUaVgx6SqQSsKNkyDv+1oQGYIpWffRuvfyah5cVlplAtFZt3hDelqhWgcLhugDP
 kpOg==
X-Gm-Message-State: AJcUukdIGxR947E2chjMTnE3FIh+yaL8q+YRNgIv3BPh7kqjnn2Ax7xf
 BOcW4MWrHqjfV81izwEB/g==
X-Google-Smtp-Source: ALg8bN7GDbbndCzGD6SPAzCYH/NLNHs5u9vHYhj9ARpHefaCtEmKCaKwr8JwAuyFDcfIks+F1UbvSQ==
X-Received: by 2002:a9d:2184:: with SMTP id s4mr21285492otb.46.1548090663716; 
 Mon, 21 Jan 2019 09:11:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u65sm6401051oib.5.2019.01.21.09.11.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jan 2019 09:11:02 -0800 (PST)
Date: Mon, 21 Jan 2019 11:11:02 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: amlogic: add new compatible devices
 to clk_measure
Message-ID: <20190121171102.GA4325@bogus>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
 <20190118103423.15075-2-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190118103423.15075-2-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_091104_715184_EBA1B1C1 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, patchwork-bot+notify@kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 11:34:20 +0100, Jerome Brunet wrote:
> Add the axg and g12a SoC family compatible to the clock measure bindings
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
