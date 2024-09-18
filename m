Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D1ACDD548
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Sep 2024 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BpRNQG9s6+epUM9oF35ckOB8fWpg9FEOlNnIM0iM1A=; b=2LZMLVGTFSmv+d
	wA2J05tlOJrNEq9DDuWuCuVt0E20w8Ar7qv4rtr9K+CpMMZuA9Vldvu7uxa5p4AOEQAJ5yYhq4XMr
	eUws5tftmLxwzmSHezxrj1L15Jo8WxqIACu1zmsDkWMgnigmKpbxwN/8MkRkcRr7bBxYYkcLQpX7p
	5qbF5GaVMK/edxL+qqhWRcm7lR6vFWFvPqj2722MuPzXjNef4LE4eldXQPX7Q4iJ3jaZMJwsXC3PS
	6gZY4QwqmknqssY6qON1uHPTrdkJB9dBkwBSY8h5+g9DrWld2gMptfuASUAFReBhJ0D4SvrBSd7Ux
	5wEeeua/GzgOrn1ItSTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxC8-00000008ai8-3j2A;
	Wed, 18 Sep 2024 16:06:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqxC5-00000008ahU-1QQI;
	Wed, 18 Sep 2024 16:06:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D59C5C5785;
	Wed, 18 Sep 2024 16:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542CDC4CEC3;
	Wed, 18 Sep 2024 16:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726675576;
	bh=k/cNz1MX33DavMoavpeGHsyNZuYMlTT3z7+1FXoHZ8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnUuMzlVKSIK5Pf9pMjUoKc6GzYcAKW4FCOZZ9H8Zz+JR8phNR9iUq3xa930sSBSv
	 wQMuI0q1nu3E+kRI4CEmRpOg34HLXIMMB0r7f5222TtcqmaYY9uYi3/xH6+0g/hE1j
	 a1AwN3CXT2NSv6g7/ySkqOhAfXyXdML4uhTDRrYV/yRLQEuNLXvBlr71ukebOoh8Sk
	 vHn5/NqNHHOX3WdOA2YkZotkwQ49YLczautW1caQw67uRZPOYjulZHhC4RTvm0HE96
	 wH6ZQLqQyH74yR59y1bGirlZ/U/edMEHehweinp2FZAI+9KkUrMH1paGmkWhbf6hmv
	 yF0yRJEg5qzGQ==
Date: Wed, 18 Sep 2024 11:06:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: clock: add Amlogic A5 PLL clock
 controller
Message-ID: <172667557462.1691676.860545750561739288.robh@kernel.org>
References: <20240914-a5-clk-v1-0-5ee2c4f1b08c@amlogic.com>
 <20240914-a5-clk-v1-1-5ee2c4f1b08c@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914-a5-clk-v1-1-5ee2c4f1b08c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_090617_445583_E82C95A1 
X-CRM114-Status: UNSURE (   8.78  )
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


On Sat, 14 Sep 2024 13:25:23 +0800, Xianwei Zhao wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the PLL clock controller dt-bindings for Amlogic A5 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a5-pll-clkc.yaml        | 62 ++++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a5-pll-clkc.h    | 24 +++++++++
>  2 files changed, 86 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
