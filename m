Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F92C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Dec 2021 20:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzFsXmxLve7HhCWsLFjDLdoBCczpmcQATPZXAtVDUkM=; b=iki2CppsMTfXC7
	VlG5btD2BbzVNHIXR6Z4W0gy76sL09YLaxNxtpyjfIxNvx2oQrjEEFJJM006RkXQDL8nGefiwRUR5
	4j1oOlS7MXLWYwVj5lQ21o+lTyA6+DBG+DYPLjt9WQSoGfNHQAQDGqPcDMuch8CWja5R++aTUwG7V
	RWOZYfNGaY/lHmHlmNHOIsMl0P5hAgzX7+vlYexYKBjVxsX0FiV+kvQGcSDHDJ9lcqQs6+7vqKggP
	+gssk3xw5W3qzsNikXVbqTkoyRmotnITNCCyi/qAHaDyEn9B+XnbCZKnOok53gxs8/vBeVfsvGswV
	jkf8VIPZw2cGhXkbNvsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwViA-007ECG-2e; Sun, 12 Dec 2021 20:44:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwVi7-007EBb-Je
 for linux-amlogic@lists.infradead.org; Sun, 12 Dec 2021 20:44:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id g14so45248859edb.8
 for <linux-amlogic@lists.infradead.org>; Sun, 12 Dec 2021 12:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M+jU9TwvZz6ds629SS50NuvlyPyvUin2EKXsAKDkl/o=;
 b=Pr2ikDq7xsSvxFAivbHPkZIV8HPbXwdpCqXi2zI+6xayw3kbod0NYGr8i0ux558xSz
 5rLgXDOKiw3VYqkP14SIe5VJBZB0dlfAkCkFIytjzQootQnJSnrqvvssc2yO0z8dpp9Q
 krGJYoPXhz6svZylYG0XN171BcetGyW6Wa9PBmF7bUhFOPE3erVAZHnhiLxtZSt6pI1t
 3KySp9F6XX6bbVB4FLRBZKp4K08BvS+Zr7mTF837VT646cnuL7ForINYG8G4InT2UlBA
 f70GJLvJGwsql0agMOgcb5yvcwJx45IhR7uxdHOFYB100K3auJoHFhLvpeMhL+a9M3Se
 K41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M+jU9TwvZz6ds629SS50NuvlyPyvUin2EKXsAKDkl/o=;
 b=3sJqbUd+NmLS3WTkFdgBf3flVKbv3cgHZIvhdGyjGRsHVqIf2R4pG7OAW3vRCwTjUd
 p7P4je2a3/9kBZugbbcvQnuUNhMiAwZec1DXNBHFag5hSa++dSk8cJ6wRP7AAqW5uM/o
 QNDvhPbmZmMvELz3erWmMr45F5lNcih9ITYZW7Jo+1h3KezzLpJN4SNtl31L/eWM9DQE
 /mROVQHqT8r1ECde1nkv5qzDL5Z5p43Gj4ClxjUq8REvUYUUSSf3RwTzq5+7NLm8cacb
 7K165AN2v0I1Lo9Ow3WuknmcyygqOunSq5CLXCaGSLXjeodPrJ3lIDucOygZF1fX5NcD
 qNZg==
X-Gm-Message-State: AOAM532Aj+agSvUnAd90bqPsyAqHDcfq5Ck8kT84Jht/GniuXTN+UBdU
 os3XYJBtYmhXQmo9Qx14jWEjP6wjCvU0yl+IEWM=
X-Google-Smtp-Source: ABdhPJxkmlWd+BZwRjj9CSpXloG+l68GfRzkIvb5IJeOu55RSbLqR0+VCFVVVWUBho//vQZicGVrSVp3uoY2qAc8Nvk=
X-Received: by 2002:a05:6402:2792:: with SMTP id
 b18mr57454758ede.329.1639341882173; 
 Sun, 12 Dec 2021 12:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20211212201844.114949-1-aouledameur@baylibre.com>
 <20211212201844.114949-4-aouledameur@baylibre.com>
In-Reply-To: <20211212201844.114949-4-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Dec 2021 21:44:31 +0100
Message-ID: <CAFBinCDnDxVj+Gtue2oA3u4jnTDmca6Dr-CTKcpkqGCLSRtALA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] phy: amlogic: meson8b-usb2: fix shared reset
 control use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: khilman@baylibre.com, p.zabel@pengutronix.de, balbi@kernel.org, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_124443_671515_03B2DEEF 
X-CRM114-Status: UNSURE (   9.17  )
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

On Sun, Dec 12, 2021 at 9:20 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use reset_control_rearm() call if an error occurs in case
> phy_meson8b_usb2_power_on() fails after reset() has been called, or in
> case phy_meson8b_usb2_power_off() is called i.e the resource is no longer
> used and the reset line may be triggered again by other devices.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework, use of reset_control_reset() on shared reset line should
> be balanced with reset_control_rearm().
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
