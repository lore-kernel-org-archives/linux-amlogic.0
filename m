Return-Path: <SRS0=L2Ze=XI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C92C4CEC7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 14:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E7A2089F
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2019 14:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rLIJp3N/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58E7A2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NcYgztnC+2wpW8DEjVCnnh25K3dK4vDEQ9rYg851P0A=; b=rLIJp3N/371minoh1cAa72NwhK
	zZ7MHo52/ET3PTBHYKiBH8DIP1kehgDpdmYCTCUyfQV0U8VL7zJWL/BWImBb/W2hmOgqzzGu1Axt5
	2ReLrugJjLckI52hMzXFfjaCquko2uhWKULhcFoyfvNM5HGQ/CLZ72zDURxoivBKnwj0l7x8KmXVN
	6QJ3nYzKKu//8lYySiD/vYhm+XnoNVON3RnsC23AwbjcMhRrCDcyGIpXEhgg9669cvuDzziUHEDne
	fBnfDzXwnMMM0jKfq1RnwvGTgLbKF8pKgswfPNuZydt8t7zWg3NV2HuqGakEnMj6gQobAYxXlzEJD
	CxNJYSYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8mil-0004ET-Vi; Fri, 13 Sep 2019 14:38:48 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8mgP-0002VI-9D; Fri, 13 Sep 2019 14:36:24 +0000
Received: by mail-oi1-f196.google.com with SMTP id e12so2834533oie.0;
 Fri, 13 Sep 2019 07:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=YbpiQzIM3eQL4XQ34vYEddsWeG9VMivV31FLcj+hIuc=;
 b=q8WiDbYPzs1AdOZmwm0KN7Hmwu5jbtgwyLH6gMbMOC88CSgaSIXJlWDNcoDPhnHhEJ
 6pyvsydc+oAr5972jxk2KRfW34UnlzcRC7i06W/yPvrUv+jcDQYhsLkWCkqE0gSeqSVa
 5o3TqMswFOXBHSSdAz55o8THIpt8A/0Z73hpaVsai8O2AMwpmIfY8C9FhQcEksVEp4f2
 zOf8raRdN42+R64rcCDBkVGbl4/BitNYlAfNPSEoVDqRNZSi9nbwi6jqxAHCJ5+mNV9w
 Kf0TZvFsBh8lkwD6oYgOR4/fYEB+lhZlUM1/qGHUJfJgSEe8JzbcPCEaa/3t7KdTAfMV
 mcGg==
X-Gm-Message-State: APjAAAWwGLjCEI/jht/4c5vMoThRCXdjybF7+rHkdQV8XYpYAoR9wjHp
 CewRZCzujdEQ6/5W/b6ZKQ==
X-Google-Smtp-Source: APXvYqyjj6rIVWDuqKwqqDB6O49ywBjZD3PZQ4+xjM00i6c2gbMnanfPNY4AfSDhsOstHiycfTtKVQ==
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr3624662oih.83.1568385380257; 
 Fri, 13 Sep 2019 07:36:20 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h20sm4239119otj.81.2019.09.13.07.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 07:36:19 -0700 (PDT)
Message-ID: <5d7ba963.1c69fb81.4869.eb19@mx.google.com>
Date: Fri, 13 Sep 2019 15:36:18 +0100
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/6] dt-bindings: pci: amlogic,
 meson-pcie: Add G12A bindings
References: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
 <1567950178-4466-2-git-send-email-narmstrong@baylibre.com>
In-Reply-To: <1567950178-4466-2-git-send-email-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_073623_351167_395DA4E0 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 repk@triplefau.lt, maz@kernel.org, bhelgaas@google.com,
 linux-amlogic@lists.infradead.org, yue.wang@Amlogic.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun,  8 Sep 2019 13:42:53 +0000, Neil Armstrong wrote:
> Add PCIE bindings for the Amlogic G12A SoC, the support is the same
> but the PHY is shared with USB3 to control the differential lines.
> 
> Thus this adds a phy phandle to control the PHY, and sets invalid
> MIPI clock as optional for G12A.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/pci/amlogic,meson-pcie.txt   | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
