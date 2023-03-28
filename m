Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C7FDC761A6
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Mar 2023 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61E8kmuhJeb1zUEc27aaYrEtTmDw+uF+8uXoVN/pV/4=; b=GnorKLeRqEGlyU
	GGjF8QdG0ekogJLfC/p1x9v4r6ffgox40EvGW7CSsJrAvOWh6JxsIhC9eVrtG91OQ31VhdGGhT+Rn
	1pUCCzZEvX24/jgE5LIg8jpg79ndIzrYxoDxYzcGNyTx5EXVlK/sEsVYg5ogBTzFpOFrcw2b1aHh5
	vHYZF7DpZMZhHmTwhbL4CDmmwY5m6uAMoZAy9EEMqlSqeWMGU5Ir4AKxuQ+Edku9drDoWzQkSXWmr
	Mya60W9akzcWWNkSiaLiVTTPqYEwvq+A3ndoA8GgWnHI2hCrWvJqOob6C6mPRh1woUoirzUxhbtgg
	zMYIJLUun21lrPqH5diQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7wU-00EFYo-37;
	Tue, 28 Mar 2023 11:56:46 +0000
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7wS-00EFWv-18
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Mar 2023 11:56:46 +0000
Received: from [IPV6:2a02:8428:2a4:1a01:1cb6:d5a2:ed09:fe0] (unknown [IPv6:2a02:8428:2a4:1a01:1cb6:d5a2:ed09:fe0])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C1BCB0059A;
	Tue, 28 Mar 2023 13:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1680004599;
	bh=NfWBDO/xBW6WIiyIjNS9fyWWl8NNVh7CXLhFuJow7Vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W4+71B3FileUwJ6Vy1VszdU3Y5CTKjOt/I+Iuk2qeLTK6j/tNce5fopFE1Kf1vC9R
	 5oAtLUK44VWoToBJRFO5eEVGcb61CdYkEsdWGONrivfEZE7qO7kDXJYL0pw/Jgh7O2
	 T0E8RqhIiJS80ZdycgpU5mokFLXiaL6vpedH5btK+Z2gnNfdh2sCyCuk+27MX/I2xK
	 WGDWdxnxdvK7ZnT+NsTT6X4Bf9PugXC1WlA0lnYcgFgAmAAbzAznTj6Tr8zJLTi3zS
	 Ap0H7U46MKZFgaGdScuGVbRwS2+ZVbjWZGT8pf6od0QwtqU0b2N8ZhWvIzshrpEWoS
	 XObWzhs0DJwjg==
Message-ID: <02ce8478-6586-e080-c82d-8e709ec9d9d5@free.fr>
Date: Tue, 28 Mar 2023 13:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/3] perf/amlogic: resolve conflict between canvas &
 pmu
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Pierre-Hugues Husson <phh@phh.me>, linux-amlogic@lists.infradead.org
References: <20230327120932.2158389-1-mgonzalez@freebox.fr>
 <20230327120932.2158389-3-mgonzalez@freebox.fr>
 <09fbe342-7bf2-fd51-f401-d88e787078a4@linaro.org>
Content-Language: fr, en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <09fbe342-7bf2-fd51-f401-d88e787078a4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_045644_594867_137D21C3 
X-CRM114-Status: UNSURE (   6.37  )
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

On 27/03/2023 16:12, Neil Armstrong wrote:

> On 27/03/2023 14:09, Marc Gonzalez wrote:
> 
> I'll fixup the commit message while applying.

Neil,

I just noticed that patch 3/3 also has the wrong prefix
("perf/amlogic:" in the commit message).

I don't know if that matters?

Regards.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
