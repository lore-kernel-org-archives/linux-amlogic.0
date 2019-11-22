Return-Path: <SRS0=YewT=ZO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDEDC432C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Nov 2019 07:52:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696A320659
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Nov 2019 07:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="moL+FgZQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PgrQz9rj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 696A320659
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpO3kzS7QU/SpfJn7ChJ8YW4ADdwHu+vADU9268yBrg=; b=moL+FgZQGs6ba+
	fWLRpz9PNp0LJ/9DA4Y3soDjQgxxYQJtMrdvVkXg5V6UimyGVIT4bYXNiPilCWsL8jnYE0zMHZ9we
	avCpFbXA5In073ND8FlqvgoVvY0+db9e8xwIs8IoBl8vrOglwTnMTY8UhDNhgueZjjCCUPUIozRUk
	dWtzZ1N9lLjMMf2vELCOA83MJNX4qmee3pT+lVL5pjCYEcCuJKEiz57kbE6RM3S9nivo9bbe0SN3z
	Bj7HgGIAwum9uFVvDNYWNNM4xni5UTQ4Bh/d/FYociIq61qIk4xtWI19bgvNfcYoBiTf634fwc2aF
	thdUeSnoA5PX03aLTPZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY3jm-0007vQ-Hm; Fri, 22 Nov 2019 07:52:18 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY3jk-0007v2-FG; Fri, 22 Nov 2019 07:52:17 +0000
Received: by mail-ot1-x344.google.com with SMTP id u13so5446846ote.0;
 Thu, 21 Nov 2019 23:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CId69ZN8zw9ohBvU0FF7D9FcvCyDU1hZuuZbIs9xAk=;
 b=PgrQz9rjrPYZ3pN21PUePSus0Hm7Ex00MnpWWh+EGlQaEENkCr3yOLM3yDfYHWbblQ
 HOb4YnlLrWToHw9YIfP/xz9Td70mOM/w9HJn2rKpov5QOs7jtTaI9jX5F4bpG3CutoVd
 uoi90EAPJuxx8v8Zf1d4i9CgE1mJR2TjNapHNly5J/S5FnJ49gOYj5U0UQY5c6uOGOlo
 AUO0MhH7SX8/pl1qICwScMBngGfSb01TVj1ROQGMAtuoICBM4UpBO0Ty6BCjP+Vr/dEO
 rDuEprwXAsTDP0dYHmvhMDQa4pZRKndT+en6x+jE2O06OQIjZBogDi398DpnI09Y2Mau
 wW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CId69ZN8zw9ohBvU0FF7D9FcvCyDU1hZuuZbIs9xAk=;
 b=qsnz4pOAFrXzjDDb0YjrTJICjaaHEYOZs2f8wTsmTv9Q/50/QLkKUfR0wECM4vbeTg
 kSW/XOGA4dM2Uxk+glQN6IbxBSDkM5rB4l5C4NXLz94A51FiqZO37hR5v1eZn+IJTeup
 q5KczxoZF2SVqLlSrBEIFh9JyQWU7JEsqXBlwMh6S8PEN++aey9anfN+IEh29BOxQxTg
 IwfRLfh3cibKmxU3ZaGAkGGtwfVqyfWFSLBhPbkXOM6s1dUqwOCAvWIaeqqJyTl3gXtE
 cM3H9q4Y3m2Gld4gR7lbfTq8pRNv9RWjFEuA2k9kM5J6edKtJPU/bYKTIe8CWz+vQqkJ
 rsoQ==
X-Gm-Message-State: APjAAAWS+DsQ5JDN6G7pRPqn4plsFET05c3hpm1un2ckphlo6YrwsmQr
 EsaryFTRn/Z0XjMRH/iVQWaXCmdR8SxJhBWt1fk=
X-Google-Smtp-Source: APXvYqzeFxfrw01grEvs/XEDH0mG+F6i0yHJyLr4ROGX1swFEompn0SBsemnA3Zd+YXdUloDWqSTQ1PHx0UrFRvl8K4=
X-Received: by 2002:a9d:3e53:: with SMTP id h19mr9832272otg.98.1574409134946; 
 Thu, 21 Nov 2019 23:52:14 -0800 (PST)
MIME-Version: 1.0
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 22 Nov 2019 08:52:04 +0100
Message-ID: <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_235216_533575_311B1170 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Hanjie,

On Fri, Nov 22, 2019 at 7:55 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
drivers/phy/amlogic/phy-meson-g12a-usb2.c seems very similar to the A1
USB2 PHY you are introducing here.

>   usb: dwc3: Add Amlogic A1 DWC3 glue
drivers/usb/dwc3/dwc3-meson-g12a.c is also very similar to the dwc3 glue.

I have two questions:
- how is the PHY and the dwc3 glue different from G12A (or SM1)?
- why do we need a separate set of new drivers (instead of updating
the existing drivers)?

We try to use one driver for the same IP block, even if there are
several revisions with small differences (for example the SAR ADC
driver supports all SoC generations from Meson8 to G12A/G12B/SM1,
because 80-90% of the code is shared across all revisions).


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
