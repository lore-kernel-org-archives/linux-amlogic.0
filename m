Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B38BC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 20:20:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376E4613C9
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 20:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376E4613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cgc8ByxEFB8FsS8YWDbbiZvJOaF1lngfMrQQC86TpV4=; b=F5ZM/7gckJn1qog7XoEEtyplk
	FmoYW649ZjX9Nt02f1/GxppzqGAFhLAuyoXmwIvs4nnmILqvbQJYETwANLLZBS3EORnAsVul0/EgB
	TpoyI/fe3repctJi4pV9edg7CIBQ5P1Jr1tvcsHexICcmEabaIkSBtSDdtzWNvVC0fFSekIkGBqb7
	lDdUhSQfOmYiB/QCDakwMgRVC4IQgq8kKTNcpLAs9Jpe43L3vn9MYbOLRiI3DHo8p9fu7u7fgGyN0
	uLlw0dOEhb1+LmyN2BZJrBySMk7ci/PeBVYJHB5A1AjxJuBxR4CBa19NJsenrjJL7OmDGAObn2uSq
	DHo7YpRiw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leO0j-002Fer-5I; Wed, 05 May 2021 20:20:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leO0f-002FeE-NE; Wed, 05 May 2021 20:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1Mv4wqHc8zTw/J8WtIF1x0mpLNs4iPzNxbH+cO+sYFs=; b=x0gpmbkUdGvsKM2375J8c+N8T8
 4Fa/aSDLjRVRBmRVio9IV5Rz82ruSMvNUfBSnHj0tnh5cJcK8eAeY0XCEgffLMChWjT4OPXxwSDmp
 W3xvjLyj5HssRuyQ66Q0vLpotnJnAd5UZFXY6+DrxLFROYDZUcxvv960Um4RCTGLxp4u6j5Wi1YtN
 FwlPDeph9QywvKNO2ZTyjIyK7tHB4sKn2aoaunRs1w0sSx1OB3toKx20KRmanxjWjikPfQiaR1tP8
 cDjuhSGxjmxq8KaSav43opxx+VMEkI6Dt8MvEql2A1Ak31YvKZyMl0eyKgFt5JGeZIWb48Kp73lXR
 cVrp+fsA==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leO0d-005Ev4-0C; Wed, 05 May 2021 20:20:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id d14so3505207edc.12;
 Wed, 05 May 2021 13:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Mv4wqHc8zTw/J8WtIF1x0mpLNs4iPzNxbH+cO+sYFs=;
 b=QVkG18XIZWHqKQDqA7yUYVW6tTYJeP+JLLxSFkbOFOBrMzSlSDtSuiUB/idxxSsy/d
 6AHzXAJG8ZA/nyWc0f8u/Ego5Cn0CpZp84CUujXe/8DzVsoSaRFPGxfT8ieRULbpcaSH
 q7XSTMnYMxVakMs9RxjwTKBHBvMvcrUvQKHTyTU/U5TaH/9u22iQgG7TmqbG2QYkOaqO
 YREjms4RvTEnAW2ICYz/yxOBjTEEa4bwdfVSFv8As/+ghmnCNz3wQaazD0sRLD2njHdf
 bZ8qP9usa9gfkmBEKNM+Tc+n40mpTfyKA2RfIpMJuHCSLO451ScGMRJHSFGsqJwj2BlQ
 7CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Mv4wqHc8zTw/J8WtIF1x0mpLNs4iPzNxbH+cO+sYFs=;
 b=ha4V1n3hP7tqQ4rzdee5hky4DPZMFIvRVzqOFS6u/fC0CMm+NWaIHtpJ7rrS8ioktc
 Omnvyvn9rm96pzNARjParIPCWvTeysNesgFl6QC20PAURuUAnd9D8K8ZoE2+W1Egf3j7
 lV9ZiJHdlV8BERjivknB7R56MG570lAiQtuyXQHgBQUIMGgX3S/chVP/igXEOrY8VUTR
 MROEXeZub2+QQ8Pv/Y9aQISyHRJ8oSBMzPjtwwrgu6oZboM3T13F6emFr19j3IoyCJ32
 uM7/CJOaPO2hy6ZvHcNic/WPF7T0KZkpDorjXt8JE8fe9BtBbK846PslR4G1N9sWd9VQ
 Wc3A==
X-Gm-Message-State: AOAM532leCvh1Emgc+91H3zVxj1iwNLhozW7+4Fg69F3QTjnh8OLm8WA
 xb4oJt1zrFQcDSUJNk0qd9/Ij+8EFcmdsBJfCAc=
X-Google-Smtp-Source: ABdhPJzZB98VEZ4g43Z5H3Hj4W7dWbziHf1Urvr12LVTjBku1fi3a9KlpuWAISYjSXM9GqQLaXXa2X380+YlZCqK2Fs=
X-Received: by 2002:a05:6402:3109:: with SMTP id
 dc9mr881064edb.13.1620246037148; 
 Wed, 05 May 2021 13:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210505073248.3816183-1-narmstrong@baylibre.com>
 <20210505073248.3816183-4-narmstrong@baylibre.com>
In-Reply-To: <20210505073248.3816183-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 5 May 2021 22:20:26 +0200
Message-ID: <CAFBinCBa=rHQ+Sho2Lq0cA0dYnhKX4ZJaQUqBcaiOxNzD+bFiA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: meson-sm1: add Banana PI BPI-M5 board
 dts
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_132039_062522_26DDC86B 
X-CRM114-Status: GOOD (  10.50  )
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

On Wed, May 5, 2021 at 9:32 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Banana Pi BPI-M5 is a credit card format SBC with the following features:
> - Amlogic S905X3 quad core Cortex-A55
> - Mali-G31 GPU
> - 4GB LPDDR4
> - 16GB eMMC flash
> - 4 USB 3.0
> - 1 GbE ethernet
> - HDMI output
> - 2x LEDS
> - SDCard
> - 2.5mm Jack with Stereo Audio + CVBS
> - Infrared Received
> - ADC Button
> - GPIO Button
> - 40 pins header + 3pins debug header
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
one nit-pick below, but still this gets my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       /*
> +        * WARNING: The USB Hub on the BPI-M54 needs a reset signal
s/BPI-M5/BPI-M54/
I am hoping that Kevin can fix this while applying


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
