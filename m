Return-Path: <SRS0=2olW=JP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A76FC433ED
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Apr 2021 20:08:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE61B61078
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Apr 2021 20:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE61B61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WLbm3kiGaT2CXGgzoQ1gtSy4KDDCtcg0hJr3qgrw8PE=; b=ZbcEYXXYOrkxoTGzuCt4f4LXD
	EJJDZRM+JTRrXD5x3+7hloLCUnz1UHLhbOW5FgVa7r6a7Qz7AcPp7yxKvHSV82jWqv3TvJ2AU8mqW
	ZgNw4mTm6GWBhwisf32hRvHadhfE0qqbJ95X5jNhATBw41WFX3rKgqdgW5wCGLou0eHtC8JMkXDL6
	b8/hr1zsWc8YjO03wK7enE+Euh628tAvUdFiMWga4q4JBZxkMLtFmXNKlT0yZShrlva2txG3mjMSu
	wsKjncWGpUhWJel6WofuPYoedD48vwjOUMW5pyT3Vf4nv1LNQR52BUxMoUWUEiq2jdGFyYr2TnZmc
	bWAeLoY2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYDib-008VOL-Q6; Sun, 18 Apr 2021 20:08:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDiY-008VNZ-GM; Sun, 18 Apr 2021 20:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=r4NSXgtmxoVSeVnorCFG1O/+2MYrv80T6AitfvZAjQI=; b=lc/9FrlhlMwAReSW91nb9FtQb7
 WEAwvyiJhwJb0yz/EdxsX5NvXEv7miEyP3fl/VjffG8E8aXVMcLWtjNfr1B/KVAarWBwlsGa66amC
 3DOG47U6H2LPXMkUgReIDamcVnbxe2jichzsbpHLZovyGth+lO78WpyHk+VS7+cBxXVjmmOo1BDDV
 bz5ztf0nKKlq2SXX1j0AkxCJb8NZvdUw6R1bHzhGeuIXvW0hCLWuycZB9rpn1MDDMy0VBPPDz72ix
 iHXbgUqc9H5cBw3m+idcO1RTLLkwjVEwrMDi4u/FyDGwpM6O9fEsRdmggl2gUxM679vAqJoooTXPQ
 lZhNgmiQ==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDiS-00AeBE-PM; Sun, 18 Apr 2021 20:08:28 +0000
Received: by mail-ed1-x532.google.com with SMTP id j7so1287322eds.8;
 Sun, 18 Apr 2021 13:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r4NSXgtmxoVSeVnorCFG1O/+2MYrv80T6AitfvZAjQI=;
 b=YVldtm5HhBE8zTXfuUeKSLpDYWA3s6PruRnQDIiDewlaTs3PtaMyZbrkhN8umMK5L4
 jihovo5MO08gBtYdN3GZe+qQRAVJFiq7nVhQbV/PHvqMlCiQNlKAsLk6iXWSm+Lp1DTM
 lBjXXQveiILyV8ts4thItq0ivAJguzDm2BhO7h47axfH8BdWeYHaib0JPhpYx3I4LPwG
 VLjXU1qPOHe5RkTvU/Q1dOo6+dp7MJjQ5UYvfcBuf378KvnW0jxatDfgi4GXbAGOao7c
 26FBdlto5lwXh+Ap/Y+VKBbzuB+bAStFJ4e7Bx7JPaJVtDoXeFtDRVf/PliMf9g5dlYI
 qlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r4NSXgtmxoVSeVnorCFG1O/+2MYrv80T6AitfvZAjQI=;
 b=s54dygGlMIlzSFHwvKAh0K0kedzVvGc1Bkr3vjGr/ZAMVKkG46+qJKPFCW/JaIxHHQ
 gSw1Pki+tYVO/m16Sidd6ZW6lVCnOJsXbosKSX7i5k19RsORm42QX1sySlLelr0rzLtf
 lLgI0/KLNvmWHw+k8Ifa1m+JnTQor3wt/eQHRq/l3+aFmT1ohwFgk1+K9vreIFNUSWGr
 PMYxjRO3Cn5odUaYY3m3ZGlO0lkB1pg0K5m+JWyrL7qbKHCBGkrHnMBKHdX1w209ISzc
 Noud+ySafaQ5vm+6aQYmDjh1ECkDAvy0c9SgefiO7u6sCDyjMyFKOyuK/7jlR4OCX3J5
 ETGw==
