Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253A8C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 19:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64C960230
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 19:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D64C960230
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzGTdhveyMS7xwd3lhHceXpdxUtVEgXDjPgiusS9zLE=; b=plVMnjCEsKkmWh
	f7hoKWpPVBMfzyY+J+QCWwlOHfHVzS8iXlPemw2IBgqsDFgAvb5+SsVHaMHfKiG3ByGTi0pJ5RBHh
	ijf2fER4kCRzxmM5KZmfiqUHgcTbQ1A6F1s3PEMlAv2NvHWCY1gQDJH3UkKigR4GSaQha8ICmly3L
	+VOlAs3XpcgcylFSJwYaY5tTeFhWmIM+bVtu3TutIAtstrQjuqExGbYjAHItxSLUBF7ESoLgUoWMZ
	ODjvvQhyAAvlaZk7P3V+bnZwpors++kS051xdyLoP+q/0HCv2NmESHqqBV4/bmMh0PQWnOWtqqc+D
	8+RCY5H9PXaxvCPtHaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSOvy-002v7o-1t; Mon, 20 Sep 2021 19:26:34 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSOvl-002v6m-RA; Mon, 20 Sep 2021 19:26:23 +0000
Received: by mail-ed1-x52f.google.com with SMTP id v5so64251051edc.2;
 Mon, 20 Sep 2021 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RJWnZekTUMSnBRk/CtZe/v9CvFL/Hwr4JrpVx75Cmtk=;
 b=ZdiTJXLL9mgXbyU5Qnw0VxfH6+FlkVxGLpvKOkpbK2L5XLuH1ISSVM2i5YsSzv538d
 Y3zLxEWtL52DZlUT9ehwoPZ9aMiO8iSp5Zlt9m2H9QdyEZ9GvSTTXd1gH8aT1BmtkyZF
 bWNEyJhSpyHwgkLwM9Z0Dnh1wfi1UQCUmPhdAwR6Z0ucyryHZ/2f4IqUNl0QsnJs7jHK
 9c30JmQqxVlas0u3kN0dg0NklDnWDz7IwkWoKBgVT4khJYCCWqwWDsgU9KF/wfCWmmZy
 wVHzUDGDkelDhFf8NRZXfzNN3vgmCtSczIr3bJDAIfDxRWnn2FOK1sO7Xkn8AWvETb4k
 wGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RJWnZekTUMSnBRk/CtZe/v9CvFL/Hwr4JrpVx75Cmtk=;
 b=zS7Gvv5ecm6QvtbVKfj6wG4e26WR8P5wsqxnNGIKKqPqkqym+YDytzvbo4I6lMEhcK
 4zvRJF3w8pIzf5o3nrvlVYmOhs/xZCijlsBVZlU4kjovZtuJhZ/RPcbismd1HZGrJCB8
 WpU1wqN+UCrpLsw00OauTVwO8kYnPiKJJYh5F6QOkwNq9g0uszSHruuGp/beTAwC6jlg
 I36Z89W1C/8uQVlUlnkcMW8NRUD3GWDc3yEPI9NbyBZopLAntAI/KnsTDleG9RuHA0CU
 q48V9BSrKpBzTxx9MSqTODjtfJv8xpQLdI4HT0zloFQ3z6isiGH/4WmOGTSAyDTl9YUz
 YAUw==
X-Gm-Message-State: AOAM5319ZPWmx4j4C8bUPcxJw/lqI3kTAUkiIdpMXbRj8Nccf0CJqKfP
 pI99viEcDs/2KZh5b/JodnYh0TgZmrJMlfyk1+iwejHJ
X-Google-Smtp-Source: ABdhPJwdPfnVeY2p6IsWhgrDuynL1Mi9SZtZIeW/NWNfEuNbq4u5cqaYdIMy2elkx0SvapDlMWXEb9a6p2wF4K3n4I8=
X-Received: by 2002:a17:906:e105:: with SMTP id
 gj5mr29600783ejb.408.1632165979872; 
 Mon, 20 Sep 2021 12:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-2-linux.amoon@gmail.com>
 <c7f6213b-5ddc-881c-1aea-9cc7b03e6a4f@baylibre.com>
 <CAFBinCBeNMET2tvH0h6HF3dR+xBb59hifQyaoXigUs3UGkS+KQ@mail.gmail.com>
 <2b07b3de-cee5-c570-8fde-6a4c684122d6@baylibre.com>
 <CANAwSgRNp8UtU+Yy4smwZ5POTWTU+xN1mrf_cH7Pu9yX5HU=VA@mail.gmail.com>
In-Reply-To: <CANAwSgRNp8UtU+Yy4smwZ5POTWTU+xN1mrf_cH7Pu9yX5HU=VA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Sep 2021 21:26:08 +0200
Message-ID: <CAFBinCDmNt+aXRE4xFZdegOUs8BqJiTPF3+DQ-buvWWXrQLkdw@mail.gmail.com>
Subject: Re: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Anand Moon <linux.amoon@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_122621_938390_AE268427 
X-CRM114-Status: GOOD (  10.37  )
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

On Tue, Aug 31, 2021 at 10:48 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> After enabling CONFIG_REGULATOR_DEBUG, with this patch applied
> I still not getting the USB regulator to enable.
> Do you see different output at your end?
I don't have much time for testing and debugging currently but I'll
put it on my TODO-list
Until either of us has found the issue I suggest not merging this patch.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
