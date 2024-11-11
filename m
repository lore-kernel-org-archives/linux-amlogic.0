Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A784D3ABFA
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2024 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKcXeFbp25nG3BuRYVEk8APyMaK3DC8dNc54S4RQ7IY=; b=saBIPoJJuH98EA
	h62P0rgkKAppj74tfnHpqTN3Nta01qKHVwXIcrFW2kjy7KAsHg0QOAtnANJgFl5IT4J4pE40vdMBu
	2XdlsbvpprfOFyxTsWUaBb2SLlPAitUbsxxH7Jd2s2ezbwfsiaMoa72g6t58I3xR4FQcrmQ03SnCG
	MWbYcfzpCkAFbEgbLTAfY7s6XNeFLVtlVl0az22rE19B2TJvzlwK3FgKmORAOYCAXAg3ayO10sZ95
	ZLoeM5Rjn4S7HCQTGY04iG6a9lpcY1USitqwLZljQtAFICE4g2N54T8O0FUa1L0ciQ6XkJzBzRijw
	F0QM3qXMVwl2up1RSaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcGN-00000001PKK-0yZk;
	Mon, 11 Nov 2024 21:47:59 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAcGK-00000001PJP-2JPx
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Nov 2024 21:47:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30A8640006;
	Mon, 11 Nov 2024 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731361674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g2b4scH3PheFozFLPBiOdBcm1frxxscZgJklXEJTI+E=;
	b=ORgrNDsApFJAXIlghO7ADZBZShp2JPVY1Y2q72fERJMhFQQ0H0WGk/ugUaRe4z0Rhcti6v
	gg5YRX3ujHhU5Z0GU/nnqnjIfyjakgMolvoxkLQbBpqDQAOjhPozKghR+zYY/eMYPox8Br
	8fOs23Vdb8h+h6rODi8IvccP+ILAeBso/HRis3257iSqm4GrGmw8/sbDKHr90Q8rh30Vh4
	9U7+5osF9YvsVOp05UXXo0fUzcvcAzTiqkuFBuEmMdB2vGBqSdVH2qb+lO2LqGKek1mG9p
	HenFUlRYr5aGhwth98wy7TjGlEhvw2m4UzpHLQsn8FAEKuqqMifoxaZTuf9I2Q==
Date: Mon, 11 Nov 2024 22:47:51 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yiting Deng <yiting.deng@amlogic.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v5 0/3] support for amlogic rtc
Message-ID: <173136163495.3310623.12434068921554307587.b4-ty@bootlin.com>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_134756_751710_8E13553A 
X-CRM114-Status: UNSURE (   6.61  )
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

On Fri, 08 Nov 2024 13:54:40 +0800, Xianwei Zhao wrote:
> Add rtc driver and bindigns for the amlogic A4(A113L2) and A5(A113X2) SoCs.
> 
> 

Applied, thanks!

[1/3] dt-bindings: rtc: Add Amlogic A4 and A5 RTC
      https://git.kernel.org/abelloni/c/12defbf1429c
[2/3] rtc: support for the Amlogic on-chip RTC
      https://git.kernel.org/abelloni/c/db26c3d6eb01
[3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
      https://git.kernel.org/abelloni/c/cf6f2ddfd039

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
