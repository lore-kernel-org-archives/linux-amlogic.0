Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AD5C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFB3613D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 22:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BFB3613D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJJDHIbkw3kV7dNLgVfjekl7iXy2q4W4I1aRJ2zuHRo=; b=JlRvSHdaz6iOis
	8cqxjGkVNXbTi4VRdB8EmRaQD0cGXfm70B8TaL5R0eGX300Kczdjy6kd916k4MI0Z3ruwUFr1huWF
	+jxCO3QlKgHp5aEHDY787Yc2Qbj6tDxm6cuRDSRkXLHxRuqUXLoP0/1IsuPHw/ifKjpNSwyfi5K+j
	Uvb3MHDEO/39Lw4LP1i33FZeck5IaHPgjhga4D7P4imkq79ZzALFL4hMR28AdCUGhxh2L2J7JO3KR
	XbZDQVra1hPQX4iioFaI2yg6iMwZ/ZgrR0vMieJMaiXSBmZSQoro9ce0wDSqHJZC4CbbMzp/Yp4am
	vGeKeMSggUZR45wcLD/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu0dc-00C14b-Mb; Thu, 17 Jun 2021 22:37:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu0dO-00C122-JB; Thu, 17 Jun 2021 22:37:15 +0000
Received: by mail-ed1-x531.google.com with SMTP id n20so5914701edv.8;
 Thu, 17 Jun 2021 15:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUciLQPe2Dk0W8P+MRSTjK4kMOaVU6u+TFpGcIEqZkg=;
 b=go05/on96W3tqe+r5HAAC/EouJUuzocIqNZcxoyePCdqdf1ZyIv5X0OUulBSw0vFZa
 eBB8nourSCgCsbxJd2wzMqaSLUgIRzkvaQ+2jr17NDmhJ07lCqDGcvBD7EJgnZrlHi4J
 HAk2KFnY3OvRz2WHPJyEmEpmnCqJ9mntAbLGKGZI7wkw60NgJmZDB6ulfCTijFuaqZLM
 RgVWqIWPEPVSPn7wEyuAmaVaxomq9Rw7qVF5ZK/zX1OiKq9zboVk4jZjOjQ+cp3uI8TT
 xyfuXJq0VXzpXXoOLCyzc8cjgeodHCsdfRXTMLmuhFf9SQKUFnHywo8IYtKhSFDN6E2J
 jbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUciLQPe2Dk0W8P+MRSTjK4kMOaVU6u+TFpGcIEqZkg=;
 b=aQ9Verat3s+opExp+/7KxnnVGuCWayNu5IpgU/K+IhTxVZDZUd2YQJ4E5m9F5TTbvJ
 K7IWN9HX/oTrDrnOHuIlodeKv33Fl6MuFARZhxFzmT+woMqBbpMT2BxrjbFVnAF0aZ1/
 cmSGdOV4UaiZkX8GTq0/GvQ+dAyyYNQyPhQ9TL658iv584NKCMno1WiK1FssTaxlcy2Q
 DXZJAlXJsTeGuFof6FJyNOrbIQ9zWPMRU9Para6H0fYTUv2ueC5zBNoNkhBdEWzJd75A
 d2q69Wfk5gLPnxxv6kGQvPRpWEWGqRPBCvAz9Lj4DJnU4JQAA7cOIPiIe9/gCZMGXhuj
 rPdA==
X-Gm-Message-State: AOAM5332/dGlUC4OCKNaBMPn+PVZmCjboyF+fir70Zy5sVbgil1R4Bmc
 jc0+TGl6oafilYOpKlZ3mPAnCLopYz1hVdhsXI+gelFFpYI=
X-Google-Smtp-Source: ABdhPJyKnkbQdRPfTK0z4c4f22bYrhYhEWRgvpOoInIGpp2TniF7iZEMWL7FXEb8W9zWpi1CYWtdISGt0cg93nBmuaE=
X-Received: by 2002:aa7:de1a:: with SMTP id h26mr830256edv.176.1623969433156; 
 Thu, 17 Jun 2021 15:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-8-linux.amoon@gmail.com>
In-Reply-To: <20210617194154.2397-8-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 00:37:02 +0200
Message-ID: <CAFBinCC0KScn6cJ36ZB_=TRncOOCXJHWwR3s=o3TobH=yOrGJA@mail.gmail.com>
Subject: Re: [RFCv1 7/8] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode.
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_153714_696314_DBEE90BF 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Anand,

On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> @@ -245,8 +250,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>         regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
>                            0x5 << REG_CTRL_FSEL_SHIFT);
>         /* reset the PHY */
> -       regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
> -                          REG_CTRL_POWER_ON_RESET);
The vendor driver uses the following sequence for the power on reset:
- set the power on reset bit
- wait 500us
- clear the power on reset bit
- wait 500us

With your change we now:
- wait 500us
- clear the power on reset bit
- wait 500us

I don't know if this is sufficient to bring the PHY into a well-defined state.
Maybe it works, maybe it doesn't reset at all in this case - I don't
know how to verify this though.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
