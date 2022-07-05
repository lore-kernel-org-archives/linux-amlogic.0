Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CA4C43334
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 08:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EutgXVFFxJYPWF1DaqBq0cAFUrM6JYStIU0Lvbh9vQ=; b=1QDfqJUB9MgD8B
	lQpOMgJE2WYPyO+TYsUPiN9lgtUH0h5zcCsnIHV8Sb35hg9QBsezeI6t+9W2LEbNaL+0yZ+nXQfmg
	AcG7LIkXexAx986vLMntSKBdmlOgh8FR12CHqHGBwaMaIeshqOwb99phQfrajtQxk5Iu99op9SwB+
	Ole0rIDV1u9W0RePUFjiTRlkOVxejUx0QsvFl3fBpqOn/jJKCkcrHjBM9s3EhO2nkWRyfOWHppgP0
	9NtuEw/BK44Ew4F9Y7zlEToWURYllHjwqFMHuy5WraAMAhedhhx0JK0CWNfZshYKQIIC7JIaqFnZt
	UeBijpQpWJNgWGFRodRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8doI-00G9Dm-F8; Tue, 05 Jul 2022 08:21:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8doF-00G9C1-MO; Tue, 05 Jul 2022 08:21:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E2D8A617B1;
	Tue,  5 Jul 2022 08:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271FEC341C7;
	Tue,  5 Jul 2022 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657009286;
	bh=TfRN1QJ6eN15QY/pRMm2YdI/F3oQ61wWL9Xu7uI+LMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPZDn98+RvjsIkoPBULv9O5Ae069Abv7vP+1hzqGOczE7T5u6FHgxFe47NQyY1pLL
	 VzTCFpLo1My/zDtSQg+gnj9rQghdh7myY84pTBiBkFr2IAgIn2jsrsq/bXqWFjiDg8
	 JV1Z+rUM3Dbk2a3wqEqWg2xln6cgP2bafTulnSFTBD/zrr70k2uhjUfaZ08jUiEdp+
	 pN5ika+Y5KzJL61+LKRXXWnKpGlsTCS7ZAwBli7wZ9KWzcNBRIPC5ufoGS/9YYwlYC
	 phIHakW82zSPfCZGt+nCAGcg1kXqeYTPUIi7dm9If7hidQ8VwFp97zWwj+Y0+hj1kS
	 fh4PMmi/eCLZA==
Date: Tue, 5 Jul 2022 13:51:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: kishon@ti.com, linux-phy@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] phy: amlogic: Add support for the G12A Analog
 MIPI D-PHY
Message-ID: <YsP0guiyOeP4jTGE@matsya>
References: <20220705075650.3165348-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705075650.3165348-1-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_012127_808449_090F8F8A 
X-CRM114-Status: UNSURE (   9.33  )
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

On 05-07-22, 09:56, Neil Armstrong wrote:
> The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
>     
> This Analog D-PHY works with a separate Digital MIPI D-PHY.
> 
> This serie adds the Bindings and the PHY driver.

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
