Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973D7D42B85
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MaON1VnpO9lEVVGJdIJYK4B4zaFZ95049JdaiRe76w=; b=tRRMLOzoV3UNvF
	xhG774IW8c2Uc7MEd/FwqdpMTHLpJc0m21yj+B9e95SSsiC9mQGn2VlphXUKrLgYvYtxbKmyb08my
	fzKZSKcxx8VX0moWeQ1uAcLwRZ2/qdYaTJYiRZalqsO7T/Gy2RV6hNQnHqSjlSiSFvO1wgUf/I0CU
	mfpmbT/5FA+D3MHLL34T+QgMZpT1wJ7yF62vgAMKhSsqYn2T6GovYk+FN+kXZxsqwwUpggknW1O0m
	K+A6VDccuj10Uai4g4YgsDUdwvlyo0DpzhXyybtK8GcnkTYixkpRQF0KM3U8bD9a6PR9u431CXh3C
	fIfJ093ql8Goyu23c5WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsG4-00000003pbG-37pS;
	Tue, 12 Nov 2024 14:52:44 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs4W-00000003n7U-0l3B
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 14:40:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 838DA1C0007;
	Tue, 12 Nov 2024 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731422445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nTKxTYuHxpsEfa5uoloGupR++LJq3u7SmDUHPOZk4Zo=;
	b=Fajmlr73GJK0QIOTpMqiS/IXudOf0W2iauFh+mvW+N2zb7/4u9almQ1luDrG6EJLhDzHQT
	0Roq/G7OzftOB99PzTD20VAAC7teWtZd78uQ1FJtgH1MhaKHHwTMhs3Ju6hqPBU3oabDLd
	T0JnRy/G6Vxd35RCj/nXsyCwS9Dk4+XhbfyqPNGPulx8xBveJMAKipKSRNJzW8moJLZ8yM
	TWcLt36Yuk6jPIUISzyxZCt0/gfJDk5smXSr6sgoeUcYhjceeyV4WSUvFwGGmh+QmPGfm4
	rEuIUJKGLWEfuHrRgLvG6Z3Tfvlu8b2GiFbGs3k/BSiN9TdFzgkh4BI0eYm/rg==
Date: Tue, 12 Nov 2024 15:40:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 0/3] support for amlogic rtc
Message-ID: <173142240907.3446466.9470229685878821309.b4-ty@bootlin.com>
References: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241112-rtc-v6-0-a71b60d2f354@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_064048_370374_3B7E799C 
X-CRM114-Status: UNSURE (   6.98  )
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

On Tue, 12 Nov 2024 11:10:13 +0800, Xianwei Zhao wrote:
> Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.
> 
> 

Applied, thanks!

[1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      https://git.kernel.org/abelloni/c/ce57cf7319e5
[2/3] rtc: support for the Amlogic on-chip RTC
      https://git.kernel.org/abelloni/c/c89ac9182ee2
[3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
      https://git.kernel.org/abelloni/c/a012d430a4f2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
