Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB376C05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 22:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRpZrkQItj0pm22SB6VLmIvIhx9ZuLUw1gPs4IZL6mI=; b=K/ife6Jey9+3Qf
	xhZfe8iDA9fXd7/BWiWQbCfT2aHrn8OMnZTilyaBTLC6jHW4oX3En+jmYIF1GFchXPHfMT571P/pF
	98Z4wuTfxjrG1b30UA1u/C+8MNyliUBCmA4Jr99hE+Pxe4OPJ3gDgmDxuGSxYmy34s3YLqEeG7K6H
	9rmZ7ikcjOj/01douffkcG3zFxE+nS4fgDDPGfWGCxV+qPtxJqNcEpC6TSv2iDi4VlFVA44LLrOHr
	MCQUBYIJqKuR2m/bEmid/rNz9n2BU0RbjrKnGD3hlCXd5vpuhlSxuCDgaasTc3qU6OZ+1TSFEt2gM
	rpbdlDgZgKr7mm0SS4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQFDE-003MoO-Qm; Thu, 09 Feb 2023 22:16:16 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQFDB-003MnH-EP; Thu, 09 Feb 2023 22:16:15 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E4573C0002;
	Thu,  9 Feb 2023 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675980966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bmZ4qf0v+zRa7IzL4TRXLKC0lXMWWU+YZ+LDVP36KDo=;
	b=jbbbFqEiPGmPtO5FjY7NDjmFt3FNtYNKcRzLVLYYODpfqBVkMFBDaQpFaHzXeUXeCMzUqf
	sMpOtBknLmznygM46/uAMIAhl0jzp1VyYMXNMfvS4ypvxzEC6Z+OSx8/J7034+ugjuRpiq
	JKgDzu/EYS24nvBg8YFzpSjkmxcHJWo4ldXAK28CpGR6KPo/C4Q4FiDyyGfKcA+L+pQk0i
	mYhSSkTR+MrGo5K3kLN6SBn7tesCTfze/vk2zP/nqd8I7wTO15CkaFZLIi9BL62pF9WUeP
	syMLynVuAHrTRSlPDcYHb15BXxf6wdErclpY6vwRUX91pPAGuChH19e/WyWBEA==
Date: Thu, 9 Feb 2023 23:16:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-rtc@vger.kernel.org
Subject: Re: (subset) [PATCH v2] dt-bindings: rtc: Convert Amlogic Meson vrtc
 controller binding
Message-ID: <167598092747.1653817.3621933849168848178.b4-ty@bootlin.com>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d820d54b-d082-589a-621f-2795d885696a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_141613_670902_D1696332 
X-CRM114-Status: UNSURE (   6.00  )
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


On Wed, 25 Jan 2023 23:24:24 +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson vrtc controller binding to yaml.
> 
> 

Applied, thanks!

[1/1] dt-bindings: rtc: Convert Amlogic Meson vrtc controller binding
      commit: 6a22a5dbc69473c2c46d1a13fe6cbc7bdaacb2a6

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
