Return-Path: <SRS0=2E3n=OZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66346C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Oct 2021 21:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 235D1611C0
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Oct 2021 21:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 235D1611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6XGzAioA+rqj83hBSPNnfG9BLKrkqDOw18+bxV/xxA=; b=ZRUTvz6BI4jh1UfUvOhlbpwc8a
	Qkt5bI05JfExKn/3W5xuBvNHNYsuCMJiMLY82VDNd9IC4DGPMAPy6z6et+DICFaDKaGKjny/f1r76
	tH67lQZLwPmxD0YbtO/dG3IPtOYS7RKiJI8o4UCdZ1I0VNyi2NqLPxI8gaUmJDqX7xeU/Lx9AFDHi
	DWsEFL15WgjDKuZ6Ek2RG46brCgSWGFkM5hAiL08ZPLX/1FWu8JJ+I1BvztAwZRXteQinMC4KgE3J
	XBDfMVMdtdayqX9zBcLS9lQpyJANamYe95vUh8QU+YyMGiRDYhKvbJBSS4uZy2/BwhfT0IJAGZS+U
	d+7ALqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXs2N-00Bx5K-I1; Tue, 05 Oct 2021 21:31:47 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXs2L-00Bx4J-Mh; Tue, 05 Oct 2021 21:31:47 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z1so1857439edb.8;
 Tue, 05 Oct 2021 14:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dyVXlnP2EO7sin30ak6UOPtTEL7Y82rXmT1HaZJEwO8=;
 b=EFN/EvkcYsa4w188RyqHCgrfIifhUY80k3vng6CANfrvzyfsDaVjfDtTPGoR518LhV
 GD5oDuzos+B9/T9xu3L51B88VpK7ug1wdWoYUKxCIx5iYryNBRqmOK3f1s0NVN3zNmSx
 ik2H8dDm4T9B6uiATyk6B/1DooH4Mqlz0oMcA15tRRXuCYjA43xQqokHbVsoWkx5638U
 JjpXaSt8duZuGSYl3aAv73jpt0xE3eIMEnCrfjLShz4nsq98JtPv0HCuTUjPusvYOHhS
 wqyE1xXpysKBlZ38l2YPGNjL6L1GamN+Nt8+bjyG/KZ7AgLrfLwbW2aQdn2pBfCWRgpX
 cngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dyVXlnP2EO7sin30ak6UOPtTEL7Y82rXmT1HaZJEwO8=;
 b=lpq0MzG5fkRje+bDa/p8xgr2nEZPqxk3gTMSVJBTWmn6xppWMGQv1Q0/g3H7nKWKDy
 /DFBI8sj3LqsEzkxqfrbT3UZ9mzCn1boxjrBYldlmtjV2xMWcWtk+VaqF4L+dqqJUF51
 cKCV3LKR064SKZwdr9NMHbDqoZ7Pqjt3oDgRjWZo3jAGHgHwYJRGIDRFWnQhgajsdN+q
 nIsY1MilRzAk3B6xTRtQ0kpTLUpAd1EIOVlhQsAUhXXY/63fM/gJjU2RD8jo5HVrcxG9
 d+AutK3XPk+1GqLI1/GnsUrZXaGBdHtqXKXtTG/bws801qcNoAirMlu2RrWoZ6nWmxVm
 hCng==
X-Gm-Message-State: AOAM531SO11NvWg7KQ9HgR0ptyQAkwy/IU1+zoX2cIzVOX2EOn9DSYbQ
 pGmLpPzbooDVEQBY7q5meA3Ud5Wo72QWYZXHg4pMvKj2CKc=
X-Google-Smtp-Source: ABdhPJwKILTM9G/OOo7WWONLMHq2ef2R6ySw+NYb6dhPKjGQkfzxEG/W1fih0HC2WwHMp8T9yaPB74McG7c/6kHtQQ0=
X-Received: by 2002:a17:906:318f:: with SMTP id
 15mr27839463ejy.206.1633469502753; 
 Tue, 05 Oct 2021 14:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
 <1jy279uprd.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBrYUPOkvJUAiEF9X0Z76ta3jSrKkLkaHvJUaiWNyR0yw@mail.gmail.com>
