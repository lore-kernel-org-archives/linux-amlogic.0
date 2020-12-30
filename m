Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4B6C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 00:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74BE021D94
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 00:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74BE021D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IIFo+SoVi3Fo5a+yHLKDMe4wojrv2evMUwN/YJWXdB8=; b=pCpil9MN4CnTHMVizMSGOL9Ki
	6THFHR5SVKbx3b0kFOxu9XuEXkjUzE6kg4VZ+YWZ5BEXEjIWriFKNb8j6dNSbVmxmn7KBjzTA9PFb
	DT+5YP0KShF+3ZqYcHn91zy9Cwj6aEIrgHMPj9wn2amzNWyXlURfZCJY1T6ktLa990e28VQJJ94tl
	b1GiJPSPIFz/F+45KFwtFQmBkIxNjXsTlsaDQL5B7v0zy7g9CjuIPZj9KXnbqDoM08EC2+PvhKtzn
	L6Wdd0RYux9a0IqIqCtpklXY1GyocBOMZN0MqniFgSILMcv6TqSE6h7jzZeQxn/2FuBfBCajNZ80w
	4fBVKPTAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuP5q-0005r9-6p; Wed, 30 Dec 2020 00:11:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuP5n-0005qf-Lv; Wed, 30 Dec 2020 00:11:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id g20so20149656ejb.1;
 Tue, 29 Dec 2020 16:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BIC/2qIdJeGBQNWxLU5IRoKvRyuZw5pGh6L03h8axVM=;
 b=ZXoYaTF9bdee6/o+D9RUWWvQtRtNTYdwAItnxc5kAGIMUCw7lNqKJ+rZ0UHgq6bCXs
 6dsBeUb2CoojB6ZeH+53yL0aKdp+OFLOFmxOj5bW0pWbToSoObLYfxG9AY9V5xGyJto3
 CjMvYrIjsYGKXU+7zPfHelpCusMmEVYheXIDPQDHJg8chMZ0v81Sv+LUiR6aJV/4wgPA
 IJ6kSZjV+HD+MTgEwCkcNQQwEOrcAXG1JtWGWsTahbpLHBkSHJrJukXd0O1ivxzXEjVk
 fN66t7QhuzUtHFfFv2yOjXu/n9+usKyxVy0dYuewW1mrbRV3cFibpBIZ2HwnLaBKOOAE
 POAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BIC/2qIdJeGBQNWxLU5IRoKvRyuZw5pGh6L03h8axVM=;
 b=aH7KPgIqLeAuohnkv3xj+2UpU2+HTlP99SXr+mkl1bE3CWbY6Z6zSx77oKeF2KC3bM
 2i3y+yzrX5UKBtddewki5wSDnffYVRr80vb9k6G7oHvEhjvGuZ5/Ipf9BMhpqDGDqZw6
 xu9Lck4iZ1UQCnZJvl6UtTK8LaL2T0vHbWnfRnOEKcu5mlHWC6OxH8Hae5AFSig/KCBJ
 /uf4sUAqQX8Hm3yUIlItn+DMl2xntD2uBOrdP4A8Fmvf5OWb3Pu5MprwBlrm5ftvaWB0
 7+xV4xx17lwYSVKkqTmSSbOef65X1hbuAQQ4B2AuNvcq7KLWRA8xXVgwPZua0MNhiQNC
 aAsA==
X-Gm-Message-State: AOAM5306j2SF7na7gQMYqzpOGiaficsWgwRdlPEtzpm26ZRPDDp0kdTt
 0keyG/Od0JUeiC+HPcivdXhu+YZnKARRRbEm9O7Vzsdb
X-Google-Smtp-Source: ABdhPJxAo/edRUUxpOPraaqjveLTeoRRb5rrdRwWHdyI1u852zzcnS6mVRrCRKC/Cls55s6FCcSBPu9Xu4SkdZwl2Wg=
X-Received: by 2002:a17:906:447:: with SMTP id
 e7mr46945242eja.172.1609287111922; 
 Tue, 29 Dec 2020 16:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
 <20201228123744.551d1364@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201228123744.551d1364@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 30 Dec 2020 01:11:41 +0100
Message-ID: <CAFBinCDM+bPgwquZAG-H=iMZr4+0rW9CG=WafRys5_HdeBkzjA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] dwmac-meson8b: picosecond precision RX delay
 support
To: Jakub Kicinski <kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_191155_763777_7ED14E17 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jakub,

On Mon, Dec 28, 2020 at 9:37 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 24 Dec 2020 00:29:00 +0100 Martin Blumenstingl wrote:
> > Hello,
> >
> > with the help of Jianxin Pan (many thanks!) the meaning of the "new"
> > PRG_ETH1[19:16] register bits on Amlogic Meson G12A, G12B and SM1 SoCs
> > are finally known. These SoCs allow fine-tuning the RGMII RX delay in
> > 200ps steps (contrary to what I have thought in the past [0] these are
> > not some "calibration" values).
>
> Could you repost in a few days? Net-next is still closed:
sure
I also received a Reviewed-by from Florian on patch #1 so I'll also include that


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
