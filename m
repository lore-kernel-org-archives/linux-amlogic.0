Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64618C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Mar 2022 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwIPtL3LTfms7P+ThdZ5T/Mm1XrAM3wobB+pCfoPxGA=; b=jn2iZNpCOPV8pU
	l1Kruj8vcgnH9OLCePI3w9RbgLMUQrv5Hg2cO3TDwmtPLbbHWlA9geRqxPNR722+XJh87CWxg4HLx
	tkIdHnW/Va6T6S8e2mdSMDCUulB+2nIEZvngWJZYa1GqTuuJaZUWUOTuSj75DDxjUWOCm86m0A6Xl
	+TqIbVhCnn/4Hh5C+TcAmG/X7+DqDnI/cWJjnoJwWwTdnsKGaPYa2sVXjc9yD7UTax0ip+vFD8+Lf
	8PEofvlcpncKzDNJMwgNSX7rTXRr0GyhCr3l/azGM5JwyhWIDnPNdugkcAiNE93i9/nWefEKUsaeh
	D4dfn7KtBTmw4kANSiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPMkG-002Mxp-Fu; Wed, 02 Mar 2022 11:02:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPMkD-002MwA-Cl; Wed, 02 Mar 2022 11:02:10 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so991744wms.4; 
 Wed, 02 Mar 2022 03:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=GK7LbsrLfu8NDtuAdj7VpigfGpU3e9sLo3rD9+yMAKg=;
 b=k+AVIXRPpET3eqsYjZTwW5Hwi8ly90xiacCytwW/sdH99Q1pv3OatYQSywJH8WbFOj
 rFFjCbaOE2/hJqKlseNMYm1JulAXxF6MYvEwodYD5qHvtYnNMpY05PprP8W60o+aBEN9
 8AO3xJzHmmRmibt2BqeLaWZuzbvIf3HmCn0FgBezOgYX5prJqN5DSl9on4YoLMldlva0
 eaSdsnt+MeY72NL12QwB9wprx2uMMSloXb7bUvKEOZVw+MG4Vl8Td8rBIdJ1HHHihoF4
 gmxZhzx3yfqvC0GTHNJ30ptgpANFKm33mN6AofqaU2EXXMKwGIcb81+urCz5PfKMLvqM
 giBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=GK7LbsrLfu8NDtuAdj7VpigfGpU3e9sLo3rD9+yMAKg=;
 b=YQJki3li56eHpJB7NE9FMFxc5iW4pqSPOw6CI4rv3eKXxSPqWfa5WbcAaMQtEJR1aK
 BxTMquYdQqKG0jC3vzPFsEtoPyUlupr94fahQJG1jX7NK4OSNKcqMj+qZ999+om4zALz
 20U3ZGbyRPMxkQY2mMCz5mDRiWFvvkuC1NBprTQStGGx37TMoiOWCI7v2abYNEz2ijVY
 enmVseBWKS9h5P8GKh4894Ip+fjJfSKo8OxRc+vsmbw2YmNVXAyrhxi/dAyu/pHGMw17
 09kAWsi/4IDs7kh7t7e0yfUTq35cVmzjSzEeXX7QRhjeuXy+d6LPhlFBhd9CpFIUtA2w
 M4Bw==
X-Gm-Message-State: AOAM532EOGOww8qzf4tSRSZLhwE5mJQA54r4Tkb6uMKwOlTfzQLz65nO
 IwuLxw+t/s4YDOBRSQBZwYE=
X-Google-Smtp-Source: ABdhPJysMuAwmk3s78nTsltDe2Isbs1ISpf2VRTVkR3jz46c8siZbMwco13uuyKzYlxiEe3ux7gl+g==
X-Received: by 2002:a05:600c:3c8b:b0:37f:1546:40c9 with SMTP id
 bg11-20020a05600c3c8b00b0037f154640c9mr20703326wmb.161.1646218925888; 
 Wed, 02 Mar 2022 03:02:05 -0800 (PST)
Received: from ?IPV6:2a01:c22:7331:8a00:3d70:3e0f:83b8:3269?
 (dynamic-2a01-0c22-7331-8a00-3d70-3e0f-83b8-3269.c22.pool.telefonica.de.
 [2a01:c22:7331:8a00:3d70:3e0f:83b8:3269])
 by smtp.googlemail.com with ESMTPSA id
 g17-20020a5d4891000000b001e74e998bf9sm16392585wrq.33.2022.03.02.03.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 03:02:05 -0800 (PST)
