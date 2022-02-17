Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7926BC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Feb 2022 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Djpa/3sUA8NyhjRqphCM+B2uAt1LbNh5lqsPS8ArR/U=; b=E5AOtE+YunDWzz
	yDwIsCibsiRTNXS7vS/vQ2BN3a7wV/7ttpBxu8YIXqTS/fNEPA+GTdr2FArqzjpk9+dlZhVyQqeEx
	7VWr/7jQKVvh9U6VieeuekQIbSVyhKVKGclr1GGQ3278m6T0d03Uogf8JntTWKoQPWNv4x4fMmuMG
	Ai0GUE/3G6Q4PA7doYH2CzQm5r1SNU+ZNA9RoostuLxvzy4sYGn1qbyZC5HNRzGEBLJ4Aj2RX9iNE
	KKVwJFk434dAJ9sA7kFdlCWSs/2oUKHdrnflk3cz/gVBTS2mTnkoNuzEQwtHpEugcp7yyEX2AkHCh
	W36kH7WbLVuS1fTdlBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKqF4-00CS5w-Tq; Thu, 17 Feb 2022 23:31:18 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKqF2-00CS58-18; Thu, 17 Feb 2022 23:31:17 +0000
Received: by mail-io1-f44.google.com with SMTP id v19so661377iom.7;
 Thu, 17 Feb 2022 15:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aX1kOLRLqUi/fD/S8s57gBL+mbXnx1KA4IaN6Y1oZro=;
 b=vLRaOsDIgqGkjKYaqGzQYDvBMsyI5u0ytVaIc98dNFBm4dfvodm5wRcny21MUH0LKs
 XHlS/1t9YFWtgod1NGn/N0dZSMSJvAS8hZVbVauD2p0UPrqHbeF8d8x8IZvvmGJzx69d
 W6CoMcSvzUaaXvhuuVPdubmz/oMf2hnhhQ4EP0Tuwp+z7QRQbcGIjjN1e8gaMM03lG1V
 v2t0FvVe2wPDjm62UxuZ9SENtnipCjDl+4o8GhWs9axJf3X++/shlZI7RYUE2K2BC9rX
 kQXaIJkhW8Yz5mrcqZJOkjXbrngEHO6aUDFdWH7X4gR8QaNj5y8C6veWnR1wzWfv0vft
 ExgQ==
X-Gm-Message-State: AOAM531DcawVJjWXlIx74Cpy5oltyRQwf4mVZ/12FpEuS5WueCrhfsnZ
 WekNvJBHe/vcww9IKPt7cw==
X-Google-Smtp-Source: ABdhPJwNBKIbdb8tbNk9wdDVdH7TrVuLhZsRST5q2MMUQdUuOJCTRscINn7gvB8ntANpuN1jIv+aMg==
X-Received: by 2002:a02:5b0a:0:b0:30f:60e4:b9ab with SMTP id
 g10-20020a025b0a000000b0030f60e4b9abmr3337571jab.189.1645140675081; 
 Thu, 17 Feb 2022 15:31:15 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id y6sm2740212ilv.3.2022.02.17.15.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:31:14 -0800 (PST)
Received: (nullmailer pid 3975113 invoked by uid 1000);
 Thu, 17 Feb 2022 23:31:12 -0000
Date: Thu, 17 Feb 2022 17:31:12 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Sam Nazarko <email@samnazarko.co.uk>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 Chad Wagner <wagnerch42@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add osmc prefix
Message-ID: <Yg7awMmMNfU/D8wM@robh.at.kernel.org>
References: <20220211105311.30320-1-christianshewitt@gmail.com>
 <20220211105311.30320-2-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211105311.30320-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_153116_116153_08E5F57C 
X-CRM114-Status: UNSURE (   9.58  )
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

On Fri, 11 Feb 2022 10:53:09 +0000, Christian Hewitt wrote:
> Open Source Media Centre (Sam Nazarko Trading Ltd.) are a manufacturer
> of Linux Set-Top Box devices.
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
