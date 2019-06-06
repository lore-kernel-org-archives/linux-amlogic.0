Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E4BC28EB4
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:47:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C535208C3
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 19:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jkaaJeHc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="M425AF5Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C535208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwPrNradF0nvJvL0ONgcB6NqHjmsGhHc3xPZLQg8xnk=; b=jkaaJeHcuiLs0G
	4evUuKMw/ZZtvbI17p32yXHxG/Dd0mleYwWBGflpxec8uhqdXstD707iMpykE03PKfrNmuZMAwaJG
	Kfzo/H+OJay/WfAx5ANSdz5z+JXyEHLQMRoT9MT83CaK3rjJD+ahTaAY8Zbn1RT34KK6g03vVTrGZ
	dDj0DYrRKpQoS0SdEneLG1D8k0B1ifKrWjaqlmgR+aB9lee1PvCmZsY4dMD7bPFPix1UbLvD9kUJa
	QviHkbQSa4ejwvO1pr/K7WUFXVxY3ONyJ9Fw9GHsflm4cZw/LpBAWCFM7UKsFxU2fBnIHs4BEBsai
	FzD7TG8gEjwLLn8iiftw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYyLy-0004eW-Gb; Thu, 06 Jun 2019 19:47:14 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYyLq-0004To-RH; Thu, 06 Jun 2019 19:47:11 +0000
Received: by mail-ot1-x344.google.com with SMTP id z23so3088458ote.13;
 Thu, 06 Jun 2019 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UcIBWNKq7rsOKiEN1ZaEM6TKSTC1rUDAvceROHJkKnU=;
 b=M425AF5Q27k8jkeaKLy3GpcG3/THjW3EKKvWd5BFOXOfwvojEUqtEhRXM41XGdkHMb
 h8LU8MGpp5JRP5f/g32xGqlzlKxtbJ1u9xwjgu4Nto8zWLvviGXaKB00286n9L/T4Kox
 EiouMsmFQFmfoT7f64GMWqXE03Ohqvy/QfKEic7ODdh1rUmOXcoGOopizF9CwVrvNn0c
 0z8zEtBu4+9BjYPIlxOhnc63GmhLiXaMMGfu+gGPXSnf9R3XUBVQggmIhg0atpJM6WBB
 /R8fvLI5n11mZVCwWrM53Urn6/S8fYaWeKPZj+Vw4WQklRnIhDwsLMdo+hY6Ym/lt8HY
 LkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UcIBWNKq7rsOKiEN1ZaEM6TKSTC1rUDAvceROHJkKnU=;
 b=mvXH2J/NU9i1MNLPUTKAOwa7veOvoi34kZZAZbXdm1vevFX4/jI42mtD6itsOQpeCW
 bRc3szF1Tk8QbnAX+zl3rI0BEz4sBcfRtqmHuz/g2SsGGgarZkH7wpQJvGvwmVaMGOQL
 GaBntK9ZCVyKTALKFmmkS1VmZwls4qWnK/6fbkZSQH8nrPlwhuFhdhDLnkLL/5qug2zy
 dmZjK0MzpH0w3F93tzFXQvExy09pZwluZT1sXLtcB/EztEEyq3Ex/7/wXIHa5e+b0UId
 8T4Q+tmY4ZAIv4ELO/CyEcq8Zd65kq+qtarpKBAJ3MmeS4wmY93FksFtv9cZDm3zWKDi
 /h0Q==
X-Gm-Message-State: APjAAAXlVlDgqZIfLVmfxfX0dYcWakmQUaiT1Dn8h1MqbLCf6YZglzzP
 OnjNovISFtXkJbOhHVmvpGuZGLYWaD9s6hz/cGk=
X-Google-Smtp-Source: APXvYqzFpAzVe5kdyBif3vrS3V+GMrD8alJ36+ksEaUmNq0YqsSf3K6qGWZQCFu9O/Xa8RCVUUMMwVMVwimx9IQZ9h4=
X-Received: by 2002:a9d:32a6:: with SMTP id u35mr16549424otb.81.1559850425739; 
 Thu, 06 Jun 2019 12:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190603094740.12255-1-narmstrong@baylibre.com>
 <20190603094740.12255-2-narmstrong@baylibre.com>
In-Reply-To: <20190603094740.12255-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 6 Jun 2019 21:46:54 +0200
Message-ID: <CAFBinCDS6wovEfU+z3bxYq6Kyw-Br+EuBGTdG6sNx4oBW=NBzA@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: meson-g12a-sei510: add 32k clock to
 bluetooth node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_124707_518342_5845338D 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 3, 2019 at 11:48 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The 32k low power clock is necessary for the bluetooth part of the
> combo module to initialize correctly, simply add the same clock we
> use for the sdio pwrseq.
>
> Fixes: d1c023af1988 ("arm64: dts: meson-g12a-sei510: Add ADC Key and BT support")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
with the correct fixes tag:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
