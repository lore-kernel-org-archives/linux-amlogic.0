Return-Path: <SRS0=sHZR=43=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8E8C10F27
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 19:00:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87C0520637
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 19:00:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="erRoX42b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87C0520637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJ7hgmB9QhhzNl3HAowyqxYF9+tvuDIrUxXpcYlSbVE=; b=erRoX42bHf2jPP
	fVWPQipnGSceaJHAnOGvmKNQOIZ5h9R5UbWaE2dEXMGO5nxB7qdc5DmweqNsJ1LNS1/BZi18I2zVE
	Yk+am6VsEn/FtmQPwWU481fxH+zlX8SLutjwFyBhYIGz/i1YjeGYBQWthIGV/5VbWhDymkYE5j8pu
	RIEaeMvDb6o0cBMlnDvRgIbXzlM8DFEa74cTkwioySIrjGitgg3mMxqxFG7f8Bo/BOjoaBmXYhrsj
	E11vYBRZ0nhGDRK/ERcdoSu9dSQX5GZFHegEiE4abj33r/prNqb9wkujl/Mkku8Rd5MxbuH5qs89c
	2MenvpfS3XiNgmw2LxHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBk70-0005j8-Lm; Tue, 10 Mar 2020 19:00:18 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBk6e-0004GP-Sc; Tue, 10 Mar 2020 18:59:58 +0000
Received: by mail-oi1-f196.google.com with SMTP id i1so14989114oie.8;
 Tue, 10 Mar 2020 11:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ptx5WrEqMj8ChwfbIT/3T1+w1q+nwH6s5pImyQy4SnA=;
 b=gL6nyLKULAeUo7ndmz10kuq2emShm6RJ2RdBEOqSnchp7o8cLwmQoXLP2bm3wbp2dP
 fnDqND66d3uoWj55zkr0UG0h4cbRMTV+CD5p3awD4dz8IAS/f1BaDB39A/ryHndTNlVk
 LeFgAKkMKPXoF1Kx5FQfYyWfl29XQMKF5/vwiOQd/SMAHlS0V/l18pFVq16JLu+TZPo3
 Wn49+jW1PL8QDSKhpWR+1esx14yjIqbXHLmFRju87zRS/v9BlabLkbQXgvIYzE6S/ZC3
 zdP7kH1oXZB5Q/77glvmGCupKI38SYzDfPQFJWtWyzpia0fWWdAKeC/NgN0ia+qKzvqV
 vh+Q==
X-Gm-Message-State: ANhLgQ1xkE0RRMw0ZOgZUsL5ZXkcCo/iA9uZD33z9sd38ovFYfID3L/W
 VdHeFZrNqzHo1y97ehQDLA==
X-Google-Smtp-Source: ADFU+vvN6GDhTro5nK0+rHJsZkUlb/MbNtLqDxIxxZhQuJR6uGPF1cnMz4xazTrFsG+NiHskw3fT3g==
X-Received: by 2002:aca:5408:: with SMTP id i8mr2233293oib.157.1583866796263; 
 Tue, 10 Mar 2020 11:59:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u18sm2707305otg.43.2020.03.10.11.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 11:59:55 -0700 (PDT)
Received: (nullmailer pid 904 invoked by uid 1000);
 Tue, 10 Mar 2020 18:59:54 -0000
Date: Tue, 10 Mar 2020 13:59:54 -0500
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add support for the Tanix
 TX5 Max
Message-ID: <20200310185954.GA811@bogus>
References: <1582991214-85209-1-git-send-email-christianshewitt@gmail.com>
 <1582991214-85209-2-git-send-email-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582991214-85209-2-git-send-email-christianshewitt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_115956_922819_CD816154 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 29 Feb 2020 19:46:53 +0400, Christian Hewitt wrote:
> The Oranth (Tanix) TX5 Max is based on the Amlogic U200 reference
> board with an S905X2 chip.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
