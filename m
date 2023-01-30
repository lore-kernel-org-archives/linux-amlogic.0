Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA59EC54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 22:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iw322DMqWtaIpGXZTh2YvFn9RiUdR9ETbJukJsNfwKQ=; b=roIFWM69GQQMq+
	9UmhYqNXbfh0eHV3XWCbk9Cu/nFvo8BWp+OPuG9VoZvlPJW/IrrGFSSqoe44O6KkTjgDQNdzCX9NR
	yLa66IMe1XpkqIdEjFzBiZj/7ew1q2JTXPa+UcKIHJ6d4a+zF0na0qlE7hZbwJp7RL58DPq/6bkyM
	kMPhABlnZSqUJF/7q1tjadxYvP3oD1THa0LI9IzViqdg2cFGjmLWw0Pzl4tBHYMPXlU2pWax3wSyt
	rgXg19fAEoE3xAD1IydXVQpC9S29NkKAV91h5T2IfKq8gYLZfe0U6lyZnpDJIA8J41OSGlRccw2WU
	ycJeS2en/kN/K7+5+oxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMcip-005exd-FP; Mon, 30 Jan 2023 22:33:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMcik-005exB-T9
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 22:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EfdNTnk9TBSamoP2JzjdKer/iDymiosZUNSEn3LqCa8=; b=qh//3/1vAmN8NouKaa4Q8N184l
	H+R38PyMF4uLYAk9+f7nwrG3aGF6WmfXDUt+Bo8o/QV6RuBrlPycA5fYEVzIBXtAOgiSvWwio7F3b
	3eQBEe40K7NqxzK98poOlqQ+3t2k6ReYeOAXskErbzUXVXK0gTi0DmUngp21BUqldaZE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pMcig-003d7F-DB; Mon, 30 Jan 2023 23:33:46 +0100
Date: Mon, 30 Jan 2023 23:33:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net-next 2/2] net: mdio: add amlogic gxl mdio mux
 support
Message-ID: <Y9hFyqANYqZee1JE@lunn.ch>
References: <20230130151616.375168-1-jbrunet@baylibre.com>
 <20230130151616.375168-3-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130151616.375168-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_143353_167672_3742E610 
X-CRM114-Status: UNSURE (   6.80  )
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

On Mon, Jan 30, 2023 at 04:16:16PM +0100, Jerome Brunet wrote:
> Add support for the mdio mux and internal phy glue of the GXL SoC
> family
> 
> Reported-by: Da Xue <da@lessconfused.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