In-Reply-To: <CAFBinCBrYUPOkvJUAiEF9X0Z76ta3jSrKkLkaHvJUaiWNyR0yw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Oct 2021 23:31:31 +0200
Message-ID: <CAFBinCBv0GWDUL+WYBU4JAgKgie07m+duxReh2tSopGOHwh4=Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, 
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000076acda05cda1c165"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_143145_799392_8566753A 
X-CRM114-Status: GOOD (  21.28  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--00000000000076acda05cda1c165
Content-Type: text/plain; charset="UTF-8"

Hi Jerome,

On Mon, Oct 4, 2021 at 11:17 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > This bit could also be a remain of an older design, not really connected
> > to anything meaningful. It would not be the first time.
> >
> > The AIU looks like an IP that has evolved a lot over the years, not always
> > in a coordinated fashion. Some scenario are well supported and easy,
> > others seem to require a magic spell.
> >
> > Last (but not least), in AML vendor kernel, the only time this bit poked
> > is around 8ch support (1 for 8ch, 0 otherwise) ... I have no idea why.
> The 32-bit SoCs use SPDIF to feed 2-channel audio to the HDMI TX
> controller and I2S to feed 8-channel audio to the HDMI TX controller.
> It seems that Amlogic stopped this for (at least some) 64-bit SoCs.
>
> My testing results indicate that AIU_CLK_CTRL_MORE[6] is still relevant.
> I can do another round of testing with various combinations of
> AIU_CLK_CTRL_MORE[6] and AIU_HDMI_CLK_DATA_CTRL register values.
> If you want me to test any specific combinations then please let me know.
I have tested various combinations, see the attached result file
(which can be viewed with "column -t /path/to/results.txt").
The short summary is that...
...I2S output requires:
  AIU_HDMI_CLK_DATA_CTRL[1:0] = 0x2
  AIU_HDMI_CLK_DATA_CTRL[5:4] = 0x2
  AIU_CLK_CTRL_MORE[6] = 0x1

...SPDIF output requires:
  AIU_HDMI_CLK_DATA_CTRL[1:0] = 0x2
  AIU_HDMI_CLK_DATA_CTRL[5:4] = (any)
  AIU_CLK_CTRL_MORE[6] = 0x1

My test consisted of running speaker-test -c2 and playing an mp3 with
ffplay on an Odroid-C1.

In other words: this confirms what we have suspected before.
What is your suggestion on how to model these muxes in the driver?

In the meantime I finally understood what #sound-dai-cells = <1>; does
thanks to your previous hints.
With that I can wire up the I2S and SPDIF inputs to the HDMI TX
controller's "HDMI codec".
Many thanks again for this hint!


Best regards,
Martin

--00000000000076acda05cda1c165
Content-Type: text/plain; charset="US-ASCII"; name="results.txt"
Content-Disposition: attachment; filename="results.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_kuekxzbb0>
X-Attachment-Id: f_kuekxzbb0

QUlVX0hETUlfQ0xLX0RBVEFfQ1RSTFsxOjBdIEFJVV9IRE1JX0NMS19EQVRBX0NUUkxbNTo0XSBB
SVVfQ0xLX0NUUkxfTU9SRVs2XSBJMlMgU1BESUYKKENUUkxfQ0xLX1NFTCkgKENUUkxfREFUQV9T
RUwpIChBTUNMSykgKEkyUykgKFNQRElGKQoweDAgMHgwIDB4MCBzaWxlbmNlIHNpbGVuY2UKMHgw
IDB4MCAweDEgc2lsZW5jZSBzaWxlbmNlCjB4MiAweDAgMHgwIHNpbGVuY2UgcGxheWJhY2sKMHgy
IDB4MCAweDEgc2lsZW5jZSBzaWxlbmNlCjB4MiAweDIgMHgxIHBsYXliYWNrIHNpbGVuY2UKMHgy
IDB4MiAweDAgc2lsZW5jZSBwbGF5YmFjawo=
--00000000000076acda05cda1c165
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--00000000000076acda05cda1c165--

