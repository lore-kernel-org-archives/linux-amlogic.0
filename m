Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF470C28CBC
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 20:12:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D762075E
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 20:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lSROVsed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85D762075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q+83SOguGRFpvOfa5tjLi7aX532f3jd1FI2RCOeZqU=; b=lSROVsed/CCFEG
	qiC173vKcfOGYzrXfyjtZUBkKCxVrh8ak+lfb0jeTz4RY/xi1ENT1KeZ7dQb4smDP+b/s+IKY/wHk
	HRQEIaMtiDadgHRYFCfgROtIr7dU6zPDy/cQcJld/CDUa2PA9f4B9TeSh7XymifgpJZk1fa8ylWwZ
	Vpv0KQ5FBa9G/JVBwqQDLnUsFHokquZ0PxFBDfxLJniB+Zk8qJ5OpgMKPROZzHzK9/QCianShh5fa
	1yyjuY5LhvITco3l0hKMNJ4PxLIqTbZb1pW6vuGxIuxbFhINp8RL5CWdsTLC0Zc99E8s2zFyKAxqT
	wSmzzYZgMv9DoYNTJXmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWQPH-0003d3-Mj; Wed, 06 May 2020 20:12:39 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWQPF-0003cU-KW; Wed, 06 May 2020 20:12:38 +0000
Received: by mail-ot1-f65.google.com with SMTP id t3so2475010otp.3;
 Wed, 06 May 2020 13:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e+vn9EFSA0UGxoYXwE1EVzF8LOPmMyHze30Po1rkro0=;
 b=Jyw7g8bCBr1zHQiWqTkpMulSUwTK04AbdfiviTgIZQH31wtaP1O0IJOHEDrfsAu8V2
 wwH+BBhgW59VeFSN6pOMvYOQ2BfoDaFaP6KsugjvV4750Sa+CQJCq7JyNfWNs++o4E+M
 6UKiDsAyqvNng6YD4U5kJGypC1ZJer66btDmw8rnrIZ+oFqjHaAjU5usQ1cWqfyGgWv7
 6t9wPXPtDpbISqPjuh181jn8b8BcuyXRf8fl3TWV9rq9jTo+KFIA0/agM+Y7Hfeb/W54
 L2GgvEE8mtg7XOj1DHagy0my5scwbNVcuwRPxDfnb4AgwtpJwLBwtTA/mzd4eiorCFol
 C7aA==
X-Gm-Message-State: AGi0PubAPxcGo4+PrNe6xkyS8WWaBTj/ynfXUDANrNgCg9mGkBWKQxoL
 f2pKia4ms3COwkqKJHxx2w==
X-Google-Smtp-Source: APiQypKFp1fXOaDvxKO48NzVwW+KRP+mYewDEAYdGEby8SRscKRUph/tJl+f9aaKBbZIMCVBbTTVqg==
X-Received: by 2002:a9d:12e3:: with SMTP id g90mr7344939otg.247.1588795956372; 
 Wed, 06 May 2020 13:12:36 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n9sm758855otl.76.2020.05.06.13.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 13:12:35 -0700 (PDT)
Received: (nullmailer pid 14836 invoked by uid 1000);
 Wed, 06 May 2020 20:12:34 -0000
Date: Wed, 6 May 2020 15:12:34 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 1/8] dt-bindings: mfd: add Khadas Microcontroller bindings
Message-ID: <20200506201234.GA14756@bogus>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
 <20200421080102.22796-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421080102.22796-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_131237_674349_8BBFE304 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com,
 Neil Armstrong <narmstrong@baylibre.com>, art@khadas.com,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 linux-arm-kernel@lists.infradead.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, lee.jones@linaro.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 21 Apr 2020 10:00:55 +0200, Neil Armstrong wrote:
> This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
> boards.
> 
> It has multiple boot control features like password check, power-on
> options, power-off control and system FAN control on recent boards.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/mfd/khadas,mcu.yaml   | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
