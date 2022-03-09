Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6364C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fmuSRL7pWXUAzFzFVZkEj6NKinbcdbVnE0zIVtnhz0A=; b=KThC1L2Qz0fuqE
	YTqpWURT/yvwS9tuRQbLSJQ6bVH3Ey+ofxnVQ1RXMeLZGxcra6OCT3xaTTqAQTGs7qazYCci6kUcb
	06qwlXHbyjnYsV5EioealrwpHeh295KLU3u1G+P1+lsEspjIVD6IiSIvhuqf2+BM9CaTJTlkFIKqx
	DUyOVK8iFep8+OftqiEZQnc1DRf78AnYokMQ3Iot5qZUctjJLcx4uhPty4K3GHnH+PtNNDHKrB5Un
	qvV80RdCLFJ1pdPi3SJtUUu1ZDB3+7wq3wHkVqS3ACt8Cb1DqjuPwPuQjR5hicdxkaNwNMSxX97No
	syMat6CAjaxSikaAifjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nS3UU-00AUrX-5M; Wed, 09 Mar 2022 21:05:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nS3UR-00AUqK-9o; Wed, 09 Mar 2022 21:05:00 +0000
Received: by mail-ed1-x52c.google.com with SMTP id b15so366831edn.4;
 Wed, 09 Mar 2022 13:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=WF5uaCx5pmP5JX00+D6eM3lqNw9uHLykZUlLYCW0P94=;
 b=pBssSHtqJ3GHfnXCagspkMeb1FLvSrigdCSjwEUL/I6u0bWka05gHXuYYNxMI9rphQ
 7PPvmnlrS7MTUHgpp60ha8HMFxGloV4Mf6eMQW/226fX3BI++EJibG1egtYlCYKkF8fm
 9ExlgOtqchacYMVfei10qogWH6kyVNHMzKH+1kxsja3W96S0YW3vDDyWDXw+V0iciHgh
 BD4aATLWrKxjZK7nzoMTmw5CWLxjSeeo6Ia/nVR+AZe9TBh7b/5/TkAvcHl/PGaFKarL
 l3oRsoFCKhfsoWzfAHy21C6DJ1zOrl1FLUqDv+QNKZk9gwVXd7iXxVDdyGX2K+tHPp99
 yO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=WF5uaCx5pmP5JX00+D6eM3lqNw9uHLykZUlLYCW0P94=;
 b=u4q0H7Cm5LAwVQt3/UicpSw788tCtJu4BmH9ssexGgNKf80FfNKp09tJ5aEd4kC5zC
 xshuD9vVZv2B1DvbHzH0GbdFBln/RlJ7L+GGDpCdn56vHEdydGPsLn2IsUDktjeOHkRf
 RV33Ci54weeWIunkjOLwKAzySVYWIZyj+xQb+sAkvGqRqZMnSrXDUyFEbcWZoxK5glPp
 G3Ays6sbWvpvOHjJFgbqBS0rNKLx3ROlUOn7ro8/UUG61AW85OlIu0J0QpX07K92tgxA
 1fE1DrtXR6yAPjL/8wlgCGHfIMp66npDR5VRvIVfftHqEQ3LpMFr6yUeoLFFXu0BnGs4
 6pew==
X-Gm-Message-State: AOAM530626ki0YCL+q+qU6cCQ8TH6gqatUQ4XPogYybIreVo182LBCNp
 kV3vSM/lq/68BaQX3hwWJ7g=
X-Google-Smtp-Source: ABdhPJyp5mxviqtMbA4kMNRShBPCiGJmb4vHPX46WP1NIXbPD3e4/lbbcT3rIHTP/GFzv39ZS0UPYw==
X-Received: by 2002:a50:d592:0:b0:415:e599:4166 with SMTP id
 v18-20020a50d592000000b00415e5994166mr1291406edi.195.1646859897467; 
 Wed, 09 Mar 2022 13:04:57 -0800 (PST)
Received: from ?IPV6:2a01:c22:7793:600:9d6a:7788:3389:da6c?
 (dynamic-2a01-0c22-7793-0600-9d6a-7788-3389-da6c.c22.pool.telefonica.de.
 [2a01:c22:7793:600:9d6a:7788:3389:da6c])
 by smtp.googlemail.com with ESMTPSA id
 x18-20020a05640226d200b00416a502c147sm606601edd.10.2022.03.09.13.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 13:04:54 -0800 (PST)
Message-ID: <e3473452-a1f9-efcf-5fdd-02b6f44c3fcd@gmail.com>
Date: Wed, 9 Mar 2022 22:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net] net: phy: meson-gxl: improve link-up behavior
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_130459_389965_331AB57F 
X-CRM114-Status: GOOD (  11.67  )
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

Sometimes the link comes up but no data flows. This patch fixes
this behavior. It's not clear what's the root cause of the issue.

According to the tests one other link-up issue remains.
In very rare cases the link isn't even reported as up.

Fixes: 84c8f773d2dc ("net: phy: meson-gxl: remove the use of .ack_callback()")
Tested-by: Erico Nunes <nunes.erico@gmail.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/meson-gxl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index c49062ad7..73f7962a3 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -243,7 +243,13 @@ static irqreturn_t meson_gxl_handle_interrupt(struct phy_device *phydev)
 	    irq_status == INTSRC_ENERGY_DETECT)
 		return IRQ_HANDLED;
 
-	phy_trigger_machine(phydev);
+	/* Give PHY some time before MAC starts sending data. This works
+	 * around an issue where network doesn't come up properly.
+	 */
+	if (!(irq_status & INTSRC_LINK_DOWN))
+		phy_queue_state_machine(phydev, msecs_to_jiffies(100));
+	else
+		phy_trigger_machine(phydev);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
