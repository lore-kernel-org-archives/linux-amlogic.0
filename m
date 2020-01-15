Return-Path: <SRS0=Q90K=3E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68964C33CB1
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 12:42:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38EE822522
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 12:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIdUTzXt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pK2KQsH0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38EE822522
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vT8c1GZ/gDRyzUskV//Ky4ubK/O/PZmOVxVRTZg2XwA=; b=pIdUTzXtk9trTE
	e/3tLOSOFkD9V5FhV6LnUnjEqDLJfPcfeLtHMIPnZ5phajUamFuzdA/s9EORedQhMwY4lx9Yv+raA
	xDWuacBoP/Vf+2eIm85XWRmurBadJxBgFdpTwEbqDp/bzn7UckFuTlBxZn2cf2BECMm4+neoAozox
	cJBD+dIkAC8ZpKve9ludeXToZcxy7QfgNfnWOMC4oDortMP3ewvFE4kPLvqtE24NG1gkgtasqkEia
	XhSCMWnfyAB1D3eDZceJsPVLQ83Gp03QX4b7bS2aA71NUs8WYgHAk1WTbTC9tbTIk5fDO9xDgS0ve
	mi9DKuVqDInOvMgm3v/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irhze-0008Gd-CU; Wed, 15 Jan 2020 12:41:54 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irhzY-0008FS-H5; Wed, 15 Jan 2020 12:41:53 +0000
Received: by mail-ed1-x544.google.com with SMTP id cy15so15383149edb.4;
 Wed, 15 Jan 2020 04:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VYFrUZfFIn1ih4ZXmSMoxrgE6FJJjwb6w+otiOxvkzc=;
 b=pK2KQsH0vQ8EelC3J81rzuMSl1QXiwz/YzhdEBimsT1vaLFmTbd6rhrzyJF6w7Rwd8
 oj1fc0rcth0QnkpoHlcq73rgVLIAaDyC3llMqh2Iba24SuyhlVK6CIKdF43KCkZ5gm6i
 ic54s1NSI0kqk4Sq2kzGiL8DKzOAqgM0S5fbfcKIiHaERa7k1F+4D7xIZJ66YeQla6cB
 3eDcMrsp1GkUJrQ6yGragpalYQNLJRuU9Czt2a5sErK6XpACiS3LQCDcVyh1Lejk9u3F
 +TTJMyObPAMrx0OTtcZzySwYrJI7wEUxJ0vt5vUkBrsN/KxSnWArQ6ZFTFjLVqM4fZkx
 iplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VYFrUZfFIn1ih4ZXmSMoxrgE6FJJjwb6w+otiOxvkzc=;
 b=RrEj+LwTrevECjDYGq6zw3JILqS03jsk+UyG2JWIaSv8bWLf77P6qBgoex7EuKE90t
 98+025QfLqAKV5VA9ZnljNfK6AvchlZDQnq4AyZU8j2owNBnUlY51qW8ieOj3DNecc9X
 vV+vrzSqlVex+/aTxT+UkAGeYxH1mj465Mm/qxo/4P0jeFDGs8HEgINus2xPX/ndQCj6
 FHA586xJsM3kLcIWQu9HI1hBN5T8ZrLEhDResydmilLsFDrGythX1c5h0MP/S1yYhYtG
 f+cU6Mvd6voRT9xcSwBz6P4jgmSEefeUK/Gg8S6tF7WraetlQW9ACrn5McwlQUAygBJF
 9Rag==
X-Gm-Message-State: APjAAAUuVpD5B9gb4hknBjiMxovHPzT1zQlWvWnZuJKfo6FrY4FK6DkL
 drhX8r4vjfo/eUFIhEoBXvICd+gdk5pmBO+n2ok=
X-Google-Smtp-Source: APXvYqzJn0AHc4rPAk1+z4TbdT44aLhxu4nuRPnA4DwJwNpOXOAUvpMX9n6siNHGAePH0mzJTVYZg+aJCTMA3i24XeI=
X-Received: by 2002:a50:875c:: with SMTP id 28mr10542048edv.271.1579092106272; 
 Wed, 15 Jan 2020 04:41:46 -0800 (PST)
MIME-Version: 1.0
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com>
 <1578537045-23260-5-git-send-email-hanjie.lin@amlogic.com>
 <87pnfl6rdk.fsf@kernel.org>
In-Reply-To: <87pnfl6rdk.fsf@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 15 Jan 2020 13:41:35 +0100
Message-ID: <CAFBinCD0DJgYDhPRHqMQuouq+ZyF6Wg_LkuCMpHj2UG6vvvdbA@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To: Felipe Balbi <balbi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_044148_569363_2540B603 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 9:43 AM Felipe Balbi <balbi@kernel.org> wrote:
[...]
> > -     priv->clk = devm_clk_get(dev, NULL);
> > -     if (IS_ERR(priv->clk))
> > -             return PTR_ERR(priv->clk);
> > +     priv->soc_id = (enum meson_soc_id)of_device_get_match_data(&pdev->dev);
> > +
> > +     if (priv->soc_id == MESON_SOC_G12A) {
>
> you can use of_device_is_compatible() and get rid of the enumeration you added.
Hanjie switched to a struct (instead of an enum) that is passed as
"match data" in v5 [0] of this series
personally I prefer what Hanjie has in v5 over
of_device_is_compatible() (because that match data pattern is what we
also use on other Amlogic drivers)


Martin


[0] https://patchwork.kernel.org/patch/11326669/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
