Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9E8ECAAD4
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Aug 2022 19:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4zAXwY2lGYl8xY/pS6FhIqOqSczFRZwjyFzIPS/CQvQ=; b=MrLLG6CoJGb3E5
	n9pj5CyKhZzj8g9HE8IYL1zbEef5TeRSWMcW83a2xC9WvchM8mMSGmzNBAQRSBjTD5i/FrdmBFgnp
	gEeTTf7GCCkbPiiea3OhExDgrQnnHtEeEZpKf0PWvLitKNyuw899uaJHjb800Ms8OO9CjIi57zTmx
	WTQKz+RtBlEnADDyTBKsfJe6/PqYdQIc5KEL7c5yCH/88gE2EFdXwZxFtbGR0V9ZJJm0EM3O5AGKw
	Fu+HZ8d5HXELMKRjNxXsRUU7qQ9ULYSFLT5kayDT9NUAgW9HLmbaXf+5R4F1uD1oUxidjhMAiVIO6
	dYzerGzzKfSPwOa4qSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTTH0-007q4f-8y; Wed, 31 Aug 2022 19:21:14 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTTGo-007q13-T1; Wed, 31 Aug 2022 19:21:04 +0000
Received: by mail-ej1-x632.google.com with SMTP id h5so18788915ejb.3;
        Wed, 31 Aug 2022 12:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=CU4jlNICWwxwIKN3U1yXNEjVJVgs1zGOKYSjXQNOblA=;
        b=cllwuJHTbcg7nm6DdJSo3WuInkP0YF2uNVEOIMf5nwb5rnsqWlf5sUAfYgzgwdvH4d
         gbD4zOwDw+nJgMOwmg1CDqOga0hNf6Sx21l20f0m7hjONQ7xwmZpHVoiWNI2MSRzVnl/
         QBEts6XmAoQGDsCdK+TH46kvuqRGZl4tM1FQ3qzyAoP53okDp+l54VQJaDQXvB1DibNe
         QcQphq0ddm08hlIg3AusnUCOQDJ6O1YS4K0haWBeHTluY9dQESbgY9A7DBhW0Y7S2DEF
         fGGr25TaSE+H3D2rbHRYeM2fk/iA4o3lzzWtNPdioNkBkQFXjkNhAh5SNnRP8yZakkr6
         vnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=CU4jlNICWwxwIKN3U1yXNEjVJVgs1zGOKYSjXQNOblA=;
        b=Jx7qGxUo83wjOyRei9yRAcBKGz5JHvQ9AXlDRYnmqD7nIX3FEQzX+3F0Y4qWlVrTw8
         G8+rgxMDsPXRnMuePepHuFk1przB3vrK0Bf3eHjPyXTD8gCc3x1YIx91KoQZq9SCJRkP
         PLW70YYuQMhlMPPe6F22Y2Nr3ldP99mDyWk2MqR3BeZGH7+TAgnTKm+72wEGbqpC65ec
         avIU/1IVzen1/Va/UskHUHxXG+793209PQj1iTs2tJaax8uoLCLuKxDQi7j5Ypo8ZNqp
         1glX7rUaiyCfutuyOFiENWR+bUjVQ4acB/GompPRDqgEW1Wdqmi9bq/p+1OY6j+5v0fd
         13ug==
X-Gm-Message-State: ACgBeo1T+jcoaBXWsFuXO6iTPZbwAe3UZ8LSyy3p8j04GVCSWaXrowmV
	P1b2FBxBG/Mld9l0CeUxmzHGlOv2Kq0=
X-Google-Smtp-Source: AA6agR6pvm7M80kDKWhWFKW0DJgcXtlN/NsT9e6TdEGJ0gkZXK7GHSs6sEJ4GC1gJIxU6vZBEvlRHA==
X-Received: by 2002:a17:907:2cd4:b0:73c:9fa8:3ddc with SMTP id hg20-20020a1709072cd400b0073c9fa83ddcmr12394193ejc.40.1661973659892;
        Wed, 31 Aug 2022 12:20:59 -0700 (PDT)
Received: from ?IPV6:2a01:c22:774a:2d00:80dd:ea1f:ff9f:1e2d? (dynamic-2a01-0c22-774a-2d00-80dd-ea1f-ff9f-1e2d.c22.pool.telefonica.de. [2a01:c22:774a:2d00:80dd:ea1f:ff9f:1e2d])
        by smtp.googlemail.com with ESMTPSA id s22-20020a50ab16000000b00445e1489313sm20071edc.94.2022.08.31.12.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 12:20:58 -0700 (PDT)
Message-ID: <8deeeddc-6b71-129b-1918-495a12dc11e3@gmail.com>
Date: Wed, 31 Aug 2022 21:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
Subject: [PATCH net] Revert "net: phy: meson-gxl: improve link-up behavior"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_122102_996269_03E8873D 
X-CRM114-Status: GOOD (  10.42  )
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

This reverts commit 2c87c6f9fbddc5b84d67b2fa3f432fcac6d99d93.
Meanwhile it turned out that the following commit is the proper
workaround for the issue that 2c87c6f9fbdd tries to address.
a3a57bf07de2 ("net: stmmac: work around sporadic tx issue on link-up")
It's nor clear why the to be reverted commit helped for one user,
for others it didn't make a difference.

Fixes: 2c87c6f9fbdd ("net: phy: meson-gxl: improve link-up behavior")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/meson-gxl.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 73f7962a37d3..c49062ad72c6 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -243,13 +243,7 @@ static irqreturn_t meson_gxl_handle_interrupt(struct phy_device *phydev)
 	    irq_status == INTSRC_ENERGY_DETECT)
 		return IRQ_HANDLED;
 
-	/* Give PHY some time before MAC starts sending data. This works
-	 * around an issue where network doesn't come up properly.
-	 */
-	if (!(irq_status & INTSRC_LINK_DOWN))
-		phy_queue_state_machine(phydev, msecs_to_jiffies(100));
-	else
-		phy_trigger_machine(phydev);
+	phy_trigger_machine(phydev);
 
 	return IRQ_HANDLED;
 }
-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
