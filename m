Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DACC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 09:17:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739E62417E
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 09:17:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCDG4syA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jCSg/LpM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739E62417E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JL3Gid+WVWJoObZVHk9tAA65yhekuYLa8UAFtu8+Q9w=; b=gCDG4syAFYQxG/4p+cCyluAaw
	6mLyeYkvlt3Pw5CcqLkMJmLOeUXSFB2Sigc/RMIM0uCNNV+3N4Qhbd/tMsej4F1+0keI3qVxJ9GE1
	0YC7NB3yNxPwyezn5hUPJgEWwiW2mSnkYr1tyxuRJ/TrSBRz+BiE9VS2JJ/5ppM30OsIEnLiWwvDk
	iOavBwtQMI+dS5EBh3tVPHfEDLlZCvhhmGTmRwOGtRSwNMpNxjezqMU7iNw5hfNlQJtK121lpplEv
	YtTmBrRgq2zSByvY0AtdUaieBL3P0JXnxyDXR6JOnh863pGegDim/6YdkhlRF/j+UocDh0hsraC8Z
	Ya09f5gDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kex6j-00077I-GP; Tue, 17 Nov 2020 09:17:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kex6h-00076l-LM
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 09:17:00 +0000
Received: by mail-wr1-x443.google.com with SMTP id r17so22424758wrw.1
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 01:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MDtk7CaVA2R3o2gPQYkO2PpHsr3cKxkUX8lkMgx4vWk=;
 b=jCSg/LpM9T3TasQK0pOYLU2PdOBSCJ7rhx2ywbCucbK35JyfPpw4TsIeTKgrQ5K5A4
 adeg0g/wSdtS/8A/fTMKmCFoIGMweGqpVivYLpnzjYNuKOV9Kagign9KKHaN2nnyLryK
 tkbrbWKxXyHq8FevU+rMII3OLsKsFo6FguEHDfhm+bmT0oixa22i29HG5MB4mb+wU0bx
 OxdN33czTGYhfmqTBm7hvtOUM/UBpVlJSfUzJfMoWZvI0w28g7PZ2K7AMR/B9G+2lH8X
 mdyKW8Sz/sAi5r9Y1kRfAHPnbR7qs+SurdOIAydwebkFyCl8MTRsEvVDKMcL3n1ztlKS
 YOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MDtk7CaVA2R3o2gPQYkO2PpHsr3cKxkUX8lkMgx4vWk=;
 b=RUk3RAhiIxJnSn7ArJ5TnmhNOGAgUqwJWDyKw+BrWyjPS8FUcX5hJ/pXKlmqpLBnIS
 m/WEmhIH2uKVevZfub9tk08pfzxjZuumTQ9dXIA1dbnHtiMLukeSzCIl786MjnfGcCmN
 iRXPwqA43Axe3RxZ92ue2ZBJcGZREUazY7IrUzqdj7lM9JlSbhQVM119t6qE5xLyqWdT
 X9ah8htTQum833weER4inkH+cJd3K2rVPKiXAGVb0CsTKNkHs1NT/En/M39+0s3LFAIP
 ANzcXYI8jrh11Ibpbwr9aympjk1WFSXHr1knAq3jRa00Vz7lV+HxQ4YX2K8q05F/o7tP
 8ITw==
X-Gm-Message-State: AOAM532RmqR/G8R5+AUsZd0qkLdSH415FM+amMGQRYJhUzE1Vcjyl54R
 GBZrUOu9+DgKSpfYm0bGkFn+ow==
X-Google-Smtp-Source: ABdhPJycFFxJJ184g8hhJdy18ua9XwfcJ0b61PxrGHf3KdoaD1f5//kMGDhO47wCHXJ23ejf/LCtEA==
X-Received: by 2002:adf:9066:: with SMTP id h93mr25171539wrh.166.1605604618486; 
 Tue, 17 Nov 2020 01:16:58 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:b09f:f7de:c7af:258b?
 ([2001:861:3a84:7260:b09f:f7de:c7af:258b])
 by smtp.gmail.com with ESMTPSA id 15sm2589534wmg.1.2020.11.17.01.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 01:16:57 -0800 (PST)
Subject: Re: [PATCH 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com>
 <20201113000508.14702-2-aouledameur@baylibre.com>
 <CAFBinCC92FfvFt1aAspkF_Mrrtu_QpS327TN2=9Yc3tWMTcu_w@mail.gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <cdb9db35-6da3-259f-1c75-8d897f755571@baylibre.com>
Date: Tue, 17 Nov 2020 10:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCC92FfvFt1aAspkF_Mrrtu_QpS327TN2=9Yc3tWMTcu_w@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_041659_768048_12595292 
X-CRM114-Status: GOOD (  16.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On 14/11/2020 20:13, Martin Blumenstingl wrote:

> Hi Amjad,
>
> On Fri, Nov 13, 2020 at 1:06 AM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
> [...]
>> @@ -124,6 +126,7 @@ static int phy_meson_gxl_usb2_exit(struct phy *phy)
>>   {
>>          struct phy_meson_gxl_usb2_priv *priv = phy_get_drvdata(phy);
>>
>> +       reset_control_rearm(priv->reset);
> please move reset_control_rearm after clk_disable_unprepare as
> mentioned on the other patch to clean things up in reverse order of
> initialization

Agreed, will fix it in next change !

>
>>          clk_disable_unprepare(priv->clk);
>
> Thank you
> Martin
>
Thank you for the feedback !

Best,

Amjad


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