Message-ID: <1e828df4-7c5d-01af-cc49-3ef9de2cf6de@gmail.com>
Date: Wed, 2 Mar 2022 12:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Erico Nunes <nunes.erico@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 netdev@vger.kernel.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-sunxi@lists.linux.dev
References: <CAK4VdL3-BEBzgVXTMejrAmDjOorvoGDBZ14UFrDrKxVEMD2Zjg@mail.gmail.com>
 <1jczjzt05k.fsf@starbuckisacylon.baylibre.com>
 <CAK4VdL2=1ibpzMRJ97m02AiGD7_sN++F3SCKn6MyKRZX_nhm=g@mail.gmail.com>
 <6b04d864-7642-3f0a-aac0-a3db84e541af@gmail.com>
 <CAK4VdL0gpz_55aYo6pt+8h14FHxaBmo5kNookzua9+0w+E4JcA@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: net: stmmac: dwmac-meson8b: interface sometimes does not come up
 at boot
In-Reply-To: <CAK4VdL0gpz_55aYo6pt+8h14FHxaBmo5kNookzua9+0w+E4JcA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_030209_480738_BCC3B0D1 
X-CRM114-Status: GOOD (  27.08  )
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

On 02.03.2022 11:33, Erico Nunes wrote:
> On Sat, Feb 26, 2022 at 2:53 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Just to rule out that the PHY may be involved:
>> - Does the issue occur with internal and/or external PHY?
> 
> My target boards have the internal phy only. It is not possible for me
> at the moment to test it with an external phy.
> 
>> - Issue still occurs in PHY polling mode? (disable PHY interrupt in dts)
> 
> Thanks for suggesting this. I did tests with this and it seems to be a
> workaround.
> With phy interrupt on recent kernels (around v5.17-rc3) I'm able to
> reproduce the issue relatively easily over a batch of a hundred jobs.
> With my tests with the phy in polling mode, I have not been able to
> reproduce so far, even with several hundred jobs.
> 
It's my understanding that in the problem case the "aneg complete"
interrupt fires, but no data flows.
This might indicate a timing issue. According to the meson PHY driver
(I don't have the datasheet) the PHY doesn't have a "link up" interrupt
source, just the mentioned "aneg complete".

Below I send an experimental patch that delays the link up processing
a little and eliminates not needed interrupt sources.
Could you please test it with PHY interrupts enabled?


By the way, to all:
I found that interrupt mode is broken in fixed (aneg disabled) mode,
because link-up isn't signaled. Experiments showed that irq source
bit 7 can be used to fix this, but this bit isn't documented in the
driver.

> For completeness I also tested 46f69ded988d (from my initial analysis)
> and setting the phy to polling mode there does not make a difference,
> issue still reproduces. So it may have been a different bug. Though I
> guess at this point we can disregard that and focus on the current
> kernel.
> 
> I tried adding a few debugs and delays to the interrupt code path in
> drivers/net/phy/meson-gxl.c but nothing gave me useful info so far.
> 
> Do you have more advice on how to proceed from here?
> 
> Thanks
> 
> Erico

Heiner


diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 7e7904fee..0acb3a99a 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -7,6 +7,7 @@
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
 #include <linux/kernel.h>
+#include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/mii.h>
 #include <linux/ethtool.h>
@@ -209,12 +210,7 @@ static int meson_gxl_config_intr(struct phy_device *phydev)
 		if (ret)
 			return ret;
 
-		val = INTSRC_ANEG_PR
-			| INTSRC_PARALLEL_FAULT
-			| INTSRC_ANEG_LP_ACK
-			| INTSRC_LINK_DOWN
-			| INTSRC_REMOTE_FAULT
-			| INTSRC_ANEG_COMPLETE;
+		val = INTSRC_LINK_DOWN | INTSRC_ANEG_COMPLETE;
 		ret = phy_write(phydev, INTSRC_MASK, val);
 	} else {
 		val = 0;
@@ -240,6 +236,9 @@ static irqreturn_t meson_gxl_handle_interrupt(struct phy_device *phydev)
 	if (irq_status == 0)
 		return IRQ_NONE;
 
+	if (irq_status & INTSRC_ANEG_COMPLETE)
+		msleep(100);
+
 	phy_trigger_machine(phydev);
 
 	return IRQ_HANDLED;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
