Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C29BC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:34:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDF1D611C8
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 22:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDF1D611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/VbZWjHTd4F2L7OhlS7KWU2vGhoskoVt5jdtS/JYyM=; b=JM5CxL3nRODAyS
	wAZNcXEIi11cF+Z5pozofVTm0XQQo40I76OA9LnfFGiBQB04/DFoi6rRLqO9Ld+L6eGb7mORzxwFN
	HMxNffz+7fvOsY4Yq00NbhH7Wts0HxU1PMU5KCd6hA1wL5GWkVdD1+mStaJAw/wU6WDSLyyacPEdl
	DyYNCRQkzNopF3K6WKDf0vTTorzxyLRmDFjpQs4dbz9vf4V4MTf3WeUXPxu21fU39j2ZbdvITp4ND
	c7rsSHxMPJ+Z2BwGaZiAeAEIky1ZsG4hagPwAjlNUfbAQNQQJ5IFsDP4vxfJ8VA3um9qPaH0TBEcE
	5BDFxefgkzFDN4ef3A5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbVmO-008yMA-9A; Fri, 15 Oct 2021 22:34:20 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbVmL-008yKC-JO; Fri, 15 Oct 2021 22:34:19 +0000
Received: by mail-ed1-x532.google.com with SMTP id w19so43327266edd.2;
 Fri, 15 Oct 2021 15:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPP9H53mtCsbQNk9doEzzimC+EjafFfLHkPsfpk1gug=;
 b=Wrmsv1r6CTDbsg6ohN8jcWCEqyPhEjWAqgDfsYvSTD6Z0wUTDq+sgfP0+HD652SaPn
 cBaOtOtCzGLQgEoeMxHfnHkrGiH+JocjZBkkCI1PEGlxKtOY3SQNH5tsK/SrVSkPJsKE
 qSDEP3gCzAKhu4nBYxhktV0Nga3FDmNdmAnd5h5Oa1/eOfPcbveQe63JZpQeth53nKJp
 tGOMwAnFv6lkSLgRyRz7bkGPG3oKDA1PSIU5Ok/Ys+0Wme+189tyJDzt1uPZvfn/pG5B
 +hIQZkuG2b1XNg1U9aImPBbo+CbVio/NzAH3MGaMZZsT0jgTREkOfUBsHBGVozTgM7Tn
 d+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPP9H53mtCsbQNk9doEzzimC+EjafFfLHkPsfpk1gug=;
 b=goADV12SN7vYw9gjEF5p4qa0N5pamdnPYVbKjooZP2Crj6JkDZ9XBOpp3whRSnqqmK
 V/ongSNjVeV5rkwYcIyRPbYsoahU8BkQXe/QQvPwLR8sEo6hVtGEnFwiXUyqOtG6eoLj
 Xu6kpWypundBxlXj4m6CfGEEEIwnFMSLnzx5HIXt7oXx3bcskX9HenCxhH/4ClMGmUuS
 Hze48SyloNbcun8KoyMCfuZItyRm3CVXy3bmg7lN3QZ3+vaSepC/3o8/Jyq6uHThwR6J
 rlwprurBWnHruYVVPPnsvUy5TKCrxzMYZkULqUbW+pu2KyZlCGVH53he6EmuDjN44djx
 7EbA==
X-Gm-Message-State: AOAM5317Dw7oV6H1bLGPDU2gKtEflm6GwIvLoFfPjlfZVFrun7spQwmR
 kLG5hDGhCmWn/DpmGbQl6cihQebFCjFCV3Kwgaw=
X-Google-Smtp-Source: ABdhPJyLJjJm67G6BpfJ0eTf82WNnFvO//ihG40tAdRB1n2RDizdnyDHqAIAfAPSbXh3mmlgYBj8ihlZGtJNQkmzTZQ=
X-Received: by 2002:a17:906:fc0a:: with SMTP id
 ov10mr5837689ejb.536.1634337255917; 
 Fri, 15 Oct 2021 15:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-7-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:34:05 +0200
Message-ID: <CAFBinCBwO0CJMPA3K6e8OxXcinzrA5LrSqaKu1XtZPWLXT8Krw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/meson: encoder_cvbs: switch to bridge with
 ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>, sam@ravnborg.org
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_153417_673408_61E07D9C 
X-CRM114-Status: GOOD (  10.58  )
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

Hi Neil, Hi Sam,

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +static const struct drm_bridge_funcs meson_encoder_cvbs_bridge_funcs = {
> +       .attach = meson_encoder_cvbs_attach,
> +       .enable = meson_encoder_cvbs_enable,
> +       .disable = meson_encoder_cvbs_disable,
> +       .mode_valid = meson_encoder_cvbs_mode_valid,
> +       .get_modes = meson_encoder_cvbs_get_modes,
> +       .atomic_enable = meson_encoder_cvbs_atomic_enable,
I did some testing on boards where u-boot doesn't initialize the video outputs.
It seems that meson_encoder_cvbs_enable() is never called with this patch.
meson_encoder_cvbs_atomic_enable() is called though.

From what I can see in drm_bridge.c [0] this is even expected.
Does this mean that we need to move all logic from .enable to
.atomic_enable (and same with .disable -> moving that logic to
.atomic_disable)?

The same comment applies to the HDMI patch.


Best regards,
Martin


[0] https://elixir.bootlin.com/linux/v5.15-rc5/source/drivers/gpu/drm/drm_bridge.c#L717

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
