Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93766C88E4C
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omuhg3uBUFgFufRN1LdG2lwur0f/oX5D67B5pkkHHAU=; b=QeyBKI4TK4xqvF
	4heyJ0qmnNdDkQt6e0UKYYwAftALwe7X/RbJ9yDfP6REcBvEqIIo89dLXgY+bwjtQA3u6/yKg+fbH
	UHtNrA6qMjOCnlouGY+9FZeW/MuW8zLDJNUkMZKf9SvgBy7ihRHO4dVZ87wG1F2tS9f4hAMLuQQgV
	y47Hzel/jFkWRnVdHqj4cwQ0mJ53b+gFjKTUNDQ8nlP7Q8gp4RGJnL0hGMUe/5+teYq8ugCiM7i5Z
	q40I2RKrSJOvUx0GGCtUKyUk5+iuEIn1nqny57cBWPG/zjslDd6C+tXLWVr7HrwaTuilUUH+qktHt
	13LGiGjj8Hg0UZ86H6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zK1-0000000GU5F-2A17;
	Fri, 11 Sep 2026 11:21:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zJz-0000000GU4R-1AFU
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 11:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CFA54450D;
	Fri, 11 Sep 2026 11:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F0D1F00899;
	Fri, 11 Sep 2026 11:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125688;
	bh=4pe+LR7D9aXkKO93/gzkVICF9QA1eqK2Dqa7ejkk/S8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mKfIYhb05XlOxrEiAbcxFKTLlqo3aZYp0P8h9hUpTaN06tExLZU7hkke71gyvBcd/
	 loQb6A1izRDhZpTzaPmuUXidLx/iU6Jhen4qTsV228Sj8k5f/8dSn2GkBHnFZgopIU
	 P+QS2IdBFQfzKnsyqis5zmMc6jZx1/BuSBLo0V6P9Gl2MtP7yugakDcjB1VAhtned7
	 SY73V3ApHx8RpoA7uCL6/Wwp+5SY7XIFYsjjJSJZCQ87rBIqbLw0wdHpzuyBKIVtvT
	 /w6QiZ99hkkAscckXB/KGy9vlJxlofMu9wWicRBzdhQbMRa15AwVgC1rZ4B/08s2WL
	 zIsisl1RySu9Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Subject: Re: [PATCH 6.12.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Fri, 11 Sep 2026 07:20:49 -0400
Message-ID: <daily-reply-0030-re-clk-meson-gxbb-6-12@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910072139.313775-1-jbrunet@baylibre.com>
References: <20260910072139.313775-1-jbrunet@baylibre.com>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

> The following out-of-bounds read has been observed by Christian on a
> GXBB WeTek Hub:

Queued for 6.12, thanks.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
