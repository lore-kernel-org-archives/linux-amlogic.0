Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C5CC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 19:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNGTvimkCD9hYkRCCrL2KelF7m/54934OdGn1y3REno=; b=pMcSTkjVlbhL3C
	UoRzyHfCDv+PazGIx3f2zDcKS5gL8xYF6wibH96edNJUiONc2RYNEPVW66QpzrJj9bsvSSBCWTqcP
	EKaLcErRghXGPBzyB6GS/640YUd59FyMeLPxTqx0x9R/viJd1DShn5Pk4sW+2kGEeho17XTu7Q5iG
	R6KvrpRONQasoapQHYoAM7K8yPZ/HNucfxUAIyFEpT4KBsQrMbSFgqD2Gh0/pcZLNLgTV+yl7jZkR
	Anh0X9vnICfsPt8LdyWemZzsc1cGMnaG7boRSt63S0Bw9TjRWWootp4MmyaNS82d2Fq9iIjFOzr5c
	tysA/GkB19v4AeGrexVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRfX8-0061pB-9G; Tue, 08 Mar 2022 19:30:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRfX5-0061nX-JK; Tue, 08 Mar 2022 19:30:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id kt27so234924ejb.0;
 Tue, 08 Mar 2022 11:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+2q5mFhtBUqIpsYqyu0QwEiTcsZGd6XXyETKADPwOk=;
 b=IfOzGNpEph8H6ppENTqnIJAGRSPw39zkjFA5iv1vAQMnVWN/U8GRhhzAWh70nwHjEm
 Oqwg/ydQRZH5+OOmqLZbyrzaRRP8KAR42itAPUaVgI9eowliH7KwA0VnnwJI+YjtmMT1
 xvOZ+Fq5+AfNV3PejPeV1CFQDGK8pT+6HZ0jkJSjKR5V1V3Ikz4ojPVrk2Ko1fAzvt8Y
 n3SEe83NcEWI50tMK9zTkNs6ylqDhhNyB9Mn8QQrcdiZDQwpNJS8LocTU+Daq2Kidtbi
 V76NAGRl95dSiHl3c8NuM8uopspGZ4/vXpE6uI1f/L+uPdnnJFFf97D4DnTqTDkqa/iW
 vf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+2q5mFhtBUqIpsYqyu0QwEiTcsZGd6XXyETKADPwOk=;
 b=k3r7StFJyQhEOgVnBn6JNG9i+QrE51nY/0aM793hlp6ehEppWR5Qhnh/4de1/SErd4
 0N7ica4gwMCz7H9KvqmqYTF27w9+b9D1BFGY31rgF+DBoboazYzhvDm5czwyOYbQ747A
 yYUb4dAfge1uRkedz1uD0yONZcibOfOU6+26XbXqopL82cGgRNdlzO993eTcKCR5dpRT
 ZkAjmxFZDJeuXA7dbIdhUhnYE2mFfJl0lzi0Poh1bikwRqfAL/qV+e0qFFizb+OaGML7
 CiiHOUMSnHuMJNr1r5nNOZ9/mzmBxwaTDdguLcXsZj5wU3K6AtBLvzoso4G8+gIa4yA+
 LITg==
X-Gm-Message-State: AOAM533uV8LpwvZLi3ZrXBNJwj0jH8hgD3Le/ULSxOJ6Dkde7Fc8WyNE
 c7JdpkLB5cocB6UJ4ReKoQH1kQ/6fjxB9jrllvCDTmXOzX8=
X-Google-Smtp-Source: ABdhPJwagRMowd5qd3x6+stSD5EFdnKkd1IUY6HpQiu0t+mlFwS993McuD2TB8XsenOgB0/d8kwBnnR+Hr5Ntoq5Z94=
X-Received: by 2002:a17:906:3412:b0:6db:6ad:381c with SMTP id
 c18-20020a170906341200b006db06ad381cmr13239197ejb.302.1646767804753; Tue, 08
 Mar 2022 11:30:04 -0800 (PST)
MIME-Version: 1.0
References: <13ecb1a6-6ae6-2815-7ff8-58f661c14b2d@gmail.com>
In-Reply-To: <13ecb1a6-6ae6-2815-7ff8-58f661c14b2d@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Mar 2022 20:29:54 +0100
Message-ID: <CAFBinCB700+g_fDmC5dXbNONLyESghp+RmZ+1myvhPbseXpY4A@mail.gmail.com>
Subject: Re: Missing mali regulator in Amlogic dts
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_113007_681080_C47A3E02 
X-CRM114-Status: GOOD (  12.33  )
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

Hi Heiner,

On Tue, Mar 8, 2022 at 7:24 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> I get following error on a  S905W-based system.
> lima d00c0000.gpu: dev_pm_opp_set_regulators: no regulator (mali) found: -19
This warning is harmless (see below)

> I see mali-supply in the DTS of few other vendors, but in no Amlogic DTS.
> Is it missing, or are Amlogic SoCs different here?
As far as I understand, on GXBB and GXL SoCs the VDDEE regulator is
managed by the firmware (which is unfortunately closed-source).
IIRC on the hardware side VDDEE is just another PWM regulator, just
like with the 32-bit SoCs or with G12A (and later) SoCs.

> In the latter case supposedly drivers/gpu/drm/lima/lima_devfreq.c would
> have to be changed to check for the optional regulator and not call
> devm_pm_opp_set_regulators() if it's missing.
I think I just copied the logic from panfrost
(drivers/gpu/drm/panfrost/panfrost_devfreq.c) to lima.
So GXM boards (using panfrost) will probably report a similar warning.
That said, I don't know enough to judge whether your approach makes sense.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
