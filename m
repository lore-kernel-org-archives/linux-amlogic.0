Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56032C982C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 20:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClJ1Z3vGeHfdB3yy9ZnHDDqXq4MnjrLRARCNsy8E6KQ=; b=y5b0ZxR5QqXEkp
	JnUJxy1ezMPB7wInVPx3pm+YYBJsUBHcEek00swcZNnho7RbZao6VYWwnZbCYlk1AB0nolKcRZAHF
	ecT576OEsiOhR2YUCly2qXL9ES+9pP+PfM1yDQThs2mK1oBrza8tng5rF//wEkOw77is/29sHdpWo
	O986ZBkGqwwNSgGLPrD5HUn8qYPTTV+eABS78KeGnnMrMSIvcxwZl4oDwIU7YAuN4GPLa4RDH9Ye2
	aWgpwMlqv2/d/V8PRLxkYkyruupujQDi+KFq/vmzfPKuPCVyW6KWjmAjnr0PHyALL+G52YjCqlqol
	PZc7hpBn2hP/JHXfOQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wNN-0000000A5Ly-0hz3;
	Wed, 16 Sep 2026 20:37:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6wNL-0000000A5Lo-3Nr3;
	Wed, 16 Sep 2026 20:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22E8040951;
	Wed, 16 Sep 2026 20:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23B21F0089A;
	Wed, 16 Sep 2026 20:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789591023;
	bh=6Q+WxJ3NRja0iBPcIiZmImtHqJDLGM4eQtUUFwXaPYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uh5q2N24aFNHTWnB3epmA4lJx/1BpqXxOK7L4BmjoHwTjr7WZBrDuBJbcer01hS7d
	 fcM/NqYm6+/NvJjcYh1n7uKGG6InZ0Hh0O9mHIBH8b0ZfYQMY64iHK1rzezMZw9mrm
	 ApKQvd4tcoBWBbvvSJpg7xSdTXor2cYCPgsd2jYXwfhFsNZv9B7lrFQAkhsc2MdS2X
	 mrG4ReyXYbmKH4HQkNLS0WuU3QTC2ldbvUqwGv+XZlVqBCIZEYf+gzh0kQ8YrYsDSS
	 qc7cWFEDnQLb9VisRvMzpLvgb7scq20xovhWsQVBFT6AWbmB4vmljcUiYO+ZKcIRrq
	 0FOGWqpT6HbWA==
Date: Wed, 16 Sep 2026 15:37:01 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: mmc: amlogic,meson-gx-mmc: document
 the T7 pipeline clock
Message-ID: <20260916203701.GA1463751-robh@kernel.org>
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-2-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260905153234.133217-2-tanure@linux.com>
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

On Sat, Sep 05, 2026 at 04:32:31PM +0100, Lucas Tanure wrote:
> The SD/eMMC controllers of the T7 SoC are physically far from the
> NIC_MATRIX bus fabric, so the hardware design inserts a pipeline stage
> in the middle of the bus path to help timing closure. This stage is fed
> by its own gate clock and, when that clock is disabled, a controller
> that starts a DMA transfer can never complete it.
> 
> Allow a fourth clock entry, named "pipeline", and require it for the
> amlogic,t7-mmc compatible. The other controllers of this family keep
> the existing three clocks.

Did the SD controller not work without this clock? If it did, then this 
is an ABI break which is evident by the current warning in linux-next.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
