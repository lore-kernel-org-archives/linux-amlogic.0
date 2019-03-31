Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D872C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 07:04:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F160E21773
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 07:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UxSkjnMl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KGn4Bjgl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F160E21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0XYKwZqar7qpqazcCPNlB1J+uWri7ZYbvzpPkAvchRA=; b=UxSkjnMlKV6HOaH3itGRCJSWQQ
	PcCG9lRYS+lDTLr4J4eu4YmdTN1+VtXlTFWimllLsGndXUarQFivvSLRjxzKtJb3BHhX8v5wJ0ixY
	KmoJ6q6wFl9kivtjE+bL1zp56qo0VK4bKN9/q5RjbxhzrpJ9bHS9MNQgS5EOpk0wDU2aPYSWd7WR6
	OoS6O+mT6QsTAZfrwtU6atnWnfQbwt32UsfbFzAgLc8d+gfkKJsE6kQUtCKTidyh4maCPwfM7xRbv
	Xn3P+YdF8DmPvZnDLQVnV3w2qVB0QAVSvDB/RrmgX2FZSQnEkWJDlRg15IRfSmKHWyoK/tNpZlTaN
	YWkWdDjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAUW7-0001ZG-6k; Sun, 31 Mar 2019 07:04:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAUW5-0001S2-Mh; Sun, 31 Mar 2019 07:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=To:Cc:In-Reply-To:References:Subject:
 From:Date:Message-ID:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T99fg7hIA02EvGKo9Wat0eXhYCvR45zHh4Mkme07iag=; b=KGn4Bjgl1O8pShXNZbU0t1vF0
 +kztb7dJgFNkEQ2kXuhe6fsiLWVfeLQX9rNpqZqEXAZU67ZcQQSHtqSC8Xp3xw135CGv5YE+MQoWD
 vjTQrXP3sMDnnplVjX25YnB9xGDOHHC1sxnWO5YnoqZHFF4cv2XzesQ3+SAe9XaLi6pfSksKsZ/PH
 5Zlfk7sCQkjNdeTHtflUSQQ/7vS1g29Z7JipH9BS65RcZsPsVOt6mP7jQM7oFDsTs/+loSw6N+mtR
 04r9twCOi0B6zVojkscEGMlesOwH9ApiRvVhL2n5RKeuS2DBDAJ+POovHomVYayhwy6wPsfblZB3l
 SyRAENaNA==;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAUAy-0004mn-Js; Sun, 31 Mar 2019 06:42:42 +0000
Received: by mail-pf1-f196.google.com with SMTP id i17so2983593pfo.6;
 Sat, 30 Mar 2019 23:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=T99fg7hIA02EvGKo9Wat0eXhYCvR45zHh4Mkme07iag=;
 b=fnS4ixhFq22uYVyXCmysxeLjIMFg5G3uXo1ZOC88wtd0VRoHUG7mRWU47YXrTXr/so
 lyjsQFBWcAnwZxQoh3fSAyAnEviEp6bdbxY/CIWFOSPS47x8gDsa/hsUHjoyzZS8nLni
 FEiAkp2EhocaJPsg04fCD9UULd+o1WTHngg96UJDugiFOE+c5Sfr0U7KYEr8pYRSZS+r
 NJgQ2Wd+64jUZMntacBrU0WfiHNloMFh11maWGmOPjGqNulAunSutx0vnsUHPpsc9/ov
 yz/51N0jhWL2LVh63tYFyiuWH7IeJSk65u9iQqOJq4dqM/viZwypbJEJLPo2Pq7U92sk
 syyw==
X-Gm-Message-State: APjAAAVgFN3tq8HCxNoGPYJdPpWRN/xVNiB7xZvAS1980tAHw7r5W8ID
 K+g4H2hgfn4zzD751t5Bkg==
X-Google-Smtp-Source: APXvYqxTgjjqz7xInefH6M1TaQ2+nlWkssNwbTWc9fBMZeYTs6YV3AC1OIS2pXDTYEUIQ4OmoXkfsw==
X-Received: by 2002:a63:2158:: with SMTP id s24mr45677421pgm.156.1554014558741; 
 Sat, 30 Mar 2019 23:42:38 -0700 (PDT)
Received: from localhost ([210.160.217.68])
 by smtp.gmail.com with ESMTPSA id e184sm10391210pfc.143.2019.03.30.23.42.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 30 Mar 2019 23:42:38 -0700 (PDT)
Message-ID: <5ca0615e.1c69fb81.5f157.ab16@mx.google.com>
Date: Sun, 31 Mar 2019 01:42:35 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC 4/6] dt-bindings: arm: amlogic: add G12B bindings
References: <20190327103308.25058-1-narmstrong@baylibre.com>
 <20190327103308.25058-5-narmstrong@baylibre.com>
In-Reply-To: <20190327103308.25058-5-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_074241_074949_6C91EF72 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 27 Mar 2019 11:33:06 +0100, Neil Armstrong wrote:
> Add compatible for the Amlogic G12B SoC, sharing most of the
> features and architecture with the G12A SoC.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
