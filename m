Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC4AC38142
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 05:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1rQP26ZuVUQPotFNm7PC5Nc8Hf54sgF8jVj3D5L7gM=; b=v3p/QF5G9GWEow
	/SjxBvxxQCp7LGTkuBSxYlvhMHmRtURhTmurcm4hETFHY0WUesfezWePpfQDxQhgmp6Wvnyj9BGvM
	tkLZIsJgNY2Vs5EtyIwwgUOnvxm7UtcEUdEs+TZhKgYmkGHd5RhykyUjsh6pD848jP/03soSf7YNk
	/5O9EtyHOamusvkFhQYvQUJDljE/AcwO7vaGqqm3/AE6uf6QIMzzK4jEu9drvn+238sayq1YW7Dki
	ve2+KQ3aAavcwKWbULbgLzj+yyr1k+L4F+dX8qYPQrKAhn9n44E9FPnQ8j0V7WcoEEyo4JkNzoih4
	C1NBrKPYByVIhQtRh3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN65n-00AL4m-Pm; Wed, 01 Feb 2023 05:55:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN65l-00AL4N-DG; Wed, 01 Feb 2023 05:55:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ADD78B820DD;
	Wed,  1 Feb 2023 05:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75027C433EF;
	Wed,  1 Feb 2023 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675230930;
	bh=wma6HotgBo/yi05Re0C5F0WxjqM4CDoXrwTj+UVTXOE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tgs/POS4q7c/EHAs9J4RA7R6jbFlyHpK6Cp+oQ5yKWDHSALuleR82Ccfv7m8nHHCj
	 kni4V29ICoIOZDyWhnxdVvz9rx5xMkWuTtSrGRDa7U17828KE/YoEg4ElaZV4FJ9K0
	 fD11yjhMGbmqXJlsjGEcT8sGZ2CKu8P/pHEoS4+fO9EbsulNgKiHz+o/HqA5+km5DN
	 YhrhRIq3ju3OnEOQvVAmw37pb4UWK6fmc7L2TgFqsQPx0SnvncEA8V9VcShOqy9jPK
	 qI1Tk/ivQpVVf4JmXSbCjQWEdXwZRBO6/oD8NqRcz69niswum4PnyJI8Plyg+wJkWp
	 bM6+vh6Ygj9rA==
Date: Tue, 31 Jan 2023 21:55:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Russell King - ARM Linux
 <linux@armlinux.org.uk>, David Miller <davem@davemloft.net>, Paolo Abeni
 <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Chris Healy <cphealy@gmail.com>, Kevin
 Hao <haokexin@gmail.com>
Subject: Re: [PATCH net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
Message-ID: <20230131215528.7a791a54@kernel.org>
In-Reply-To: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
References: <23ecd290-56fb-699a-8722-f405b723b763@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_215533_621929_50CF928A 
X-CRM114-Status: UNSURE (   9.74  )
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

On Tue, 31 Jan 2023 22:03:21 +0100 Heiner Kallweit wrote:
> Jerome provided the information that also the GXL internal PHY doesn't
> support MMD register access and EEE. MMD reads return 0xffff, what
> results in e.g. completely wrong ethtool --show-eee output.
> Therefore use the MMD dummy stubs.
> 
> Note: The Fixes tag references the commit that added the MMD dummy
> access stubs.
> 
> Fixes: 5df7af85ecd8 ("net: phy: Add general dummy stubs for MMD register access")

Please make sure to CC the author. Adding Kevin Hao <haokexin@gmail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
