Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF76C5519F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 19:12:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54A62225E
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 19:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fnInD6CD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FSu31JSK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54A62225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nv8Zw5piUyVdQUWbStPrPut7FWfLoUBuWuDLJl4DgMo=; b=fnInD6CDzy75b/NvKDJuKQ0Sk
	XWbso/Wq09PD77K3pq1xSc5ODLO+m+l9FR2lLJMqo2f/Q4C508Vq7KoMHkK8uwdpKhpDbD43sFPIQ
	H36+Pm8j2ZCh69sL5h84+f/rIGNCt8UO0x6AXsnxmi4EHfOET0Gtc3H3Pv9eISh3HYg/qJLa5XMX7
	8hLhUf1feJHX/j1eR79YF7ap6wdZhUcvI1785THv5BOyv7Me9DXdb9hSdWgw7DhLc2Mvlho1j09gr
	W5Srb6VdfON6cidr0/f5KIfZYraXdmQCSlYN3fnoar8JQFr1yoAx5eGGJWXAcVt0rOWzeTjoKzY0h
	P1RBb+XeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke0yA-0001l9-Vk; Sat, 14 Nov 2020 19:12:19 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke0y6-0001jh-Py
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 19:12:17 +0000
Received: by mail-ej1-x643.google.com with SMTP id cw8so18627524ejb.8
 for <linux-amlogic@lists.infradead.org>; Sat, 14 Nov 2020 11:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u5WJiirRKNDUV5O3yKO2RQW3GzVNyUWzALcJgmi9qD8=;
 b=FSu31JSKLbwJZm8SKdIl9tHJVYSdoso0nbNX1WyZSqU7bJ+f3/mhAJKWP98OxztFvq
 GpqqwY1QxIJK9hRA4qjpD6KncuahjDOHrbayfw9KPlE/heg7r1R0rfDAJTbIAQJNuDr9
 IkJpuOQ2tuj/r96z41WusH70BMbCVlaD5vYOlEq3JiUbLmXUbNaOk2uJ8Xyka56OpZz3
 TEcOnoZkXQGGRi1idfvtDrP0MeDZR1wA40ED1SpzLXak4V5sPvxsBG7RJ5PDXD4JcD00
 dhRUSf3jZI7yX4WlK1PEEq6k83ONo5c19SPdweZAaQFGS8s0k7AW9ApQg34JKmOigg5w
 7NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5WJiirRKNDUV5O3yKO2RQW3GzVNyUWzALcJgmi9qD8=;
 b=s89vOPm71XVNQcxLu8jtPPqTflyCJB9/xdGasn43jIRbhfVD++IqzUL38RXP8yzSCS
 ZAlVCXgdO1A63FszSbWWqfuTja9OsqcA6KmoeWmL9PybvtjkioJ+k6q58Csb4hkJFOmB
 hAeIHLKXYoY7a8bWdE18a6PO3A0Pn62yLuKPqAHFyrJWN+GhVm1WWwJICpSVwKRwB6gt
 dwd2c2j7xp7K+/DcIn7BFeCPM8Ggq12PIK18GVvaTm3441bE3ODl8jpO8U9FtBeNw5yh
 U9Eutwnlb7BGcnNyQT9YCPMhJ6vs+BXjz4/K/Q7a36HXonYCvA9NtbMH8gzNn7/uu2E/
 f0ow==
X-Gm-Message-State: AOAM533r3JepSTcjfFT/mBwfxzt0Wax3Cci5KtF9acOLKX5B0cU5NTP2
 R62ZrsX6+i6rNTq4x3uOEgriySkZeobptrARu3A=
X-Google-Smtp-Source: ABdhPJzdMCUsv64szJ8LAp46qliACxg7P6fS8+B9EpwGZnNi0pnsgtbqLjudhNZQ7G9Q6urZlSQdUGypFLEZRpTpiTA=
X-Received: by 2002:a17:906:fa1b:: with SMTP id
 lo27mr7560682ejb.216.1605381129975; 
 Sat, 14 Nov 2020 11:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20201113000508.14702-1-aouledameur@baylibre.com>
 <20201113000508.14702-4-aouledameur@baylibre.com>
In-Reply-To: <20201113000508.14702-4-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 14 Nov 2020 20:11:59 +0100
Message-ID: <CAFBinCA6_Cei5QdiVRTX14S5QFoyDgAOhFUXtnx5uiAxuTRs9A@mail.gmail.com>
Subject: Re: [PATCH 3/3] phy: amlogic: meson8b-usb2: fix shared reset control
 use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_141214_871619_3ED4C787 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <balbi@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Amjad,

On Fri, Nov 13, 2020 at 1:07 AM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
[...]
>         ret = clk_prepare_enable(priv->clk_usb);
>         if (ret) {
>                 dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
> +               reset_control_rearm(priv->reset);
this should come after reset_control_rearm so we're cleaning up in
reverse order of initializing things
(in this case it probably makes no difference since
reset_control_rearm is not touching any registers, but I'd still have
it in the correct order to not confuse future developers)

>                 clk_disable_unprepare(priv->clk_usb_general);
>                 return ret;
>         }
> @@ -197,6 +199,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>                         regmap_read(priv->regmap, REG_ADP_BC, &reg);
>                         if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
>                                 dev_warn(&phy->dev, "USB ID detect failed!\n");
> +                               reset_control_rearm(priv->reset);
same here, reset_control_rearm should be after clk_disable_unprepare

>                                 clk_disable_unprepare(priv->clk_usb);
>                                 clk_disable_unprepare(priv->clk_usb_general);
>                                 return -EINVAL;
> @@ -216,6 +219,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
>                                    REG_DBG_UART_SET_IDDQ,
>                                    REG_DBG_UART_SET_IDDQ);
>
> +       reset_control_rearm(priv->reset);
same here, reset_control_rearm should be after clk_disable_unprepare

>         clk_disable_unprepare(priv->clk_usb);
>         clk_disable_unprepare(priv->clk_usb_general);


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
