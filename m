Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA0FC6FD18
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Mar 2023 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7gwo7HH3rfxe63siYfkm4D1J11PMyrDm6fTMxodTQNE=; b=sRWsanLlb1Mzhf
	DVSJ/rT2CjdUwbjsjviCKH+fz14aN1WbRaaNGEIBymPKYRbmFDFMA9w2cLDAoZ54L8SkFNnub6rNK
	U2USc9BpG4Lr5jcGqnXE5Xktkt9cG9tmKTwRDzUBfezdJW96y2EQg+m1VXBWiaac/Bk5MDI5OH8sD
	A5D4jpEaSG3oXbIfWQrXjKo5GuBj+1DqO+sy2QoVD22NMdUfVgYvuwVbtaAkaSr6LBCUsD2f6AWBR
	I1gXbqAnRm8OF6xz0BDfjTdYOt4zPcq6cnxqshEMDOTMReKItWuc9N45LCpT6GlwvRkgec5X+PITg
	DrGs6eNxLs86S5jaKv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piF8l-007aVB-1O;
	Fri, 31 Mar 2023 13:50:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piF8j-007aT3-06;
	Fri, 31 Mar 2023 13:50:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 47AFEB82E86;
	Fri, 31 Mar 2023 13:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A94FC433D2;
	Fri, 31 Mar 2023 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680270598;
	bh=z/Ar//fKecpCf9wRkg18J/k+U8y/C1Zx2QWQGp9b4Uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=et0BefEu3QBhflB0a+HHoSnW5KubjrOSR95wqxNWiBBhpwxazaCrTjl8pIcvzQ/+6
	 PWEGCOc+Gjt3SovdTeNO8RTYvvb52/lmxPe0v72S0cvh/JjieCMTjhMfJyvqiZqEJf
	 juMEq0wI2jg3pZui65EK2GvBWLGo7DeAOWA3halnI8jvQwMl+TnY/WeA/3wvYMyXLX
	 F+Zr/ZIgH/J/BvAVPvgmmjot8EWNYMey0RLRWuy2a0w8rrpodHSicO6ONgreUjdOH/
	 xZPjXwUo4KbkOu2K+DhOD/MppezeqnF7WfoZOjQS5qAoFYOR+xVsFAgD34QgJaCtYE
	 3rXUA2DCLxLtw==
Date: Fri, 31 Mar 2023 19:19:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, kishon@kernel.org,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] phy: dphy: Use devm_platform_ioremap_resource()
Message-ID: <ZCblAoyNJhoRyyKd@matsya>
References: <20230323073534.75037-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230323073534.75037-1-yang.lee@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_065001_211630_835F7737 
X-CRM114-Status: UNSURE (   7.58  )
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

On 23-03-23, 15:35, Yang Li wrote:
> According to commit 7945f929f1a7 ("drivers: provide
> devm_platform_ioremap_resource()"), convert platform_get_resource(),
> devm_ioremap_resource() to a single call to use
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
