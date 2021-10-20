Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABC2C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 18:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DAA6128E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 18:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6DAA6128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Nfw+bkLQ4W/pyuGr1n8iNuvbd9QkSwjRI+PJGv4GsE=; b=BZ3EE0Q2BNP2R2
	Ls1ptgLRO6zASlyMp4066YxUInqf1MqTixFjV6pnIeT3SyqO0XHijhhx5DEeDTlHgqmaLFBXUvRIp
	604ROWVsB+RfJoC/rmls4HMdb462alAj8XaiOyTfJHj8AqPcDt0WHqxs2y8HcYeHH2mIjV51S7LHW
	TznvyLw+k+Ojy7CheqE6oIQhfjjvJC76a7fDD16dLPtEaZLFV+4KNfLN84ya4pHSYho/jUjN1dRIo
	mdPSi0nyH+OcXzax929Ua5GNsCZsheWLzqaA/MW+QogaH+dCr8Wl9vdQDIRf4wO/JzXIuHsC1vcao
	NJlFTVyxFVSChuxknCSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdG8r-005Ocp-Jw; Wed, 20 Oct 2021 18:16:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdG8p-005OcP-6Y; Wed, 20 Oct 2021 18:16:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 5so386718edw.7;
 Wed, 20 Oct 2021 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Jn7WfTLu8jwkYeAj+iAPqeRaBH+HlGXHIsBLIJGA0w=;
 b=l5Yp4jOV8szTGfylg2ypOzkihdNd0JdPDwuRrgRvQ0UeaaqS+v699603BDGKO04VpU
 54pyLP19VJL8QATcdVqcQrIb8veUCHvxIaUQpTyv6rM3jys8kvaaUADch1PMcXXFlAP/
 vzZL4/vqsidX45IZn4mhpGae11IxaphvXsBKdlEs0WUybA+2HDL/iwCg7gcvQFWcrBIn
 xq0TExqOLZoQizipb86+q/50cQTDEPRQFI7Yss+qWPDrC88aeIDS74uA2gQIdjYUAjiS
 oW3Ux2/Y/F3LvJ8gUqRQ7CnxOggbgk/nrYnbyqX3lusPCZN25TGi8ev6D2HfNBwbRBls
 nNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Jn7WfTLu8jwkYeAj+iAPqeRaBH+HlGXHIsBLIJGA0w=;
 b=Q2acT7zVlJ9KtJU7gdeAj9jUXwLKjq8DTDkwe6limqtt9Kttv/0ltZb5PK9w8YwINq
 5vs6kmEPYXRb+iQwUfS7p/4DUTgTn3yq0/rGeoemuhHveeuyFa+BFt62SuXwyFTYrsuz
 6GLTtLQdhtMpOnbfBnG4mala0Z0xH8mwB71scqeLaVib9XhUPMI8Tju4ED83LW0PwyGV
 DH4jzIYH9ES80mIi6m2B1l07mwIC7LPaWf8TRyOP1SgpseOWJ5+QrRiistnZkqn0/P+w
 RToNnIwf/1MZH/KkTW3/XbbXlkBykc1fTGm4EealFxHS97hXresK6D6+0NEJE5jxsG77
 TLGQ==
X-Gm-Message-State: AOAM531CUnwf+OF6TuorryNukFFSi56DLuyUh/yetEBw3D4dEPgDNauP
 RlztKkJuJFEK1ThUMP/rD1ksPAViRVLYt8WX4MA=
X-Google-Smtp-Source: ABdhPJyMGVsnf3QU6/teL21jshD1FVHfAlbBDN7+Ikc/9F0vhYqmSUmw7uXsudjF0O7XdetHc3yt4e40gU9EQaMKYDw=
X-Received: by 2002:a17:906:f2cd:: with SMTP id
 gz13mr1093501ejb.278.1634753800493; 
 Wed, 20 Oct 2021 11:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211016145939.15643-1-martin.blumenstingl@googlemail.com>
 <1j5ytuvdmw.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCBGZi3MRqTRshyCkq8AAaqHi2NkZVV80ppZr4Lx=xWOWA@mail.gmail.com>
 <1jmtn6tu99.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmtn6tu99.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 20 Oct 2021 20:16:29 +0200
Message-ID: <CAFBinCCRWS6j=6hDo_sOBmQZw5X8L4GYP=rHQVqHd04keCrbuQ@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: gxbb: Add the spread spectrum bit for MPLL0
 on GXBB
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_111643_277705_17DE0E32 
X-CRM114-Status: GOOD (  18.51  )
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

Hi Jerome,

On Mon, Oct 18, 2021 at 2:03 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > The difference here is BIT(14). un-setting BIT(14) (documented as
> > EN_DDS0) did not change anything according to Christian's test.
> > That also means that SDM, SDM_EN and N2 have the expected values.
> > I manually did the maths:
> > (2000000000Hz * 16384) / ((16384 * 6) + 12808) = 294909640.7Hz
> > which matches what clk_summary sees:
> > 294909641Hz
>
>  ... and (2000000000Hz * 16384) / ((16384 * 6) = 333MHz which is fairly close
>  to what you get w/o flipping the bit
This is actually a great hint. So far MPLL clocks have "just worked"
for me and I didn't have to work with this.
With your explanation it makes sense that SDM_EN makes the hardware
use or ignore the SDM value.

[...]
> For example yes. I am asking check a bit more what this bit does and
> what it does not:
>  - I need confirmation whether or not it does spread spectrum. Yes this
>  needs to be observed on a SoC pin, like MCLK with a fairly low divider
>  to the averaging effect which could partially mask spread spectrum.
I did some more tests with Christian. It turns out that on GXBB
HHI_MPLL_CNTL7[15] has no impact on the rate seen by meson-clk-msr.
On the other hand, HHI_MPLL_CNTL[25] makes MPLL0 use or ignore the SDM
value (again, verified through meson-clk-msr).

>  - Get an idea what it actually does. The 2 calculations above are an
>  hint. (Spread spectrum does not change the rate mean value)
Indeed!
My conclusion is that on GXBB:
1) HHI_MPLL_CNTL[25] doesn't control the spread spectrum setting of
MPLL0 - just like you thought
2) HHI_MPLL_CNTL[25] is actually SDM_EN (and HHI_MPLL_CNTL7[15]
doesn't seem to have any impact on MPLL0's output rate)

Please let me know if there's anything else we can test.
Else I'll send a patch for making HHI_MPLL_CNTL[25] the SDM_EN bit of
MPLL0 on GXBB.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
