Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A905BECAAD3
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Sep 2022 15:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ecg7uWtH6nn9DxeDeB6rMCEZX1nA3dlTk8WbF9j1mN8=; b=2UQKbm2iwcyb1V
	D3ZVBL8DeClZQ55fE8r/rHSG06CjiKCXAxC6/OGsbu59UxBBPV9EIHPNnoFFvzjlGSoNYsW+qO2P0
	Z1A1xZLNMkUfxmLF0umXnOTfk0DuKFKhfqOqmzWCkd3levNhzk6H7xOy676YSPzFIwFydjTBdMwgm
	A65Lu3PrCFI1dkYvYSVpbcVYbt/n6sGf7QcYWqKMIREgwwu9gfu5gA/zfkYqx/CSq0eldgdb/7Lod
	HVUaZm6x/OHN7XIo6LlEQw0Uw09SaK0WTXlenNfYnZS2BjRRquVJlmO7Bq0uk2BnEkKQ/UjxC0mtL
	a0OS5bNUjvGr7YusTulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUrQD-007UOH-Nr; Sun, 04 Sep 2022 15:20:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUrQA-007ULv-Op; Sun, 04 Sep 2022 15:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 28CCCB80D70;
	Sun,  4 Sep 2022 15:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F88C433C1;
	Sun,  4 Sep 2022 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662304823;
	bh=G+i/iVKAXDV0RznojLdHtlVVgUfqjawkT0JYw4KaCxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRPy4GBW8sXYwcBkxW31BX78heA9sN4eGZwK1wbu9Wqa3HLDgy/qXK8Kiswn6VU7k
	 YUU/G2fgMHc7nMKh7jFSAiB1AVgu+lrccAnTvWb1DWIWMibnlAApla+7wf2Ve0PaQj
	 npjyv65jjbKshys89ZS5xf8PJFi7+sNfigImING5LBz3AAK3mrYPO0XbOoHWGkTDyy
	 F0HLQ1/FwVjsrF817QSnH31TQ59pAb3MqUl/5KWnoGN6zkGyAH23UM5QPNgou9gNbW
	 hQjl4XziRjTZrqhU0C9av+7czlII9vrGs6beRqASfwJbbJavwdPQZxLMt/6MAaxhT5
	 lqkzaTIcu4iPw==
Date: Sun, 4 Sep 2022 20:50:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] phy: amlogic: use devm_clk_get_enabled() to simplify the
 code
Message-ID: <YxTCM2aNRbKTtUJz@matsya>
References: <9308a2a3-e828-bd9d-ab83-a68376aab5c3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9308a2a3-e828-bd9d-ab83-a68376aab5c3@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_082026_974740_6E187138 
X-CRM114-Status: UNSURE (   6.03  )
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

On 30-08-22, 19:16, Heiner Kallweit wrote:
> Simplify the code by using devm_clk_get_enabled().

Applied, thanks

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
