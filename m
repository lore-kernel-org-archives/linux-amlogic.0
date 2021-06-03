Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48D7C47082
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4DF460FE7
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4DF460FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtfcorDIcErHi6DzhYb87KTCP7OMOR9oMAx13KqiLPU=; b=H/PDFIBKgQlPF7
	6wn5WsJVmXU2rdLFUyr67/WyiEnHnmi20Rw+kh1xuYQq4E31bQOhHdWuC5l2VHBDNRtipVh+uXoJh
	ffV2pMxslRWuC2U54M1PBG+yVwKNRo1UoBUUWsjXQPjMpschsbObx4zmEcao5AlhiKPgAhUI63SIY
	dQm2BrlhydQSc6LYczXV64UY47vDRBOQBoUnkKCBpCVGWjgcjmL4/V+S0qElNBp0TWfPFHtHKci6c
	b/xjXrjS/CCnyT6yMA8aAsVHaJ3Ive2LXYsCbXze6bO0/wqF6YN4RcPS+XOVPDqBK47bLO6LP9hMz
	cBn2Hw+NO8O/93JogisA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lornm-00A4H0-Nk; Thu, 03 Jun 2021 18:10:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorni-00A4Dw-Re; Thu, 03 Jun 2021 18:10:40 +0000
Received: by mail-ed1-x532.google.com with SMTP id dj8so8195064edb.6;
 Thu, 03 Jun 2021 11:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SE1zlIceHLCl5jI7mNY25NCNQlJC62i47aZuFqzl7rc=;
 b=UR4He1sXM5Lp8KMcxtsiwOJlceX9Xld54cezhwcAWOCarc0Kar90QAKZO6xOgFnsh1
 OBe63VLRf29HCr+WRwb4hMCmTtMJxcPvn+NNIocpfm5EWBwuxXokWxyKUL2QTh33FQx0
 14nv9sL8j1z0YlR7KrVx8s2mMla9zawtbx1nU+k5K16Fdxx3VzzKqb80pCoytdc8RcKa
 M5+StLcvAq64Icdib3NIDAabJBKtSAJ3+YqVx7Yozv1vQKZeqj3/b2JWjLdDlgEUxb6C
 wHK+MxWfS1nz6r6WNOWfkdzh+kign4zXHfRCSuJ6p7tWsQfxu1Ml1eBM2/1HDYG6XVbv
 sFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SE1zlIceHLCl5jI7mNY25NCNQlJC62i47aZuFqzl7rc=;
 b=WcNbYzntFXIff3vWRUWxtdDsFFneTmT7CKhmayV353ASdAuqZFtCaCbVbSR9SHT7/4
 J+9ElzoUgMTORW1QjW+hQKKkPfgX2f43FoBFmADAlQxRvvt2xHPsfhMFBjsI0sq1fI3z
 noKQZm/DONjcQIx58jabkg8ndcp1Q4Kyg5u98iWasjyV2P7j41w8ExPseD0a88eU6iIG
 gEO5jjJeAwqPJc2J54r0P7Eu7r0JVNJWKZqGMVuMc26Zhcqln6WYWEDDaILnW+vK4Xvy
 jfDe6Rs/0V2A0yrWOd++bX0f1hHLCppqKTRWvE83ifATPON6/uve0tvS1sGbz68VAeo6
 phMA==
X-Gm-Message-State: AOAM531/k5MdaQozcA4x2JxOO21Eg6z6FR7qDcd4v7KBJNQ/sC/m0W0F
 dPg8Uc72OpW/W0lHemmfc9in9duBLJg+xDczce4=
X-Google-Smtp-Source: ABdhPJzFRZjiVsi6h5d4nalkgiWmRLjstOEkoIMEHKV/xoI+FxYsF7bgdCGgD5mX5a5ke3pKmvVVMfSUsUDzMBvVHQE=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr782716eds.146.1622743836618; 
 Thu, 03 Jun 2021 11:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-5-narmstrong@baylibre.com>
In-Reply-To: <20210601090140.261768-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 3 Jun 2021 20:10:25 +0200
Message-ID: <CAFBinCD8XzrFJxxvJeLsz+5MqTqcQD6df_x8YVcPzmo-eMuVfw@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: meson-sm1-odroid-hc4: disable unused USB
 PHY0
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_111038_952493_B103235F 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 1, 2021 at 11:01 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> As described in the HC4 schematics, only the USB port B is used,
> port A is left unconnected. Thus disable PHY0 and remove it from PHYs list.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
