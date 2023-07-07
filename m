Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B14AEB64D9
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 15:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrTfPIClDydx9dhje9EHBdZBBMH8yolz/2/5b8qI0rg=; b=WOY1EDwkJ8j+/1
	t/esfqOKs2ttP9NKs11+k8H0bCSk7QIM7ANCEg5dmqleMB6uibHTeoFfbdg1cDD18+cuS1c95d2pO
	JCHcUJ2KxsMiD0vogqTh9UJXyhDfLBTiahCM7tbMdAFfjOhKO3QJk+Z1IKKoBaomLQaXY0QhR/VBY
	wVrIAMuO4MCufZ4gpgDluoxOrJ1HjMddyI5NYu72BCVvNMFzioIAaJOKBf9vev825ZgJUJKt4DCSb
	jcXkrvkzeL/V9NaHhrq86q0D7KoR5TN6EZoOPfY+DOCvX9HpYOlpiZy71H/NR6YntmmceeRCHFZpS
	slApriTHwJOsRUsAhG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnP4-00539Y-1t;
	Fri, 07 Jul 2023 15:29:50 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHnP1-00538K-24;
	Fri, 07 Jul 2023 15:29:48 +0000
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-346392da0d6so7387565ab.3;
        Fri, 07 Jul 2023 08:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688743786; x=1691335786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np7u1Gdthtj0H8HtGvq1aCjiEkrlbP9XGrbQ0FbEkYo=;
        b=Dg1xf61Y/jyelnoQhrwurr+/49ou3AwH1VQczsfd/t9rZiGhMvCrsBazH78ISYp57k
         yqLWNE8SE+1JVZGk2rslIkLkXqsvKkIHB03X1l++txCReCUOAJ29OanZ36C5Qa+pA5jw
         OLszNCT/yCRL366n8Gxapln1bn70ZJf6MUh3MTM90wm2seNPCkQama3whuo47yapHzZ6
         gly3jyGhxBXBV0nsPEPJnYtgGCZFVuZjQGT4GnKz/r1ygZbwVJVyVNuk+zeOBM4Xhnju
         G5xz+zmKtrdGj/soXLgnSQ3Oc+K+Gd5NApJTf5fC2D2+bPmAXEko8O1OXFHMphNHiUOB
         wJPQ==
X-Gm-Message-State: ABy/qLa7HudS/93egIqM0R+tktxXPlT8P1dt/fmJTG7mpz/Za06Z6RNi
	YBK1tEn8smuvjdswgv3XkUXWINe4aw==
X-Google-Smtp-Source: APBJJlG5IZMtz1lyDHAnM11LNIdYWsO0vZyrcvTYEhT3rk7aFygsR8f+tCdOG6f4F+MnwTUZXCoSdA==
X-Received: by 2002:a92:d94d:0:b0:346:4293:df1 with SMTP id l13-20020a92d94d000000b0034642930df1mr2882969ilq.31.1688743786588;
        Fri, 07 Jul 2023 08:29:46 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id p12-20020a92d48c000000b0033b2a123254sm1387612ilg.61.2023.07.07.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 08:29:45 -0700 (PDT)
Received: (nullmailer pid 337099 invoked by uid 1000);
	Fri, 07 Jul 2023 15:29:43 -0000
Date: Fri, 7 Jul 2023 09:29:43 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/4] dt-bindings: power: add Amlogic C3 power domains
Message-ID: <168874378313.337045.7252600709382848540.robh@kernel.org>
References: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
 <20230707003710.2667989-3-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707003710.2667989-3-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_082947_678235_CD88CA88 
X-CRM114-Status: GOOD (  10.37  )
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


On Fri, 07 Jul 2023 08:37:08 +0800, Xianwei Zhao wrote:
> Add devicetree binding document and related header file for Amlogic C3 secure power domains.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2:  Mofiy filename  matching compatibles.
> 	   Delete unnecessary blank line.
> ---
>  .../power/amlogic,meson-sec-pwrc.yaml         |  3 ++-
>  include/dt-bindings/power/amlogic,c3-pwrc.h   | 25 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/power/amlogic,c3-pwrc.h
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
