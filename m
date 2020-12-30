Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D25C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 23:25:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C3BB207A9
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 23:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C3BB207A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4q9dxn8klhXmeVOB9VJYGph6+/piVZEucUVvOKBZNjw=; b=3WzTDMUSJdpbK76Bq4dnKiXxSV
	QlYly73vCZ8hpKmRtiWtoQoGvUxAyoenfi6PBeiOV3NMvGbhDA1Sps7d19qbYnY0HgNGAVoymgJoU
	sOA4QzTTExNwmE4jFg3oDnIPHvJRgoqzmquIkgyj/AspJIg57bGgnVgvg8P8gTKmNuiCLt5j7cnL7
	44l4TpFLZllZ3vuNiBcBdW0zbRiNwroGU+a8T2uIV6mp1HW/rejKzhDdduY84Bo5y6ruMxKr+ZWL2
	TLA3l/7UR6yuLwxjN/140SCA9roDXKcVADFMn5zykh+8v0dzyCZmJqiIy+Obn8hrBzpJF8x0PqJDb
	/p6btYJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kukpi-0000kH-Gf; Wed, 30 Dec 2020 23:24:46 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kukpe-0000jE-F0; Wed, 30 Dec 2020 23:24:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id 6so23658542ejz.5;
 Wed, 30 Dec 2020 15:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=kMNFm8ebIuItWKDvrj3xBA1Bsn2nUWXnMPwJswbaR+E=;
 b=uu86qXtwL1PIIG0UG9BMgMJ4c2ZxlXaQroeVmfqy2brWjSSk8C/3lq6n9APe174cFH
 gZWgku5F5yJgikuE0KwVkyQ672qRnX12/y9D17JuxH+XPN7LychGh/tT8XhS4sExINn9
 iIbEVtxoT4y17IwqSMXHFBD5gG2bM4/2hmqFDM/Q6/hilbTJWYG4CvIqqXau1Xzl5x92
 nB2qFZU99niHa3lFIlcCNI2gwLWf+GHPQoh7MF9k47ZPlmFAC37AEQ9TiU5NuD/C8FMm
 K0L4XISsbcazrJi+QjVjeKL1FRkXqIu5QRREM33JWvv1sttbvxUui5Vxk42W3u3QuUqc
 au6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kMNFm8ebIuItWKDvrj3xBA1Bsn2nUWXnMPwJswbaR+E=;
 b=BkSTN6rhknhl72UIcX7NuzRRNH8VA8yyPfS+6FEe61AExFszc4u0HAoEkWDhyly9vW
 OKk6Uv0BOfjzZh6u7nRLRee3sjY/hlhYOtdwmnFLWzLI1LTb1Xcpb1tBsmPaOyDcHHFd
 Mx5dfW9IxTlhEBwdPJiXzhjc2SJYe6my2ysk1dKMvjaTMcHTycCRTkIe8IiAyHEnHZLm
 17DhtifmJv/8uHbLUhOAmFJEGxCxaUIlB9S2Yh83VHTXejPzWlQsMQFYX45lJinBhiq8
 4QbrvtQODBjwKAri0+R+vmL1JBqcKZwG47rDuujX2uWKGA3sLoGEuQ8qMwZBIOZZAiTD
 6rKQ==
X-Gm-Message-State: AOAM531FHZW3ffQ4WhvL4P5p9Ar9hAdo+DnlfdF+fDgB5gWcdbgD3TwA
 qKFVY4+ZXjs0m6A3NPvDEpi28Gy4FAa8KbmukvM=
X-Google-Smtp-Source: ABdhPJxFwGExrQ/UAiqNVh0VJyQGgChhiNEMBWP2Gjc02ULU3SphCxh9Z5gMdS6n8/KU06h8Vi3LG3M49DxCbNN9W6o=
X-Received: by 2002:a17:906:a415:: with SMTP id
 l21mr50334789ejz.2.1609370680794; 
 Wed, 30 Dec 2020 15:24:40 -0800 (PST)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 31 Dec 2020 00:24:30 +0100
Message-ID: <CAFBinCA4EnbJZ5HnWzqP-LdLJE0FD_nGqA6PxdQaR5KfETgvTQ@mail.gmail.com>
Subject: discussion: re-structuring of the Amlogic Meson VPU DRM driver
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_182442_647535_87006197 
X-CRM114-Status: GOOD (  18.72  )
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil and all interested people,

in the past there were concerns about how some of the components are
coupled in our Meson DRM driver(s).
With this discussion I would like to achieve four things:
1. understand the current issues that we have
2. come up with a TODO list of things that need to be tackled as well
as recommendations how to solve it (for example: "driver ABC function
ABC uses the recommended way - take that as reference")
3. one by one work on the items on the TODO list
4. add support for the 32-bit SoCs to the Meson VPU DRM driver
(without adding more "not recommended" code)

Disclaimer: I am not familiar with the DRM subsystem - so apologies if
the terminology is not correct.

drivers/gpu/drm/meson/meson_dw_hdmi.c currently serves four purposes:
1. manage the TOP (glue) registers for the dw-hdmi IP
This is Amlogic specific and consists of things like HPD filtering,
some internal resets, etc.
In my opinion this part is supposed to stay in this driver

2. load the driver for the dw-hdmi IP by calling dw_hdmi_probe()
I read somewhere that this is not recommended anymore and should be replaced.
Is my understanding correct and what is the recommended replacement?

3. it manages the HDMI PHY registers in the HHI register area
For the 32-bit SoCs I will not follow this pattern and will create a
separate PHY instead.
As a long-term goal I think we should also move this into a dedicated
PHY driver.

4. call back into VPU/VENC functions to set up these registers
This is a blocker for 32-bit SoC support as I would have to duplicate
this code if we don't make any changes. This includes things like
calculating (and setting) clock frequencies, calling
meson_venc_hdmi_mode_set for setting up the DVI pixel encoder, etc.
My understanding is that this part should not be part of the
meson_dw_hdmi driver, but "some other" driver. I don't understand
which driver that's supposed to be though and how things would be
wired up in the end.

In addition to HDMI my understanding is that for adding MIPI DSI
support you would
a) either have to follow the pattern from the meson_dw_hdmi driver or
b) also require some better way to achieve this

The biggest question marks for me are #2 and #4 from the list above.
Also is there anything I have missed?
Any input, feedback and questions are welcome!

PS: an additional topic on the TODO list will be "use the common clock
framework" for clock setup. it's currently not clear to me if that's
possible on the 64-bit SoCs in all cases.
I will start a separate discussion for that topic after this one.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
