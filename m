Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9B6C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Dec 2021 21:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UqsBPWO4Uy05EzjrlLOXK+w4IDFULyp4bVBf3B0q0A=; b=HtPv+aoWLvs/Pi
	WPvTbOTcojKDBNDY6BLzXZxm9NYrl7trcCROEZ7JIiDZNHiFiirn89KrCxf/vhD4PwcJd2h5sHUfg
	t2s4Qalq5tNjPSRbO3CfidzPPGpgTVMVwVjQrWwBZ1m6O7EbU3XA1/vH30Po7D5GuT6cdFWgUaKwb
	MwdcHJGsT0aZUg0Cv1cDOvGH0Eo8xgopgHNeKAN+IQuxQgJQUZRQz/ZfyC+9JmNV13qVPtWtsAJmb
	JEiKhXxZeqqdEHPKDcjZFafCPSUq4HaMRpLqtorEZOK26XSoRC0tPiGtvxzO4rYnszTCJw3fdysy6
	n2nlfFgNqtxkalOO6vJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muhvr-00ABld-6k; Tue, 07 Dec 2021 21:23:27 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muhvo-00ABk7-VJ; Tue, 07 Dec 2021 21:23:26 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so545282otv.9; 
 Tue, 07 Dec 2021 13:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wTGBwhPj40CR1g2mGQdatX2+v0ySWURSaUSpv1NBdsE=;
 b=cZdDdTdZKf0U241B4jpq2SawMCya3t2orGrnR2Hs53XYZ9/FOgQkL43yfF3mH/eO4B
 HqWfPDKmFjJk4bxwesLPL7vMLn9L+5a+qi0dzkV7U+PPNfoFyMFuBvuSO6NY7biZZcM+
 FgO5za1pInTLxyOJ5nlZ9YpavPO8LujzV3ezBR+4wg4hVlts6BbDMk4QYzDApTBSPO1H
 uywAkStZy7PR+F8wLpFgzYIeLwqd88A53qaRCQLa3W9jSXghvDByiWxT0FuHH21S11zB
 5iuu2P2NQvq3TbBkfxyDVAz4hFUoSM3KHcg/iMBEek+1UfncSCM6wG1+SH6/tvoR72Wj
 Fpzw==
X-Gm-Message-State: AOAM530N2IY6SVRMa+vXFOdCnKXVSPr4ciNfT0R9vusIVarMt5avEhKh
 nDgCkaWZSKjzdgAYZLTyPQ==
X-Google-Smtp-Source: ABdhPJzvyqjJ/2s0aqvVtAfSL4kD9uoQXETopuH9p57MR6ljTsRHggf0g95JO90lUzCXrwDFTYd4Kg==
X-Received: by 2002:a05:6830:4414:: with SMTP id
 q20mr37704267otv.14.1638912203643; 
 Tue, 07 Dec 2021 13:23:23 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w18sm140924otm.1.2021.12.07.13.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:23:23 -0800 (PST)
Received: (nullmailer pid 856283 invoked by uid 1000);
 Tue, 07 Dec 2021 21:23:22 -0000
Date: Tue, 7 Dec 2021 15:23:22 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Benoit Masson <yahoo@perenite.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 7/9] dt-bindings: vendor-prefixes: add haochuangyi
 prefix
Message-ID: <Ya/QynWdRdyeU6s+@robh.at.kernel.org>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-8-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211130060523.19161-8-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_132325_031017_3EF2492F 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 30 Nov 2021 06:05:21 +0000, Christian Hewitt wrote:
> Shenzhen Haochuangyi Technology Co.,Ltd are a manufcaturer of Android
> Set-Top Box devices.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
