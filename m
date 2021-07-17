Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66546C636CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 20:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30BD96101D
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 20:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30BD96101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgpciDdzcfai2Dk/48Z84cE7Wi5eRBYfYkBZJFXAdDs=; b=DSvBMCXG25m1U3
	92C80Ptk5TAhI2F2L7Z7bTlwye+F1/9QIOipvPq5J1A4WPL5IR163PHED7zR2/feO3RwMq+awtzBR
	uC7goPkNx57QZTmU2eVGteptfqUFFQ7PDvbkA1dioQnIjXLeQBzg24OZbpM4EDK/75Ot6XzRX3eLb
	U7MME+8Avc5NAQKK0IOAeoswULI91bVxQNpxHfHxpQXYKDpDX7Vv6+K9ZdNgMPVzOgKLomi4GWI4A
	0H4F0otJLoD1QnrG1bZHNR77f70b4BFiqHgE8VQ6PkfoG+BOQf5+Uvn0fH2kSwNgDveYoxYGAw1Y7
	0n3fpY02Pju8lRIANBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4qTk-006zzz-5A; Sat, 17 Jul 2021 20:00:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4qTW-006zxB-88; Sat, 17 Jul 2021 19:59:51 +0000
Received: by mail-ed1-x52c.google.com with SMTP id dj21so17632773edb.0;
 Sat, 17 Jul 2021 12:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=762AIHyaLIJRd5Chx9MkMYblmaxMzIP64XnDWe7yge4=;
 b=u2tl/92J8+a0AKu87KFYHYdNR5lpZ8vZAHWOlKtueq89OKWj+bbJcIGQ7iJx/9o1sH
 KBioWFQnyXd3r8KLDBldMzMmvNCokvnJ95EQaO/TATi81MWP3KBRIeF80W7M3ohJl4Uj
 UomWQV7Ra3hWKJvOka3YWsXUolw6nNMZ17NERsm9cxCA8U7Qv65hjsA0X7LmBX7P3UdN
 Uy9m6I34b1LKbR8blkN1Zt8PyV3jRDB8Dudm7oZVs6f3KN/ZLLTlz0E/yIoe6Y/F0lbS
 e0TE9C48ydpIKPVyoyseLHfWkHeE6Ynpd6bqBFx1aEWtHv1eNxhifyc/Yv2P5XRZZHEE
 oQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=762AIHyaLIJRd5Chx9MkMYblmaxMzIP64XnDWe7yge4=;
 b=CIv2D7WuzWqfM39ft+qvljn24fV9buImPfMmHvig7jrrFIoZwk4NCT7ebmeupo1LhR
 eIOdOfZ4YtV+b3fY6BC0AdHguS2M99XUzONzvCRf7bql3Rya7sPaDhMMvof8PmqI0Fcm
 j4drLmBF4Qpp4FRGoFeBF10B8JwFqoODCEOUTpwpvppVZ3xakaKq99IAVEdt34We5e68
 zRiWUz1J7Pt14QwmvMij9VkqDWrGxAsHR6+C41H5PdZQDW0rgIeE3fQSbEMM71VLAviy
 VNkzOkVIF8vfpDrjFqzApOC2Du0Ug+nKbLsY1sUw1bakLJAzYiWGYzu0RHSOAcBzPF0Q
 kSLQ==
X-Gm-Message-State: AOAM533KyMDRmdmmfWmFivNPLgNVI+trQqewnxYMJ74dhoJ9USEsiXbe
 +4o4C2qVVDGCOdq37sEA3eoWq0KvXw9fOee4mVI=
X-Google-Smtp-Source: ABdhPJwHt7US2HSby+xCEyO/61wsFoFE3bqY4zs8JfLejU0Lk/xtsoJy92vCwGGJyDmPJm+AzWDwDPgFi7thK92igoA=
X-Received: by 2002:aa7:c550:: with SMTP id s16mr23614280edr.130.1626551988810; 
 Sat, 17 Jul 2021 12:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210716103651.1455-1-linux.amoon@gmail.com>
 <20210716103651.1455-3-linux.amoon@gmail.com>
In-Reply-To: <20210716103651.1455-3-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 17 Jul 2021 21:59:37 +0200
Message-ID: <CAFBinCAPNomGxO6Z57qPrmwv_iP4yGo4gpOR8o=mi3n+hq3dJA@mail.gmail.com>
Subject: Re: [PATCHv2 2/4] arm64: dts: amlogic: odroidc2: Fix the chip enable
 signal for usb power
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_125950_337502_4C9F4881 
X-CRM114-Status: UNSURE (   8.27  )
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

Hi Anand,

On Fri, Jul 16, 2021 at 12:38 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Fix the chip enable signal changing from Active High to Active Low
> to enable input power to USB power. Also updated signal name as per
> the shematics.
typo: shematics -> schematics

>
> Fixes: 5a0803bd5ae2 ("ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes")
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
I don't have an Odroid-C2 so I will not be able to review this as well
as the Odroid-C1 patch.
My suggestion is that we discuss the Odroid-C1 patch first as that's
some hardware that we both have.
Once I understand how the Odroid-C1 patch works I can at least give my
Acked-by on the Odroid-C2 change.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