X-Gm-Message-State: AOAM531XNDjyxMZbGxnBu4Xu93nt22KXAOfQGcEpY8dADJhrejNkR3sx
 uwugq3+Ini6vtHklXMUqHFTg5KqhSzP3o9L9XWRNYNveJHM=
X-Google-Smtp-Source: ABdhPJzm4v4SaZBzMjFCQXMrBA5P6PDJPR2zpj5EZwNeaLYnN23+2hzqrCo5ff1StTHRSKYGqfImHwTKVxxBslweaXM=
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr8856230edq.146.1618776502441; 
 Sun, 18 Apr 2021 13:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <f13f7006-2d0c-40c7-cea6-03b5190fd106@baylibre.com>
In-Reply-To: <f13f7006-2d0c-40c7-cea6-03b5190fd106@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 18 Apr 2021 22:08:11 +0200
Message-ID: <CAFBinCB6WLo1-kMMTC112tdBmdcJ=q2rpih56J1SfOX78xeEiw@mail.gmail.com>
Subject: Re: 2021 Amlogic SoCs Features Status
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_130824_866461_676D4F45 
X-CRM114-Status: GOOD (  21.79  )
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

Hi Neil,

thank you for this summary!

On Thu, Apr 15, 2021 at 4:29 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> I would like to thanks all the contributors (code, test, bug reports, ...) for the last
> 4,5 years !
Indeed, thanks to everyone who helped to get where we are right now!

[...]
> ## Meson6 / Meson8 / Meson8b
>
> I'll let martin elaborate on that, but it seems the biggest missing bits are Display, Video Decoder & Encoder support.
Meson6: unknown status, I don't have any hardware so YMMV
Meson8: similar status as Meson8b/Meson8m2 as these SoCs are almost
identical. The only known differences are Ethernet (Meson8 and Meson6
use the same Ethernet IP, while Meson8b and Meson8m2 use a newer IP ->
same as found on GXBB) and some clocks (which means that Meson8 cannot
change the GPU clock at runtime for example because the glitch-free
mux is absent)

Meson8b/Meson8m2:
video output:
1. I need to re-spin and re-test my CCF series which makes the video
clock tree mutable. This means I need to use the PLL initialization
"magic registers" to set the PLL to the "doubling" mode
2. some of the existing DRM driver code needs to be converted to a
bridge so I don't have to duplicate the non-dw-HDMI part of
meson_dw_hdmi.c
3. 1080P and lower video modes are working with my out-of-tree driver
for me. upstreaming this driver will require multiple rounds of
reviews as this includes a driver for the TransSwitch HDMI controller
IP (not just the Amlogic part)
4. cleanup of the DRM patches sitting in my tree

HDMI CEC:
- untested, but I hope that it's similar enough to GXBB so it works
without too much effort

audio output:
- in my tests SPDIF output is working fine
- I2S over HDMI also worked "fine" in my (2-channel) tests. I expect
that it'll suffer from the MGN issue as GXBB, GXL and GXM
- for boards where the analog output path is known this can be made to
work. I did some experiments on my EC-100 some time ago where I could
get it to work. but I was unsuccessful with the analog out on other
boards

video encoders/decoders:
- according to what Maxime told me some time ago this should be very
similar to GXBB but I have not done any experiments so far

once implemented for any of Meson8/Meson8b/Meson8m2/GXBB we'll get it
for the "other" SoCs for free:
- IR hardware decoding
- USB OTG


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
