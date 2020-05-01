Return-Path: <SRS0=tEAa=6P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74191C47253
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 17:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E49520857
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 17:10:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m6lWO9M9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VFix+Zzz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E49520857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjgNK9sRTT6CZ7lV17k+Gb0qjnWH+O0PcK1ZF9EQ7ew=; b=m6lWO9M9t547u/
	1u7fHgEsS0STAWTtkR3ZM3/YIKWvndKzfRu+HYgIK4nS8fKlVSRFXYk+92gLM2OopY6eOZKZV+38U
	XqkolBKr1GS+eMl2cOWzzxN8bdl9hEgttOdbQaRkcR5/e/+QRzSTjG87ZOXug6nGE9T9u+F4+fAEA
	ZBb6J+LV0vPe7IJo+eVrgciK0i/d259PzT0XZuF/5DG886alO4GthJwHI0aT28DK7WtmycVAd93+i
	S49FjQtPryHwHNWlxML2WReK+SeGZtm0ikeMOlnttF0vAfOy7nS0MFtSMGJPOYZ/Y4aqK5R72vCvp
	EBk3IBtaP+vW1DpLqfwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUZB8-0004iw-Og; Fri, 01 May 2020 17:10:22 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUZB5-0004hx-PI; Fri, 01 May 2020 17:10:21 +0000
Received: by mail-ed1-x544.google.com with SMTP id r16so7757509edw.5;
 Fri, 01 May 2020 10:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mdsa9GHdUWtpaN13DncP5RB/gp8GCrhEqRpKlncbW8M=;
 b=VFix+ZzzMeP4eNt2Ma6wISbnBws23mS6CK24e9btsoxi/rWAL28gHCi3lnw01N2Mso
 xg7A5BAI4W+HY83Q4a9smJTfbPRB6vX6oaiV3FXBRkn6hDHWIN0DGdL47vAFMZS93EAF
 Xkpme5PxE0x9U6DQBOSk3KEchoiisb+4c0tORK82VbZJgmveYqqkviH8RVMWJ5kFg7Xj
 2ccbyQziO0INOSv7Rs+puN5g+q31+TzX5QZpBq0IJFlBvvq+RRHCqRO29F3xDWvwUxN3
 UqXlO2R0Jo/A2g7JJ6pIyPJD/KyOOoAubmsnNLXOyDELxVxqF3Zt+TX4hw9AX1+H4XOu
 eayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mdsa9GHdUWtpaN13DncP5RB/gp8GCrhEqRpKlncbW8M=;
 b=Mvr778edSVjsEKqLvxeVhEYnbMi4JnHFBfhwT26rc4tKV123OIZcrpwCq4e3+QnyQM
 bnRhHVIZZdEBXAm6YOm4XPCM3TKZdOxH2jxc6Ux06LJ39IkyRjy6xogWiN91d1E0wQ21
 p1bVkOgTRTIyWE2jbTp88Zs7Qfp1OmApDGMIiYw38RmfLJOXM7ixT0GLIJd4ehy/IKMq
 iBntMfxPlJyWlKTljPB24I+wQixw5EfJ5xkcoJH6EIgzcAVg8hDWF3Z+PVa+ZW0Hs3mO
 8t80GdhOtXoh2efNBDvKab/e//L54u+hsswSnp5zxh1yi5UqqmmUEQBDB5jbStMvcRPk
 FloQ==
X-Gm-Message-State: AGi0PuaViy/1KHN7YojNDMALqoVd21uLlZynGsOXrFEYaFGc8Blzx98X
 6ILap5jj2S5zq8YE3FL5EpOBbKb6cna6HV0RUSc=
X-Google-Smtp-Source: APiQypIlznByGASsngfncYgj2mcw6Vrs/KqUKB8Ee7ab33jQKBgHBdr9tJ2P2JZNmmWhIHFqaa9FcURiBcyKlJ1LWcU=
X-Received: by 2002:a50:fc06:: with SMTP id i6mr4256455edr.110.1588353017519; 
 Fri, 01 May 2020 10:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
 <20200429201644.1144546-9-martin.blumenstingl@googlemail.com>
 <20200501154448.GH128733@lunn.ch>
In-Reply-To: <20200501154448.GH128733@lunn.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 1 May 2020 19:10:06 +0200
Message-ID: <CAFBinCCbtLRomdikKWkS+HOFoek4cGhN4L91FQfQ4rbKTV-xvg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 08/11] net: stmmac: dwmac-meson8b: add support for
 the RX delay configuration
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_101019_848739_E084A631 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Fri, May 1, 2020 at 5:44 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +     if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
> > +             /* The timing adjustment logic is driven by a separate clock */
> > +             ret = meson8b_devm_clk_prepare_enable(dwmac,
> > +                                                   dwmac->timing_adj_clk);
> > +             if (ret) {
> > +                     dev_err(dwmac->dev,
> > +                             "Failed to enable the timing-adjustment clock\n");
> > +                     return ret;
> > +             }
> > +     }
>
> Hi Martin
>
> It is a while since i used the clk API. I thought the get_optional()
> call returned a NULL pointer if the clock does not exist.
> clk_prepare_enable() passed a NULL pointer is a NOP, but it also does
> not return an error. So if the clock does not exist, you won't get
> this error, the code keeps going, configures the hardware, but it does
> not work.
>
> I think you need to check dwmac->timing_adj_clk != NULL here, and
> error out if DT has properties which require it.
Thank you for your excellent code review quality (as always)!
you are right and I will fix that in the next version


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
