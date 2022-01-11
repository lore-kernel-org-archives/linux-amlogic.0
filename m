Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098D7C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxSCHgikaUhVvGrmtmeJowtNyns9ctAutjMINCM1Oj4=; b=PU1+5ZJczMHuL6
	ZmTzbCnE73Lpk+RM/WrRiUwfePgt5N+cr0hp1N+2g6uBBTcQW2NHn9oOEHmRzwXAJeBapk6s34Soh
	MirSI9T8LsDYxO8PiHQGObs+j9GGFTxHv7VzA3a0P8DZukp7jGHPBWwKIEAI9ZtSCG7NfaXLpXCwv
	BeYb7zH6dwiKu4NBmUnmgXG3oM/SdUIn6YCkfaeSJW0WeGurAmhEobob21mwy6NAeupi+lFz45L+A
	s4hjK/rm+iZ2KAIr9dUTpoQMbF6gpPYxFN3lbIUU0cd3Fou8soaXJnIrbHRo7PKthbO53AufZ9Igy
	4HaBtIe42y7QWUBXBvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Q2Z-000PQU-0A; Tue, 11 Jan 2022 22:54:55 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Q2W-000PPx-RN; Tue, 11 Jan 2022 22:54:54 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso473844otf.12; 
 Tue, 11 Jan 2022 14:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oaRuwn3z2vZgd7d6uXNPEElduZNqC7atPxnY1MWXEY8=;
 b=jZJutvsdOPE1aUWgMBIYV5HH8nsCwRMaoIXt4CoDqcnGcLlS5XTh8sXN3Hvs9medIV
 12xnbXX8PB/tKhbAhNKHWTUOZ8tgi/5fezqdkM6NJojNWLFjPfzd5CvB8e52rMPVVNK9
 D1xgjmhoj6sqoNMycB5UVz+w0/3Oc/qOouPot+gYN9Z4fQA/SuRqSGx8jbtpNwZhtlo8
 B5BEM9xHwshLG98d4lHUs+31+t1B+zKZC4ueAfLcVUuHpenkWIyg/hHPfMZ5bf0V3i1b
 YzMviij6tZpkn+BZVcnXb7Bved02RvcVfh/UTnQwxT6qFER4uymzv9RQcgqCS6Fh/x6r
 7fcw==
X-Gm-Message-State: AOAM533yvzd7FVMlyMBGq+V7eWD794AbZ9Hq24yLKkGWAx15aAO0rLyU
 JuwGEhpymrUyvL1W3qS75Sb9KX2kkQ==
X-Google-Smtp-Source: ABdhPJwvYN7rY4HXMQOQTwTBQsr1FwLLwpj6T6v32VokHKGrciARnmlF3v+Wt525mMAIkpcHWb5nnQ==
X-Received: by 2002:a05:6830:13d9:: with SMTP id
 e25mr4780844otq.215.1641941691939; 
 Tue, 11 Jan 2022 14:54:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h1sm2187481oog.26.2022.01.11.14.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 14:54:51 -0800 (PST)
Received: (nullmailer pid 3659851 invoked by uid 1000);
 Tue, 11 Jan 2022 22:54:50 -0000
Date: Tue, 11 Jan 2022 16:54:50 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 Benoit Masson <yahoo@perenite.com>, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: arm: amlogic: add X96-AIR bindings
Message-ID: <Yd4KulrOCjS4PdWG@robh.at.kernel.org>
References: <20220103163956.6581-1-christianshewitt@gmail.com>
 <20220103163956.6581-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220103163956.6581-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_145452_911565_0761D8AE 
X-CRM114-Status: GOOD (  10.95  )
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

On Mon, 03 Jan 2022 16:39:49 +0000, Christian Hewitt wrote:
> Add board bindings for the Amediatech X96-AIR STB which ships with
> model variants distiguished by Ethernet configuration: models using
> an external Gigabit PHY have a -gbit suffix, while models using an
> internal 10/100 PHY have no suffix.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
