Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF69CC47082
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 09:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B30B61380
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 09:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B30B61380
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3afdFKLSx8SEw8NjtehNKNOVUeOnvpnFv34G7Ps2Ffw=; b=i87d+dnHXi6yyc
	2rd/GnY1bWGAm8RvNMbZdb3/i6bA43IYr5EGsj6WUv9mJ52iD2btTu+9J4lmky+D2WuGF8rHC8gRA
	02mhlXirMtRH4LMtNZ2LfUqC4wLsNwcHOp0UPGvbrherEXT3JP6TIw5WpQXgHzMjEsFJEF3QAVRZy
	8LSpjn5Z1EmHeplh2g8FHtkryxkdFUeEq0Ly3I6Kg5yKWDNz7Hl9VavyYrWlI77nt95VeQMB+Dzxv
	mZlJKR1w/xWz7qViXpUPeR4isDPz7IPyy/88fcSLRBbGEqBD0PODubBMziOCmHqLaJyNONEBy9J3D
	oM+f0G40dwchUPtqilDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpSxe-00GNlq-9F; Sat, 05 Jun 2021 09:51:22 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpSx9-00GNVc-MW; Sat, 05 Jun 2021 09:50:55 +0000
Received: by mail-ej1-f49.google.com with SMTP id ci15so18222110ejc.10;
 Sat, 05 Jun 2021 02:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WUL55trsK3iGDeYqiUfYG/F0lSMpavljcEoIgPo1+wg=;
 b=LABjJDxVAjH6/Z1R9UFnNFIsoku1Lgc1UO56pI3YW3D1ObTc4BzjQaK2K1FCncFmOp
 xI1/zq9XyNfgtHI+4otJh9IxOJ0KPJBavDYMtlEUrBvy2WKN+/4EsuiFrHU9P196SPhO
 mOU+pV/3MqY9dSfYIP6d7vC5BLf9UZ54JQXys3WYcLYu9VcvyDoF7Zj0qONCrYDCpwta
 SaUbpzS5m2EmhR5GX7gQc91Lpl2dYodo1Wf87SynTuDD/Nus/zWPcllx/tTVXg5V5c0C
 Hx32bR8k7JD79EDu6z2KUpwB2FIz93rskeS2Oug3kGbMVdpqJPPRrKyNdAJnPJ3lI50N
 MNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WUL55trsK3iGDeYqiUfYG/F0lSMpavljcEoIgPo1+wg=;
 b=Xpe0qhxjZ9so/sezHnsYaP5wVKncIqUe07Gvul5xtoYI/wXENrXZSmuDwtMROL0fZX
 pDu/k8SZCNFsmiMKx2z9AtLVO8e25RcmnBnwnk1OcHUZzdgAfIg+fW6Vndp4wQk0xDSe
 06Hpg4pPxGUwdEJkiZs6t34l1yJ+Ybj0zXNS9VEt7q6JOLyWoWNkJ1RBp+0HbdK1dDWe
 Mnly7X4MoGjLkKz95yy1Z0XJHOtI0D6/x/8PCn+0UMPjqFRZBusSsPr/roU0BhZgu/V4
 RNkRBz54XoyHAoz3E3XQGdytVmLy4BIrbCJZZ/EVGBq5rIFITEJ8m7hu4AEwDZc+yAEl
 zsCA==
X-Gm-Message-State: AOAM532vItDpWcdnxyEjsr1nuoZkb32tiCZB9I7DIcRFmYzS1N9v6lqw
 9BA/hX0Fcct5Uifu6Jd+4VaE0x621J5bQjpCt3w=
X-Google-Smtp-Source: ABdhPJxBdFNViNJgZhsw7KvR5SGb6k9Ioqc/iEODGjTsNTPsZKHaPYbvAQ2t5UTDRMbXnq0lsxic+Wh9AVF4c5PMzms=
X-Received: by 2002:a17:907:2d8d:: with SMTP id
 gt13mr8666648ejc.162.1622886589815; 
 Sat, 05 Jun 2021 02:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210605030915.411391-1-xieqinick@gmail.com>
In-Reply-To: <20210605030915.411391-1-xieqinick@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Jun 2021 11:49:39 +0200
Message-ID: <CAFBinCA+Rm3X43fT4oePS0vXphPPEZMweoM_7c0MR1ZwSbsoaQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: vim3l: add NNA node
To: xieqinick@gmail.com
Cc: robh+dt@kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, jbrunet@baylibre.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, nick@khadas.com, artem@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_025051_791184_412BD5F3 
X-CRM114-Status: UNSURE (   9.42  )
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

Hi Nick,

On Sat, Jun 5, 2021 at 5:09 AM <xieqinick@gmail.com> wrote:
>
> From: Nick Xie <nick@khadas.com>
>
> Add Neural Network Accelerator device tree node
> for Khadas VIM3L.
we neither have a driver for this upstream nor any binding
documentation in Documentation/devicetree/bindings/
are you planning to add this?

Especially the missing binding documentation is problematic as it
causes some warnings when validating the .dts files against the
bindings from Documentation/devicetree/bindings/


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
