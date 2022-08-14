Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FC0C25B06
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Aug 2022 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhEIcaHcjLzHDxTsnICSyOdL647kR60OYfkQ55SjVSM=; b=wi7PQQHFYxAxQt
	rQplQeWoGaP6Nl2IykkWvK/s5K0mJPlN+6kI7GFG229JDTlktMigTVFhhoj2fma65pU1PGD+7CZku
	8kWmIqSKT0k6SZ2k9qpyCcxA0Dx94sI+1aebFd9VBnB5s9BMxF/CX4TmzutTUU9s1BTP11S/htZgz
	GcWOx4SN5eckcgJ/sl3s+swMmntyvJgozmsafiCQpzwOl84gQ4YpTIezCfMQhlrUg4KqmI11q4Lqc
	l/SFPj1LUoskB7FL/lOy8g8uHNWnmuO5y56aftxc/N3nrJeDGTm5Aqh3pjWdnoGDooXITBYqc7gKp
	FoLkzfbaEwsPv/bxjglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLOR-009Jz1-0N; Sun, 14 Aug 2022 21:43:35 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLOF-009Jwh-QE; Sun, 14 Aug 2022 21:43:24 +0000
Received: by mail-qt1-f173.google.com with SMTP id w28so4412309qtc.7;
        Sun, 14 Aug 2022 14:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=gsvKZizMBPBqAoYqxHhYeaAnDMKudFEih3zhgTZgEKI=;
        b=hJRZurwB0ByoU+6hnq7eDxFnozHopou2rPWHm1/CYJE1VP4EWMV/ixepwbL+Jo2iQM
         8WaPOq27SecpaFvOyHOT5BIVp3U7f1rYnpdHTEC3Vb9AhKa+k3PUgqb32Yz+vZen3LMV
         DKmR7QulM2H1gmINox11FWsalHd8G+0Tk+DqJyjvwPGvWTkgymOMP6gQIecrlsQZy+KX
         LofOzpE5sBuYvOeBCeAWDBboTjKJl01+FBAsGS0NJIu1wLfuYlJLty/6NCkTkBxryCpt
         90pEXLIjLRfq2CJ4UzHPIBzak0HNe0AipcOUZ/pD8cWo9xlW1rnct9fX7O00EUk0nTxW
         uhtg==
X-Gm-Message-State: ACgBeo1R2Z3LLlOTQbQcHGmt502kEn1sVDK6yIdEq+KVzDYiK1iKd5f+
	j2eEzxTZrZYET1F+wfw6Hw==
X-Google-Smtp-Source: AA6agR5vGKyXZeFoPtut0Cl2IDwYQJK1DsTfiQVEtUhzO4dX1YgRj3J4ywYCM2tynjSjhUKjQvEW2w==
X-Received: by 2002:a05:622a:1707:b0:343:645e:333d with SMTP id h7-20020a05622a170700b00343645e333dmr11792887qtk.497.1660513402051;
        Sun, 14 Aug 2022 14:43:22 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac9f:26d8:4b95:fcf4:6a60:b904])
        by smtp.gmail.com with ESMTPSA id h17-20020ac85e11000000b003430589dd34sm6962150qtx.57.2022.08.14.14.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 14:43:21 -0700 (PDT)
Received: (nullmailer pid 738164 invoked by uid 1000);
	Sun, 14 Aug 2022 21:26:29 -0000
Date: Sun, 14 Aug 2022 15:26:29 -0600
From: Rob Herring <robh@kernel.org>
To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: amlogic: add bindings for Jethub
 D1p (j110)
Message-ID: <20220814212629.GA738114-robh@kernel.org>
References: <20220811103113.3097868-1-adeep@lexina.in>
 <20220811103113.3097868-3-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811103113.3097868-3-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_144323_870010_CE9E3C6E 
X-CRM114-Status: UNSURE (   7.99  )
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

On Thu, 11 Aug 2022 13:31:13 +0300, Vyacheslav Bocharov wrote:
> JetHome JetHub D1p is a home automation controller, modification
>  of JetHub D1 based on Amlogic A113X
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
